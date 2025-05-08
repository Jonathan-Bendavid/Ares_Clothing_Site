<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AccManagement.aspx.cs" Inherits="accManagment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="AccManagement.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="account-container">
        <h1>Account Manager</h1>
        <div class="account-link"><%= link %></div>
        <div class="account-details"><%= str %></div>
    </div>
</asp:Content>
