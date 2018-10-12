CREATE PROCEDURE UpdatePlayerDetails
(
@OldName nvarchar(50),
@NewName nvarchar(50),
@NewJersey Int,
@NewDOB date,
@NewRegNum Int
)
AS
UPDATE Players
SET ClubRegNum = @NewRegNum, JerseyNumber = @NewJersey, DOB=@NewDOB, PlayerName=@NewName
WHERE PlayerName = @OldName