using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Player
/// </summary>
public class Player
{
    public string Name { get; set; }
    public DateTime DOB { get; set; }
    public int Jersey { get; set; }
    public int ClubNumber { get; set; } 
    public Player()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public Player(string name, DateTime dob,int jersey)
    {
        this.Name = name;
        this.DOB = dob;
        this.Jersey = jersey;
    }
}