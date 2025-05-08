using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Services.Discovery;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[Global.TYPE] == Global.VISITOR_TYPE)
        {
            Response.Redirect("HomePage.aspx");
        }
        
        if (!IsPostBack)
        {
            string cartPriceStr = Request.QueryString["cartPrice"];

            if (!string.IsNullOrEmpty(cartPriceStr))
            {
                InsertUserToDB(cartPriceStr);
            }
        }
    }


    private void InsertUserToDB(string cartPrice)
    {
        DateTime now = DateTime.Now;
        string formattedDate = now.ToString("dd-MM-yyyy");
        cartPrice = cartPrice.Replace("Total", "").Replace("$", "");
        string sql = "INSERT INTO [orders] ([Username], [Price], [Date]) VALUES (N'" + Session[Global.NAME] + "', N'" + cartPrice + "', N'" + formattedDate + "')";
        Helper.DoQuery(Helper.FILE_NAME, sql);
    }
}

