CREATE PROCEDURE DeletePlayer
(
  @Name Nvarchar(50)
)
AS
Delete FROM Players WHERE PlayerName=@Name