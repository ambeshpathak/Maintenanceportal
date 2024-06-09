<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admindash.aspx.cs" Inherits="Maintenance_System.admindash" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>Admin Dashboard</title>
    <style>

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); /* Responsive grid */
            gap: 18px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-left:20px;
            margin-right:20px;
            height:652px;
        }
           .custom-grid {
                    width: 100%;
                    border-collapse: collapse;
                    overflow-y: auto;
                    max-height: 100px;
                    text-align:center;
            }

            .grid-item {
                padding: 10px;
                border: 1px solid black ;
                background-color: #f9f9f9; /* Light gray background for cells */
                color: black; /* Text color */
                font-weight: bold;
                text-align: center;
            }

            .grid-header {
                background-color: rgb(2,77,135); /* Blue background for header */
                color: white; /* Text color */
                font-weight: bold;
                padding: 10px;
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
        
        .card {
            background-color: rgb(2,77,135);
            color:white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            flex: 0 1 calc(25% - 20px); /* Adjust this value to control the width of the cards */
            box-sizing: border-box;
            height: 120px;
            transition: transform 0.3s ease;
        }

   

        .card .glow {
            position: absolute;
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
        }

        .auto-style1 {
            text-align: right;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            font-size: x-large;
        }

        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard">
                          <div class="card">
                            <h3 class="auto-style1">
                                <asp:Label ID="Label1" runat="server" Text="0" CssClass="auto-style3" style="font-size: x-large"></asp:Label>
                              </h3>
                        </div>
                          <div class="card">
                            <h3 class="auto-style1">
                                <asp:Label ID="Label5" runat="server" Text="0" CssClass="auto-style3" style="font-size: x-large"></asp:Label>
                              </h3>
                        </div>
                        <div class="card">
                            <h3 class="auto-style1">
                                <asp:Label ID="Label6" runat="server" CssClass="auto-style4" Text="Closed "></asp:Label>
                            </h3>
                            <h3 class="auto-style1">
                                <asp:Label ID="Label2" runat="server" Text="0" CssClass="auto-style3" style="font-size: x-large"></asp:Label>
                            </h3>
                        </div>
                        <div class="card">
                          <h3 class="auto-style1">
                              <asp:Label ID="Label7" runat="server" CssClass="auto-style4" Text="Create"></asp:Label>
                            </h3>
                            <h3 class="auto-style1">
                              <asp:Label ID="Label3" runat="server" Text="0" CssClass="auto-style3" style="font-size: x-large"></asp:Label>
                            </h3>
                      </div>
                     
                </div>
    <div class="grid-container">
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="custom-grid"    ViewStateMode="Enabled" AllowPaging="True" PagerSettings-Mode="NumericFirstLast" PageSize="11" OnPageIndexChanging="GridView1_PageIndexChanging" DataSourceID="SqlDataSource2">
           <Columns>
        
        <asp:BoundField DataField="ps_no" HeaderText="PSNO" SortExpression="ps_no" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
        <HeaderStyle CssClass="grid-header"></HeaderStyle>

<ItemStyle CssClass="grid-item"></ItemStyle>
       
        </asp:BoundField>
               <asp:BoundField DataField="user_name" HeaderText="Username" SortExpression="user_name" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
       <HeaderStyle CssClass="grid-header"></HeaderStyle>

<ItemStyle CssClass="grid-item"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
        <HeaderStyle CssClass="grid-header"></HeaderStyle>

<ItemStyle CssClass="grid-item"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="role" HeaderText="Role" SortExpression="role" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
        <HeaderStyle CssClass="grid-header"></HeaderStyle>

<ItemStyle CssClass="grid-item"></ItemStyle>
        </asp:BoundField>
    </Columns>
            <PagerSettings Mode="NumericFirstLast" />
               <PagerStyle CssClass="grid-pager" />
</asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:maintanceConnectionString %>" SelectCommand="SELECT [ps_no], [user_name], [email], [role] FROM [user_data]"></asp:SqlDataSource>
       </div> 
        
    
</asp:Content>
