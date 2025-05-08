<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="RegisterStyle.css" rel="stylesheet" />
    <script type="text/javascript">
function checkAll() {


                var uName = document.getElementById("uName").value;
                if (isValidUsersName(uName) == false) {
                    return false;
                }

                var pass = document.getElementById("pass").value;
                if (isValidPass(pass) == false) {
                    return false;
                }


                var email = document.getElementById("email").value;
                if (isValidEmail(email) == false) {
                    return false;
                }

            
                var tel = document.getElementById("tel").value;
                if (isValidTel(tel) == false) {
                    return false;
                }
                var pass1 = document.getElementById("pass1").value;
                if (isValidPass1(pass1) == false) {
                    return false;
    }
    var bd = parseInt(document.getElementById("birthday").value, 10);
        var birthday = document.getElementById("birthday").value;
    if (isValidBirthday(birthday, bd) == false) {
            return false;
        }
        return true;
          
            }

            function isValidUsersName(str) {
                if (str == "") {
                    window.alert("Must fill user name")
                    return false;
                }
               
                if (str.length <= 3) {
                    window.alert("Username must have more then 3 characters ")
                    return false;
                }
                
                if (str.search(/[a-z]/) == -1) {
                    window.alert("Username needs at least one small letter ")
                    return false;
                }
                if (str.search(/[A-Z]/) == -1) {
                    window.alert("Username needs at least one upper letter ")
                    return false;
                }
                if (str.search(/[!\@\#\$\%\^\&\*\(\)]/) != -1) {
                    window.alert("Username cant have any special charecter")
                    return false;
                }
                return true;
            }

            function isValidPass(str) {
                if (str == "") {
                    window.alert("Must fill password")
                    return false;
                }
                
                if (str.length < 6) {
                    window.alert("Password must have more then 5 characters ")
                    return false;
                }
                
                if (str.search(/[0-9]/) == -1) {
                    window.alert("Password must have one number ")
                    return false;
                }
                if (str.search(/[a-z]/) == -1) {
                    window.alert("Password needs at least one small letter ")
                    return false;
                }
                if (str.search(/[A-Z]/) == -1) {
                    window.alert("Password needs at least one upper letter ")
                    return false;
                }
                if (str.search(/[!\@\#\$\%\^\&\*\(\)]/) == -1) {
                    window.alert("Password must have special characters ")
                    return false;
                }
                return true;
            }
            function isValidPass1(str,) {
                if (str == "") {
                    window.alert("Must have second password")
                    return false;
                }
                var pass = document.getElementById("pass").value;
                if (pass == str) {
                    return true;
                }
                window.alert("must be the same password")
                return false;
            }
            function isValidEmail(str) {
                if ((str.split("@").length == 2) && (str.indexOf("@") != 0) && (str.indexOf(".") != 0) && (str.lastIndexOf(".") != str.length - 1) && (str.lastIndexOf(".") > str.lastIndexOf("@")) && (str.length >= 5 && str.length <= 30)) {
                    return true;
                }
                window.alert("Invalid Email")
                return false;

                
        }
        function isValidBirthday(str, a) {
            if (str == "") {
                window.alert("Must fill birthday")
                return false;
            }
            if (a <= 1910 || a >= 2009) {
                window.alert("Invalid Age")
                return false;
            }

            for (var i = 1; i < str.length; i++) {
                if (str.charAt(i) < '0' || str.charAt(i) > '9') {
                    window.alert("Invalid Age")
                    return false;
                }
            }
            return true;
        }
        function isValidTel(str) {

            
            if (str == "") {
                window.alert("Must fill phone number")
                return false;
            }
            if (str.length < 10) {
                window.alert("phone number is too short")
                return false;
            }
            
            for (var i = 1; i < str.length; i++) {
                if(str.charAt(i) < '0' || str.charAt(i) > '9' || str.charAt(0) != '0') {
                    window.alert("Invalid Phone Number")
                    return false;
                }
            }

            return true;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="hero">
        <div class="form-box">
    <h2 style="text-align: center">Registration Page</h2>
            <h3 style="text-align: center"><a href="UserLogin.aspx">Click Here For Log In</a></h3>
    <h3 style="text-align: center"><%=msg%></h3>
        <form id="form1" name="form1" method="post" runat="server" onsubmit="return checkAll()">         
        <div class="input-group">
            <input type="text" class="input-field" id="uName" name="Username" placeholder="Enter username" />
            <input type="password" class="input-field" id="pass" name="password" placeholder="Enter password" />
            <input type="password" class="input-field" id="pass1" name="confirmPassword" placeholder="Confirm password" />
            <input type="email" class="input-field" id="email" name="email" placeholder="Enter Email" />
            <input type="number" class="input-field" id="birthday" name="birthday" placeholder="Enter birth year (e.g. 2005)" />
            <input type="number" class="input-field" id="tel" name="tel" placeholder="Enter Phone Number" />

            <div class="radio-group">
                <label><input type="radio" name="gender" value="male" />Male</label>
                <label><input type="radio" name="gender" value="female" />Female</label>
                <label><input type="radio" name="gender" value="other" />Other</label>
            </div>

            <select name="type" id="type" class="input-field" required>
                <option value="" disabled selected>Select clothing style</option>
                <option value="Casual">Casual</option>
                <option value="Vintage">Vintage</option>
                <option value="Streetwear">Streetwear</option>
                <option value="Luxury">Luxury</option>
            </select>

            <label>Where did you hear abour us?</label>
            <div class="checkbox-container">
                <label><input type="checkbox" name="hearAbout" value="friends" />Friends</label>
                <label><input type="checkbox" name="hearAbout" value="online" />Online</label>
                <label><input type="checkbox" name="hearAbout" value="advertisement" />Advertisement</label>
                <label><input type="checkbox" name="hearAbout" value="other" />Other</label>
            </div>

            <button type="submit" name="action" value="submit" class="submit-btn" id="submit">Register</button>
        </div>
    </form>

            </div>
        </div>
</asp:Content>

