CREATE PROCEDURE SelectClub
(
  @RegId Int
)
AS
SELECT RegNum, ClubName, ClubCity, Adress FROM Clubs WHERE RegNum=@RegId