USE [master]
GO
/****** Object:  Database [eKlinika]    Script Date: 9/26/2019 7:28:33 PM ******/
CREATE DATABASE [eKlinika]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eKlinika', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\eKlinika.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'eKlinika_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\eKlinika_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [eKlinika] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eKlinika].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eKlinika] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eKlinika] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eKlinika] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eKlinika] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eKlinika] SET ARITHABORT OFF 
GO
ALTER DATABASE [eKlinika] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eKlinika] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eKlinika] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eKlinika] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eKlinika] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eKlinika] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eKlinika] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eKlinika] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eKlinika] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eKlinika] SET  ENABLE_BROKER 
GO
ALTER DATABASE [eKlinika] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eKlinika] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eKlinika] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eKlinika] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eKlinika] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eKlinika] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [eKlinika] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eKlinika] SET RECOVERY FULL 
GO
ALTER DATABASE [eKlinika] SET  MULTI_USER 
GO
ALTER DATABASE [eKlinika] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eKlinika] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eKlinika] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eKlinika] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eKlinika] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'eKlinika', N'ON'
GO
ALTER DATABASE [eKlinika] SET QUERY_STORE = OFF
GO
USE [eKlinika]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/26/2019 7:28:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apotekar]    Script Date: 9/26/2019 7:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apotekar](
	[Id] [int] NOT NULL,
	[OpisPosla] [nvarchar](max) NULL,
 CONSTRAINT [PK_Apotekar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApotekaRacun]    Script Date: 9/26/2019 7:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApotekaRacun](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApotekarId] [int] NOT NULL,
	[DatumIzdavanja] [datetime2](7) NOT NULL,
	[PacijentId] [int] NOT NULL,
 CONSTRAINT [PK_ApotekaRacun] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutorizacijskiToken]    Script Date: 9/26/2019 7:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutorizacijskiToken](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IpAdresa] [nvarchar](max) NULL,
	[KorisniciId] [int] NOT NULL,
	[Vrijednost] [nvarchar](max) NULL,
	[VrijemeEvidentiranja] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AutorizacijskiToken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dijagnoza]    Script Date: 9/26/2019 7:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dijagnoza](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Opis] [nvarchar](max) NULL,
	[StrucniOpis] [nvarchar](max) NULL,
	[DoktorSpecijalizacija] [nvarchar](max) NULL,
 CONSTRAINT [PK_Dijagnoza] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dobavljac]    Script Date: 9/26/2019 7:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dobavljac](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DrzavaId] [int] NOT NULL,
	[Kontakt] [nvarchar](max) NULL,
	[Naziv] [nvarchar](max) NULL,
 CONSTRAINT [PK_Dobavljac] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doktor]    Script Date: 9/26/2019 7:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktor](
	[Id] [int] NOT NULL,
	[DatumSpecijalizacije] [datetime2](7) NOT NULL,
	[Specijalizacija] [nvarchar](max) NULL,
	[Titula] [nvarchar](max) NULL,
 CONSTRAINT [PK_Doktor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Drzava]    Script Date: 9/26/2019 7:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drzava](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](max) NULL,
	[Oznaka] [nvarchar](max) NULL,
 CONSTRAINT [PK_Drzava] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grad]    Script Date: 9/26/2019 7:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DrzavaId] [int] NOT NULL,
	[Naziv] [nvarchar](max) NULL,
	[PostanskiBroj] [nvarchar](max) NULL,
 CONSTRAINT [PK_Grad] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Korisnici]    Script Date: 9/26/2019 7:28:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnici](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[LozinkaHash] [nvarchar](max) NULL,
	[LozinkaSalt] [nvarchar](max) NULL,
	[DatumRodjenja] [datetime2](7) NOT NULL,
	[GradId] [int] NULL,
	[Ime] [nvarchar](max) NULL,
	[Prezime] [nvarchar](max) NULL,
	[JMBG] [nvarchar](max) NULL,
	[Slika] [varbinary](max) NULL,
	[Spol] [nvarchar](max) NULL,
	[Ulica] [nvarchar](max) NULL,
 CONSTRAINT [PK_Korisnici] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KorisniciUloge]    Script Date: 9/26/2019 7:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KorisniciUloge](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KorisnikId] [int] NOT NULL,
	[UlogaId] [int] NOT NULL,
 CONSTRAINT [PK_KorisniciUloge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KrvnaGrupa]    Script Date: 9/26/2019 7:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KrvnaGrupa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](max) NULL,
 CONSTRAINT [PK_KrvnaGrupa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LabPretraga]    Script Date: 9/26/2019 7:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LabPretraga](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MjernaJedinica] [nvarchar](max) NULL,
	[Naziv] [nvarchar](max) NULL,
	[ReferentnaVrijednostDonja] [float] NOT NULL,
	[ReferentnaVrijednostGornja] [float] NOT NULL,
	[VrstaPretrageId] [int] NOT NULL,
	[VrstaVr] [int] NOT NULL,
 CONSTRAINT [PK_LabPretraga] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lijek]    Script Date: 9/26/2019 7:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lijek](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CijenaPoKomadu] [float] NOT NULL,
	[Naziv] [nvarchar](max) NULL,
	[PoReceptu] [bit] NOT NULL,
	[ProizvodjacId] [int] NOT NULL,
	[Tip] [nvarchar](max) NULL,
	[UkupnoNaStanju] [int] NOT NULL,
	[Uputstvo] [nvarchar](max) NULL,
 CONSTRAINT [PK_Lijek] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicinskaSestra]    Script Date: 9/26/2019 7:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicinskaSestra](
	[Id] [int] NOT NULL,
	[Certifikati] [nvarchar](max) NULL,
	[Kursevi] [nvarchar](max) NULL,
 CONSTRAINT [PK_MedicinskaSestra] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modalitet]    Script Date: 9/26/2019 7:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modalitet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabPretragaId] [int] NOT NULL,
	[Opis] [nvarchar](max) NULL,
	[isReferentnaVrijednost] [bit] NOT NULL,
 CONSTRAINT [PK_Modalitet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Narudzba]    Script Date: 9/26/2019 7:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Narudzba](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DatumIsporuke] [datetime2](7) NULL,
	[DatumNarudzbe] [datetime2](7) NOT NULL,
	[DobavljacId] [int] NOT NULL,
 CONSTRAINT [PK_Narudzba] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NarudzbaStavka]    Script Date: 9/26/2019 7:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NarudzbaStavka](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Kolicina] [int] NOT NULL,
	[LijekId] [int] NOT NULL,
	[NarudzbaId] [int] NOT NULL,
 CONSTRAINT [PK_NarudzbaStavka] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Osoblje]    Script Date: 9/26/2019 7:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Osoblje](
	[Id] [int] NOT NULL,
	[DatumZaposlenja] [datetime2](7) NOT NULL,
	[GodineStaza] [int] NOT NULL,
	[Jezici] [nvarchar](max) NULL,
	[TipZaposlenja] [nvarchar](max) NULL,
	[TrajanjeUgovora] [nvarchar](max) NULL,
 CONSTRAINT [PK_Osoblje] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacijent]    Script Date: 9/26/2019 7:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacijent](
	[Id] [int] NOT NULL,
	[Alergije] [nvarchar](max) NULL,
	[BrojKartona] [nvarchar](max) NULL,
	[BrojKnjizice] [nvarchar](max) NULL,
	[DatumRegistracije] [datetime2](7) NOT NULL,
	[KrvnaGrupaId] [int] NOT NULL,
	[SpecijalniZahtjevi] [nvarchar](max) NULL,
	[Tezina] [float] NOT NULL,
	[Visina] [int] NOT NULL,
 CONSTRAINT [PK_Pacijent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pregled]    Script Date: 9/26/2019 7:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pregled](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DatumPregleda] [datetime2](7) NOT NULL,
	[DatumRezervacije] [datetime2](7) NOT NULL,
	[DoktorId] [int] NOT NULL,
	[MedicinskaSestraId] [int] NOT NULL,
	[Napomena] [nvarchar](max) NULL,
	[Prioritet] [nvarchar](max) NULL,
	[TipPregleda] [nvarchar](max) NULL,
	[isOdrzan] [bit] NOT NULL,
	[PacijentId] [int] NOT NULL,
 CONSTRAINT [PK_Pregled] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proizvodjac]    Script Date: 9/26/2019 7:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proizvodjac](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Kontakt] [nvarchar](max) NULL,
	[Naziv] [nvarchar](max) NULL,
 CONSTRAINT [PK_Proizvodjac] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RacunStavka]    Script Date: 9/26/2019 7:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RacunStavka](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApotekaRacunId] [int] NOT NULL,
	[Kolicina] [int] NOT NULL,
	[LijekId] [int] NOT NULL,
 CONSTRAINT [PK_RacunStavka] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recept]    Script Date: 9/26/2019 7:28:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recept](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DatumIzdavanja] [datetime2](7) NOT NULL,
	[LijekId] [int] NOT NULL,
	[PregledId] [int] NOT NULL,
	[Uputstvo] [nvarchar](max) NULL,
	[IsObradjen] [bit] NOT NULL,
 CONSTRAINT [PK_Recept] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RezultatPretrage]    Script Date: 9/26/2019 7:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RezultatPretrage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabPretragaId] [int] NOT NULL,
	[ModalitetId] [int] NULL,
	[NumerickaVrijednost] [float] NULL,
	[UputnicaId] [int] NOT NULL,
 CONSTRAINT [PK_RezultatPretrage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uloge]    Script Date: 9/26/2019 7:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uloge](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](max) NULL,
	[Opis] [nvarchar](max) NULL,
 CONSTRAINT [PK_Uloge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uplata]    Script Date: 9/26/2019 7:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uplata](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrojUplatnice] [nvarchar](max) NULL,
	[DatumUplate] [datetime2](7) NOT NULL,
	[Iznos] [float] NOT NULL,
	[Namjena] [nvarchar](max) NULL,
	[PacijentId] [int] NOT NULL,
	[PregledId] [int] NULL,
	[ZiroRacun] [nvarchar](max) NULL,
 CONSTRAINT [PK_Uplata] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uputnica]    Script Date: 9/26/2019 7:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uputnica](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DatumRezultata] [datetime2](7) NOT NULL,
	[DatumUputnice] [datetime2](7) NOT NULL,
	[IsGotovNalaz] [bit] NOT NULL,
	[LaboratorijDoktorId] [int] NOT NULL,
	[PacijentId] [int] NOT NULL,
	[UputioDoktorId] [int] NOT NULL,
	[VrstaPretrageId] [int] NOT NULL,
 CONSTRAINT [PK_Uputnica] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UstanovljenaDijagnoza]    Script Date: 9/26/2019 7:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UstanovljenaDijagnoza](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Detalji] [nvarchar](max) NULL,
	[DijagnozaId] [int] NOT NULL,
	[Napomena] [nvarchar](max) NULL,
	[PregledId] [int] NOT NULL,
 CONSTRAINT [PK_UstanovljenaDijagnoza] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VrstaPretrage]    Script Date: 9/26/2019 7:28:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VrstaPretrage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](max) NULL,
 CONSTRAINT [PK_VrstaPretrage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_ApotekaRacun_ApotekarId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApotekaRacun_ApotekarId] ON [dbo].[ApotekaRacun]
