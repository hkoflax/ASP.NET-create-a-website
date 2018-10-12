USE [Assignment3]

--Insert into clubs database--
GO
INSERT INTO [Clubs] ([RegNum],[ClubName],[ClubCity],[Adress])
			  VALUES(1,'FC Barcelona','Barcelona','Aristides Maillol 08028')
INSERT INTO [Clubs] ([RegNum],[ClubName],[ClubCity],[Adress])
			  VALUES(2,'FC Real Madrid','Madrid','Av. de Concha Espina, 1, 28036')
INSERT INTO [Clubs] ([RegNum],[ClubName],[ClubCity],[Adress])
			  VALUES(3,'FC Sevilla','Sevilla','Avenida Eduardo Dato, 41005')

--Insert into players database--

GO
INSERT INTO [Players] ([PlayerName],[JerseyNumber],[DOB],[ClubRegNum])
			    VALUES('Messi',10,'1987-06-24',1)
INSERT INTO [Players] ([PlayerName],[JerseyNumber],[DOB],[ClubRegNum])
			    VALUES('Suarez',9,'1987-01-24',1)
INSERT INTO [Players] ([PlayerName],[JerseyNumber],[DOB],[ClubRegNum])
			    VALUES('Iniesta',8,'1984-05-11',1)
INSERT INTO [Players] ([PlayerName],[JerseyNumber],[DOB],[ClubRegNum])
			    VALUES('Ronaldo',7,'1985-02-05',2)
INSERT INTO [Players] ([PlayerName],[JerseyNumber],[DOB],[ClubRegNum])
			    VALUES('Ramos',4,'1986-03-30',2)
INSERT INTO [Players] ([PlayerName],[JerseyNumber],[DOB],[ClubRegNum])
			    VALUES('Benzema',9,'1987-12-19',2)
INSERT INTO [Players] ([PlayerName],[JerseyNumber],[DOB],[ClubRegNum])
			    VALUES('Nasri',8,'1987-06-26',3)
INSERT INTO [Players] ([PlayerName],[JerseyNumber],[DOB])
			    VALUES('Neymar',10,'1992-02-05')