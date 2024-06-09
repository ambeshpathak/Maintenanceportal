<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="userdash.aspx.cs" Inherits="Maintenance_System.userdash" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    <style type="text/css">
    .grid-container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); /* Responsive grid */
        gap: 18px;
        padding: 25px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin-left:20px;
        margin-right:20px;
        height:645px;
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
        flex: 0 1 calc(20% - 20px); /* Adjust this value to control the width of the cards */
        box-sizing: border-box;
        height: 140px;
        transition: transform 0.3s ease;
    }
       
        
        .auto-style2 {
            text-align: right;
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
                border-radius: 5px;
                height:600px;
            }
            
               .butt1 {
                height: 40px;
                width: 80px;
                background-color: white ; 
                color: black;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-left:20px;
                padding:10px;
            }

            .butt1:hover {
                background-color:rgb(2,77,135); 
                color:white;
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

     <div class="dashboard">
                          <div class="card">
                            <h3 class="auto-style2">
                                <asp:Label ID="Label1" runat="server" Text="0" CssClass="auto-style3" style="font-size: 26px"></asp:Label>
                              </h3>
                        </div>
                          
                        <div class="card">
                            <h3 class="auto-style2">
                                <asp:Label ID="Label4" runat="server" Text="0" CssClass="auto-style3" style="font-size: 26px"></asp:Label>
                            </h3>
                        </div>

                        <div class="card">
                            <h3 class="auto-style2">
                                <asp:Label ID="Label5" runat="server" Text="0" CssClass="auto-style3" style="font-size: 26px"></asp:Label>
                            </h3>
                        </div>
                        
                      <div class="card">
                        <h3 class="auto-style2">
                            <asp:Label ID="Label3" runat="server" Text="0" CssClass="auto-style3" style="font-size: 26px"></asp:Label>
                          </h3>
                      </div>
                      <div class="card">
                        <h3 class="auto-style2">
                            <asp:Label ID="Label2" runat="server" Text="0" CssClass="auto-style3" style="font-size: 26px"></asp:Label>
                          </h3>
                      </div>
      </div>
    <br />
                    <div class="b1">
                           <asp:LinkButton ID="btnSignIn" runat="server" CssClass="butt1" Onclick="Button1_Click" >
                           </asp:LinkButton>
  </div>

    <div class="container1">
      
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  OnRowDataBound="GridView1_RowDataBound" DataKeyNames="Id" CssClass="custom-grid"  OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  ViewStateMode="Enabled" AllowPaging="True" PagerSettings-Mode="NumericFirstLast" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="11">
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
        <asp:BoundField DataField="status" HeaderText="Status" SortExpression="location" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" >
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
