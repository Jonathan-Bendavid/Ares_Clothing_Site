<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="contactStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style ="text-align: center;">Contact</h1>
    <div class="Contact-container">
        <form action="messages.aspx" method="post">

            <label for="fname">First Name</label>
            <input type="text" id="fname" name="firstname" placeholder="Your name..">
            <label for="lname">Last Name</label>
            <input type="text" id="lname" name="lastname" placeholder="Your last name..">
            <label for="email">Email</label>
            <input type="email" id="mail" name="email" placeholder="Your email..">
            <label for="subject">Subject</label>
            <textarea id="subject" name="subject" placeholder="Write something.." style="height:200px"></textarea>

            <input type="submit" class="button" value="Submit">

        </form>
    </div>
 
</asp:Content>
