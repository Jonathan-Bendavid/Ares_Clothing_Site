using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class UserLogin : System.Web.UI.Page
{
    public string sqlDisplay = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            if (!isUserExist())
            {
                sqlDisplay = "Your Username/Password is incorrect";
            }
            else
            {
                Session[Global.TYPE] = (Global.REGISTERED_USER_TYPE);
                Session[Global.NAME] = (Request.Form["Username"]);
                Response.Redirect("HomePage.aspx");
            }
        }

    }
    private bool isUserExist()
    {
        string sql = "SELECT * FROM " + Helper.USERS_TABLE_NAME;
        sql += " WHERE Username = N'" + Request.Form["Username"] + "'";
        bool exist = Helper.IsExist(Helper.FILE_NAME, sql);
        return exist;
    }
}