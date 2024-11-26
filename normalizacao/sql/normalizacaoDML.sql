-- Inserindo os dados
INSERT INTO Estudantes (NumeroEstudante, NomeEstudante, Curso) VALUES
(21934, 'Antunes', 'Informática'),
(42346, 'Bernardo', 'Matemática'),
(54323, 'Correia', 'Estatística');

-- Inserindo os dados
INSERT INTO Disciplinas (NumeroDisciplina, NomeDisciplina) VALUES
(4, 'Álgebra'),
(14, 'Análise Sist.'),
(23, 'Progr. Linear'),
(8, 'Topologia'),
(12, 'Geometria'),
(16, 'Lógica');

-- Inserindo os dados
INSERT INTO Professores (CodigoProfessor, NomeProfessor, CategoriaProfessor) VALUES
(21, 'Gil Alves', 'PA'),
(87, 'Ana Lopes', 'PC'),
(43, 'Paulo Pinto', 'AS'),
(32, 'Nuno Neves', 'AE');

-- Inserindo os dados
INSERT INTO Inscricoes (NumeroEstudante, NumeroDisciplina, CodigoProfessor, Nota) VALUES
(21934, 4, 21, 15),
(21934, 14, 87, NULL),
(21934, 23, 43, 16),
(42346, 8, 32, 10),
(42346, 4, 21, NULL),
(42346, 12, 21, 18),
(54323, 16, 32, 13),
(54323, 4, 21, 11),
(54323, 8, 32, 10);