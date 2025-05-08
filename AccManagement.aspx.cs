using System;
using System.Data;
using System.Web.UI;

public partial class accManagment : System.Web.UI.Page
{
    public string link = "";
    public string str = "";
    public string sqlQ = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session[Global.TYPE] == Global.VISITOR_TYPE)
        {
            Response.Redirect("Error.aspx");
        }

        if ((string)Session[Global.TYPE] == Global.REGISTERED_USER_TYPE)
        {
            sqlQ = "select * from " + Helper.USERS_TABLE_NAME;
        }
        else
        {
            sqlQ = "select * from " + Helper.ADMIN_TABLE_NAME;
        }

        DataTable data = Helper.ExecuteDataTable(Helper.FILE_NAME, sqlQ);
        int userCount = data.Rows.Count;
        int row = 0;
        int i = userCount - 1;

        while (i != row && i > 0)
        {
            if (Session[Global.NAME].ToString() == data.Rows[i]["Username"].ToString() || i == 0)
            {
                row = i;
            }
            i--;
        }

        str += "<ul class='account-info-list'>";

        if ((string)Session[Global.TYPE] == Global.REGISTERED_USER_TYPE)
        {
            str += "<li>Email: " + data.Rows[row]["mail"] + "</li>";
            str += "<li>Username: " + data.Rows[row]["Username"] + "</li>";
            str += "<li>Birth Year: " + data.Rows[row]["birthday"] + "</li>";
            str += "<li>Phone: " + data.Rows[row]["tel"] + "</li>";
            str += "<li>Gender: " + data.Rows[row]["gender"] + "</li>";
            str += "</ul>";
            link = "<a class='change-link' href='UserChangeData.aspx'>Click here to change account details</a>";
        }
        else if ((string)Session[Global.TYPE] == Global.MANAGER_TYPE)
        {
            str += "<li>Username: " + data.Rows[row]["Username"] + "</li>";
            str += "<li>Password: " + data.Rows[row]["password"] + "</li>";
            str += "</ul>";
            link = "<a class='change-link' href='adminChange.aspx'>Click here to change account info</a>";
        }
    }
}
