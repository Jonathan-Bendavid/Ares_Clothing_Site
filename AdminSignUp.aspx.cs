using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AdminSignUp : System.Web.UI.Page
{
    public string sqlDisplay = "";
    public string msg = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[Global.TYPE] != Global.MANAGER_TYPE)
        {
            Response.Redirect("HomePage.aspx");
        }
        if (IsPostBack)
        {
            if (!isUserExist())
            {
                InsertUserToDB();
                msg += "Success. New Admin Account Created";
            }
            else
            {
                sqlDisplay = "This Account Exists";
            }
        }

    }
    private bool isUserExist()
    {
        string sql = "SELECT * FROM " + Helper.ADMIN_TABLE_NAME;
        sql += " WHERE Username = N'" + Request.Form["Username"] + "'";
        bool exist = Helper.IsExist(Helper.FILE_NAME, sql);
        return exist;
    }
    private void InsertUserToDB()
    {
        string sql = "INSERT INTO " + Helper.ADMIN_TABLE_NAME;
        sql += " VALUES (N'" + Request.Form["Username"] + "', N'" + Request.Form["password"] + "');";
        Helper.DoQuery(Helper.FILE_NAME, sql);
    }
}