<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="Add_user.aspx.cs" Inherits="Maintenance_System.Add_user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<title>User Registration Form</title>
<style>
    body {
      font-family: Arial, sans-serif;
      background-color: #d5e3f7;
      margin: 0;
      padding: 0;
      transition: background-color 0.3s ease; /* Smooth transition for background color change */
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
      margin-bottom: 10px;
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
      background-color: white;
      color: white;
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
        height:90px;
        padding-top:25px;
        text-align:center;
    }


    .auto-style1{
        text-align:left;

    }

    .form-group button:hover {
      background-color: white;
      color:black;
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

  

.custom-combobox .ajax__combobox_inputcontainer input {
    /* Additional styles for the input area */
    /* For example: */
    border: solid 1px;
    color:black;
    outline: none;
    width: 100%;
}



.custom-combobox .ajax__combobox_buttoncontainer button {
    /* Additional styles for the button */
    /* For example: */
    background-color: white;
    color: black;
    border: solid 1px black;
    padding: 5px 10px;
    border-radius: 5px;
    cursor: pointer;
}

.custom-combobox .ajax__combobox_itemlist {
    /* Additional styles for the dropdown list */
    /* For example: */
    border: 1px solid #ccc;
    border-top: none;
    max-height: 150px; /* Adjust as needed */
    overflow-y: auto;
}

.custom-combobox .ajax__combobox_itemlist .ajax__combobox_item {
    /* Additional styles for each item in the dropdown */
    /* For example: */
    padding: 5px;
    cursor: pointer;
}

.custom-combobox .ajax__combobox_itemlist .ajax__combobox_item.ajax__combobox_item_selected {
    /* Additional styles for the selected item */
    /* For example: */
    background-color: #007bff;
    color: #fff;
}


    .dropdown-option {
        font-size: 16px; /* Adjust the font size as needed */
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

    .error-message {
        color: red;
        font-style: Bold;
        margin-top:5px;
        
    }

    @media screen and (max-width: 600px) {
      .form-group label {
        margin-bottom: 5px;
      }

      .form-group input[type="text"],
      .form-group input[type="email"],
      .form-group input[type="password"],
      .form-group select {
        width: calc(100% - 10px);
      }
    }
    .auto-style2 {
        text-align: center;
    }
    .auto-style3 {
        font-size: larger;
    }
    
</style>
</head>
<body>
    <form id="userForm" action="#" method="post">
        <div class="cont2">
            <h1 class="auto-style2">Add New User</h1>
        </div>
        <div class="cont1">
      <div class="form-group">
        <label for="psno"><span class="auto-style3"><strong>PSNO</strong></span>:</label>
                  <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1" Height="38px" Width="390px" AutoPostBack="True" OnTextChanged="txtPSNumber_TextChanged" ></asp:TextBox>
       
      </div>

      <div class="form-group">
        <label for="username">Username:</label>
        <asp:TextBox ID="TextBox6" runat="server" CssClass="auto-style1" Height="38px" Width="390px" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox6" ErrorMessage="Enter Username" ForeColor="Red"></asp:RequiredFieldValidator>

      </div>

      <div class="form-group">
        <label for="email">Email:</label>
       <asp:TextBox ID="TextBox7" runat="server" TextMode="Email" CssClass="auto-style1" Height="38px" Width="390px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox7" ErrorMessage="Enter Email-Id" ForeColor="Red"></asp:RequiredFieldValidator>

      </div>

      <div class="form-group">
        <label for="password">Password:</label>
        <asp:TextBox ID="TextBox8" runat="server" CssClass="auto-style1" Height="38px" Width="390px" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox8" ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
          <br />
          <asp:RegularExpressionValidator ID="RegexValidatorPassword" runat="server"
                ControlToValidate="TextBox8"
                ErrorMessage="Password must contain at least one uppercase letter"
                ValidationExpression=".*[A-Z]+.*"
                CssClass="error-message">
           </asp:RegularExpressionValidator>

      </div>
      <div class="form-group">
        <label for="role">Role:</label>
        <asp:DropDownList ID="DropDownList1" runat="server"  CssClass="dropdown-option" Height="55px" Width="390px">
            <asp:ListItem Text=" Select Role " Value="" Selected="True"  />
            <asp:ListItem>User</asp:ListItem>
            <asp:ListItem>Support</asp:ListItem>
            <asp:ListItem>Support Admin</asp:ListItem>
            <asp:ListItem>Admin</asp:ListItem>
      </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Select Role of User" ForeColor="Red"></asp:RequiredFieldValidator>

      </div>
      <div class="form-group">
              <asp:Button ID="submitBtn" CssClass="sbutton2" runat="server" Text="Clear"  Height="39px" Width="87px" OnClick="submitBtn_Click" /> 
          <asp:Button ID="submitBtn0" CssClass="sbutton1" runat="server" Text="Submit" OnClick="Button1_Click" Height="39px" Width="95  px" />
               
               
      </div>

            </div>
    </form>
</body>
</html>

</asp:Content>
