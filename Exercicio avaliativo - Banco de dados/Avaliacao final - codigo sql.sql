-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE MODALIDADES (
ID_modalidade INTEGER PRIMARY KEY,
Tipo_esporte VARCHAR(40)
)

CREATE TABLE Patrocinados_DOA��ES (
ID_doa��o INTEGER PRIMARY KEY,
Valor DECIMAL(10,2),
Descri��o VARCHAR(100),
ID_campeonato_FK INTEGER,
ID_patrocinador_FK INTEGER
)

CREATE TABLE CAMPEONATOS (
ID_campeonato INTEGER PRIMARY KEY,
Qtd_participantes INTEGER,
Descri��o VARCHAR(100),
Campeonato VARCHAR(80),
ID_modalidade_FK INTEGER,
ID_Local_FK INTEGER,
FOREIGN KEY(ID_modalidade_FK) REFERENCES MODALIDADES (ID_modalidade)
)

CREATE TABLE PATROCINADORES (
ID_patrocinador INTEGER PRIMARY KEY,
Nome_patrocinador VARCHAR(50)
)

CREATE TABLE LOCAIS (
ID_Local INTEGER PRIMARY KEY,
Logradouro VARCHAR(100),
Pais VARCHAR(50),
Numero INTEGER
)

CREATE TABLE Participam_HISTORICO (
ID_competi��o INTEGER PRIMARY KEY,
Data_competi��o DATETIME,
ID_campeonato_FK INTEGER,
ID_time_FK INTEGER,
Coloca��o_FK INTEGER,
FOREIGN KEY(ID_campeonato_FK) REFERENCES CAMPEONATOS (ID_campeonato)
)

CREATE TABLE COLOCA��O (
Coloca��o INTEGER PRIMARY KEY,
Premia��o VARCHAR(50)
)

CREATE TABLE TIMES (
ID_time INTEGER PRIMARY KEY,
Nome_time VARCHAR(50),
ID_t�cnico_FK INTEGER
)

CREATE TABLE T�CNICO (
ID_t�cnico INTEGER PRIMARY KEY,
Nome_tecnico VARCHAR(50),
Telefone VARCHAR(15),
Salario DECIMAL(10,2)
)

CREATE TABLE Possuem_TRANFERENCIAS (
ID_transferencia INTEGER PRIMARY KEY,
Valor DECIMAL(10,2),
Data_transferencia DATETIME,
ID_time_FK INTEGER,
ID_jogador_FK INTEGER,
FOREIGN KEY(ID_time_FK) REFERENCES TIMES (ID_time)
)

CREATE TABLE JOGADORES (
ID_jogador INTEGER PRIMARY KEY,
Salario DECIMAL(10,2),
Nome_jogador VARCHAR(50),
Telefone VARCHAR(15),
ID_posi��o_FK INTEGER,
ID_nacionalidade_FK INTEGER
)

CREATE TABLE POSI��O (
ID_posi��o INTEGER PRIMARY KEY,
Tipo_posi��o VARCHAR(50)
)

CREATE TABLE NACIONALIDADES (
ID_nacionalidade INTEGER PRIMARY KEY,
Nacionalidade VARCHAR(50)
)

CREATE TABLE Pertencem_TRANSA��ES (
ID_transa��o INTEGER PRIMARY KEY,
Data_transa��o DATETIME,
Porcentagem_a�oes INTEGER,
ID_time_FK INTEGER,
ID_dono_FK INTEGER,
FOREIGN KEY(ID_time_FK) REFERENCES TIMES (ID_time)
)

CREATE TABLE DONOS (
ID_dono INTEGER PRIMARY KEY,
Nome_dono VARCHAR(50)
)

ALTER TABLE Patrocinados_DOA��ES ADD FOREIGN KEY(ID_campeonato_FK) REFERENCES CAMPEONATOS (ID_campeonato)
ALTER TABLE Patrocinados_DOA��ES ADD FOREIGN KEY(ID_patrocinador_FK) REFERENCES PATROCINADORES (ID_patrocinador)
ALTER TABLE CAMPEONATOS ADD FOREIGN KEY(ID_Local_FK) REFERENCES LOCAIS (ID_Local)
ALTER TABLE Participam_HISTORICO ADD FOREIGN KEY(ID_time_FK) REFERENCES TIMES (ID_time)
ALTER TABLE Participam_HISTORICO ADD FOREIGN KEY(Coloca��o_FK) REFERENCES COLOCA��O (Coloca��o)
ALTER TABLE TIMES ADD FOREIGN KEY(ID_t�cnico_FK) REFERENCES T�CNICO (ID_t�cnico)
ALTER TABLE Possuem_TRANFERENCIAS ADD FOREIGN KEY(ID_jogador_FK) REFERENCES JOGADORES (ID_jogador)
ALTER TABLE JOGADORES ADD FOREIGN KEY(ID_posi��o_FK) REFERENCES POSI��O (ID_posi��o)
ALTER TABLE JOGADORES ADD FOREIGN KEY(ID_nacionalidade_FK) REFERENCES NACIONALIDADES (ID_nacionalidade)
ALTER TABLE Pertencem_TRANSA��ES ADD FOREIGN KEY(ID_dono_FK) REFERENCES DONOS (ID_dono)
