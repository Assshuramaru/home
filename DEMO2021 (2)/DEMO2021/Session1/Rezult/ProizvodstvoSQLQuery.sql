CREATE DATABASE Proizvodstvo
GO

USE Proizvodstvo

CREATE TABLE TipAgenta
(
	TipAgentaId INT PRIMARY KEY IDENTITY,
	Nazvatie NVARCHAR(150) UNIQUE NOT NULL
)
GO

CREATE TABLE Agent
(
	AgentId INT PRIMARY KEY IDENTITY,
	ImaAgenta NVARCHAR(100) NOT NULL,
	ImaCompanii NVARCHAR(300) UNIQUE NOT NULL,
	UridisheskiiAdres NVARCHAR(500) NOT NULL,
	Inn VARCHAR(30) UNIQUE NOT NULL,
	Kpp VARCHAR(30) UNIQUE NOT NULL,
	FamiliaDirectora NVARCHAR(100) NOT NULL,
	ImaDirectora NVARCHAR(100) NOT NULL,
	OtchestvoDirectora NVARCHAR(100) NULL,
	Telefon VARCHAR(11) UNIQUE NOT NULL,
	Pothta VARCHAR(200) UNIQUE NOT NULL,
	Logotip VARCHAR(400) NULL,
	PrioritetnostPostavkah SMALLINT NOT NULL,
	TipAgentaId INT REFERENCES TipAgenta(TipAgentaId) NOT NULL
)
GO

CREATE TABLE ToskiProdaji
(
	ToskiProdajiId INT PRIMARY KEY IDENTITY,
	AgentId INT REFERENCES Agent(AgentId) NOT NULL,
	Nazvanie NVARCHAR(250) NOT NULL,
	Adres NVARCHAR(450) NOT NULL
)
GO

CREATE TABLE IstoriaPrioritetnostiPostavki
(
	IstoriaPrioritetnostiPostavkiId INT PRIMARY KEY IDENTITY,
	AgentId INT REFERENCES Agent(AgentId) NOT NULL,
	Proiritetnost SMALLINT NOT NULL
)
GO

CREATE TABLE TipProdycta
(
	TipProdyctaId SMALLINT PRIMARY KEY IDENTITY ,
	Nazvanie NVARCHAR(400) UNIQUE NOT NULL
)
GO

CREATE TABLE NomeraStandatrta
(
	NomeraStandatrtaId SMALLINT PRIMARY KEY IDENTITY,
	NazvanieStandarta NVARCHAR(400) UNIQUE NOT NULL,
	Opisanie NVARCHAR(1000) NOT NULL
)
GO

CREATE TABLE Productshia
(
	ProductshiaId INT PRIMARY KEY IDENTITY,
	Artikul NVARCHAR(200) NOT NULL,
	Naimenovanie NVARCHAR(400) NOT NULL,
	Opisanie NVARCHAR(1000) NULL,
	Izobradjenie VARCHAR(400) NULL,
	MinStoimostProductaDlaAgenta MONEY NOT NULL,
	DlinaYpakovki SMALLINT NOT NULL,
	ShirinaYpakovki SMALLINT NOT NULL,
	VisotaYpakovki SMALLINT NOT NULL,
	VesBezYpakovki SMALLINT NOT NULL,
	VesSYpakovki SMALLINT NOT NULL,
	SertifikatCathestva VARCHAR(400) NOT NULL,
	NomeraStandatrtaId SMALLINT REFERENCES NomeraStandatrta(NomeraStandatrtaId) NOT NULL,
	TipProdyctaId SMALLINT REFERENCES TipProdycta(TipProdyctaId) NOT NULL
)
GO

CREATE TABLE Zaiavka
(
	ZaiavkaId INT PRIMARY KEY IDENTITY,
	AgentId INT REFERENCES Agent(AgentId) NOT NULL,
	FamiliaMenedjrea NVARCHAR(100) NOT NULL,
	ImaMenedjrea NVARCHAR(100) NOT NULL,
	OthestvoMenedjrea NVARCHAR(100) NOT NULL,
	DataZaiavki DATE NOT NULL,
	VremaProizvodstva TIME(0) NOT NULL,
	KolishestvoProdyctii SMALLINT NOT NULL,
	OrganizashiaDostavki NVARCHAR(100) NOT NULL,
	StoimostPredoplati MONEY NOT NULL,
	StoimostProisvodstva MONEY NOT NULL,
	StatysPredoplaty BIT NOT NULL,
	StatysPolnoiOplaty BIT NOT NULL,
	StatysZaversheniaZaiavki BIT NOT NULL,
	ProductshiaId INT REFERENCES Productshia(ProductshiaId) NOT NULL
)
GO

CREATE TABLE IstoriaRealizashiiProductii
(
	IstoriaRealizashiiProductiiId INT PRIMARY KEY IDENTITY,
	AgentId INT REFERENCES Agent(AgentId) NOT NULL,
	ProductshiaId INT REFERENCES Productshia(ProductshiaId) NOT NULL
)
GO

CREATE TABLE IstoriaIzmeneniMinStoimostDlaAgent
(
	IstoriaIzmeneniMinStoimostDlaAgentId INT PRIMARY KEY IDENTITY,
	ZaiavkaId INT REFERENCES Zaiavka(ZaiavkaId) NOT NULL,
	DateZaiavki DATE NOT NULL
)
GO

CREATE TABLE Speshialnost
(
	SpeshialnostId SMALLINT PRIMARY KEY IDENTITY,
	Nazvanie NVARCHAR(500) UNIQUE NOT NULL,
)
GO

