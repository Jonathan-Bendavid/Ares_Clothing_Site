using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Security.Principal;

public partial class adminChange : System.Web.UI.Page
{
    public String sql = ""; public String sqlDisplay = ""; public String type = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        type = (String)Session[Global.TYPE];
        if (type == Global.VISITOR_TYPE || type == Global.REGISTERED_USER_TYPE)
        {
            Response.Redirect("Error.aspx");
        }
    
        if (IsPostBack && (String)Session[Global.TYPE] == Global.MANAGER_TYPE)
        {
            changeDetails();
        }
    }

    private void changeDetails()
    {
        string sql = "";
        string username = Request.Form["uname"];
        string password = Request.Form["password"];
        sql = "UPDATE " + Helper.ADMIN_TABLE_NAME + " SET ";
        bool changesMade = false;
        if (!string.IsNullOrEmpty(username))
        {
            sql += "Username=N'" + username + "'";
            Session[Global.NAME] = username;
            changesMade = true;
        }
        if (!string.IsNullOrEmpty(password))
        {
            if (changesMade) sql += ", ";
            sql += "password=N'" + password + "'";
            changesMade = true;
        }

        if (changesMade == false)
        {
            Response.Redirect("HomePage.aspx");
        }

        sql += " WHERE Username=N'" + Session[Global.NAME].ToString() + "'";
        Helper.DoQuery(Helper.FILE_NAME, sql);
        Console.WriteLine("Success");
        Response.Redirect("HomePage.aspx");
    }
}