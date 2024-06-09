<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resetpwd.aspx.cs" Inherits="Maintenance_System.Resetpwd" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel ="shortcut icon" href="mhi.ico" />
    <title>Reset Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background:rgb(2,77,135)
        }

        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 320px;
            max-width: 90%;
            height:384px;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .login-container input[type="submit"] {
            width: 100%;
            background-color:rgb(2,77,135);
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            border:black solid 1px;

        }

        .login-container input[type="submit"]:hover {
            background: white;
            color:black;
            border:black solid 2px;
        }

        .login-container .message {
            text-align: center;
            color: red;
            margin-top: 10px;
        }
        .auto-style1 {
            width: 308px;
        }
      
        .auto-style2 {
            height: 111px;
        }

        /* New CSS for the clear button */
        .clear-button {
            width: 100%;
            background-color: #bf3030;
            color: white;
            padding: 10px;
            border: black solid 1px;
            border-radius: 5px;
            cursor: pointer;

        }

        .clear-button:hover {
            background: darkred;
        }
        .auto-style3 {
            text-align: left;
        }
        .auto-style4 {
            text-align: center;
            height: 105px;
        }

        .l1{
            margin-left:105px;
        }
        .newStyle1 {
            font-family: "Trade Winds";
        }
        .error-message{
            color:red;
        }
        </style>
</head>
<body>
    <div class="login-container">
       <div class="img"> 
           <img src="images/MHI.png" class="auto-style1" />
       </div>
        <form id="form1" runat="server" class="auto-style2">
            <div class="auto-style4">
            <div class="auto-style3">
            <asp:TextBox ID="TextBox1" runat="server" name="Pass" placeholder="Enter New Password" AutoPostBack="True" ></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="RegexValidatorPassword" runat="server"
                ControlToValidate="TextBox1"
                ErrorMessage="Password must  one uppercase letter"
                ValidationExpression=".*[A-Z]+.*"
                CssClass="error-message">
           </asp:RegularExpressionValidator>
            <asp:TextBox ID="TextBox2" runat="server" name="password" placeholder="Enter Confirm Password" TextMode="Password"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox1" ControlToValidate="TextBox2" ErrorMessage="Password not Match" ForeColor="Red"></asp:CompareValidator>
                <br>
            <asp:CheckBox ID="ShowPasswordCheckBox" runat="server" Text="Show Password" CssClass="password-checkbox" onchange="togglePasswordVisibility()"></asp:CheckBox>
                <br />
            <br>
            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="btnResetPass_Click" Font-Bold="True" />
            </div>
                <br />
            <asp:Button ID="Button2"  OnClick="Button2_Click" runat="server" Text="Clear" BackColor="#d53434" />
            </div>
         </form>  
    </div>
    <script>
    function togglePasswordVisibility() {
        var TextBox2 = document.getElementById('<%= TextBox2.ClientID %>');
        var showPasswordCheckBox = document.getElementById('<%= ShowPasswordCheckBox.ClientID %>');

        if (showPasswordCheckBox.checked) {
            TextBox2.type = "text";
        } else {
            TextBox2.type = "password";
        }
    }
    </script>

    

</body>
</html>

