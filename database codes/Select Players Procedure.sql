CREATE PROCEDURE SelectPlayers
(
  @RegId Int
)
AS
SELECT PlayerName, JerseyNumber FROM Players WHERE ClubRegNum=@RegId