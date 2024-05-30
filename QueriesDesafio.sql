/* 1 - Buscar o nome e ano dos filmes */
SELECT f.Nome, f.Ano
  FROM Filmes f;

/* 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano */
SELECT f.Nome, f.Ano
  FROM Filmes f
 ORDER BY f.Ano;

/* 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a dura��o */
SELECT f.Nome, f.Ano, f.Duracao
  FROM Filmes f
 WHERE UPPER(f.Nome) LIKE UPPER('de volta para o futuro%');

/* 4 - Buscar os filmes lan�ados em 1997 */
SELECT f.*
  FROM Filmes f
 WHERE f.Ano = 1997;

/* 5 - Buscar os filmes lan�ados AP�S o ano 2000 */
SELECT f.*
  FROM Filmes f
 WHERE f.Ano > 2000;

/* 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente */
SELECT f.*
  FROM Filmes f
 WHERE (f.Duracao > 100 AND f.Duracao < 150)--f.Duracao BETWEEN 100 AND 150
 ORDER BY f.Duracao;

/* 7 - Buscar a quantidade de filmes lan�adas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente */
SELECT f.Ano, COUNT(f.Id) as Quantidade
  FROM Filmes f
 GROUP BY f.Ano, f.Duracao
 ORDER BY f.Duracao DESC;
 
/* 8 - Buscar os Atores do g�nero masculino, retornando o PrimeiroNome, UltimoNome */
SELECT a.PrimeiroNome, a.UltimoNome
  FROM Atores a
 WHERE a.Genero = 'M';

/* 9 - Buscar os Atores do g�nero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome */
SELECT a.PrimeiroNome, a.UltimoNome
  FROM Atores a
 WHERE a.Genero = 'F'
 ORDER BY a.PrimeiroNome;

/* 10 - Buscar o nome do filme e o g�nero */
SELECT f.Nome as Filme, g.Genero
  FROM Filmes f, FilmesGenero fg, Generos g
 WHERE f.Id = fg.IdFilme
   AND fg.IdGenero = g.Id;

-- OU...

SELECT f.Nome as Filme, g.Genero
  FROM Filmes f
  LEFT JOIN FilmesGenero fg ON f.Id = fg.IdFilme -- dessa forma tamb�m traz os filmes sem g�nero
  LEFT JOIN Generos g ON fg.IdGenero = g.Id;

/* 11 - Buscar o nome do filme e o g�nero do tipo "Mist�rio" */
SELECT f.Nome as Filme, g.Genero
  FROM Filmes f, FilmesGenero fg, Generos g
 WHERE f.Id = fg.IdFilme
   AND fg.IdGenero = g.Id
   AND g.Genero = 'Mist�rio';

-- OU...

SELECT f.Nome as Filme, g.Genero
  FROM Filmes f
  LEFT JOIN FilmesGenero fg ON f.Id = fg.IdFilme
  LEFT JOIN Generos g ON fg.IdGenero = g.Id
  WHERE g.Genero = 'Mist�rio';

/* 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel */
SELECT f.Nome as Filme, a.PrimeiroNome +' '+ a.UltimoNome as Ator, e.Papel
  FROM Filmes f, ElencoFilme e, Atores a
 WHERE f.Id = e.IdFilme
   AND e.IdAtor = a.Id;

-- OU...

SELECT f.Nome as Filme, a.PrimeiroNome +' '+ a.UltimoNome as Ator, e.Papel
  FROM Filmes f
  RIGHT JOIN ElencoFilme e ON f.Id = e.IdFilme -- RIGHT JOIN, para n�o trazer filmes que "n�o tenham" atores
  LEFT JOIN Atores a ON e.IdAtor = a.Id;

