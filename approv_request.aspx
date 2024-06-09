<%@ Page Title="" Language="C#" MasterPageFile="~/Support.Master" AutoEventWireup="true" CodeBehind="approv_request.aspx.cs" Inherits="Maintenance_System.approv_request" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Approve Request</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
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
                padding: 20px;
                border-radius: 5px;
                height:480px;
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

               
           

            .form-control {
                width: 100%;
                padding: 8px;
                margin: 5px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

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

            .popup-button {
                background-color: rgb(2,77,135); /* Darker green background on hover */
                color:white; /* White text */
                padding: 10px 20px; /* Padding */
                border: 1px solid black; /* No border */
                border-radius: 4px; /* Rounded corners */
                cursor: pointer; /* Cursor style */
                font-size: 16px; /* Font size */
                transition: background-color 0.3s; /* Smooth transition */
            }

            .popup-button:hover {
                background-color: white; /* Darker green background on hover */
                color:black;
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


        </style>


   
    
    <div class="auto-style1">
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" PageSize="4" CssClass="custom-grid">
    <Columns>
        <asp:BoundField DataField="ps_no" HeaderText="PS No" SortExpression="ps_no" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
<HeaderStyle CssClass="grid-header"></HeaderStyle>

<ItemStyle CssClass="grid-item"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
<HeaderStyle CssClass="grid-header"></HeaderStyle>

<ItemStyle CssClass="grid-item"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
<HeaderStyle CssClass="grid-header"></HeaderStyle>

<ItemStyle CssClass="grid-item"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="sub_category" HeaderText="Sub Category" SortExpression="sub_category" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
<HeaderStyle CssClass="grid-header"></HeaderStyle>

<ItemStyle CssClass="grid-item"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="emailid" HeaderText="Email ID" SortExpression="emailid" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
<HeaderStyle CssClass="grid-header"></HeaderStyle>

<ItemStyle CssClass="grid-item"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
<HeaderStyle CssClass="grid-header"></HeaderStyle>

<ItemStyle CssClass="grid-item"></ItemStyle>
        </asp:BoundField>
        <asp:TemplateField HeaderText="Details" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header">
            <ItemTemplate>
                <asp:Button runat="server" Text="GET" CssClass="popup-button" OnClientClick="return false;" OnClick="Button1_Click1" />
            </ItemTemplate>
<HeaderStyle CssClass="grid-header"></HeaderStyle>

<ItemStyle CssClass="grid-item"></ItemStyle>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:maintanceConnectionString %>" SelectCommand="SELECT [ps_no], [Id], [category], [sub_category], [emailid], [status] FROM [service_request]"></asp:SqlDataSource>
        
     </div>

      <div id="popup" class="popup">
    <div class="popup-content">
        <span class="close" onclick="closePopup()">&times;</span>
        <label>ID</label>
        <asp:TextBox ID="txtid" ReadOnly="True" CssClass="form-control" runat="server" />
        <label>PSNO</label>
        <asp:TextBox ID="txtps" ReadOnly="True" CssClass="form-control" runat="server" />
        <label>Extn No</label>
        <asp:TextBox ID="txtext" ReadOnly="True" CssClass="form-control" runat="server" />
        <label>Email</label>
        <asp:TextBox ID="txtemail" ReadOnly="True" CssClass="form-control" runat="server" />
        <label>Category</label>
        <asp:TextBox ID="category" ReadOnly="True" CssClass="form-control" runat="server" />
        <label>Sub Category</label>
        <asp:TextBox ID="subcategory" ReadOnly="True" CssClass="form-control" runat="server" />
        <label>Service Request</label>
        <asp:TextBox ID="servicerequest" ReadOnly="True" CssClass="form-control" runat="server" />
        <label>Details</label>
        <asp:TextBox ID="TextAre1" ReadOnly="True" CssClass="form-control" runat="server" />
        <label>Location</label>
        <asp:TextBox ID="location" CssClass="form-control" runat="server" />
        <br>
            
  
        <br /><label>Status</label>
        <asp:DropDownList ID="DropDownList1" CssClass="custom-dropdown" runat="server">
            <asp:ListItem>In Progress</asp:ListItem>
            <asp:ListItem>Close</asp:ListItem>
        </asp:DropDownList>
        <br>
        <br>
       <div class="b1">
                <asp:Button ID="Submit2" CssClass="custom-button" runat="server" Text="Submit" Height="46px" OnClick="Button2_Click" Width="112px" />
                
    </div>
    </div>
</div>
    <script>
        function openPopup() {
            document.getElementById("popup").style.display = "block";
        }

        // Function to close the popup
        function closePopup() {
            document.getElementById("popup").style.display = "none";
        }

        // Attach event handlers to buttons in GridView to open the popup
        document.addEventListener("DOMContentLoaded", function () {
            var buttons = document.querySelectorAll('.popup-button');
            buttons.forEach(function (button) {
                button.addEventListener('click', openPopup);
            });
        });
    </script>
</asp:Content>
