using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Orders : System.Web.UI.Page
{
    public string sqlQ = "";
    public string str = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        if ((String)Session[Global.TYPE] != Global.MANAGER_TYPE)
        {
            Response.Redirect("Error.aspx");
        }

        string sqlQ = "SELECT * FROM [orders] ORDER BY CONVERT(datetime, [Date], 105) DESC";
        DataTable data = Helper.ExecuteDataTable(Helper.FILE_NAME, sqlQ);

        int userCount = data.Rows.Count;
        str += "<table>";
        str += "<tr>";
        str += "<th>username";
        str += "</th>";
        str += "<th>Price";
        str += "</th>";
        str += "<th>Date";
        str += "</th>";
        str += "</tr>";
        for (int i = 0; i < userCount; i++)
        {
            str += "<tr>";
            str += "<td><br />";
            str += data.Rows[i]["Username"];
            str += "</td> <td><br />";
            str += data.Rows[i]["Price"] + "$";
            str += "</td> <td><br />";
            str += data.Rows[i]["Date"];
            str += "</td>";
            str += "</tr>";
        }
        str += "</table>";
    }
}