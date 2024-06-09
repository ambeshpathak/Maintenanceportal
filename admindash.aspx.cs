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
    public partial class admindash : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["maintanceConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Session["username"].ToString();
                CountUser();
            }
            else
            {
                Response.Write("<script>alert('Please Login...')</script>");
                Response.Redirect("login.aspx");
            }

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;

        }
        protected void CountUser()
        {
            conn.Open();
            SqlCommand cmd2 = new SqlCommand("SELECT COUNT(*) FROM service_request where status = 'Request Created' ", conn);
            int rowCount2 = (int)cmd2.ExecuteScalar();
            Label3.Text = "  </br>" + rowCount2.ToString();

            SqlCommand cmd3 = new SqlCommand("SELECT COUNT(*) FROM service_request where status = 'Closed' ", conn);
            int rowCount3 = (int)cmd3.ExecuteScalar();
            Label2.Text = " </br>" + rowCount3.ToString();

            SqlCommand cmd4 = new SqlCommand("SELECT COUNT(*) FROM service_request where status = 'In Progress' ", conn);
            int rowCount4 = (int)cmd4.ExecuteScalar();
            Label5.Text = " In Progress </br></br>" + rowCount4.ToString();

            SqlCommand cmd5 = new SqlCommand("SELECT COUNT(*) FROM service_request ", conn);
            int rowCount5 = (int)cmd5.ExecuteScalar();
            Label1.Text = " Total </br></br>" + rowCount5.ToString();
        }
    }
}