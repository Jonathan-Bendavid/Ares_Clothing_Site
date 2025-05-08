using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public string name = "";
    public string UserMenu = "";
    public string greet = "";
    public string cart = "";

    protected void Page_Load(object sender, EventArgs e)
    {
       
        if ((string)Session[Global.TYPE] == Global.VISITOR_TYPE)
        {
            UserMenu = "<li><a href = 'Register.aspx' >Register | Log In</a></li>";
            UserMenu += "<li><a href = 'adminLogin.aspx' >Admin Log In</a></li>";
        }
        if ((String)Session[Global.TYPE] == Global.REGISTERED_USER_TYPE || (String)Session[Global.TYPE] == Global.MANAGER_TYPE)
        {
            name = "<li><a href = 'accManagement.aspx'>" + (String)Session[Global.NAME] + "</a></li >";
            UserMenu = "<li><a href='Logout.aspx'> Logout </a></li> ";
            cart = "<li><a href='Cart.aspx'><img src='cart.png' style='height: 30px; width: 30px; vertical-align: inherit'/></a></li>";

        }
        if ((String)Session[Global.TYPE] == Global.MANAGER_TYPE)
        {
            UserMenu += "<li><a href= 'AdminPage.aspx' > Admin Page </a> </li>";
        }
    }
    }