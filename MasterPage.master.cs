using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LblDate.Text = DateTime.Now.Date.ToString("MMMM dd, yyyy") + "    &nbsp;|&nbsp;    " + DateTime.Now.ToString("HH:mm ss tt");
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        LblDate.Text = DateTime.Now.Date.ToString("MMMM dd, yyyy") + "    &nbsp;|&nbsp;    " + DateTime.Now.ToString("HH:mm ss tt");
    }
}
