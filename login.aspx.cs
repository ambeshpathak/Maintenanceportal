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


    public partial class login1 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["maintanceConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                String qry = "SELECT * FROM user_data WHERE ps_no = @ps_no AND password = @password AND role = 'Admin' ";
                String qry1 = "SELECT * FROM user_data WHERE ps_no = @ps_no AND password = @password AND role = 'User' ";
                String qry2 = "SELECT * FROM user_data WHERE ps_no = @ps_no AND password = @password AND role = 'Support' ";
                String qry3 = "SELECT * FROM user_data WHERE ps_no = @ps_no AND password = @password AND role = 'Support Admin' ";


                conn.Open();

                using (SqlCommand cmd = new SqlCommand(qry, conn))
                using (SqlCommand cmd1 = new SqlCommand(qry1, conn))
                using (SqlCommand cmd2 = new SqlCommand(qry2, conn))
                using (SqlCommand cmd3 = new SqlCommand(qry3, conn))
                {
                    cmd.Parameters.AddWithValue("@ps_no", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@password", TextBox2.Text);
                    cmd1.Parameters.AddWithValue("@ps_no", TextBox1.Text);
                    cmd1.Parameters.AddWithValue("@password", TextBox2.Text);
                    cmd2.Parameters.AddWithValue("@ps_no", TextBox1.Text);
                    cmd2.Parameters.AddWithValue("@password", TextBox2.Text);
                    cmd3.Parameters.AddWithValue("@ps_no", TextBox1.Text);
                    cmd3.Parameters.AddWithValue("@password", TextBox2.Text);

                    using (SqlDataReader rd = cmd.ExecuteReader())
                    {
                        if (rd.Read())
                        {
                            Session["username"] = TextBox1.Text;
                            Session["user_name"] = rd.GetValue(2).ToString();
                            Session["role"] = rd.GetValue(5).ToString();
                            Response.Redirect("admindash.aspx");
                            rd.Close();
                        }
                        else
                        {
                            Label1.Text = "Invalid Login";
                        }
                    }
                    using (SqlDataReader rd1 = cmd1.ExecuteReader())
                    {
                        if (rd1.Read())
                        {
                            Session["username"] = TextBox1.Text;
                            Session["user_name"] = rd1.GetValue(2).ToString();
                            Session["extn"] = rd1.GetValue(1).ToString();
                            Session["email"] = rd1.GetValue(3).ToString();
                            Response.Redirect("userdash.aspx");
                            rd1.Close();
                        }
                        else if (TextBox1.Text == "" && TextBox2.Text == "")
                        {
                            Label1.Text = "Invalid Login";

                        }
                        else
                        {
                            Label1.Text = "Invalid Login";
                        }
                    }

                    using (SqlDataReader rd2 = cmd2.ExecuteReader())
                    {
                        if (rd2.Read())
                        {
                            Session["username"] = TextBox1.Text;
                            Session["user_name"] = rd2.GetValue(2).ToString();
                            Session["role"] = rd2.GetValue(5).ToString();
                            Response.Redirect("SupportDash.aspx");
                            rd2.Close();
                        }
                        else
                        {
                            Label1.Text = "Invalid Login";
                        }
                    }

                    using (SqlDataReader rd3 = cmd3.ExecuteReader())
                    {
                        if (rd3.Read())
                        {
                            Session["username"] = TextBox1.Text;
                            Session["user_name"] = rd3.GetValue(2).ToString();
                            Session["role"] = rd3.GetValue(5).ToString();
                            Response.Redirect("SupportAdminDashboard.aspx");
                            rd3.Close();
                        }
                        else
                        {
                            Label1.Text = "Invalid Login";
                        }
                    }


                }
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
    }

   
}