using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public String LabelName
    {
        set
        {
            lblName.Text = value;
        }
    }
    public String Name
    {
        set
        {
            txtName.Text = value;
        }
        get
        {
            return txtName.Text;
        }
    }
    public String LabelCity
    {
        set
        {
            lblCity.Text = value;
        }
    }
    public String City
    {
        set
        {
            txtCity.Text = value;
        }
        get
        {
            return txtCity.Text;
        }
    }
}