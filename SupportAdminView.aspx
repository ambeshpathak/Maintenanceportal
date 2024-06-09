<%@ Page Title="" Language="C#" MasterPageFile="~/SupportAdmin.Master" AutoEventWireup="true" CodeBehind="SupportAdminView.aspx.cs" Inherits="Maintenance_System.SupportAdminView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
            .custom-grid {
                width: 100%;
                border-collapse: collapse;
                overflow-y: auto;
                max-height: 100px;
                text-align:center;
            }

            .grid-item {
                padding: 15px;
                border: 1px solid black ;
                background-color: #f9f9f9; /* Light gray background for cells */
                color: black; /* Text color */
                 font-weight: bold;
                text-align: center;
            }

            .grid-subject{
                padding: 10px;
                border: 1px solid black ;
                background-color: #f9f9f9; /* Light gray background for cells */
                color: black; /* Text color */
                font-weight: bold;
                text-align: left;
                white-space: normal;
            }

            .grid-header {
                background-color: rgb(2,77,135); /* Blue background for header */
                color: white; /* Text color */
                font-weight: bold;
                padding: 10px;
            }

            .container1 {
                background: white;
                margin: 20px;
                padding: 20px;
                border-radius: 10px;
                height:835px;
            }

            .custom-pagination1 {
                margin-top: 20px;
                text-align: center;
            }

            .custom-pagination a,
            .custom-pagination span {
                display: inline-block;
                padding: 8px 12px;
                margin: 0 4px;
                border: 1px solid black;    
                color: black;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s, color 0.3s;
            }

            .custom-pagination a:hover {
                background-color: rgb(2,77,135);
                color: white;
            }

            .custom-pagination .current {
                background-color: #007bff;
                color: white;
            }
                    .form-group label {
                font-weight: bold;
            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }

            /* Style input fields */
            .form-control {
                width: 100%;
                padding: 8px;
                margin: 5px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            /* Style submit button */
            .btn {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                float: right;
            }

            .btn:hover {
                background-color: #45a049;
            }

            .custom-dropdown {
                width: 200px; 
                padding: 8px; 
                border: 1px solid #ccc; 
                border-radius: 4px; 
                box-sizing: border-box; 
                font-size: 16px; 
             }

            .custom-button {
                background-color: rgb(2,77,135); /* Red background */
                color: white; /* White text */
                padding: 10px 20px; /* Padding */
                border: none; /* No border */
                border-radius: 4px; /* Rounded corners */
                cursor: pointer; /* Cursor style */
                margin-left:740px;
                border:1px solid black;
                font-size: 16px; /* Font size */
                transition: background-color 0.3s; /* Smooth transition */
            }

            .custom-button:hover {
                background-color: white;/* Darker red background on hover */
                border:2px solid black;
                color:black;
            }
            .cont2{
                background:white;
                height:80px;
                margin:20px;
                border-radius:10px;
                text-align:center;
                padding-top:30px;
            }

        .auto-style2 {
            background: white;
            height: 80px;
            margin: 20px;
            border-radius: 10px;
            text-align: center;
            padding-top: 30px;
            font-size: x-large;
        }

         .custom-grid .grid-pager {
                    text-align: center;
                    margin-top: 10px;
            }

            .custom-grid .grid-pager a {
                    display: inline-block;
                    padding: 5px 10px;
                    margin: 0 2px;
                    background-color: white;
                    border: 1px solid black;
                    color: #333;
                    text-decoration: none;
                    border-radius: 3px;
            }

            .custom-grid .grid-pager a:hover {
                     background-color:  #d5e3f7;
                     color:black;
            }

            .custom-grid .grid-pager span {
                    display: inline-block;
                    padding: 5px 10px;
                    margin: 0 2px;
                    background-color: #006699;
                    border: 1px solid black;
                    color: white;
                    border-radius: 3px;
            }

        </style>
    <div class="auto-style2">
        <strong>View Closed Request

        </strong>

        </div>

    <div class="container1">
           
      
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="custom-grid" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" PageSize="12" PagerSettings-Mode="NumericFirstLast" OnPageIndexChanging="GridView1_PageIndexChanging">
           <Columns>
        
        <asp:BoundField DataField="Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
<HeaderStyle CssClass="grid-header"></HeaderStyle>

<ItemStyle CssClass="grid-item"></ItemStyle>
        </asp:BoundField>
               <asp:BoundField DataField="service_request" HeaderText="Subject" SortExpression="service_request" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
<HeaderStyle CssClass="grid-header"></HeaderStyle>

<ItemStyle CssClass="grid-subject"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
<HeaderStyle CssClass="grid-header"></HeaderStyle>

<ItemStyle CssClass="grid-item"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="location" HeaderText="Location" SortExpression="sub_category" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
<HeaderStyle CssClass="grid-header"></HeaderStyle>

<ItemStyle CssClass="grid-item"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
        <HeaderStyle CssClass="grid-header"></HeaderStyle>

        <ItemStyle CssClass="grid-item"></ItemStyle>
        </asp:BoundField>
           <asp:CommandField HeaderText="View" SelectText="View" ShowSelectButton="True" HeaderStyle-CssClass="grid-header"  ItemStyle-CssClass="grid-item" />
    </Columns>
                    <PagerSettings Mode="NumericFirstLast" />
               <PagerStyle CssClass="grid-pager" />
</asp:GridView>
          </div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:maintanceConnectionString %>" SelectCommand="SELECT [Id], [ps_no], [service_request], [category], [location], [status] 
FROM [service_request] order by id DESC ;"></asp:SqlDataSource>
</asp:Content>
