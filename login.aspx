<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Maintenance_System.login1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel ="shortcut icon" href="mhi.ico" />
    <title>Maintenance Login</title>
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
            height:450px;
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
            height: 247px;
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
        
        .auto-style4 {
            text-align: center;
            height: 249px;
        }

        .l1{
      
            color:red;
        }
        .newStyle1 {
            font-family: "Trade Winds";
        }
        .auto-style5 {
            text-decoration: none;
        }
         .auto-style6 {
            font-size: large;
        }
        .cont2{
            background:rgb(2,77,135);
            color:white;
            height:30px;
            padding:5px;
            padding-top:12px;
            border-radius:10px;
            text-align:center;
        }
    </style>
</head>
<body>
    <div class="login-container">
       <div class="img"> 
           <img src="images/MHI.png" class="auto-style1" />
       </div>
        <br />
        <div class="cont2">
            <asp:Label ID="Label2" runat="server"  Text="Maintenance Portal" CssClass="auto-style6"></asp:Label>
        </div>
         
        <br />
        <form id="form1" runat="server" class="auto-style2">
            <div class="auto-style4">
            <div class="auto-style3">
            <asp:TextBox ID="TextBox1" runat="server" name="PSNO" placeholder="PSNO"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" name="password" placeholder="Password" TextMode="Password"></asp:TextBox>
            <asp:CheckBox ID="ShowPasswordCheckBox" runat="server" Text="Show Password" CssClass="password-checkbox" onchange="togglePasswordVisibility()"></asp:CheckBox>

                <span class="newStyle1">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="forget.aspx" class="auto-style5">Forget Password.?</a></span><br />
         <asp:Label ID="Label1" runat="server" CssClass="l1"></asp:Label>
                <br />
        <br />
            <asp:Button ID="Button1" runat="server" Text="LogIn" OnClick="Button1_Click" Font-Bold="True" />
            </div>
                <br />
            <asp:Button ID="Button2"  OnClick="Button2_Click" runat="server" Text="Clear" Font-Bold="True" BackColor="#d53434" />
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

