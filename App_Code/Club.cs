using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Club
/// </summary>
public class Club
{
    public String Name { get; set; }
    public string City { get; set; }
    public int RegNum { get; set; }
    public string Adress { get; set; }
    public List<Player> ListOfPlayers = new List<Player>();
    public Club()
    {

    }
    public Club(string name, string city, int regnum)
    {
        this.Name = name;
        this.City = city;
        this.RegNum = regnum;
    }
    public List<Club> Getclubs()
    {
        return (List<Club>)HttpContext.Current.Application["ClubList"];
    }
}