using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UserChangeData : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        string type = (String)Session[Global.TYPE];
        if (type == Global.VISITOR_TYPE || type == Global.MANAGER_TYPE )
        {
            Response.Redirect("Error.aspx");
        }
        
        if (IsPostBack)
        {
            string username = Request.Form["uname"];
            string email = Request.Form["email"];
            string password = Request.Form["password"];
            int birthyear = 0;
            int.TryParse(Request.Form["birthyear"], out birthyear);
            int tel = 0;
            int.TryParse(Request.Form["tel"], out tel);       
            string tableName = Helper.USERS_TABLE_NAME;
            string sql = "UPDATE " + tableName + " SET ";
            bool usernameChanged = false;
            bool changesMade = false;
            if (!string.IsNullOrEmpty(username))
            {
                sql += "Username=N'" + username + "'";
                changesMade = true;
                usernameChanged = true;
            }
            if (!string.IsNullOrEmpty(email))
            {
                if (changesMade) sql += ", ";
                sql += "mail=N'" + email + "'";
                changesMade = true;
            }
            if (!string.IsNullOrEmpty(password))
            {
                if (changesMade) sql += ", ";
                sql += "password=N'" + password + "'";
                changesMade = true;
            }
            if (birthyear != 0)
            {
                if (changesMade) sql += ", ";
                sql += "birthday=" + birthyear;
                changesMade = true;
            }
            if ((tel) != 0)
            {
                if (changesMade) sql += ", ";
                sql += "tel=N'" + tel + "'";
            }

            if (changesMade == false)
            {
                Response.Redirect("HomePage.aspx");
            }

            sql += " WHERE Username=N'" + Session[Global.NAME].ToString() + "'";

            if (usernameChanged)
            {
                Session[Global.NAME] = username;
            }

            Helper.DoQuery(Helper.FILE_NAME, sql);
            Console.WriteLine("Success");
            Response.Redirect("HomePage.aspx");
        }
    }


}
