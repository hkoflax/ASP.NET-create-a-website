using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Clubs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();
        }
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

    private void Bind()
    {
        DataConnection myConnection = new DataConnection();
        String script = "Select RegNum, ClubName from Clubs";
        ClubView.DataSource= myConnection.ExecuteScript(script);
        ClubView.DataKeyNames = new string[] { "RegNum" };
        ClubView.DataBind();
    }

    protected void ClubView_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Obtain the index of the selected row
        int selectedRowIndex = ClubView.SelectedIndex;
        //assigning the value to the session variable;
        Session["ClubDetailsId"] = (int)ClubView.DataKeys[selectedRowIndex].Value;
        Response.Redirect("ClubDetails.aspx#Body");
    }
}