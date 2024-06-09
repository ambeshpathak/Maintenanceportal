using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maintenance_System
{
    public partial class SupportDash : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["maintanceConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Session["username"].ToString();
                CountUser();
                Show_data();
            }
            else
            {
                Response.Write("<script>alert('Please Login...')</script>");
                Response.Redirect("login.aspx");
            }
            
        }
       
        protected void CountUser()
        {
            conn.Open();
            int currentMonth = DateTime.Now.Month;
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM service_request where status = 'Closed' and assignto = '" + Session["user_name"].ToString() + "' AND MONTH(create_date) = @Month ", conn);
            cmd.Parameters.AddWithValue("@Month", currentMonth);
            int rowCount = (int)cmd.ExecuteScalar();
            Label4.Text = " Closed </br></br>" + rowCount.ToString();
                                        
            SqlCommand cmd5 = new SqlCommand("SELECT COUNT(*) FROM service_request WHERE assignto = @Username AND MONTH(create_date) = @Month", conn);
            cmd5.Parameters.AddWithValue("@Username", Session["user_name"].ToString());
            cmd5.Parameters.AddWithValue("@Month", currentMonth);
            int rowCount5 = (int)cmd5.ExecuteScalar();
            Label1.Text = "Monthly Total</br>" + rowCount5.ToString();

            SqlCommand cmd6 = new SqlCommand("SELECT COUNT(*) FROM service_request where status = 'Assigned to " + Session["user_name"].ToString() + "' and assignto = '" + Session["user_name"].ToString() + "' AND MONTH(assign_date) = @Month", conn);
            cmd6.Parameters.AddWithValue("@Month", currentMonth);
            int rowCount6 = (int)cmd6.ExecuteScalar();
            Label3.Text = " Assigned </br></br>" + rowCount6.ToString();

            SqlCommand cmd2 = new SqlCommand("SELECT COUNT(*) FROM service_request where status = 'In Progress' and assignto = @Username AND MONTH(progress_date) = @Month ", conn);
            cmd2.Parameters.AddWithValue("@Username", Session["user_name"].ToString());
            cmd2.Parameters.AddWithValue("@Month", currentMonth);
            int rowCount2 = (int)cmd2.ExecuteScalar();
            Label2.Text = " In Progress </br></br>" + rowCount2.ToString();

            conn.Close();
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
        protected void Show_data()
        {
            try
            {
                conn.Open();
                string query = "SELECT id, ps_no, user_name, category,service_request, location, status, assignto FROM service_request WHERE assignto = @UserName AND status IN('In Progress', 'Request Created', 'Assigned to "+Session["user_name"].ToString()+"')order by id DESC ; ";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserName", Session["user_name"].ToString());
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else
                {
                    dt.Rows.Add(dt.NewRow()); // Add an empty row to DataTable
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    int totalColumns = GridView1.Rows[0].Cells.Count;
                    GridView1.Rows[0].Cells.Clear(); // Clear all the cells in the row
                    GridView1.Rows[0].Cells.Add(new TableCell()); // Add a new cell
                    GridView1.Rows[0].Cells[0].ColumnSpan = totalColumns; // Set the column span to the total number of columns in the GridView
                    GridView1.Rows[0].Cells[0].Text = "No Data Available"; // Set the text for the cell
                }
            }
            catch (Exception ex)
            {
                // Handle the exception (e.g., log it, display an error message)
                Response.Write("An error occurred while retrieving data: " + ex.Message);
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Show_data();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex >= 0)
            {
                GridViewRow selectedRow = GridView1.SelectedRow;
                string id = selectedRow.Cells[0].Text;


                // Store data in session
                Session["SelectedID"] = id;

                // Redirect to the other page
                Response.Redirect("Edit_Data.aspx");
            }
        }

        
    }
}