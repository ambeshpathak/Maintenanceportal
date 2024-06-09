using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Maintenance_System
{
    public partial class Report_User : System.Web.UI.Page
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

        protected void show_data()
        {
            string username = Session["username"].ToString();
            DateTime fromDate = Calendar1.SelectedDate;
            DateTime toDate = Calendar2.SelectedDate;

            // Make sure the connection is disposed properly, preferably with a using statement
           
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT id, ps_no, category, sub_category, service_request, status FROM service_request WHERE ps_no = @Username AND create_date >= @FromDate AND create_date <= @ToDate ORDER BY id DESC", conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@FromDate", fromDate);
                cmd.Parameters.AddWithValue("@ToDate", toDate);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow());
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    int totalColumns = GridView1.Rows[0].Cells.Count;
                    GridView1.Rows[0].Cells.Clear();
                    GridView1.Rows[0].Cells.Add(new TableCell());
                    GridView1.Rows[0].Cells[0].ColumnSpan = totalColumns;
                    GridView1.Rows[0].Cells[0].Text = "No Data Available";
                }
            
        }


        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            show_data();
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Specify the maximum length for the column
                int maxLength = 30; // Change this value according to your requirement

                // Loop through each cell in the row
                foreach (TableCell cell in e.Row.Cells)
                {
                    // Check if the cell contains text
                    if (!string.IsNullOrEmpty(cell.Text) && cell.Text.Length > maxLength)
                    {
                        // Truncate the text and add ellipses
                        cell.Text = cell.Text.Substring(0, maxLength) + "...";
                        // Add title attribute to display full text on hover
                        cell.Attributes.Add("title", cell.Text);
                    }
                }
            }
        }
       

        protected void Button1_Click(object sender, EventArgs e)
        {
            show_data();
        }
    }
}