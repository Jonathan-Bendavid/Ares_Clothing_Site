<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Costumers.aspx.cs" Inherits="Costumers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="customerStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="text-align: center">Customers</h1>
    <br />
    <a href="AdminPage.aspx"><h3 style="text-align: center; font-weight:  800">Click Here To Return To Admin Page</h3></a>
    <br />
    <br />
    <%= str %>
</asp:Content>

