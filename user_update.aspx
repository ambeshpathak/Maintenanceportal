<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="user_update.aspx.cs" Inherits="Maintenance_System.user_update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<title>User Update</title>
<style>
    body {
      font-family: Arial, sans-serif;
      background-color: #d5e3f7;
      margin: 0;
      padding: 0;
      transition: background-color 0.3s ease; 
    }

    .container {
      max-width: 900px;
      margin: 50px auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
    }

    h2 {
      text-align: center;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .cont1{
        background: white;
        margin-top: 20px;
        margin-left: 230px;
        margin-right: 270px;
        border-radius: 10px;
        padding: 40px;
        padding-bottom:10px;
    }

    .form-group label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
      font-size:larger;
    }

    .form-group input[type="text"],
    .form-group input[type="email"],
    .form-group input[type="password"],
    .form-group select {
      width: calc(100% - 10px);
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .form-group select {
      appearance: none;
      -webkit-appearance: none;
      -moz-appearance: none;
      background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%23333"><path d="M7 10l5 5 5-5z"/></svg>');
      background-repeat: no-repeat;
      background-position: right 10px top 50%;
      background-size: 20px;
    }

    .form-group button {
      padding: 10px 20px;
      background-color: #4CAF50;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      
    }

    .cont2{
        background:white;
        color:black;
        margin-top:20px;
        border-radius:10px;
        margin-bottom:10px;
        margin-left:230px;
        margin-right:270px;
        height:80px;
        padding-top:25px;
        text-align:center;
    }


    .auto-style1{
        text-align:left;

    }

    .form-group button:hover {
      background-color: #45a049;
    }

    .sbutton1{
        margin-left: 200px;
        background: rgb(34, 102, 141);
        color: white;
        border-radius:5px;
        font-size:large;

    }

    .sbutton2:hover{
        background:rgb(191, 49, 49);    
        color:white;
    }

    .dropdown-option {
        font-size: 20px;
    }

    .sbutton2{
        background:white;
        color:black;
        border-radius:5px;
        font-size:large;
    }

    .sbutton{
        background:rgb(34, 102, 141);
        color:white;
        border-radius:5px;
    }

   
    .auto-style2 {
        text-align: center;
    }
</style>
</head>
<body>
    <form id="userForm" action="#" method="post">
        <div class="cont2">
            <h1 class="auto-style2">Update User</h1>
        </div>
        <div class="cont1">
      <div class="form-group">
          
        <label for="psno">PSNO:</label>
        <asp:TextBox ID="TextBox5" runat="server" CssClass="auto-style1" Height="38px" Width="290px"></asp:TextBox>
          &nbsp
          <asp:Button ID="Button2" CssClass="sbutton" runat="server" Text="Get Data" OnClick="Button2_Click" Height="38px" Width="85px"  />
      </div>

      <div class="form-group">
        <label for="username">Username:</label>
        <asp:TextBox ID="TextBox6" runat="server" CssClass="auto-style1" Height="38px" Width="390px" ReadOnly ="True"></asp:TextBox>
      </div>

      <div class="form-group">
        <label for="email">Email:</label>
       <asp:TextBox ID="TextBox7" runat="server" CssClass="auto-style1" Height="38px" TextMode="Email" Width="390px" ></asp:TextBox>
      </div>

      <div class="form-group">
        <label for="password">Password:</label>
        <asp:TextBox ID="TextBox8" runat="server" CssClass="auto-style1" Height="38px" Width="390px"  ReadOnly ="True"></asp:TextBox>
      </div>
      <div class="form-group">
        <label for="role">Role:</label>
        <asp:DropDownList ID="DropDownList1" runat="server"  CssClass="dropdown-option" Height="55px" Width="390px">
            <asp:ListItem Text=" Select Role " Value="" Selected="True"  />
            <asp:ListItem>User</asp:ListItem>
            <asp:ListItem>Support</asp:ListItem>
            <asp:ListItem>Admin</asp:ListItem>
      </asp:DropDownList>
      </div>
      <div class="form-group">
              <asp:Button ID="submitBtn" CssClass="sbutton2" runat="server" Text="Clear"  Height="39px" Width="87px" OnClick="submitBtn_Click" /> 
          <asp:Button ID="submitBtn0" CssClass="sbutton1" runat="server" Text="Update" OnClick="Button1_Click" Height="39px" Width="95  px" />
      </div>

            </div>
    </form>
    <script>
        function updateProgressBar(progress) {
            var progressBar = document.getElementById('progressBar');
            if (progressBar) {
                progressBar.style.width = progress + '%';
            }
        }

    </script>
</body>
</html>
</asp:Content>
