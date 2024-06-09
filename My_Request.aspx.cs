using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Maintenance_System
{
    public partial class My_Request : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["maintanceConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Session["username"].ToString();
                show_data();
            }
            else
            {
                Response.Write("<script>alert('Please Login...')</script>");
                Response.Redirect("login.aspx");
            }

        }

        protected void show_data()
        {
            string ddd = Session["username"].ToString();

            conn.Open();     
            SqlDataAdapter sda = new SqlDataAdapter("select id,ps_no,category,sub_category,service_request,status from service_request where ps_no = '" + ddd + "'order by id DESC ", conn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            conn.Close();
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
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex >= 0)
            {
                GridViewRow selectedRow = GridView1.SelectedRow;
                string id = selectedRow.Cells[0].Text;


                // Store data in session
                Session["Select_ID"] = id;

                // Redirect to the other page
                Response.Redirect("View_Request2.aspx");
            }
        }

    }
 }