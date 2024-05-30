/* 1 - Buscar o nome e ano dos filmes */
SELECT f.Nome, f.Ano
  FROM Filmes f;

/* 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano */
SELECT f.Nome, f.Ano
  FROM Filmes f
 ORDER BY f.Ano;

/* 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração */
SELECT f.Nome, f.Ano, f.Duracao
  FROM Filmes f
 WHERE UPPER(f.Nome) LIKE UPPER('de volta para o futuro%');

/* 4 - Buscar os filmes lançados em 1997 */
SELECT f.*
  FROM Filmes f
 WHERE f.Ano = 1997;

/* 5 - Buscar os filmes lançados APÓS o ano 2000 */
SELECT f.*
  FROM Filmes f
 WHERE f.Ano > 2000;

/* 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente */
SELECT f.*
  FROM Filmes f
 WHERE (f.Duracao > 100 AND f.Duracao < 150)--f.Duracao BETWEEN 100 AND 150
 ORDER BY f.Duracao;

/* 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente */
SELECT f.Ano, COUNT(f.Id) as Quantidade
  FROM Filmes f
 GROUP BY f.Ano, f.Duracao
 ORDER BY f.Duracao DESC;
 
/* 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome */
SELECT a.PrimeiroNome, a.UltimoNome
  FROM Atores a
 WHERE a.Genero = 'M';

/* 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome */
SELECT a.PrimeiroNome, a.UltimoNome
  FROM Atores a
 WHERE a.Genero = 'F'
 ORDER BY a.PrimeiroNome;

/* 10 - Buscar o nome do filme e o gênero */
SELECT f.Nome as Filme, g.Genero
  FROM Filmes f, FilmesGenero fg, Generos g
 WHERE f.Id = fg.IdFilme
   AND fg.IdGenero = g.Id;

-- OU...

SELECT f.Nome as Filme, g.Genero
  FROM Filmes f
 INNER JOIN FilmesGenero fg ON f.Id = fg.IdFilme
 INNER JOIN Generos g ON fg.IdGenero = g.Id;

/* 11 - Buscar o nome do filme e o gênero do tipo "Mistério" */
SELECT f.Nome as Filme, g.Genero
  FROM Filmes f, FilmesGenero fg, Generos g
 WHERE f.Id = fg.IdFilme
   AND fg.IdGenero = g.Id
   AND g.Genero = 'Mistério';

-- OU...

SELECT f.Nome as Filme, g.Genero
  FROM Filmes f
 INNER JOIN FilmesGenero fg ON f.Id = fg.IdFilme
 INNER JOIN Generos g ON fg.IdGenero = g.Id
 WHERE g.Genero = 'Mistério';

/* 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel */
SELECT f.Nome as Filme, a.PrimeiroNome +' '+ a.UltimoNome as Ator, e.Papel
  FROM Filmes f, ElencoFilme e, Atores a
 WHERE f.Id = e.IdFilme
   AND e.IdAtor = a.Id;

SELECT f.Nome as Filme, a.PrimeiroNome +' '+ a.UltimoNome as Ator, e.Papel
  FROM Filmes f
 INNER JOIN ElencoFilme e ON f.Id = e.IdFilme
 INNER JOIN Atores a ON e.IdAtor = a.Id;
