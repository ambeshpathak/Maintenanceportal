<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="View_Request2.aspx.cs" Inherits="Maintenance_System.View_Request2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            /* Smooth transition for background color change */
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
            margin-bottom: 20px; /* Added margin to separate rows */
        }

        .form-group {
            flex: 1;
            margin-right: 20px; 
        }

        .form-group1 {
            flex: 1;
             font-style:
        }
        .form-group:last-child {
            margin-right: 0; /* Remove margin-right for the last form element in each row */
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            font-size: larger;
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="password"],
        .form-group select {
            width: 100%; /* Changed width to 100% */
            padding: 12px; /* Increased padding for better visibility */
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .custom-dropdown {
            width: calc(100% - 10px); /* Adjusted width */
            padding: 12px; /* Increased padding */
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .form-group button {
            padding: 12px 20px; /* Increased padding */
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

        .sbutton2 {
            background: white;
            color: black;
            border-radius: 5px;
            font-size: large;
            margin-top: 25px; /* Adjust this margin to change vertical position */
            margin-left: 794px; /* Adjust this margin to change horizontal position */
        }

        .sbutton2:hover {
            background: Red;
            color: white;
        }

        @media screen and (max-width: 600px) {
            .form-group label {
                margin-bottom: 5px;
            }

            .form-group input[type="text"],
            .form-group input[type="email"],
            .form-group input[type="password"],
            .form-group select {
                width: 100%; /* Changed width to 100% */
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
            padding-bottom: 10px;
            height: 644px;
        }
       
        .auto-style1 {
            text-align: left;
            width:950px;
            padding:10px;
        }
        .auto-style23 {
            text-align: left;
            padding: 10px;
        }
        </style>
</head>

<body>
    <div class="cont2">
        <h1 class="auto-style2">View Request</h1>
    </div>

    <div class="cont1">
        <form>
            <div class="form-row">
                <div class="form-group">
                    <label for="role">Ticket No:</label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style1" Height="38px" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="role">Category:</label>
                    <asp:TextBox ID="TextBox9" runat="server" CssClass="auto-style1" Height="38px" ReadOnly="true"></asp:TextBox>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="role">Sub-Category:</label>
                    <asp:TextBox ID="TextBox10" runat="server" CssClass="auto-style1" Height="38px" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="role">Subject:</label>
                    <asp:TextBox ID="TextBox11" runat="server" CssClass="auto-style1" Height="38px" ReadOnly="true"></asp:TextBox>
                </div>
            </div>

             <div class="form-row">
                <div class="form-group">
                    <label for="role">Details:</label>
                    <asp:TextBox ID="TextBox12" runat="server" TextMode="MultiLine" CssClass="auto-style1" Height="135  px" Width="100%" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="role">Location:</label>
                     <asp:TextBox ID="TextBox13" runat="server" CssClass="auto-style1" Height="48px" ReadOnly="true"></asp:TextBox>
                   
                    <br>
                    <br />
                    <label for="role">Status:</label>
                     <asp:TextBox ID="TextBox14" runat="server" CssClass="auto-style1" Height="48px" ReadOnly="true"></asp:TextBox>
                </div>
              </div>
            <div class="form-row">
            <div class="form-group">
                 <label for="role"><strong>Remark:</strong></label>
                     <asp:TextBox ID="TextBox15" TextMode="MultiLine" runat="server" CssClass="auto-style23" Width="100%"  Height="140px" ReadOnly="true"></asp:TextBox>  
                 </div> 
                <div class="form-group">
                    <label for="role"><strong>Feedback:</strong></label>
                             <asp:TextBox ID="TextBox2" TextMode="MultiLine" runat="server" CssClass="auto-style23" Width="100%"  Height="140px" ReadOnly="true"></asp:TextBox>
                    </div>
            
            </div>
                                 <asp:Button ID="Button1" CssClass="sbutton2" runat="server" Text="Cancel" Height="48px" Width="90px" OnClick="submitBtn_Click" />

            
        
      
</body>

</html>

</asp:Content>
