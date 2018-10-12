using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MatchSchedule : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindClubList();
            BindSchedule();
            checkDate();
        }
    }
    private void BindClubList()
    {
        txtmatchDate.Text = DateTime.Now.ToShortDateString().ToString();
        txtmatchDate.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
        DataConnection myConnection = new DataConnection();
        String script = "Select RegNum,ClubName from Clubs";
        HomeClubList.DataSource = myConnection.ExecuteScript(script);
        HomeClubList.DataTextField = "ClubName";
        HomeClubList.DataValueField = "RegNum";
        HomeClubList.DataBind();
        myConnection.conn.Close();

        /*SqlCommand command = new SqlCommand();
        command.CommandText= "Select RegNum,ClubName from Clubs where RegNum!=@RegNUm";
        command.Parameters.Add("RegNUm", SqlDbType.Int);
        command.Parameters["RegNUm"].Value =HomeClubList.SelectedItem.Value;*/

        //AwayClubList.DataSource = myConnection.ExecuteCommand(command);

        AwayClubList.DataSource = myConnection.ExecuteScript(script);
        AwayClubList.DataTextField = "ClubName";
        AwayClubList.DataValueField = "RegNum";
        AwayClubList.DataBind();
        myConnection.conn.Close();
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        DateTime a;
        if (DateTime.TryParse(txtmatchDate.Text, out a) == true)
        {
            Match aMatch = new Match();

            aMatch.HomeClub = HomeClubList.SelectedItem.Text;
            aMatch.AwayClub = AwayClubList.SelectedItem.Text;
            aMatch.MatchDate = a;

            SqlCommand command = new SqlCommand();
            command.CommandText = "InsertMatch";
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.Add("homeTeam", SqlDbType.NVarChar);
            command.Parameters["homeTeam"].Value = aMatch.HomeClub;

            command.Parameters.Add("awayTeam", SqlDbType.NVarChar);
            command.Parameters["awayTeam"].Value = aMatch.AwayClub;

            command.Parameters.Add("date", SqlDbType.Date);
            command.Parameters["date"].Value = aMatch.MatchDate;

            DataConnection myConnection = new DataConnection();
            myConnection.ExecuteNonQuery(command);
        }
        BindSchedule();
    }
    private void BindSchedule()
    {
        DataConnection myConnection = new DataConnection();
        String script = "Select MatchId, HomeTeam,AwayTeam,MatchDate from Matches";

        SchduleView.DataSource = myConnection.ExecuteScript(script);
        SchduleView.DataKeyNames = new string[] { "MatchId" };
        SchduleView.DataBind();
        //checkDate();
    }

    protected void AwayClubList_SelectedIndexChanged(object sender, EventArgs e)
    {
        checkDate();
        /*
        DataConnection myConnection = new DataConnection();
        SqlCommand command = new SqlCommand();
        command.CommandText = "Select RegNum,ClubName from Clubs where RegNum!=@RegNUm";
        command.Parameters.Add("RegNUm", SqlDbType.Int);
        command.Parameters["RegNUm"].Value = AwayClubList.SelectedItem.Value;

        HomeClubList.Items.Clear();
        HomeClubList.DataSource = myConnection.ExecuteCommand(command);
        HomeClubList.DataTextField = "ClubName";
        HomeClubList.DataValueField = "RegNum";
        HomeClubList.DataBind();
        myConnection.conn.Close();
        */
    }

    protected void HomeClubList_SelectedIndexChanged(object sender, EventArgs e)
    {
        checkDate();
        /*DataConnection myConnection = new DataConnection();
        SqlCommand command = new SqlCommand();
        command.CommandText = "Select RegNum,ClubName from Clubs where RegNum!=@RegNUm";
        command.Parameters.Add("RegNUm", SqlDbType.Int);
        command.Parameters["RegNUm"].Value = HomeClubList.SelectedItem.Value;

        AwayClubList.AppendDataBoundItems = true;
        AwayClubList.DataSource = myConnection.ExecuteCommand(command);
        AwayClubList.DataTextField = "ClubName";
        AwayClubList.DataValueField = "RegNum";
        AwayClubList.DataBind();
        myConnection.conn.Close();*/
    }

    private void checkDate()
    {
        DataConnection myConnection = new DataConnection();
        SqlCommand command = new SqlCommand();
        command.CommandText = "Select Max(distinct MatchDate) from Matches where Hometeam=@Home" +
                              " or AwayTeam=@Home or AwayTeam=@Away or HomeTeam=@Away";
        command.Parameters.Add("Home", SqlDbType.NVarChar);
        command.Parameters["Home"].Value = HomeClubList.SelectedItem.Text;
        command.Parameters.Add("Away", SqlDbType.NVarChar);
        command.Parameters["Away"].Value = AwayClubList.SelectedItem.Text;

        DataTable myTable = new DataTable();
        myTable.Load(myConnection.ExecuteCommand(command));

        string result = myTable.Rows[0][0].ToString();
        DateTime a = Convert.ToDateTime(result);
        a = a.AddDays(2);
        txtmatchDate.Text = a.ToShortDateString().ToString();
        txtmatchDate.Attributes["min"] = a.ToString("yyyy-MM-dd");
    }

}