<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="UserLogin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="hero">
        <div class="form-box">
            <h2 style="text-align: center">User Log in</h2>
            <h3 style="text-align: center"><a href="Register.aspx">Register Here</a></h3>
            <h3 style="text-align: center"><%=sqlDisplay %></h3>
            <form class="input-group" runat="server" method="post">
                <input type="text" class="input-field" name="Username" placeholder="Enter username" />
                <input type="password" class="input-field" name="password" placeholder="Enter password" />

                <div class="checkbox-row">
                    <input type="checkbox" class="checkbox" name="check" id="check" />
                    <label for="check">Remember My Password</label>
                </div>

                <a href="ProjectRecover.aspx">Forgot Password?</a>

                <button type="submit" name="action" value="log" class="submit-btn">Log in</button>
            </form>

            </div>
        </div>
</asp:Content>

