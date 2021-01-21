USE [master]
GO
/****** Object:  Database [ShopDB]    Script Date: 1/21/2021 13:57:06 ******/
CREATE DATABASE [ShopDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopDB', FILENAME = N'C:\Users\Aca\ShopDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopDB_log', FILENAME = N'C:\Users\Aca\ShopDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ShopDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ShopDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopDB] SET  MULTI_USER 
GO
ALTER DATABASE [ShopDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopDB] SET QUERY_STORE = OFF
GO
USE [ShopDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ShopDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/21/2021 13:57:06 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 1/21/2021 13:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[ShopID] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 1/21/2021 13:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Length] [nvarchar](255) NULL,
	[Score] [nvarchar](255) NULL,
	[Image] [nvarchar](255) NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 1/21/2021 13:57:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210104181154_V1', N'5.0.1')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([ID], [Name], [Description], [ShopID]) VALUES (2, N'Action', N'Action film is a film genre in which the protagonist or protagonists are thrust into a series of events that typically include violence, extended fighting, physical feats, rescues and frantic chases.', 3)
GO
INSERT [dbo].[Category] ([ID], [Name], [Description], [ShopID]) VALUES (3, N'Comedy', N'A comedy film is a category of film in which the main emphasis is on humor. These films are designed to make the audience laugh through amusement and most often work by exaggerating characteristics for humorous effect.', 3)
GO
INSERT [dbo].[Category] ([ID], [Name], [Description], [ShopID]) VALUES (4, N'Crime', N'Crime is a film genre inspired by and analogous to the crime fiction literary genre. Films of this genre generally involve various aspects of crime and its detection.', 3)
GO
INSERT [dbo].[Category] ([ID], [Name], [Description], [ShopID]) VALUES (5, N'Fantasy', N'Fantasy films are films that belong to the fantasy genre with fantastic themes, usually magic, supernatural events, mythology, folklore, or exotic fantasy worlds.', 3)
GO
INSERT [dbo].[Category] ([ID], [Name], [Description], [ShopID]) VALUES (6, N'Horror', N'A horror film is one that seeks to elicit fear in its audience for entertainment purposes. Horror films additionally aim to evoke viewers'' nightmares, fears, revulsions and terror of the unknown and macabre.', 3)
GO
INSERT [dbo].[Category] ([ID], [Name], [Description], [ShopID]) VALUES (7, N'Romance', N'Romance films are romantic love stories that focus on passion, emotion, and the affectionate romantic involvement of the main characters and the journey that their love takes them through dating, courtship or marriage.', 3)
GO
INSERT [dbo].[Category] ([ID], [Name], [Description], [ShopID]) VALUES (8, N'Sci-Fi', N'Sci-Fi is a film genre that uses speculative, fictional science-based depictions, such as extraterrestrial lifeforms, alien worlds and time travel, along with futuristic elements such as spacecraft, robots, interstellar travel or other technologies.', 3)
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (27, N'The Dark Knight', N'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', N'2h 32min', N'9.0/10', N'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_FMjpg_UY864_.jpg', 2)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (32, N'The Lord of the Rings: The Fellowship of the Ring', N'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron. ', N'2h 58min', N'8.8/10', N'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_FMjpg_UY862_.jpg', 5)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (33, N'The Godfather', N'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son. ', N'2h 55min', N'9.2/10', N'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UY901_.jpg', 4)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (34, N'Pulp Fiction', N'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption. ', N' 2h 34min', N'8.9/10', N'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@.jpg', 4)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (37, N'The Lord of the Rings: The Two Towers', N'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron''s new ally, Saruman, and his hordes of Isengard.', N'2h 59min', N'8.7/10', N'https://m.media-amazon.com/images/M/MV5BZGMxZTdjZmYtMmE2Ni00ZTdkLWI5NTgtNjlmMjBiNzU2MmI5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UX964_.jpg', 5)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (38, N'The Lord of the Rings: The Return of the King', N'Gandalf and Aragorn lead the World of Men against Sauron''s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', N'3h 21min', N'8.9/10', N'https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX800_.jpg', 5)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (39, N'Inception', N'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', N'2h 28min', N'8.8/10', N'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_FMjpg_UX700_.jpg', 2)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (40, N'Inception', N'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', N' 2h 28min', N'8.8/10', N'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_FMjpg_UX700_.jpg', 8)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (41, N'The Matrix', N'When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.', N'2h 16min', N'8.7/10', N'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UY851_.jpg', 8)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (42, N'Goodfellas', N'The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito in the Italian-American crime syndicate. ', N'2h 26min', N'8.7/10', N'https://m.media-amazon.com/images/M/MV5BY2NkZjEzMDgtN2RjYy00YzM1LWI4ZmQtMjIwYjFjNmI3ZGEwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UY854_.jpg', 4)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (43, N'Interstellar', N'A team of explorers travel through a wormhole in space in an attempt to ensure humanity''s survival.', N'2h 49min', N'8.6/10', N'https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UY864_.jpg', 8)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (44, N'The Silence of the Lambs', N'A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.', N'1h 58min', N'8.6/10', N'https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UY867_.jpg', 8)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (45, N'The Silence of the Lambs', N'A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.', N'1h 58min', N'8.6/10', N'https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UY867_.jpg', 4)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (46, N'The Matrix', N'When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.', N'2h 16min', N'8.7/10', N'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UY851_.jpg', 8)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (47, N'The Departed', N'An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston.', N'2h 31min', N'8.5/10', N'https://m.media-amazon.com/images/M/MV5BMTI1MTY2OTIxNV5BMl5BanBnXkFtZTYwNjQ4NjY3._V1_FMjpg_UX450_.jpg', 4)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (48, N'Gladiator', N'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.', N'2h 35min', N'8.5/10', N'https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UY864_.jpg', 2)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (49, N'Back to the Future', N'Marty McFly, a 17-year-old high school student, is accidentally sent thirty years into the past in a time-traveling DeLorean invented by his close friend, the eccentric scientist Doc Brown.', N' 1h 56min', N'8.5/10', N'https://m.media-amazon.com/images/M/MV5BZmU0M2Y1OGUtZjIxNi00ZjBkLTg1MjgtOWIyNThiZWIwYjRiXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX1218_.jpg', 3)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (50, N'Superbad', N'Two co-dependent high school seniors are forced to deal with separation anxiety after their plan to stage a booze-soaked party goes awry.', N'1h 53min', N'7.6/10', N'https://m.media-amazon.com/images/M/MV5BMTc0NjIyMjA2OF5BMl5BanBnXkFtZTcwMzIxNDE1MQ@@._V1_FMjpg_UX336_.jpg', 3)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (51, N'21 Jump Street', N'A pair of underachieving cops are sent back to a local high school to blend in and bring down a synthetic drug ring.', N'1h 49min', N'7.2/10', N'https://m.media-amazon.com/images/M/MV5BNTZjNzRjMTMtZDMzNy00Y2ZjLTg0OTAtZjVhNzYyZmJjOTljXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_FMjpg_UY864_.jpg', 3)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (52, N'The Hangover', N'Three buddies wake up from a bachelor party in Las Vegas, with no memory of the previous night and the bachelor missing. They make their way around the city in order to find their friend before his wedding.', N'1h 40min', N'7.7/10', N'https://m.media-amazon.com/images/M/MV5BNGQwZjg5YmYtY2VkNC00NzliLTljYTctNzI5NmU3MjE2ODQzXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UY864_.jpg', 3)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (53, N'EuroTrip', N'Dumped by his girlfriend, a high school grad decides to embark on an overseas adventure in Europe with his friends. ', N' 1h 32min', N'6.6/10', N'https://m.media-amazon.com/images/M/MV5BMTIxNjcxMDUxN15BMl5BanBnXkFtZTYwNjAxNTM3._V1_FMjpg_UX485_.jpg', 3)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (54, N'Die Hard', N'An NYPD officer tries to save his wife and several others taken hostage by German terrorists during a Christmas party at the Nakatomi Plaza in Los Angeles.', N' 2h 12min', N'8.2/10', N'https://m.media-amazon.com/images/M/MV5BZjRlNDUxZjAtOGQ4OC00OTNlLTgxNmQtYTBmMDgwZmNmNjkxXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1066_.jpg', 2)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (55, N'Terminator 2: Judgment Day', N'A cyborg, identical to the one who failed to kill Sarah Connor, must now protect her teenage son, John Connor, from a more advanced and powerful cyborg. ', N'2h 17min', N'8.5/10', N'https://m.media-amazon.com/images/M/MV5BMGU2NzRmZjUtOGUxYS00ZjdjLWEwZWItY2NlM2JhNjkxNTFmXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_FMjpg_UY861_.jpg', 2)
GO
INSERT [dbo].[Movies] ([ID], [Name], [Description], [Length], [Score], [Image], [CategoryID]) VALUES (56, N'The Shining', N'A family heads to an isolated hotel for the winter where a sinister presence influences the father into violence, while his psychic son sees horrific forebodings from both past and future.', N'2h 26min', N'8.4/10', N'https://m.media-amazon.com/images/M/MV5BZWFlYmY2MGEtZjVkYS00YzU4LTg0YjQtYzY1ZGE3NTA5NGQxXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_FMjpg_UX627_.jpg', 6)
GO
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Shop] ON 
GO
INSERT [dbo].[Shop] ([ID]) VALUES (3)
GO
SET IDENTITY_INSERT [dbo].[Shop] OFF
GO
/****** Object:  Index [IX_Category_ShopID]    Script Date: 1/21/2021 13:57:07 ******/
CREATE NONCLUSTERED INDEX [IX_Category_ShopID] ON [dbo].[Category]
(
	[ShopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Movies_CategoryID]    Script Date: 1/21/2021 13:57:07 ******/
CREATE NONCLUSTERED INDEX [IX_Movies_CategoryID] ON [dbo].[Movies]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Shop_ShopID] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shop] ([ID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Shop_ShopID]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Category_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Category_CategoryID]
GO
USE [master]
GO
ALTER DATABASE [ShopDB] SET  READ_WRITE 
GO
