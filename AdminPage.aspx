<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        :root {
    --main-color: #6082B6;
    --text-grey: #8390A2;
    --color-dark: #1D2231;
}
    </style>
    <title>Admin</title>
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css"/>
    <link href="AdminStyle.css" rel="stylesheet" />

</head>
<body>
    <input type="checkbox" id="nav-toggle" />

    <div class="sidebar">
       <div class = "sidebar-brand" >
           <h2><a href="HomePage.aspx" style="color: white">Ares</a></h2>
           </div>
        <div class="sidebar-menu">
            <ul>
                <li>
                    <a href ="AdminPage.aspx" class="active"><span class="las la-igloo"></span><span>Dashboard</span></a>
                </li>
                 <li>
                    <a href ="HomePage.aspx"><span class="las la-home"></span><span>Home Page</span></a>
                </li>
                <li>
                    <a href="Costumers.aspx"><span class="las la-users"></span><span>Customers</span></a>
                </li>         
                <li>
                    <a href="Orders.aspx"><span class="las la-shopping-bag"></span><span>orders</span></a>
                </li>
                <li>
                    <a href="adminChange.aspx"><span class="las la-user"></span><span>Change Info</span></a>
                </li>
                 <li>
                    <a href="UserChange.aspx"><span class="las la-user"></span><span>Change Customer Info</span></a>
                </li>
                <li>
                    <a href="AdminSignup.aspx"><span class="las la-user"></span><span>New Admin</span></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="main-content">
        <header>
        <h2>
            <label for="nav-toggle"></label>
            <label for="#"><span class ="las-la-bars"></span></label>
            Dashboard
        </h2>
            <div class ="search-wrapper">
                <span class="las-la-search"></span>
                <input type="search" placeholder="Search here"/>
            </div>
            <div class ="user-wrapper">
                <img src="#" width:"40px" height:"40px" alt=""/> 
                <div>
                    <h4>
                        <%=name %>
                    </h4>
                    <small>
                        admin
                    </small>
                </div>
            </div>
        </header>
        <main>
            <div class="dashboard-cards">
                <div class="card-single">
                    <div>
                        <h1>
                            <%=str %>
                        </h1>
                        <span>Costumers</span>
                    </div>
                    <div>
                        <span class ="las-la-users">

                        </span>
                    </div>
                    </div>
                <div class="card-single">
                    <div>
                        <h1>
                            14
                        </h1>
                        <span>projects</span>
                    </div>
                    <div>
                        <span class ="las-la-clipboard-list">

                        </span>
                    </div>
                    </div>
                <div class="card-single">
                    <div>
                        <h1>
                            <%=customers %>
                        </h1>
                        <span>orders</span>
                    </div>
                    <div>
                        <span class ="las-la-shopping-bag">
                        </span>
                    </div>
                    </div>
                <div class="card-single">
                    <div>
                        <h1>
                           <%=sum %>$
                        </h1>
                        <span>Revenue</span>
                    </div>
                    <div>
                        <span class ="lab-la-google-wallet">

                        </span>
                    </div>
                    </div>
            </div>
            <div class="recent-grid">
                <div class="customers">
                    <div class="card">
                        <div class="card-header">
                            <h3>new Costumer</h3>
                            <form runat="server"><asp:Button Text="See All" runat="server" OnClick="Customers"></asp:Button><span class ="las la-arrow-right"></span></form>
                </div>
                        <div class="card-body">
                            <div class="costumer">
                                <div class="info">
                                <div>
                                <h4><%=lastCust%></h4>
                                <small>User</small>
                                </div>
                                    </div>
                </div>
                </div>
                </div>
                </div>
            </div>

        </main>
    </div>
</body>
</html>
