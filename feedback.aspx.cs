using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Maintenance_System
{
    public partial class feedback : System.Web.UI.Page
    {
        private static int UserId;
        private static Guid guid;
        private int row_id;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["maintanceConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                guid = new Guid(Request.QueryString["Guid"]);
                row_id = int.Parse(Request.QueryString["row_id"]);

                if (guid != Guid.Empty)
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM feedback WHERE id = @id", conn))
                    {
                        cmd.Parameters.AddWithValue("@id", guid);
                        conn.Open();
                        using (SqlDataReader sqlRdr = cmd.ExecuteReader())
                        {
                            if (sqlRdr.Read())
                            {
                                UserId = sqlRdr.GetInt32(1);
                            }
                        }
                    }
                }
                else
                {
                    Response.Redirect("access_denied.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("access_denied.aspx");
            }
            finally
            {
                conn.Close();
            }
        }




        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBoxMultiLine.Text))
            {
                
                    try
                    {
                        conn.Open();

                    // Update service_request table with feedback
                    SqlCommand cmd1 = new SqlCommand("UPDATE service_request SET feedback = @feedback WHERE ps_no = @psno AND id = @id", conn);
                        
                            cmd1.Parameters.AddWithValue("@feedback", TextBoxMultiLine.Text);
                            cmd1.Parameters.AddWithValue("@id", row_id);
                            cmd1.Parameters.AddWithValue("@psno", UserId);
                            cmd1.ExecuteNonQuery();
                            SqlCommand cmd = new SqlCommand("DELETE FROM feedback WHERE id = @id", conn);
                            cmd.Parameters.AddWithValue("@id", guid);
                            cmd.ExecuteNonQuery();

                    Response.Write("<script>alert('Feedback Submited Successfully');</script>");
                    Response.Write("<script>window.location = 'login.aspx';</script>");
                }
                    catch (Exception ex)
                    {
                        // Handle the exception (e.g., log or display error message)
                        ClientScript.RegisterStartupScript(this.GetType(), "dbError", $"alert('An error occurred: {ex.Message}');", true);
                    }
               
            }
            else
            {
                // Display error message to the user
                ClientScript.RegisterStartupScript(this.GetType(), "inputError", "alert('Please input feedback.');", true);
            }
        }


        
    }
}
