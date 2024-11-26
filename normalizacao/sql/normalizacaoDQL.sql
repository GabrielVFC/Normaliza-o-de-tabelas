SELECT E.NomeEstudante, D.NomeDisciplina, P.NomeProfessor, I.Nota
FROM Inscricoes I
JOIN Estudantes E ON I.NumeroEstudante = E.NumeroEstudante
JOIN Disciplinas D ON I.NumeroDisciplina = D.NumeroDisciplina
JOIN Professores P ON I.CodigoProfessor = P.CodigoProfessor
WHERE E.NomeEstudante = 'Antunes';

SELECT D.NomeDisciplina, AVG(I.Nota) AS MediaNota
FROM Inscricoes I
JOIN Disciplinas D ON I.NumeroDisciplina = D.NumeroDisciplina
WHERE I.Nota IS NOT NULL
GROUP BY D.NomeDisciplina;

SELECT D.NomeDisciplina, P.NomeProfessor, P.CategoriaProfessor
FROM Disciplinas D
JOIN Inscricoes I ON D.NumeroDisciplina = I.NumeroDisciplina
JOIN Professores P ON I.CodigoProfessor = P.CodigoProfessor;
