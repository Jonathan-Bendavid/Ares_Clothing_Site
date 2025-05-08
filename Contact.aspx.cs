using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    public string firstName = "";
    public string lastName = "";
    public string email = "";
    public string subject = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            firstName = Request.Form["firstname"];
            lastName = Request.Form["lastname"];
            email = Request.Form["email"];
            subject = Request.Form["subject"];

            // Save the message to a text file
            string filePath = Server.MapPath("~/App_Data/messages.txt");
            using (StreamWriter writer = new StreamWriter(filePath, true))
            {
                writer.WriteLine(string.Format("{0} - {1} {2} ({3}): {4}", DateTime.Now, firstName, lastName, email, subject));
            }
        }
    }
}
