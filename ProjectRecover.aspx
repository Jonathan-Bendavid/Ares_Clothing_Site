<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProjectRecover.aspx.cs" Inherits="ProjectRecover" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
    form {
        max-width: 600px;
        margin: auto;
        padding: 20px;
        background-color: white;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
        color: #333;
    }

    label {
        display: block;
        margin-bottom: 10px;
        font-weight: bold;
    }

    input[type="text"],
    input[type="number"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border-radius: 3px;
        border: 1px solid #ccc;
        font-size: 16px;
        color: #333;
        box-sizing: border-box;
    }

    button[type="submit"] {
        background-color: #6082B6;
        color: white;
        font-weight: bold;
        border: none;
        border-radius: 3px;
        padding: 10px 20px;
        cursor: pointer;
    }

    button[type="submit"]:hover {
        background-color: #333;
    }

    .error {
        color: red;
        font-size: 14px;
        margin-bottom: 10px;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form runat="server" method="post">
        <h1>Password Recovery</h1>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username">
        <label for="year">Security Question: What is your Birthday?</label>
        <input type="number" id="year" name="year">
        <br>
        <button type="submit">Recover Password</button>
        <br>
        <br />
        <%=msg %>
    </form>
</asp:Content>
