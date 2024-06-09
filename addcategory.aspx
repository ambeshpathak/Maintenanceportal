<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="addcategory.aspx.cs" Inherits="Maintenance_System.addcategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Maintenance Category</title>
    <style>
        /* Custom dropdown styles */
        .custom-dropdown {
            width: 230px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom:20px;
            font-size: 16px;
        }
        /* Custom button styles */
        .custom-button {
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 5px 0px;
            cursor: pointer;
            border-radius: 10px;
            margin-left:62px;
            display: inline-block;
            cursor: pointer;
            background-color: white;
            border-bottom: 4px solid black;
            font-weight: 700;
            color: black;
            line-height: 26px;   
        }

        .custom-button:hover{
           border:solid 1px;
           border-spacing:3px;
        }
        .cont1 {
            background: white;
            margin-top: 20px;
            margin-left: 20px;
            margin-right: 20px;
            padding: 20px;
            border-radius: 5px;
            display: flex; 
            height:320px;
            padding-top:30px;
        }
        .card {
            flex: 1;
            margin: 0 10px;
            height: 250px;
            background: rgb(2,77,135);
        }
        .cont2{
           background: white;
            margin-top: 20px;
            margin-left: 20px;
            margin-right: 20px;
            border-radius: 10px;
            height: 60px;
        }
       
        .auto-style {
            background: white;
            margin-top: 20px;
            margin-left: 20px;
            margin-right: 20px;
            border-radius: 10px;
            height: 70px;
            text-align: center;
            padding-top:15px;
        }

        .l1{
            color:black;
        }

        .auto-style2 {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            margin-bottom: 20px;

        }

        .auto-style3 {
            color: black;
            font-size: larger;
            margin-top:20px;
        }
        
       
    </style>
</head>
<body>
    <div class="auto-style">
        <h1>
           
        <asp:Label ID="Label5" runat="server" CssClass="auto-style3" Text="Add Categories"></asp:Label>
        </h1>
     </div>
    <div class="cont1">
        <!-- Maintenance Category Card -->
        <div class="card">
            <h2>
                <asp:Label ID="Label2" runat="server" ForeColor="White" Text="Add  Category"></asp:Label>
            </h2>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:maintanceConnectionString %>" SelectCommand="SELECT [location_name] FROM [Location]"></asp:SqlDataSource>
           <br />
            <asp:DropDownList ID="ddlContinents" runat="server" CssClass="custom-dropdown" DataTextField="servicename" 
                DataValueField="service_Id" AutoPostBack="True" OnSelectedIndexChanged="ddlContinents_SelectedIndexChanged">
            </asp:DropDownList>
            <br>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style2" Height="33px" Width="230px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
            <asp:Button ID="Submit" class="custom-button" runat="server" Text="Submit" Height="44px" OnClick="Submit_Click" Width="106px" />
        </div>

        <!-- SubCategory Card -->
        <div class="card">
            <h2>
                <asp:Label ID="Label3" runat="server" ForeColor="White" Text="Add Sub-Category"></asp:Label>
            </h2>
            <br>
            <asp:DropDownList ID="ddlCountries" runat="server" CssClass="custom-dropdown" DataValueField="sub_service_id" 
                DataTextField="sub_service_name" AutoPostBack="True" OnSelectedIndexChanged="ddlCountries_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="custom-dropdown" Height="31px" Width="230px"></asp:TextBox>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
            <asp:Button ID="Submit1" class="custom-button" runat="server" Text="Submit" Height="46px" OnClick="Submit_Click1" Width="112px" />
        </div>

        <!-- Location Card -->
        <div class="card">
            <h2>
                <asp:Label ID="Label4" runat="server" ForeColor="White" Text="Add  Location"></asp:Label>
            </h2>
            <br>
             <asp:DropDownList ID="DropDownList1" runat="server" CssClass="custom-dropdown" AutoPostBack="True" DataTextField="location_name" DataValueField="location_name">
            </asp:DropDownList>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="custom-dropdown" Height="30px" Width="230px"></asp:TextBox>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
            <asp:Button ID="Submit2" class="custom-button" runat="server" Text="Submit" Height="46px" OnClick="Submit_Click2" Width="112px" />
        </div>
    </div>
</body>
</html>



</asp:Content>
