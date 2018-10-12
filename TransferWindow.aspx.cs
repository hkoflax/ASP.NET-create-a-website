using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TransferWindow : System.Web.UI.Page
{
    DataSet dataSet = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
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
    private void BindGrid()
    {
        SqlDataAdapter adapter;
        SqlConnection con = null;
        if (ViewState["TransferDataset"] == null)
        {
            try
            {
                String connectionString = ConfigurationManager.ConnectionStrings["Assignment3"].ConnectionString;
                String script = "SELECT Players.PlayerName, Clubs.ClubName FROM Players INNER JOIN Clubs ON Players.ClubRegNum = Clubs.RegNum";
                con = new SqlConnection(connectionString);
                adapter = new SqlDataAdapter(script, con);
                adapter.Fill(dataSet, "Result");

                adapter.SelectCommand.CommandText = "Select PlayerName,JerseyNumber,DOB,ClubRegNum  from Players";
                adapter.Fill(dataSet, "Players");
            }
            catch (Exception e)
            {
                throw e;
            }
            ViewState["TransferDataset"] = dataSet;
        }
        else
        {
            dataSet = (DataSet)ViewState["TransferDataset"];
        }
        String sortExpression;
        if (gridSortDirection == SortDirection.Ascending)
        {
            sortExpression = gridSortExpression + " ASC";
        }
        else
        {
            sortExpression = gridSortExpression + " DESC";
        }
        dataSet.Tables["Result"].DefaultView.Sort = sortExpression;

        ClubView.DataSource = dataSet.Tables["Result"];
        ClubView.DataBind();
    }
    private SortDirection gridSortDirection
    {
        get
        {
            if (ViewState["GridSortDirection"] == null)
            {
                ViewState["GridSortDirection"] = SortDirection.Ascending;
            }
            return (SortDirection)ViewState["GridSortDirection"];
        }
        set
        {
            ViewState["GridSortDirection"] = value;
        }
    }
    private string gridSortExpression
    {
        get
        {
            if (ViewState["GridSortExpression"] == null)
            {
                ViewState["GridSortExpression"] = "PlayerName";
            }
            return (String)ViewState["GridSortExpression"];
        }
        set
        {
            ViewState["GridSortExpression"] = value;
        }
    }

    protected void ClubView_Sorting(object sender, GridViewSortEventArgs e)
    {
        String sortExpression = e.SortExpression;
        if (sortExpression == gridSortExpression)
        {
            if (gridSortDirection == SortDirection.Ascending)
            {
                gridSortDirection = SortDirection.Descending;
            }
            else
            {
                gridSortDirection = SortDirection.Ascending;
            }
        }
        else
        {
            gridSortDirection = SortDirection.Ascending;
        }
        gridSortExpression = sortExpression;
        BindGrid();
    }

    protected void ClubView_RowEditing(object sender, GridViewEditEventArgs e)
    {
        ClubView.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void ClubView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        ClubView.EditIndex = -1;
        BindGrid();
    }

    protected void ClubView_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        DataTable dt = ((DataSet)ViewState["TransferDataset"]).Tables["Players"];
        DataTable dt1 = ((DataSet)ViewState["TransferDataset"]).Tables["Result"];
        GridViewRow row = ClubView.Rows[e.RowIndex];

        int newClubId = Convert.ToInt32(((DropDownList)row.Cells[2].Controls[1]).SelectedValue);
        string newClubName = ((DropDownList)row.Cells[2].Controls[1]).SelectedItem.Text;

        dt1.Rows[e.RowIndex]["ClubName"] = newClubName;
        dt.Rows[e.RowIndex]["ClubRegNum"] = newClubId;
        ClubView.EditIndex = -1;
        BindGrid();
    }

    protected void SaveTransferBtn_Click(object sender, EventArgs e)
    {
        SqlConnection con = null;
        SqlDataAdapter adapter;
        SqlCommandBuilder commandBuilder;
        String connectionString = ConfigurationManager.ConnectionStrings["Assignment3"].ConnectionString;
        String myScript = "Select PlayerName,JerseyNumber,DOB,ClubRegNum  from Players";

        con = new SqlConnection(connectionString);
        adapter = new SqlDataAdapter(myScript, con);
        commandBuilder = new SqlCommandBuilder(adapter);
        adapter.Update(((DataSet)ViewState["TransferDataset"]).Tables["Players"]);
        Response.Redirect("Clubs.aspx");
    }

    protected void BackBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Clubs.aspx");
    }
}