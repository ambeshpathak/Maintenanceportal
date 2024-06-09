<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="Report_User.aspx.cs" Inherits="Maintenance_System.Report_User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                height:552px;
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
            transition: background-color 0.3s; 
        }

        .custom-button:hover {
            background-color: white;
            border:2px solid black;
            color:black;
        }

        .auto-style2 {
            text-align: center;
            background: white;
            margin: 20px;
            border-radius: 10px;
            height: 220px;
            padding-top: 20px;
        }

        .cont2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .cont2 h3 {
            font-size: 18px;
            color: #333;
            margin: 10px 0;
        }

        .cont2 .auto-style2 {
            display: inline-block;
        }

        .cont2 .auto-style2 .calendar {
            display: inline-block;
            border: 1px solid #ccc;
            background-color: #fff;
            border-radius: 5px;
            padding: 5px;
        }

        .cont2 .auto-style2 .btn {
            margin-left: 10px;
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .cont2 .auto-style2 .btn:hover {
            background-color: #0056b3;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="cont2">
    <h3 class="auto-style2">
        From : <asp:Calendar ID="Calendar1" CssClass="calendar" runat="server"></asp:Calendar> 
        To : <asp:Calendar ID="Calendar2" CssClass="calendar" runat="server"></asp:Calendar> 
        <asp:Button ID="Button1" CssClass="btn" runat="server" Text="Search" OnClick="Button1_Click" /> 
        <asp:Button ID="Button2" CssClass="btn" runat="server" Text="Download" />
    </h3>
</div>
    <div class="container1">
           
      
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="custom-grid"   OnRowDataBound="GridView1_RowDataBound" AllowPaging="True" PageSize="8" PagerSettings-Mode="NumericFirstLast" OnPageIndexChanging="GridView1_PageIndexChanging">
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
    </Columns>
             <PagerSettings Mode="NumericFirstLast" />
               <PagerStyle CssClass="grid-pager" />
</asp:GridView>
          </div>
    <script>
        function showCalendar(calendar1) {
        var calendar = document.getElementById(calendar1);
        calendar.style.display = "block";
        }
        function show_Calendar(calendar2) {
            var calendarr = document.getElementById(calendar2);
            calendarr.style.display = "block";
        }
    </script>
</asp:Content>
