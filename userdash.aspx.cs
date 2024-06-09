using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Maintenance_System
{

    public partial class userdash : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["maintanceConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnSignIn.Text = "<i class='fas fa-plus'></i> &nbsp; Request";
            }

            if (Session["username"] != null)
            {
                Session["username"].ToString();
                CountUser();
                Show_data();
            }
            else
            {
                Session.Clear();
                Session.Abandon();
                Session.RemoveAll();
                Response.Write("<script>alert('Please Login...')</script>");
                Response.Redirect("login.aspx");
            }
            
        }

        protected void CountUser()
        {
            conn.Open();
            int currentMonth = DateTime.Now.Month;
            SqlCommand cmd5 = new SqlCommand("SELECT COUNT(*) FROM service_request WHERE ps_no = @Username AND MONTH(create_date) = @Month", conn);
            cmd5.Parameters.AddWithValue("@Username", Session["username"].ToString());
            cmd5.Parameters.AddWithValue("@Month", currentMonth);
            int rowCount5 = (int)cmd5.ExecuteScalar();
            Label1.Text = "Total Request</br></br>" + rowCount5.ToString();

            SqlCommand cmd3 = new SqlCommand("SELECT COUNT(*) FROM service_request WHERE status = 'Closed' AND ps_no = @Username AND MONTH(close_date) = @Month", conn);
            cmd3.Parameters.AddWithValue("@Username", Session["username"].ToString());
            cmd3.Parameters.AddWithValue("@Month", currentMonth);
            int rowCount3 = (int)cmd3.ExecuteScalar();
            Label5.Text = "Closed</br></br>" + rowCount3.ToString();

            SqlCommand cmd2 = new SqlCommand("SELECT COUNT(*) FROM service_request WHERE status = 'Request Created' AND ps_no = @Username AND MONTH(create_date) = @Month", conn);
            cmd2.Parameters.AddWithValue("@Username", Session["username"].ToString());
            cmd2.Parameters.AddWithValue("@Month", currentMonth);
            int rowCount2 = (int)cmd2.ExecuteScalar();
            Label4.Text = "Create</br></br>" + rowCount2.ToString();

            SqlCommand cmd4 = new SqlCommand("SELECT COUNT(*) FROM service_request WHERE status = 'In Progress' AND ps_no = @Username AND MONTH(progress_date) = @Month", conn);
            cmd4.Parameters.AddWithValue("@Username", Session["username"].ToString());
            cmd4.Parameters.AddWithValue("@Month", currentMonth);
            int rowCount4 = (int)cmd4.ExecuteScalar();
            Label3.Text = "Progress</br></br>" + rowCount4.ToString();

            SqlCommand cmd6 = new SqlCommand("SELECT COUNT(*) FROM service_request WHERE status NOT IN ('In Progress', 'Request Created', 'Closed') AND ps_no = @Username AND MONTH(create_date) = @Month", conn);
            cmd6.Parameters.AddWithValue("@Username", Session["username"].ToString());
            cmd6.Parameters.AddWithValue("@Month", currentMonth);
            int rowCount6 = (int)cmd6.ExecuteScalar();
            Label2.Text = "Assigned</br></br>" + rowCount6.ToString();

            conn.Close();
        }

        protected void Show_data()
        {
            string ddd = Session["username"].ToString();

            conn.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select id,ps_no,user_name,category,service_request,location,status from service_request where ps_no = '" + ddd + "' order by id DESC", conn);
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
                Session["Select_ID"] = id;

                // Redirect to the other page
                Response.Redirect("View_Request2.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("request_form.aspx");
        }
    }
    
}