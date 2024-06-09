<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Maintenance_System.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <!DOCTYPE html>

<html xmlns="http://www.w3.GridView with Popup Button</title>
    <style>
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .gridview-container {
            display: flex;
            flex-direction: column;
            border: 1px solid #ccc;
            border-radius: 5px;
            overflow: hidden;
        }

        .gridview-row {
            display: flex;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }

        .gridview-cell {
            flex: 1;
        }

        .popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 9999;
        }

        .popup-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        .close {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
            font-size: 20px;
            color: #888;
        }

        .popup-button {
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .popup-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" >
        
           <div class="gridview-container">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="ps_no" HeaderText="ps_no" SortExpression="ps_no" />
                <asp:BoundField DataField="extn" HeaderText="extn" SortExpression="extn" />
                <asp:BoundField DataField="emailid" HeaderText="emailid" SortExpression="emailid" />
                <asp:TemplateField HeaderText="Details">
                <ItemTemplate>
                    <asp:Button ID="Button2" runat="server" Text="Open Popup" CssClass="popup-button" OnClientClick='<%# "showPopup(" + Eval("Id") + "); return false;" %>' />
                </ItemTemplate>
        </asp:TemplateField>
            </Columns>
        </asp:GridView>
                 </div>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:maintanceConnectionString %>" SelectCommand="SELECT [Id], [ps_no], [extn], [emailid] FROM [service_request]"></asp:SqlDataSource>


        <div class="popup" id="popup">
            <div class="popup-content">
                <span class="close" onclick="closePopup()">&times;close" onclick="closePopup()">&times;</span>
                </div>
            
                <form id="userForm" action="#" method="post">
      <div class="form-group">

        <label for="psno">PSNO:">

        <label for="psno">PSNO:</label>
        <asp:TextBox ID="txtps" runat="server" CssClass="auto-style1" Height="38px" Width="835px"></asp:TextBox>
      </div>

      <div class="form-group">
        <label for="username">Username:</label>
        <asp:TextBox ID="txtext" runat="server" CssClass="auto-style1" Height="38px" Width="835px"></asp:TextBox>
      </div>

      <div class="form-group">
        <label for="email">Email:</label>
       <asp:TextBox ID="txtemail" runat="server" CssClass="auto-style1" Height="38px" Width="835px"></asp:TextBox>
      </div>

      <div class="form-group">
        <label for="password">Password:</label>
        <asp:TextBox ID="category" runat="server" CssClass="auto-style1" Height="38px" Width="835px"></asp:TextBox>
      </div>
      <div class="form-group">
        <label for="role">Role:</label>
        <asp:TextBox ID="subcategory" runat="server" CssClass="auto-style1" Height="38px" Width="835px"></asp:TextBox>
      </div>
    <div class="form-group">
        <label for="role">Role:</label>
        <asp:TextBox ID="servicerequest" runat="server" CssClass="auto-style1" Height="38px" Width="835px"></asp:TextBox>
      </div>
    <div class="form-group">
        <label for="role">Role:</label>
        <asp:TextBox ID="TextArea1" runat="server" CssClass="auto-style1" Height="38px" Width="835px"></asp:TextBox>
      </div>
       <div class="form-group">
        <label for="role">Role:</label>
        <asp:TextBox ID="location" runat="server" CssClass="auto-style1" Height="38px" Width="835px"></asp:TextBox>
      </div>
       <div class="form-group">
        <label for="role">Role:</label>
        <asp:TextBox ID="status" runat="server" CssClass="auto-style1" Height="38px" Width="835px"></asp:TextBox>
      </div>
      <div class="form-group">
              <asp:Button ID="Button1" CssClass="sbutton1" runat="server" Text="Clear"  />
               <asp:Button ID="submitBtn" CssClass="sbutton" runat="server" Text="Submit" OnClick="Button1_Click" />
      </div>
    </form>
            </div>
        </div>
    </form>
    <script>
        function showPopup() {
            document.getElementById('popup').style.display = 'block';
        }

        function closePopup() {
            document.getElementById('popup').style.display = 'none';
        }
    </script>
</body>
</html>
</asp:Content>
