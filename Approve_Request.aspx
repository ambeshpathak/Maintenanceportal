<%@ Page Title="" Language="C#" MasterPageFile="~/Support.Master" AutoEventWireup="true" CodeBehind="Approve_Request.aspx.cs" Inherits="Maintenance_System.Approve_Request" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Approve Request</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <style>
         .grid-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* Adjust the number of columns as needed */
            gap: 20px; /* Adjust the gap between items */
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-left: 20px;
            margin-right: 20px;
            height: 660px;
        }

        .grid-item {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            color:black;
        }
        .maincont{
            background:#d5e3f7;

        }
        .container{

        }
    </style>
</head>
<body>    
   
        <br />
        <br />
        <div class="grid-container">
            
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="164px" Width="899px" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="Black" BorderStyle="None" BorderWidth="1px" CellPadding="3" PageSize="8" DataKeyNames="Id">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="ps_no" HeaderText="ps_no" SortExpression="ps_no" />
                <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                <asp:BoundField DataField="sub_category" HeaderText="sub_category" SortExpression="sub_category" />
                <asp:TemplateField HeaderText="Details">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Details" Width="72px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White"/>
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left"  />
            <RowStyle ForeColor="#000066" Font-Bold="true" HorizontalAlign="Center" Height="60px" CssClass="grid-item"  />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White"  />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:maintanceConnectionString %>" SelectCommand="SELECT [Id], [ps_no], [category], [sub_category] FROM [service_request]"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

     
    <div class="container1">
<div class="modal fade" id="mymodal" data-backdrop="false" role="dialog">
<div class=" modal-dialog modal-dailog-centered">
<div class="modal-content">
<div class="modal-header">
<h4 class="modal-title">View Request</h4>
<asp:Label ID="lblmsg" Text="" runat="server" />
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
<label>ID</label>
<asp:TextBox ID="txtid" ReadOnly="True" CssClass="form-control"  runat="server" />
<label>PSNO</label>
<asp:TextBox ID="txtps" ReadOnly="True" CssClass="form-control"  runat="server" />

<label>Extn No</label>
<asp:TextBox ID="txtext" ReadOnly="True" CssClass="form-control"  runat="server" />

<label>Email</label>
<asp:TextBox ID="txtemail" ReadOnly="True" CssClass="form-control"  runat="server" />
<label>Category</label>
<asp:TextBox ID="category" ReadOnly="True" CssClass="form-control"  runat="server" />
<label>Sub Category</label>
<asp:TextBox ID="subcategory" ReadOnly="True" CssClass="form-control"  runat="server" />
<label>Service Request</label>
<asp:TextBox ID="servicerequest" ReadOnly="True" CssClass="form-control"  runat="server" />
<label>Details</label>
<textarea id="TextArea1" TextMode="Multiline" ReadOnly="True" class="auto-style3" name="S1"  runat="server" rows="4"  ></textarea>
<label>Location</label>
<asp:TextBox ID="location" CssClass="form-control"  runat="server" />
<label>Attachments</label><br />
   
      <asp:Image ID="imgDisplay" runat="server" />

  
<br /><label>Status</label>
<asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>In Progress</asp:ListItem>
                <asp:ListItem>Close</asp:ListItem>
            </asp:DropDownList>

</div>
<div class="modal-footer">
<asp:Button ID="Submit2" class="btn btn-danger" runat="server" Text="Submit" Height="46px" OnClick="Button2_Click" Width="112px" />
<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>

</div>
</div>
</div>
</div>
</div>

   <!-- Bootstrap JS -->
    <script src="assets/js/bootstrap.min.js"></script>
</body>
</html>
</asp:Content>
