<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forget.aspx.cs" Inherits="Maintenance_System.forget" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel ="shortcut icon" href="mhi.ico" />
    <title>Forget Password</title>
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
            height:310px;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .login-container input[type="text"]
         {
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
            height: 154px;
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
            height: 150px;
        }

        .l1{
            margin-left:105px;
        }
        .newStyle1 {
            font-family: "Trade Winds";
        }

        .b1{
            background-color: #bf3030;
            color: white;
        }

        .b1:hover {
            background: darkred;        
        }
        .auto-style5 {
            text-align: right;
        }
        .auto-style6 {
            text-decoration: none;
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
            <div class="auto-style5">
                <br>
            <asp:TextBox ID="TextBox1" runat="server" name="PSNO" placeholder="Enter Registered Email-Id"></asp:TextBox>
            &nbsp;<a href="login.aspx" class="auto-style6">Back to Login.?</a><br />
            <br>
            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="btnForgotPass_Click" Font-Bold="True" />
            </div>
                <br />
            <asp:Button ID="Button2"  OnClick="btnClear_Click" runat="server" Text="Clear" BackColor="#d53434" />

            </div>
         </form>  
    </div>
</body>
</html>