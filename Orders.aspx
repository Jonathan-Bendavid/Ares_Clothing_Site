<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
    font-family: 'Work Sans', sans-serif;
    font-weight: 800;
}
table {
    width: 60%;
    margin-right: auto;
    margin-left: auto;
    border-collapse: collapse;
}
td, th,h1 {
    text-align: center;
    margin: auto;
    margin-top: 6px;
    margin-bottom: 6px;
    border-right: 1px solid;
    border-left: 1px solid;
    border-collapse: collapse;
}
th {
    border-bottom: 1px solid;
    border-collapse: collapse;
    font-size: 26px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1>Orders</h1>
    <br /><br />
    <a href="AdminPage.aspx"><h3 style="text-align: center; font-weight:  800">Click Here To Return To Admin Page</h3></a>
    <br />
    <bSr />
    <%= str %>
</asp:Content>

