<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adminChange.aspx.cs" Inherits="adminChange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="UserChangeData.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <form class="main-form" method="post" runat="server">
        <h1>Change Admin Details</h1>
        <a href="AdminPage.aspx"><h3 style="text-align: center; font-weight:  800"; class ="link">Click Here To Go To Admin Page</h3></a>

        <label for="uname">Username:</label>
        <input type="text" id="uname" name="uname">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password">
        <br />
        <br />
        <input type="submit" name="submit" id="submit" value="Change">
        </form>

</asp:Content>

