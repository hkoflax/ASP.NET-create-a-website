CREATE PROCEDURE SelectPlayerDetails
(
@Name nvarchar(50)
)
AS
SELECT PlayerName,JerseyNumber,DOB, ClubName from Players join Clubs ON Clubs.RegNum = Players.ClubRegNum WHERE PlayerName=@Name