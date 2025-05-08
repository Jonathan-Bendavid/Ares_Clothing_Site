using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class DeleteUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string fileName = "Database.mdf";
        if ((String)Session[Global.TYPE] != Global.MANAGER_TYPE)
        {
            Response.Redirect("Error.aspx");
        }
        string Uname = Request.QueryString["Username"].ToString();
        string sql = "DELETE FROM userstable WHERE Username ='" + Uname + "'";
        Helper.DoQuery(fileName, sql);
        Response.Redirect("costumers.aspx");
    }
}
