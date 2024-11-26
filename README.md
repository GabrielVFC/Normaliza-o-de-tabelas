# Normalização-de-tabelas
## Estrutura do Banco de Dados
O banco de dados foi dividido em quatro tabelas principais:

1. Estudantes: Armazena informações dos alunos (número, nome e curso).
2. Disciplinas: Contém os dados das disciplinas (número e nome).
3. Professores: Registra os professores (código, nome e categoria).
4. Inscrições: Relaciona estudantes, disciplinas e professores, incluindo as notas.

## Configuração
## 1. Criando a Tabela de Estudantes
Esta tabela armazena os dados básicos de cada aluno.

```sql
CREATE TABLE Estudantes (
    NumeroEstudante INTEGER PRIMARY KEY,
    NomeEstudante TEXT NOT NULL,
    Curso TEXT NOT NULL
);
```
## Descrição:

- NumeroEstudante: Número único que identifica cada aluno.
- NomeEstudante: Nome do aluno.
- Curso: Curso ao qual o aluno pertence.
- 
## Inserção de Dados:
```sql
INSERT INTO Estudantes (NumeroEstudante, NomeEstudante, Curso) VALUES
(21934, 'Antunes', 'Informática'),
(42346, 'Bernardo', 'Matemática'),
(54323, 'Correia', 'Estatística');
```
## 2. Criando a Tabela de Disciplinas
Esta tabela contém informações sobre as disciplinas disponíveis.

```sql

CREATE TABLE Disciplinas (
    NumeroDisciplina INTEGER PRIMARY KEY,
    NomeDisciplina TEXT NOT NULL
);
```
## Descrição:

- NumeroDisciplina: Número único que identifica cada disciplina.
- NomeDisciplina: Nome da disciplina.
  
## Inserção de Dados:

```sql
INSERT INTO Disciplinas (NumeroDisciplina, NomeDisciplina) VALUES
(4, 'Álgebra'),
(14, 'Análise Sist.'),
(23, 'Progr. Linear'),
(8, 'Topologia'),
(12, 'Geometria'),
(16, 'Lógica');
```
## 3. Criando a Tabela de Professores
Esta tabela registra os professores e suas categorias.

```sql
CREATE TABLE Professores (
    CodigoProfessor INTEGER PRIMARY KEY,
    NomeProfessor TEXT NOT NULL,
    CategoriaProfessor TEXT NOT NULL
);
```
## Descrição:

- CodigoProfessor: Número único que identifica cada professor.
- NomeProfessor: Nome do professor.
- CategoriaProfessor: Categoria do professor (PA, PC, AS, AE, etc.).

## Inserção de Dados:

```sql
INSERT INTO Professores (CodigoProfessor, NomeProfessor, CategoriaProfessor) VALUES
(21, 'Gil Alves', 'PA'),
(87, 'Ana Lopes', 'PC'),
(43, 'Paulo Pinto', 'AS'),
(32, 'Nuno Neves', 'AE');
```
## 4. Criando a Tabela de Inscrições
Essa tabela relaciona os estudantes, as disciplinas e os professores, incluindo as notas.

```sql
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
```
## Descrição:

- NumeroEstudante: Identifica o estudante (ligado à tabela Estudantes).
- NumeroDisciplina: Identifica a disciplina (ligado à tabela Disciplinas).
- CodigoProfessor: Identifica o professor (ligado à tabela Professores).
- Nota: Nota do aluno na disciplina (pode ser NULL se a nota não estiver disponível).

## Inserção de Dados:

```sql
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
```
# Consultas SQL
## 1. Listar notas de um estudante específico
Este comando exibe as disciplinas cursadas, os professores responsáveis e as notas de um aluno específico.

```sql
SELECT E.NomeEstudante, D.NomeDisciplina, P.NomeProfessor, I.Nota
FROM Inscricoes I
JOIN Estudantes E ON I.NumeroEstudante = E.NumeroEstudante
JOIN Disciplinas D ON I.NumeroDisciplina = D.NumeroDisciplina
JOIN Professores P ON I.CodigoProfessor = P.CodigoProfessor
WHERE E.NomeEstudante = 'Antunes';
```
## 2. Obter o desempenho médio em cada disciplina
Este comando calcula a média das notas em cada disciplina.

```sql
SELECT D.NomeDisciplina, AVG(I.Nota) AS MediaNota
FROM Inscricoes I
JOIN Disciplinas D ON I.NumeroDisciplina = D.NumeroDisciplina
WHERE I.Nota IS NOT NULL
GROUP BY D.NomeDisciplina;
```
## 3. Listar disciplinas com seus professores
Este comando exibe todas as disciplinas e os professores que as ministram.

```sql
SELECT D.NomeDisciplina, P.NomeProfessor, P.CategoriaProfessor
FROM Disciplinas D
JOIN Inscricoes I ON D.NumeroDisciplina = I.NumeroDisciplina
JOIN Professores P ON I.CodigoProfessor = P.CodigoProfessor;
```