CREATE TABLE Sotrydnik
(
	SotrydnikId INT PRIMARY KEY IDENTITY,
	Foto VARCHAR(400) NULL,
	Familia NVARCHAR(100) NOT NULL,
	Ima NVARCHAR(100) NOT NULL,
	Othestvo NVARCHAR(100) NULL,
	DateRozdenia DATE NOT NULL,
	SeriaPasporta VARCHAR(4) NOT NULL,
	NomerPasporta VARCHAR(6) NOT NULL,
	MestoProzivania NVARCHAR(500) NOT NULL,
	MestoRozdenia NVARCHAR(500) NOT NULL,
	KemVidanPasport NVARCHAR(400) NOT NULL,
	DateVidachiPasporta DATE NOT NULL,
	KodPodrazdeleniaPasporta VARCHAR(6) NOT NULL,
	ShetPolushtela VARCHAR(30) UNIQUE NOT NULL,
	BankPolushatela NVARCHAR(500) NOT NULL,
	InnBanka VARCHAR(30) UNIQUE NOT NULL,
	BikBanka VARCHAR(30) UNIQUE NOT NULL,
	KorrespondentskiiShet VARCHAR(30) UNIQUE NOT NULL,
	StatusDjenat BIT NOT NULL,
	KolishetvoDetei TINYINT NOT NULL,
	ProblemiSoZdoroviem NVARCHAR(500) NOT NULL,
	GraphikRaboty NVARCHAR(60) NOT NULL,
	SpeshialnostId SMALLINT REFERENCES Speshialnost(SpeshialnostId) NOT NULL
)
GO

CREATE TABLE MestaKompanii
(
	MestaKompaniiId TINYINT PRIMARY KEY IDENTITY,
	Nazvanie NVARCHAR(400) UNIQUE NOT NULL
)
GO

CREATE TABLE HistoriMestopolodjenieSotrydnikov
(
	HistoriMestopolodjenieSotrydnikovId BIGINT PRIMARY KEY IDENTITY,
	DateTimePosehenia DATETIME NOT NULL,
	SotrydnikId INT REFERENCES Sotrydnik(SotrydnikId) NOT NULL,
	MestaKompaniiId TINYINT REFERENCES MestaKompanii(MestaKompaniiId) NOT NULL
)
GO

CREATE TABLE Proizvodstvo
(
	ProizvodstvoId INT PRIMARY KEY IDENTITY ,
	ProductshiaId INT REFERENCES Productshia(ProductshiaId) NOT NULL,
	SotrydnikId INT REFERENCES Sotrydnik(SotrydnikId) NOT NULL
)
GO

CREATE TABLE TipPostavshika
(
	TipPostavshikaId TINYINT PRIMARY KEY IDENTITY,
	Nazvanie NVARCHAR(450) UNIQUE NOT NULL
)
GO

CREATE TABLE TipMaterial
(
	TipMaterialId INT PRIMARY KEY IDENTITY,
	Nazvanie NVARCHAR(500) UNIQUE NOT NULL,
	Opisanie NVARCHAR(1000) NOT NULL
)
GO

CREATE TABLE Material
(
	MaterialId INT PRIMARY KEY IDENTITY,
	Naimenovanie NVARCHAR(500) UNIQUE NOT NULL,
	TipMaterialId INT REFERENCES TipMaterial(TipMaterialId) NOT NULL,
	KolihestwoVYpakovke SMALLINT NOT NULL,
	EdinishaIzmerenia NVARCHAR(40) NOT NULL,
	KolichestvoNaSklade SMALLINT NOT NULL,
	Opisanie NVARCHAR(1000) NULL,
	Izobrajenie VARCHAR(400) NULL,
	Stoimost MONEY NOT NULL
)
GO

CREATE TABLE Postavshik
(
	PostavshikId INT PRIMARY KEY IDENTITY,
	MaterialId INT REFERENCES Material(MaterialId) NOT NULL,
	TipPostavshikaId TINYINT REFERENCES TipPostavshika(TipPostavshikaId) NOT NULL,
	Naimenovanie NVARCHAR(500) NOT NULL,
	Inn VARCHAR(30) UNIQUE NOT NULL
)
GO

CREATE TABLE SpisokMaterialDlaProizvodstvaProdyctii
(
	SpisokMaterialDlaProizvodstvaProdyctiiID INT PRIMARY KEY IDENTITY,
	ProductshiaId INT REFERENCES Productshia(ProductshiaId) NOT NULL,
	MaterialId INT REFERENCES Material(MaterialId) NOT NULL
)
GO

CREATE TABLE IstoriaPostypleniaMaterialov
(
	IstoriaPostypleniaMaterialovId INT PRIMARY KEY IDENTITY,
	MaterialId INT REFERENCES Material(MaterialId) NOT NULL,
	DateAndTime DATETIME NOT NULL,
	KolishestvoYpakovok SMALLINT NOT NULL
)
GO

CREATE TABLE HistoriaIzmeneniiKolisestvaMterialov
(
	HistoriaIzmeneniiKolisestvaMterialovId INT PRIMARY KEY IDENTITY,
	MaterialId INT REFERENCES Material(MaterialId) NOT NULL,
	PostavshikId INT REFERENCES Postavshik(PostavshikId) NOT NULL,
	DateAndTime DATETIME NOT NULL,
	Kolishestvo SMALLINT NOT NULL
)
GO