CREATE PROCEDURE UpdateClubDetails
(
@RegNum Int,
@NewName nvarchar(50),
@NewCity nvarchar(50),
@NewAdress nvarchar(50)
)
AS
UPDATE Clubs
SET ClubName = @NewName, ClubCity = @NewCity, Adress=@NewAdress
WHERE RegNum = @RegNum