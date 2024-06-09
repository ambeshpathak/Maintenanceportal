using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maintenance_System
{
    public partial class Approve_Request : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["maintanceConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Session["username"].ToString();
            }
            else
            {
                Response.Write("<script>alert('Please Login...')</script>");
                Response.Redirect("login.aspx");
            }
        }
   

        
        protected void Button1_Click1(object sender, EventArgs e)
        {
            string script = "$('#mymodal').modal('show');";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", script, true);
            int rowid = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            string ddd = GridView1.Rows[rowid].Cells[0].Text;

            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from service_request where id= '" + ddd + "' ", conn);
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = conn;
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtid.Text = dr["id"].ToString();
                txtps.Text = dr["ps_no"].ToString();
                txtext.Text = dr["extn"].ToString();
                txtemail.Text = dr["emailid"].ToString();
                category.Text = dr["category"].ToString();
                subcategory.Text = dr["sub_category"].ToString();
                servicerequest.Text = dr["service_request"].ToString();
                TextArea1.Value = dr["detail"].ToString();
                location.Text = dr["location"].ToString();

            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            conn.Open();
            
            
            SqlCommand cmd1 = new SqlCommand("UPDATE service_request SET status = '" + DropDownList1.SelectedItem.Text + "'  WHERE id = '" + int.Parse(txtid.Text) + "'; ", conn);
            int rowsAffected = cmd1.ExecuteNonQuery();
            Response.Write("<script>alert('Request Updated Successfully')</script>");
        }

    }
}