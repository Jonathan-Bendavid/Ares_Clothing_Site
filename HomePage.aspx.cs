using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{

    public string linkDisplay = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[Global.TYPE] == Global.VISITOR_TYPE)
        {
            linkDisplay = "Register.aspx";
        }
    }
}