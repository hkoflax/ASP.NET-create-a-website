CREATE PROCEDURE InsertClub
(
  @RegNum   int,
  @ClubName nvarchar(50),
  @ClubCity nvarchar(50),
  @Adress   nvarchar(50)
)
AS
INSERT INTO Clubs (RegNum,ClubName,ClubCity,Adress)
			VALUES(@RegNum,@ClubName,@ClubCity,@Adress)