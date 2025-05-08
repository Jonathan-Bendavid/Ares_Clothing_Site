using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Costumers : System.Web.UI.Page
{
    public string sqlQ = "";
    public string str = "";
    public string userToDelete = "";
    protected void Page_Load(object sender, EventArgs e)
    {
         
       /* if ((String)Session[Global.TYPE] != Global.MANAGER_TYPE)
        {
            Response.Redirect("Error.aspx");
        }*/
        
        sqlQ = "select * from " + Helper.USERS_TABLE_NAME;
            DataTable data = Helper.ExecuteDataTable(Helper.FILE_NAME, sqlQ);
            int userCount = data.Rows.Count;
            str += "<table>";
            str += "<tr>";
            str += "<th>mail";
            str += "</th>";
            str += "<th>username";
            str += "</th>";
        str += "<th>Password";
        str += "</th>";
        str += "<th>birthyear";
            str += "</th>";
        str += "<th>Gender";
        str += "</th>";
        str += "<th>Telephone";
        str += "</th>";
        str += "<th>Delete";
        str += "</th>";
        for (int i = 0; i < userCount; i++)
            {
                str += "<tr>";
                str += "<td><br />";
                str += data.Rows[i]["mail"];
                str += "</td> <td><br />";
                str += data.Rows[i]["Username"];
                str += "</td> <td><br />";
                str += data.Rows[i]["password"];
            str += "</td> <td><br />";
                str += data.Rows[i]["birthday"];
            str += "</td>";
            str += "<td><br />";
            str += data.Rows[i]["gender"];
            str += "</td>";
            str += "<td><br />";
            str += data.Rows[i]["tel"];
            str += "</td>";
            userToDelete = data.Rows[i]["Username"].ToString();
                str += "<td><br />";
                str += "<a href = 'deleteUser.aspx?Username=" + userToDelete + "' >[delete]</a>";
                str += "</td>";
                str += "</tr>";
            }
            str += "</table>";
        }
    }
