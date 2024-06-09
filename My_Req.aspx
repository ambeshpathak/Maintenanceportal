<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="My_Req.aspx.cs" Inherits="Maintenance_System.My_Req" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!DOCTYPE html>

<html>
<head>
<style>
  /*  .mydatagrid
{
width: 80%;
border: solid 2px black;
min-width: 80%;
}
.header
{
background-color: #000;
font-family: Arial;
color: White;
height: 25px;
text-align: center;
font-size: 16px;
}

.rows
{
background-color: #fff;
font-family: Arial;
font-size: 14px;
color: #000;
min-height: 25px;
text-align: left;
}
.rows:hover
{
background-color: #5badff;
color: #fff;
}
*/
/*.mydatagrid a*/ /** FOR THE PAGING ICONS **/
/*{
background-color: Transparent;
padding: 5px 5px 5px 5px;
color: #fff;
text-decoration: none;
font-weight: bold;
}*/

/*.mydatagrid a:hover*/ /** FOR THE PAGING ICONS HOVER STYLES**/
/*{
background-color: #000;
color: #fff;
}
.mydatagrid span*/ /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/
/*{
background-color: #fff;
color: #000;
padding: 5px 5px 5px 5px;
}
.pager
{
background-color: #5badff;
font-family: Arial;
color: White;
height: 30px;
text-align: left;
}

.mydatagrid td
{
padding: 5px;
}
.mydatagrid th
{
padding: 5px;
}

.btn
{
    color: black;
}*/


</style>
  
</head>
  <body>    
    
    <p>
        <br />
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="Details">
                    <ItemTemplate>
                        <asp:Button ID="Button1"  runat="server" Height="28px" OnClick="Button1_Click1" Text="Details" Width="94px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:maintanceConnectionString %>" SelectCommand="SELECT [ps_no], [category], [sub_category], [service_request] FROM [service_request]"></asp:SqlDataSource>
        
        
    </p>
    <p>
        
      </p>

    <div class="container">
<div class="modal fade" id="mymodal" data-backdrop="false" role="dialog">
<div class=" modal-dialog modal-dailog-centered">
<div class="modal-content">
<div class="modal-header">
<h4 class="modal-title">View Request</h4>
<asp:Label ID="lblmsg" Text="" runat="server" />
<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
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
<textarea id="TextArea1" TextMode="Multiline" ReadOnly="True" class="auto-style3" name="S1"  runat="server" style="width:567px;height:34px"></textarea>
<label>Location</label>
<asp:TextBox ID="location" CssClass="form-control"  runat="server" />
<label>Attachments</label><br />
   
      <asp:Image ID="imgDisplay" runat="server" />

  
<br /><label>Status</label>
<asp:TextBox ID="status" ReadOnly="True" CssClass="form-control"  runat="server" />


</div>
<div class="modal-footer">
<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>

</div>
</div>
</div>
</div>
</div>
    </body>  

</html>
</asp:Content>
