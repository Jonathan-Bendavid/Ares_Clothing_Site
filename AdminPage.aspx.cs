using System;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.Policy;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;







public partial class AdminPage : System.Web.UI.Page
{
    public string sqlQ = "";
    public string str = "";
    public string name = "";
    public string lastCust = "";
    public int customers = 0;
    public decimal sum = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
         if ((String)Session[Global.TYPE] != Global.MANAGER_TYPE)
         {
             Response.Redirect("Error.aspx");
         }
        
        name = (string)Session[Global.NAME];
        sqlQ = "select * from " + Helper.USERS_TABLE_NAME;
        DataTable data = Helper.ExecuteDataTable(Helper.FILE_NAME, sqlQ);
        int c = data.Rows.Count - 1;
        str = data.Rows.Count + "";
        lastCust = data.Rows[c]["Username"] + "";
        sqlQ = "select * from [orders]";
        DataTable orders = Helper.ExecuteDataTable(Helper.FILE_NAME, sqlQ);
        customers = orders.Rows.Count;

        for (int i = 0; i < customers; i++)
        {
            string priceCell = orders.Rows[i]["Price"] + "";

            if (!string.IsNullOrEmpty(priceCell))
            {
                decimal price;

                if (decimal.TryParse(priceCell, out price))
                {
                    sum += price;
                }
            }
        }

        Console.WriteLine("Total Sum: " + sum);
    }
    protected void Customers(object sender, EventArgs e)
    {
        Response.Redirect("Costumers.aspx");
    }
}