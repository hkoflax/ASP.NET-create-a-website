CREATE PROCEDURE InsertPlayer
(
  @Name      nvarchar(50),
  @JerseyNum int,
  @DOB		 date,
  @ClubNum   int
)
AS
INSERT INTO Players (PlayerName,JerseyNumber,DOB,ClubRegNum)
			  VALUES(@Name,@JerseyNum,@DOB,@ClubNum)