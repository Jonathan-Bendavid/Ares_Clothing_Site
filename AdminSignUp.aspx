<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminSignUp.aspx.cs" Inherits="AdminSignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="adminLogin.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="hero">
        <div class="form-box">
            <h2 style="text-align: center">Create Admin Account</h2>

            <a href="AdminPage.aspx" class="link">Click Here To Go To Admin Page</a>
            <h3 style="text-align: center"><%= msg %></h3>
            <h3 style="text-align: center"><%= sqlDisplay %></h3>

            <form class="input-group" runat="server" method="post">
                <input type="text" class="input-field" name="Username" placeholder="Enter username" />
                <input type="text" class="input-field" name="password" placeholder="Enter password" />

                <div class="checkbox-row">
                    <input type="checkbox" class="checkbox" name="check" id="check" />
                    <label for="check">Remember My Password</label>
                </div>

                <button type="submit" name="action" value="signup" class="submit-btn">Sign Up</button>
            </form>
        </div>
    </div>
</asp:Content>
