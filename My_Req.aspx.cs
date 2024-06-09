using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maintenance_System
{
    public partial class My_Req : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["maintanceConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Session["username"].ToString();
            }

            gridviewbind();
        }
 
        protected void gridviewbind()
        {
            SqlCommand cmd = new SqlCommand("select * from service_request where ps_no = '"+ Session["username"].ToString() +"' ", conn);
          
                SqlDataAdapter dt = new SqlDataAdapter();    
                    
                    conn.Open();
                    dt.SelectCommand = cmd;

                    DataTable dTable = new DataTable();
                    dt.Fill(dTable);

                    GridView1.DataSource = dTable;
                    GridView1.DataBind();           
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            
            

            /*byte[] imageData = (byte[])cmd1.ExecuteScalar();

            if (imageData != null)
            {
                string base64String = Convert.ToBase64String(imageData);
                imgDisplay.ImageUrl = "data:image/png;base64," + base64String;
            }
            else
            {
                
                imgDisplay.ImageUrl = "~/images/download.jpg";
            }*/
            
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string script = "$('#mymodal').modal('show');";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", script, true);


            int rowid = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            string ddd = GridView1.Rows[rowid].Cells[0].Text;


            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from service_request where id = '"+ ddd + "' ", conn);
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = conn;
            SqlDataReader dr = cmd.ExecuteReader();


            while (dr.Read())
            {
               
                txtps.Text = dr["ps_no"].ToString();
                txtext.Text = dr["extn"].ToString();
                txtemail.Text = dr["emailid"].ToString();
                category.Text = dr["category"].ToString();
                subcategory.Text = dr["sub_category"].ToString();
                servicerequest.Text = dr["service_request"].ToString();
                TextArea1.Value = dr["detail"].ToString();
                location.Text = dr["location"].ToString();
                status.Text = dr["status"].ToString();

            }

            dr.Close();


            SqlCommand cmd1 = new SqlCommand("select attechment from service_request where ps_no = '" + txtps.Text + "' ", conn);
            cmd1.CommandType = System.Data.CommandType.Text;
            cmd1.Connection = conn;
            SqlDataReader dr1 = cmd1.ExecuteReader();
            conn.Close();
        }
    }
}