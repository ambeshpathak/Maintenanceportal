<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="request_form.aspx.cs" Inherits="Maintenance_System.request_form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Create Request Form</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Data</title>
    <style>
        body {
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
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
        }

        .form-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px; 
        }

        .form-group {
            flex: 1;
            margin-right: 20px; 
        }

        .form-group:last-child {
            margin-right: 0;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            font-size: larger;
        }

        .primary-button {
            background-color: rgb(2, 77, 135);
            color: white;
            border: none;
            height: 40px;
            width: 90px;
            border: 1px black solid;
            margin-top:40px;
            border-radius:5px;
            font-size:16px;

        }

        .primary-button:hover {
            background-color: white;
            border:1px solid black;
            color:black;
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="password"],
        .form-group select {
            width: 100%; 
            padding: 12px; 
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .custom-dropdown {
            width: calc(100% - 10px); 
            padding: 12px; 
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .form-group button {
            padding: 12px 20px;
            background-color: white;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: white;
            color: black;
        }

        @media screen and (max-width: 600px) {
            .form-group label {
                margin-bottom: 5px;
            }

            .form-group input[type="text"],
            .form-group input[type="email"],
            .form-group input[type="password"],
            .form-group select {
                width: 100%; 
            }
        }

        .auto-style2 {
            text-align: center;
            background: white;
            margin: 20px;
            border-radius: 10px;
            height: 70px;
            padding-top: 20px;
        }

        .cont1 {
            background: white;
            margin-top: 20px;
            margin-left: 20px;
            margin-right: 20px;
            border-radius: 10px;
            padding: 20px;
            padding-bottom: 5px;
            height: 400px;
        }

        .auto-style1{
            width:440px;
            padding:10px;
        }
       
        .file-upload1 {
            display: inline-block;
            border: 1px solid black;
            border-radius: 4px;
            padding: 10px 7px;
            cursor: pointer;
            background-color: #f9f9f9;
            color: #333;
            width:440px;
            height:45px;
        }

        
        .but1{
            width:90px;
            height:40px;
            background:#cf5252;
            color:white;
            border-radius:5px;
            font-size:16px;
            margin-left:230px;
        }

        .but1:hover{
            background:red;
            color:white;
        }

        .file-upload input[type="file"] {
            display: none;
        }

        .auto-style1 option {
          padding: 8px;
          font-size: 16px;
          background-color: #fff;
          color: #333;
        }

       
        .auto-style1:hover {
          border-color: #666;
        }

      
        .auto-style1:focus {
          outline: none;
          border-color: #3399ff;
          box-shadow: 0 0 5px #3399ff;
        }

     
        .auto-style1:after {
          content: '\25BC'; 
          position: absolute;
          top: 50%;
          right: 10px;
          transform: translateY(-50%);
          pointer-events: none;
        }

       
        .auto-style1:hover:after {
          color: #666;
        }


    </style>
</head>

<body>
    <div class="cont2">
        <h1 class="auto-style2">Create New Request</h1>
    </div>

    <div class="cont1">
        <form>
            <div class="form-row">
                <div class="form-group">
                    <label for="role">Category:</label>
                    <asp:DropDownList ID="ddlContinents" runat="server" CssClass="auto-style1" DataTextField="servicename" DataValueField="service_Id" AutoPostBack="True" OnSelectedIndexChanged="ddlContinents_SelectedIndexChanged"></asp:DropDownList>                
                </div>
                <div class="form-group">
                    <label for="role">Sub Category:</label>
                   <asp:DropDownList ID="ddlCountries" runat="server" DataValueField="sub_service_id" CssClass="auto-style1" DataTextField="sub_service_name" AutoPostBack="True" OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged"></asp:DropDownList>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="role">Subject:</label>
                    <asp:TextBox ID="TextBox5" CssClass="auto-style1" runat="server"></asp:TextBox>                
                </div>
                <div class="form-group">
                    <label for="role">Details:</label>
                    <asp:TextBox ID="TextBoxMultiLine" runat="server" CssClass="auto-style1" TextMode="MultiLine" Rows="4"></asp:TextBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:maintanceConnectionString %>" SelectCommand="SELECT [location_name] FROM [service_loc]"></asp:SqlDataSource>
                </div>
            </div>

             <div class="form-row">
                <div class="form-group">
                    <label for="role">Location:</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="auto-style1" DataValueField="location_name" DataSourceID="SqlDataSource1"></asp:DropDownList>                
                </div>
                <div class="form-group">
                    <label for="role">Attachments:</label>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="file-upload1" />                   
                    <br>
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Cancel" CssClass="but1" />
        &nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" OnClick="Button1_Click" Text="Submit" CssClass="primary-button" />

        <label for="serviceRequest">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="Enter Subject" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </label>  
            </div>
         </div>
</body>

</html>

</asp:Content>
