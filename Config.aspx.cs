using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Config : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //ThemeList.SelectedValue = Request.Cookies["Assignment2Theme"]["Name"];
     }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.Cookies.Get("Assignment2Theme") != null)
        {
            Page.Theme = Request.Cookies["Assignment2Theme"]["Name"];
        }
        else
        {
            Page.Theme = "Light";
            Response.Cookies["Assignment2Theme"]["Name"] = "Light";
            Response.Cookies["Assignment2Theme"].Expires = DateTime.Now.AddDays(1);
        }
    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        Response.Cookies["Assignment2Theme"]["Name"] = ThemeList.SelectedValue;
        Response.Cookies["Assignment2Theme"].Expires = DateTime.Now.AddDays(1);
        Response.Redirect("Home.aspx");
    }
}