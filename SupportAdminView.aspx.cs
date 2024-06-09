using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maintenance_System
{
    public partial class SupportAdminView : System.Web.UI.Page
    {
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

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;

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
                Session["SelectedID"] = id;

                // Redirect to the other page
                Response.Redirect("View_Request3.aspx");
            }
        }
    }
}