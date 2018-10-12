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

public partial class ClubDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindDetails();
            BindPlayers();
            try
            {
                if (!Roles.IsUserInRole(User.Identity.Name, "Admin"))
                {
                    DetailsView.Enabled = false;
                }
            }
            catch (HttpException ex)
            {
                Response.Redirect("Login.aspx");
            }
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
    private void BindDetails()
    {
        int clubId = (int)Session["ClubDetailsId"];
        SqlCommand command = new SqlCommand();
        command.CommandText = "SelectClub";
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("RegID", SqlDbType.Int);
        command.Parameters["RegID"].Value = clubId;
        DataConnection myConnection = new DataConnection();
        try
        {
            DetailsView.DataSource = myConnection.ExecuteCommand(command);
            DetailsView.DataKeyNames = new string[] { "RegNum" };
            DetailsView.DataBind();
        }
        finally
        {
            myConnection.CloseConection();
        }
    }
    private void BindPlayers()
    {
        int clubId = (int)Session["ClubDetailsId"];
        SqlCommand command = new SqlCommand();
        command.CommandText = "SelectPlayers";
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("RegID", SqlDbType.Int);
        command.Parameters["RegID"].Value = clubId;
        DataConnection myConnection = new DataConnection();
        try
        {
            PlayerList.DataSource = myConnection.ExecuteCommand(command);
            PlayerList.DataKeyNames = new string[] { "PlayerName" };
            PlayerList.DataBind();
        }
        finally
        {
            myConnection.CloseConection();
        }
    }

    protected void DetailsView_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        int clubId = (int)Session["ClubDetailsId"];
        SqlCommand command = new SqlCommand();
        command.CommandText = "DeleteClub";
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("RegID", SqlDbType.Int);
        command.Parameters["RegID"].Value = clubId;
        DataConnection myConnection = new DataConnection();
        myConnection.ExecuteNonQuery(command);
        Response.Redirect("Clubs.aspx");
    }

    protected void DetailsView_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        DetailsView.ChangeMode(e.NewMode);
        BindDetails();
    }

    protected void DetailsView_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        int clubId = (int)DetailsView.DataKey.Value;
        string newName = ((TextBox)DetailsView.FindControl("NameTxt")).Text;
        string newCity = ((TextBox)DetailsView.FindControl("CityTxt")).Text;
        string newAdress = ((TextBox)DetailsView.FindControl("AdressTxt")).Text;
        SqlCommand command = new SqlCommand();
        command.CommandText = "UpdateClubDetails";
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("RegNum", SqlDbType.Int);
        command.Parameters["RegNum"].Value = clubId;
        command.Parameters.Add("NewName", SqlDbType.VarChar);
        command.Parameters["NewName"].Value = newName;
        command.Parameters.Add("NewCity", SqlDbType.VarChar);
        command.Parameters["NewCity"].Value = newCity;
        command.Parameters.Add("NewAdress", SqlDbType.VarChar);
        command.Parameters["NewAdress"].Value = newAdress;
        DataConnection myConnection = new DataConnection();
        myConnection.ExecuteNonQuery(command);
        DetailsView.ChangeMode(DetailsViewMode.ReadOnly);
        BindDetails();
    }


    protected void PlayerList_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Obtain the index of the selected row
        int selectedRowIndex = PlayerList.SelectedIndex;
        //assigning the value to the session variable;
        Session["PlayerDetailsName"] = PlayerList.DataKeys[selectedRowIndex].Value;
        Response.Redirect("PlayerDetails.aspx");
    }
}