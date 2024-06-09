<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="My_Request.aspx.cs" Inherits="Maintenance_System.My_Request" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>My Request</title>
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

            .auto-style1 {
                background: white;
                margin-top: 20px;
                margin-left: 20px;
                margin-right: 20px;
                border-radius: 10px;
                height: 805px;
                text-align: center;
                padding:20px;

            }
        
            .container1 {
                background: white;
                margin: 20px;
                padding: 30px;
                border-radius: 5px;
                height:720px;
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

             .auto-style3 {
                margin-top: 20px;
                margin-bottom: 10px;
                height: 65px;
                width: 940px; /* Increased width */
                background: white;
                margin-left: 20px;
                border-radius: 10px;
                text-align: center;
                margin-right:20px;
            }
            /* Close button */
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
                width: 200px; /* Set width as needed */
                padding: 8px; /* Padding */
                border: 1px solid #ccc; /* Border */
                border-radius: 4px; /* Rounded corners */
                box-sizing: border-box; /* Include padding in width */
                font-size: 16px; /* Font size */
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
        .auto-style2 {
            text-align: center;
            background: white;
            margin: 20px;
            border-radius: 10px;
            height: 70px;
            padding-top: 20px;
        }


        </style>

    <div class="cont2">
        <h1 class="auto-style2">My Requests</h1>
    </div>
    <div class="container1">
           
      
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="custom-grid"  OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  OnRowDataBound="GridView1_RowDataBound" AllowPaging="True" PageSize="12" PagerSettings-Mode="NumericFirstLast" OnPageIndexChanging="GridView1_PageIndexChanging">
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
        <asp:BoundField DataField="sub_category" HeaderText="Sub Category" SortExpression="sub_category" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
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

</asp:Content>
