using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Register : System.Web.UI.Page
{
    public string sqlDisplay = "";
    public string msg = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            if (!isUserExist())
            {
                
                Session[Global.TYPE] = Global.REGISTERED_USER_TYPE;
                Session[Global.NAME] = Request.Form["Username"];
                InsertUserToDB();
                Response.Redirect("HomePage.aspx");

            }
            else
            {
                msg = "You already have an account please sign in instead";

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
    private void InsertUserToDB()
    {
        string sql = "INSERT INTO " + Helper.USERS_TABLE_NAME;
        sql += " VALUES (N'" + Request.Form["email"] + "', N'" + Request.Form["Username"] + "', N'" + Request.Form["birthday"] + "', N'" + Request.Form["password"] + "', N'" +  Request.Form["tel"] + "', N'" + Request.Form["gender"] + "');";
        Helper.DoQuery(Helper.FILE_NAME, sql);
    }
}

 