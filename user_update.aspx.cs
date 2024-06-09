using System;

using System.Configuration;
using System.Data.SqlClient;



namespace Maintenance_System
{
    public partial class user_update : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["maintanceConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                // Set up the SQL command with parameters to prevent SQL injection
                SqlCommand cmd = new SqlCommand("UPDATE user_data SET role = '" + DropDownList1.SelectedItem.Text + "' ,  email =  '" + TextBox8.Text + "'  WHERE ps_no = '" + int.Parse(TextBox5.Text) + "' ", conn);
                // Execute the SQL command
                int rowsAffected = cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Data Successfully Updated ')</script>");

                conn.Close();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert(' Data Not Update ! ')</script>");

            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("select * from user_data where ps_no = '" + TextBox5.Text + "' ", conn);


                conn.Open();
                SqlDataReader r = cmd.ExecuteReader();
                if (r.HasRows)
                {
                    while (r.Read())
                    {
                        TextBox6.Text = r.GetValue(2).ToString();
                        TextBox7.Text = r.GetValue(3).ToString();
                        TextBox8.Text = r.GetValue(4).ToString();
                        DropDownList1.SelectedValue = r.GetValue(5).ToString();
                    }

                    conn.Close();

                }
                else if (TextBox5.Text == "")
                {
                    Response.Write("<script>alert(' Enter PSNO ')</script>");
                }
                else
                {
                    Response.Write("<script>alert(' PSNO Not Found ')</script>");

                }

            }
            catch (Exception ex)
            {


                Response.Write("<script>alert(' Enter valid PSNO ')</script>");

            }

        }
           
        

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            DropDownList1.SelectedValue = "";

        }
    }
}