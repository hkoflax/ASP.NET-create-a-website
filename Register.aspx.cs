using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
}