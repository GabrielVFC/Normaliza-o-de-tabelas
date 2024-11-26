CREATE TABLE Estudantes (
    NumeroEstudante INTEGER PRIMARY KEY,
    NomeEstudante TEXT NOT NULL,
    Curso TEXT NOT NULL
);

CREATE TABLE Disciplinas (
    NumeroDisciplina INTEGER PRIMARY KEY,
    NomeDisciplina TEXT NOT NULL
);

CREATE TABLE Professores (
    CodigoProfessor INTEGER PRIMARY KEY,
    NomeProfessor TEXT NOT NULL,
    CategoriaProfessor TEXT NOT NULL
);

CREATE TABLE Inscricoes (
    NumeroEstudante INTEGER,
    NumeroDisciplina INTEGER,
    CodigoProfessor INTEGER,
    Nota INTEGER,
    PRIMARY KEY (NumeroEstudante, NumeroDisciplina),
    FOREIGN KEY (NumeroEstudante) REFERENCES Estudantes(NumeroEstudante),
    FOREIGN KEY (NumeroDisciplina) REFERENCES Disciplinas(NumeroDisciplina),
    FOREIGN KEY (CodigoProfessor) REFERENCES Professores(CodigoProfessor)
);