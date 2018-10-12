CREATE PROCEDURE DeleteClub
(
  @RegId Int
)
AS
Delete FROM Clubs WHERE RegNum=@RegId

