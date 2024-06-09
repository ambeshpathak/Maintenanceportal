<%@ Page Title="" Language="C#" MasterPageFile="~/SupportAdmin.Master" AutoEventWireup="true" CodeBehind="SupportAdminDashboard.aspx.cs" Inherits="Maintenance_System.SupportAdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
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
        height:650px;
    }

     .dashboard {
        flex: 1;
        padding: 20px;
        height:170px;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
       
    }

    .card {
        background-color: rgb(2,77,135);
        color:white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
        flex: 0 1 calc(35% - 20px); /* Adjust this value to control the width of the cards */
        box-sizing: border-box;
        height: 140px;
        transition: transform 0.3s ease;
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

            .custom-grid {
                    width: 100%;
                    border-collapse: collapse;
                    overflow-y: auto;
                    max-height: 100px;
                    text-align:center;
            }
            .container1 {
                background: white;
                margin: 20px;
                padding: 20px;
                border-radius: 5px;
                height:600px;
            }

            .grid-item {
                padding: 10px;
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
            text-align: right;
         }


</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="dashboard">
                          <div class="card">
                            <h3 class="auto-style1">
                                <asp:Label ID="Label1" runat="server" Text="0" CssClass="auto-style3" style="font-size: xx-large"></asp:Label>
                              </h3>
                        </div>
                          
                        
                </div>

    <div class="container1">
      
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  DataKeyNames="Id" CssClass="custom-grid" OnRowDataBound="GridView1_RowDataBound"  OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  ViewStateMode="Enabled" AllowPaging="True" PagerSettings-Mode="NumericFirstLast" OnPageIndexChanging="GridView1_PageIndexChanging">
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
        <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
<HeaderStyle CssClass="grid-header"></HeaderStyle>

<ItemStyle CssClass="grid-item"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
        <HeaderStyle CssClass="grid-header"></HeaderStyle>

        <ItemStyle CssClass="grid-item"></ItemStyle>
        </asp:BoundField>
           <asp:CommandField HeaderText="View" SelectText="View" ShowSelectButton="True" HeaderStyle-CssClass="grid-header"  ItemStyle-CssClass="grid-item" >
<HeaderStyle CssClass="grid-header"></HeaderStyle>

<ItemStyle CssClass="grid-item"></ItemStyle>
               </asp:CommandField>
    </Columns>
            <PagerSettings Mode="NumericFirstLast" />
               <PagerStyle CssClass="grid-pager" />
</asp:GridView>
          </div>
</asp:Content>
