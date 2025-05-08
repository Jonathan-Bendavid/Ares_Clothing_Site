using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Data;

public partial class ProjectRecover : Page
{
    public string password = "";
    public string birthday;
    public string msg="";

    protected void Page_Load(object sender, EventArgs e)
    {
        if((String)Session[Global.TYPE]!= Global.VISITOR_TYPE)
        {
            Response.Redirect("Error.aspx");
        }
        if (IsPostBack)
        {
            string sql = "SELECT * FROM " + Helper.USERS_TABLE_NAME;
            sql += " WHERE Username = N'" + Request.Form["username"] + "'";
            DataTable data = Helper.ExecuteDataTable(Helper.FILE_NAME, sql);
            if (data.Rows.Count > 0)
            {
                password = data.Rows[0]["password"].ToString();
                birthday=data.Rows[0]["birthday"].ToString();
                if (birthday.Equals(Request.Form["year"]))
                {
                    msg += "Your password is: " + password;
                }
                else
                {
                    msg += "Password recovery failed. Please check your username and security answer.";
                }
               
            }
            else
            {
                msg += "That account does not exist";
            }
            
        }
    }
}