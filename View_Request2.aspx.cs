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
    public partial class View_Request2 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["maintanceConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Session["username"].ToString();
                view_data();
            }
            else
            {
                Response.Write("<script>alert('Please Login...')</script>");
                Response.Redirect("login.aspx");
            }
        }

        protected void view_data()
        {
            string ddd = Session["Select_ID"].ToString();

            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from service_request where id= '" + ddd + "' ", conn);
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = conn;
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                TextBox1.Text = dr["id"].ToString();
                TextBox9.Text = dr["category"].ToString();
                TextBox10.Text = dr["sub_category"].ToString();
                TextBox11.Text = dr["service_request"].ToString();
                TextBox12.Text = dr["detail"].ToString();
                TextBox13.Text = dr["location"].ToString();
                TextBox14.Text = dr["status"].ToString();
                TextBox15.Text = dr["remark"].ToString();
                TextBox2.Text = dr["feedback"].ToString();
            }
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("userdash.aspx");
        }
    }
}