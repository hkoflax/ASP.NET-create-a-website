using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

public partial class PlayerDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDetails();
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
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lb = (LinkButton)e.Row.Cells[0].Controls[0]; // assuming the the ShowEditLink resides in the first column of Grid
            //just changed the index of cells to where the EditLink reside in the column
            if (lb != null)
            {
                lb.Visible = false;
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
        String PlayerName = (String)Session["PlayerDetailsName"];
        SqlCommand command = new SqlCommand();
        command.CommandText = "SelectPlayerDetails";
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("Name", SqlDbType.NVarChar);
        command.Parameters["Name"].Value = PlayerName;
        DataConnection myConnection = new DataConnection();
        try
        {
            DetailsView.DataSource = myConnection.ExecuteCommand(command);
            DetailsView.DataKeyNames = new string[] { "PlayerName" };
            DetailsView.DataBind();
        }
        finally
        {
            myConnection.CloseConection();
        }
    }
    protected void DetailsView_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        String PlayerName = (String)Session["PlayerDetailsName"];
        SqlCommand command = new SqlCommand();
        command.CommandText = "DeletePlayer";
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("Name", SqlDbType.NVarChar);
        command.Parameters["Name"].Value = PlayerName;
        DataConnection myConnection = new DataConnection();
        myConnection.ExecuteNonQuery(command);
        Response.Redirect("ClubDetails.aspx#Body");
    }

    protected void DetailsView_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        DetailsView.ChangeMode(e.NewMode);
        BindDetails();
    }

    protected void DetailsView_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        DateTime a;
        String oldName = (String)Session["PlayerDetailsName"];
        string newName = ((TextBox)DetailsView.FindControl("NameTxt")).Text;
        int Jersey = Convert.ToInt32(((TextBox)DetailsView.FindControl("JerseyTxt")).Text);
        String Dob = ((TextBox)DetailsView.FindControl("DobTxt")).Text;
        if (newName != "")
        {
            if (DateTime.TryParse(Dob, out a) == true)
            {
                SqlCommand command = new SqlCommand();
                command.CommandText = "UpdatePlayerDetails";
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("OldName", SqlDbType.VarChar);
                command.Parameters["OldName"].Value = oldName;
                command.Parameters.Add("NewName", SqlDbType.VarChar);
                command.Parameters["NewName"].Value = newName;
                command.Parameters.Add("NewJersey", SqlDbType.Int);
                command.Parameters["NewJersey"].Value = Jersey;
                command.Parameters.Add("NewDOB", SqlDbType.Date);
                command.Parameters["NewDOB"].Value = a;
                DataConnection myConnection = new DataConnection();
                myConnection.ExecuteNonQuery(command);
                DetailsView.ChangeMode(DetailsViewMode.ReadOnly);
                BindDetails();
            }
        }
        if (oldName!=newName)
        {
            Response.Redirect("ClubDetails.aspx#Body");
        }
    }
}