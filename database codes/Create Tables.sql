USE [Assignment3]
GO
CREATE TABLE [Clubs] (
    [RegNum]   [int] NOT NULL,
    [ClubName] [nvarchar] (50) NOT NULL,
    [ClubCity] [nvarchar] (50) NULL,
    [Adress]   [nvarchar] (50) NULL,
    CONSTRAINT [PK_Club] PRIMARY KEY CLUSTERED 
	([RegNum] ASC) WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
)ON [PRIMARY]
GO
CREATE TABLE [Players] (
    [PlayerName]   [nvarchar] (50) NOT NULL,
    [JerseyNumber] [int]          NULL,
    [DOB]          [date]         NULL,
    [ClubRegNum]   [int]          NULL,
    CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED 
	([PlayerName] ASC) WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
)ON [PRIMARY]
GO
CREATE TABLE [Matches] (
	[MatchId]	 [int] IDENTITY(1,1) NOT NULL  ,
    [HomeTeam] NVARCHAR(50)  NOT NULL,
    [AwayTeam] NVARCHAR(50)  NOT NULL,
	[MatchDate]  [Date] NOT NULL,
	CONSTRAINT [PK_Match] PRIMARY KEY CLUSTERED 
	([MatchId] ASC) WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
)ON [PRIMARY]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD CONSTRAINT [FK_ClubRegNum] FOREIGN KEY ([ClubRegNum]) 
REFERENCES [Clubs] ([RegNum]) ON DELETE CASCADE