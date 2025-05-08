<%@ Page Title="User Data Change" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserChangeData.aspx.cs" Inherits="UserChangeData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Change User Details</title>
    <link href="UserChangeData.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form class="main-form" method="post" runat="server">

        <h1>Change User Details</h1>

        <a href="AccManagement.aspx" class="link">Click here to go to Account Management</a>

    
        <label for="uname">Username:</label>
        <input type="text" id="uname" name="uname">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password">
        <label for="birthyear">Birth Year:</label>
        <input type="text" id="birthyear" name="birthyear">
        <label for="tel">Telephone Number:</label>
        <input type="tel" id="tel" name="tel">
        <input type="submit" value="Change">
    </form>
    
</asp:Content>


