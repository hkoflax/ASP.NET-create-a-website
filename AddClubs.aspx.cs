using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddClubs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindClubList();
        }
    }

    private void BindClubList()
    {
        DataConnection myConnection = new DataConnection();
        String script = "Select RegNum,ClubName from Clubs";
        ClubDropDownList.DataSource = myConnection.ExecuteScript(script);
        ClubDropDownList.DataTextField = "ClubName";
        ClubDropDownList.DataValueField = "RegNum";
        ClubDropDownList.DataBind();
        if (ClubDropDownList.DataSource == null)
        {
            btnAddPlayer.Visible = false;
        }
        else
        {
            btnAddPlayer.Visible = true;
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
    protected void btnAddPlayer_Click(object sender, EventArgs e)
    {
        Table2.Visible = true;
        txtDOB.Text = "1999-12-01";
    }

    protected void btnSavePlayer_Click(object sender, EventArgs e)
    {
        DateTime a;
        if (TxtPname.Text != "")
        {
            if (DateTime.TryParse(txtDOB.Text, out a) == true)
            {
                Player aPlayer = new Player(TxtPname.Text, a, Convert.ToInt32(txtJersyeNum.Text));
                aPlayer.ClubNumber = Convert.ToInt32(ClubDropDownList.SelectedItem.Value);

                SqlCommand command = new SqlCommand();
                command.CommandText = "InsertPlayer";
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add("Name", SqlDbType.NVarChar);
                command.Parameters["Name"].Value = aPlayer.Name;

                command.Parameters.Add("JerseyNum", SqlDbType.Int);
                command.Parameters["JerseyNum"].Value = aPlayer.Jersey;

                command.Parameters.Add("DOB", SqlDbType.Date);
                command.Parameters["DOB"].Value = aPlayer.DOB;

                command.Parameters.Add("ClubNum", SqlDbType.Int);
                command.Parameters["ClubNum"].Value = aPlayer.ClubNumber;

                DataConnection myConnection = new DataConnection();
                myConnection.ExecuteNonQuery(command);
            }
        }
        TxtPname.Text = "";
        txtJersyeNum.Text = "";
    }

    protected void btnCancelClub_Click(object sender, EventArgs e)
    {
        MyClubControl.Name = "";
        MyClubControl.City = "";
        txtAdress.Text = "";
        txtRegNumber.Text = "";
    }

    protected void btnCancelPlayer_Click(object sender, EventArgs e)
    {
        txtDOB.Text = "";
        txtJersyeNum.Text = "";
        TxtPname.Text = "";
        Table2.Visible = false;
    }

    protected void btnSaveClub_Click(object sender, EventArgs e)
    {
        Club aClub = new Club(MyClubControl.Name, MyClubControl.City, Convert.ToInt32(txtRegNumber.Text));
        aClub.Adress = txtAdress.Text;

        SqlCommand command = new SqlCommand();
        command.CommandText = "InsertClub";
        command.CommandType = CommandType.StoredProcedure;

        command.Parameters.Add("RegNum", SqlDbType.Int);
        command.Parameters["RegNum"].Value = aClub.RegNum;

        command.Parameters.Add("ClubName", SqlDbType.NVarChar);
        command.Parameters["ClubName"].Value = aClub.Name;

        command.Parameters.Add("ClubCity", SqlDbType.NVarChar);
        command.Parameters["ClubCity"].Value = aClub.City;

        command.Parameters.Add("Adress", SqlDbType.NVarChar);
        command.Parameters["Adress"].Value = aClub.Adress;

        DataConnection myConnection = new DataConnection();
        myConnection.ExecuteNonQuery(command);

        btnAddPlayer.Visible = true;
        BindClubList();

        MyClubControl.Name = "";
        MyClubControl.City = "";
        txtAdress.Text = "";
        txtRegNumber.Text = "";
    }
}