(
	[ApotekarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApotekaRacun_PacijentId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApotekaRacun_PacijentId] ON [dbo].[ApotekaRacun]
(
	[PacijentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Dobavljac_DrzavaId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Dobavljac_DrzavaId] ON [dbo].[Dobavljac]
(
	[DrzavaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Grad_DrzavaId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Grad_DrzavaId] ON [dbo].[Grad]
(
	[DrzavaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CS_Email]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [CS_Email] ON [dbo].[Korisnici]
(
	[Email] ASC
)
WHERE ([Email] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CS_UserName]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [CS_UserName] ON [dbo].[Korisnici]
(
	[UserName] ASC
)
WHERE ([UserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Korisnici_GradId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Korisnici_GradId] ON [dbo].[Korisnici]
(
	[GradId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_KorisniciUloge_KorisnikId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_KorisniciUloge_KorisnikId] ON [dbo].[KorisniciUloge]
(
	[KorisnikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_KorisniciUloge_UlogaId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_KorisniciUloge_UlogaId] ON [dbo].[KorisniciUloge]
(
	[UlogaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LabPretraga_VrstaPretrageId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_LabPretraga_VrstaPretrageId] ON [dbo].[LabPretraga]
(
	[VrstaPretrageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Lijek_ProizvodjacId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Lijek_ProizvodjacId] ON [dbo].[Lijek]
(
	[ProizvodjacId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Modalitet_LabPretragaId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Modalitet_LabPretragaId] ON [dbo].[Modalitet]
(
	[LabPretragaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Narudzba_DobavljacId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Narudzba_DobavljacId] ON [dbo].[Narudzba]
(
	[DobavljacId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NarudzbaStavka_LijekId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_NarudzbaStavka_LijekId] ON [dbo].[NarudzbaStavka]
(
	[LijekId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NarudzbaStavka_NarudzbaId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_NarudzbaStavka_NarudzbaId] ON [dbo].[NarudzbaStavka]
(
	[NarudzbaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pacijent_KrvnaGrupaId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Pacijent_KrvnaGrupaId] ON [dbo].[Pacijent]
(
	[KrvnaGrupaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pregled_DoktorId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Pregled_DoktorId] ON [dbo].[Pregled]
(
	[DoktorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pregled_MedicinskaSestraId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Pregled_MedicinskaSestraId] ON [dbo].[Pregled]
(
	[MedicinskaSestraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Pregled_PacijentId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Pregled_PacijentId] ON [dbo].[Pregled]
(
	[PacijentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RacunStavka_ApotekaRacunId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_RacunStavka_ApotekaRacunId] ON [dbo].[RacunStavka]
(
	[ApotekaRacunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RacunStavka_LijekId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_RacunStavka_LijekId] ON [dbo].[RacunStavka]
(
	[LijekId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Recept_LijekId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Recept_LijekId] ON [dbo].[Recept]
(
	[LijekId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Recept_PregledId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Recept_PregledId] ON [dbo].[Recept]
(
	[PregledId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RezultatPretrage_LabPretragaId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_RezultatPretrage_LabPretragaId] ON [dbo].[RezultatPretrage]
(
	[LabPretragaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RezultatPretrage_ModalitetId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_RezultatPretrage_ModalitetId] ON [dbo].[RezultatPretrage]
(
	[ModalitetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RezultatPretrage_UputnicaId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_RezultatPretrage_UputnicaId] ON [dbo].[RezultatPretrage]
(
	[UputnicaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Uplata_PacijentId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Uplata_PacijentId] ON [dbo].[Uplata]
(
	[PacijentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Uplata_PregledId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Uplata_PregledId] ON [dbo].[Uplata]
(
	[PregledId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Uputnica_LaboratorijDoktorId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Uputnica_LaboratorijDoktorId] ON [dbo].[Uputnica]
(
	[LaboratorijDoktorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Uputnica_PacijentId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Uputnica_PacijentId] ON [dbo].[Uputnica]
(
	[PacijentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Uputnica_UputioDoktorId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Uputnica_UputioDoktorId] ON [dbo].[Uputnica]
(
	[UputioDoktorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Uputnica_VrstaPretrageId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Uputnica_VrstaPretrageId] ON [dbo].[Uputnica]
(
	[VrstaPretrageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UstanovljenaDijagnoza_DijagnozaId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_UstanovljenaDijagnoza_DijagnozaId] ON [dbo].[UstanovljenaDijagnoza]
(
	[DijagnozaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UstanovljenaDijagnoza_PregledId]    Script Date: 9/26/2019 7:28:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_UstanovljenaDijagnoza_PregledId] ON [dbo].[UstanovljenaDijagnoza]
(
	[PregledId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Apotekar]  WITH CHECK ADD  CONSTRAINT [FK_Apotekar_Osoblje_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Osoblje] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Apotekar] CHECK CONSTRAINT [FK_Apotekar_Osoblje_Id]
GO
ALTER TABLE [dbo].[ApotekaRacun]  WITH CHECK ADD  CONSTRAINT [FK_ApotekaRacun_Apotekar_ApotekarId] FOREIGN KEY([ApotekarId])
REFERENCES [dbo].[Apotekar] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApotekaRacun] CHECK CONSTRAINT [FK_ApotekaRacun_Apotekar_ApotekarId]
GO
ALTER TABLE [dbo].[ApotekaRacun]  WITH CHECK ADD  CONSTRAINT [FK_ApotekaRacun_Pacijent_PacijentId] FOREIGN KEY([PacijentId])
REFERENCES [dbo].[Pacijent] ([Id])
GO
ALTER TABLE [dbo].[ApotekaRacun] CHECK CONSTRAINT [FK_ApotekaRacun_Pacijent_PacijentId]
GO
ALTER TABLE [dbo].[AutorizacijskiToken]  WITH CHECK ADD  CONSTRAINT [FK_AutorizacijskiToken_Korisnici_KorisniciId] FOREIGN KEY([KorisniciId])
REFERENCES [dbo].[Korisnici] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AutorizacijskiToken] CHECK CONSTRAINT [FK_AutorizacijskiToken_Korisnici_KorisniciId]
GO
ALTER TABLE [dbo].[Dobavljac]  WITH CHECK ADD  CONSTRAINT [FK_Dobavljac_Drzava_DrzavaId] FOREIGN KEY([DrzavaId])
REFERENCES [dbo].[Drzava] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Dobavljac] CHECK CONSTRAINT [FK_Dobavljac_Drzava_DrzavaId]
GO
ALTER TABLE [dbo].[Doktor]  WITH CHECK ADD  CONSTRAINT [FK_Doktor_Osoblje_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Osoblje] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doktor] CHECK CONSTRAINT [FK_Doktor_Osoblje_Id]
GO
ALTER TABLE [dbo].[Grad]  WITH CHECK ADD  CONSTRAINT [FK_Grad_Drzava_DrzavaId] FOREIGN KEY([DrzavaId])
REFERENCES [dbo].[Drzava] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Grad] CHECK CONSTRAINT [FK_Grad_Drzava_DrzavaId]
GO
ALTER TABLE [dbo].[Korisnici]  WITH CHECK ADD  CONSTRAINT [FK_Korisnici_Grad_GradId] FOREIGN KEY([GradId])
REFERENCES [dbo].[Grad] ([Id])
GO
ALTER TABLE [dbo].[Korisnici] CHECK CONSTRAINT [FK_Korisnici_Grad_GradId]
GO
ALTER TABLE [dbo].[KorisniciUloge]  WITH CHECK ADD  CONSTRAINT [FK_KorisniciUloge_Korisnici_KorisnikId] FOREIGN KEY([KorisnikId])
REFERENCES [dbo].[Korisnici] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KorisniciUloge] CHECK CONSTRAINT [FK_KorisniciUloge_Korisnici_KorisnikId]
GO
ALTER TABLE [dbo].[KorisniciUloge]  WITH CHECK ADD  CONSTRAINT [FK_KorisniciUloge_Uloge_UlogaId] FOREIGN KEY([UlogaId])
REFERENCES [dbo].[Uloge] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KorisniciUloge] CHECK CONSTRAINT [FK_KorisniciUloge_Uloge_UlogaId]
GO
ALTER TABLE [dbo].[LabPretraga]  WITH CHECK ADD  CONSTRAINT [FK_LabPretraga_VrstaPretrage_VrstaPretrageId] FOREIGN KEY([VrstaPretrageId])
REFERENCES [dbo].[VrstaPretrage] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LabPretraga] CHECK CONSTRAINT [FK_LabPretraga_VrstaPretrage_VrstaPretrageId]
GO
ALTER TABLE [dbo].[Lijek]  WITH CHECK ADD  CONSTRAINT [FK_Lijek_Proizvodjac_ProizvodjacId] FOREIGN KEY([ProizvodjacId])
REFERENCES [dbo].[Proizvodjac] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lijek] CHECK CONSTRAINT [FK_Lijek_Proizvodjac_ProizvodjacId]
GO
ALTER TABLE [dbo].[MedicinskaSestra]  WITH CHECK ADD  CONSTRAINT [FK_MedicinskaSestra_Osoblje_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Osoblje] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MedicinskaSestra] CHECK CONSTRAINT [FK_MedicinskaSestra_Osoblje_Id]
GO
ALTER TABLE [dbo].[Modalitet]  WITH CHECK ADD  CONSTRAINT [FK_Modalitet_LabPretraga_LabPretragaId] FOREIGN KEY([LabPretragaId])
REFERENCES [dbo].[LabPretraga] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Modalitet] CHECK CONSTRAINT [FK_Modalitet_LabPretraga_LabPretragaId]
GO
ALTER TABLE [dbo].[Narudzba]  WITH CHECK ADD  CONSTRAINT [FK_Narudzba_Dobavljac_DobavljacId] FOREIGN KEY([DobavljacId])
REFERENCES [dbo].[Dobavljac] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Narudzba] CHECK CONSTRAINT [FK_Narudzba_Dobavljac_DobavljacId]
GO
ALTER TABLE [dbo].[NarudzbaStavka]  WITH CHECK ADD  CONSTRAINT [FK_NarudzbaStavka_Lijek_LijekId] FOREIGN KEY([LijekId])
REFERENCES [dbo].[Lijek] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NarudzbaStavka] CHECK CONSTRAINT [FK_NarudzbaStavka_Lijek_LijekId]
GO
ALTER TABLE [dbo].[NarudzbaStavka]  WITH CHECK ADD  CONSTRAINT [FK_NarudzbaStavka_Narudzba_NarudzbaId] FOREIGN KEY([NarudzbaId])
REFERENCES [dbo].[Narudzba] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NarudzbaStavka] CHECK CONSTRAINT [FK_NarudzbaStavka_Narudzba_NarudzbaId]
GO
ALTER TABLE [dbo].[Osoblje]  WITH CHECK ADD  CONSTRAINT [FK_Osoblje_Korisnici_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Korisnici] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Osoblje] CHECK CONSTRAINT [FK_Osoblje_Korisnici_Id]
GO
ALTER TABLE [dbo].[Pacijent]  WITH CHECK ADD  CONSTRAINT [FK_Pacijent_Korisnici_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Korisnici] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pacijent] CHECK CONSTRAINT [FK_Pacijent_Korisnici_Id]
GO
ALTER TABLE [dbo].[Pacijent]  WITH CHECK ADD  CONSTRAINT [FK_Pacijent_KrvnaGrupa_KrvnaGrupaId] FOREIGN KEY([KrvnaGrupaId])
REFERENCES [dbo].[KrvnaGrupa] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pacijent] CHECK CONSTRAINT [FK_Pacijent_KrvnaGrupa_KrvnaGrupaId]
GO
ALTER TABLE [dbo].[Pregled]  WITH CHECK ADD  CONSTRAINT [FK_Pregled_Doktor_DoktorId] FOREIGN KEY([DoktorId])
REFERENCES [dbo].[Doktor] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pregled] CHECK CONSTRAINT [FK_Pregled_Doktor_DoktorId]
GO
ALTER TABLE [dbo].[Pregled]  WITH CHECK ADD  CONSTRAINT [FK_Pregled_MedicinskaSestra_MedicinskaSestraId] FOREIGN KEY([MedicinskaSestraId])
REFERENCES [dbo].[MedicinskaSestra] ([Id])
GO
ALTER TABLE [dbo].[Pregled] CHECK CONSTRAINT [FK_Pregled_MedicinskaSestra_MedicinskaSestraId]
GO
ALTER TABLE [dbo].[Pregled]  WITH CHECK ADD  CONSTRAINT [FK_Pregled_Pacijent_PacijentId] FOREIGN KEY([PacijentId])
REFERENCES [dbo].[Pacijent] ([Id])
GO
ALTER TABLE [dbo].[Pregled] CHECK CONSTRAINT [FK_Pregled_Pacijent_PacijentId]
GO
ALTER TABLE [dbo].[RacunStavka]  WITH CHECK ADD  CONSTRAINT [FK_RacunStavka_ApotekaRacun_ApotekaRacunId] FOREIGN KEY([ApotekaRacunId])
REFERENCES [dbo].[ApotekaRacun] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RacunStavka] CHECK CONSTRAINT [FK_RacunStavka_ApotekaRacun_ApotekaRacunId]
GO
ALTER TABLE [dbo].[RacunStavka]  WITH CHECK ADD  CONSTRAINT [FK_RacunStavka_Lijek_LijekId] FOREIGN KEY([LijekId])
REFERENCES [dbo].[Lijek] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RacunStavka] CHECK CONSTRAINT [FK_RacunStavka_Lijek_LijekId]
GO
ALTER TABLE [dbo].[Recept]  WITH CHECK ADD  CONSTRAINT [FK_Recept_Lijek_LijekId] FOREIGN KEY([LijekId])
REFERENCES [dbo].[Lijek] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Recept] CHECK CONSTRAINT [FK_Recept_Lijek_LijekId]
GO
ALTER TABLE [dbo].[Recept]  WITH CHECK ADD  CONSTRAINT [FK_Recept_Pregled_PregledId] FOREIGN KEY([PregledId])
REFERENCES [dbo].[Pregled] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Recept] CHECK CONSTRAINT [FK_Recept_Pregled_PregledId]
GO
ALTER TABLE [dbo].[RezultatPretrage]  WITH CHECK ADD  CONSTRAINT [FK_RezultatPretrage_LabPretraga_LabPretragaId] FOREIGN KEY([LabPretragaId])
REFERENCES [dbo].[LabPretraga] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RezultatPretrage] CHECK CONSTRAINT [FK_RezultatPretrage_LabPretraga_LabPretragaId]
GO
ALTER TABLE [dbo].[RezultatPretrage]  WITH CHECK ADD  CONSTRAINT [FK_RezultatPretrage_Modalitet_ModalitetId] FOREIGN KEY([ModalitetId])
REFERENCES [dbo].[Modalitet] ([Id])
GO
ALTER TABLE [dbo].[RezultatPretrage] CHECK CONSTRAINT [FK_RezultatPretrage_Modalitet_ModalitetId]
GO
ALTER TABLE [dbo].[RezultatPretrage]  WITH CHECK ADD  CONSTRAINT [FK_RezultatPretrage_Uputnica_UputnicaId] FOREIGN KEY([UputnicaId])
REFERENCES [dbo].[Uputnica] ([Id])
GO
ALTER TABLE [dbo].[RezultatPretrage] CHECK CONSTRAINT [FK_RezultatPretrage_Uputnica_UputnicaId]
GO
ALTER TABLE [dbo].[Uplata]  WITH CHECK ADD  CONSTRAINT [FK_Uplata_Pacijent_PacijentId] FOREIGN KEY([PacijentId])
REFERENCES [dbo].[Pacijent] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Uplata] CHECK CONSTRAINT [FK_Uplata_Pacijent_PacijentId]
GO
ALTER TABLE [dbo].[Uplata]  WITH CHECK ADD  CONSTRAINT [FK_Uplata_Pregled_PregledId] FOREIGN KEY([PregledId])
REFERENCES [dbo].[Pregled] ([Id])
GO
ALTER TABLE [dbo].[Uplata] CHECK CONSTRAINT [FK_Uplata_Pregled_PregledId]
GO
ALTER TABLE [dbo].[Uputnica]  WITH CHECK ADD  CONSTRAINT [FK_Uputnica_Doktor_LaboratorijDoktorId] FOREIGN KEY([LaboratorijDoktorId])
REFERENCES [dbo].[Doktor] ([Id])
GO
ALTER TABLE [dbo].[Uputnica] CHECK CONSTRAINT [FK_Uputnica_Doktor_LaboratorijDoktorId]
GO
ALTER TABLE [dbo].[Uputnica]  WITH CHECK ADD  CONSTRAINT [FK_Uputnica_Doktor_UputioDoktorId] FOREIGN KEY([UputioDoktorId])
REFERENCES [dbo].[Doktor] ([Id])
GO
ALTER TABLE [dbo].[Uputnica] CHECK CONSTRAINT [FK_Uputnica_Doktor_UputioDoktorId]
GO
ALTER TABLE [dbo].[Uputnica]  WITH CHECK ADD  CONSTRAINT [FK_Uputnica_Pacijent_PacijentId] FOREIGN KEY([PacijentId])
REFERENCES [dbo].[Pacijent] ([Id])
GO
ALTER TABLE [dbo].[Uputnica] CHECK CONSTRAINT [FK_Uputnica_Pacijent_PacijentId]
GO
ALTER TABLE [dbo].[Uputnica]  WITH CHECK ADD  CONSTRAINT [FK_Uputnica_VrstaPretrage_VrstaPretrageId] FOREIGN KEY([VrstaPretrageId])
REFERENCES [dbo].[VrstaPretrage] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Uputnica] CHECK CONSTRAINT [FK_Uputnica_VrstaPretrage_VrstaPretrageId]
GO
ALTER TABLE [dbo].[UstanovljenaDijagnoza]  WITH CHECK ADD  CONSTRAINT [FK_UstanovljenaDijagnoza_Dijagnoza_DijagnozaId] FOREIGN KEY([DijagnozaId])
REFERENCES [dbo].[Dijagnoza] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UstanovljenaDijagnoza] CHECK CONSTRAINT [FK_UstanovljenaDijagnoza_Dijagnoza_DijagnozaId]
GO
ALTER TABLE [dbo].[UstanovljenaDijagnoza]  WITH CHECK ADD  CONSTRAINT [FK_UstanovljenaDijagnoza_Pregled_PregledId] FOREIGN KEY([PregledId])
REFERENCES [dbo].[Pregled] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UstanovljenaDijagnoza] CHECK CONSTRAINT [FK_UstanovljenaDijagnoza_Pregled_PregledId]
GO
USE [master]
GO
ALTER DATABASE [eKlinika] SET  READ_WRITE 
GO
