CREATE PROCEDURE InsertMatch
(
  @homeTeam nvarchar(50),
  @awayTeam nvarchar(50),
  @date		  date
)
AS
INSERT INTO Matches(HomeTeam,AwayTeam,MatchDate)
			  VALUES(@homeTeam,@awayTeam,@date)