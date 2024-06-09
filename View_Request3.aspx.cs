using System;

using System.Configuration;
using System.Data.SqlClient;

namespace Maintenance_System
{
    public partial class View_Request3 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["maintanceConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Session["username"].ToString();
                DateCalculate();
                view_data();
            }
            else
            {
                Response.Write("<script>alert('Please Login...')</script>");
                Response.Redirect("login.aspx");
            }
        }

        protected void DateCalculate()
        {
            string ddd = Session["SelectedID"].ToString();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["maintanceConnectionString"].ConnectionString))
            {
                conn.Open();

                SqlCommand cmd7 = new SqlCommand("select close_date from service_request where id = @Id", conn);
                SqlCommand cmd6 = new SqlCommand("select create_date from service_request where id = @Id", conn);
                SqlCommand cmd5 = new SqlCommand("select status from service_request where id = @Id", conn);

                cmd5.Parameters.AddWithValue("@Id", ddd);
                cmd6.Parameters.AddWithValue("@Id", ddd);
                cmd7.Parameters.AddWithValue("@Id", ddd);
                
                DateTime create_date, close_date;

                using (SqlDataReader dr = cmd5.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        string status = dr["status"].ToString();
                        
                        dr.Close(); // Close the DataReader before executing other commands

                        create_date = (DateTime)cmd6.ExecuteScalar();
                        

                        if (status != "Closed")
                        {
                            TimeSpan crr = DateTime.Now - create_date;          
                            TextBox16.Text = $"{(int)crr.TotalHours:D2}:{crr.Minutes:D2}";
                            TextBox17.Text = crr.Days.ToString();
                        }
                        else if (status != "In Progress")
                        {
                            TimeSpan prr = DateTime.Now - create_date;
                            TextBox16.Text = $"{(int)prr.TotalHours:D2}:{prr.Minutes:D2}";
                            TextBox17.Text = prr.Days.ToString();
                        }
                        else if (status != "Request Created")
                        {
                            close_date = (DateTime)cmd7.ExecuteScalar();
                            TimeSpan prr = DateTime.Now - create_date;
                            TextBox16.Text = $"{(int)prr.TotalHours:D2}:{prr.Minutes:D2}";
                            TextBox17.Text = prr.Days.ToString();
                        }
                        else
                        {
                            close_date = (DateTime)cmd7.ExecuteScalar();
                            TimeSpan ddr = close_date - create_date;
                            TextBox16.Text = $"{(int)ddr.TotalHours:D2}:{ddr.Minutes:D2}";
                            TextBox17.Text = ddr.Days.ToString();

                        }
                    }
                }
            }
        }

        protected void view_data()
        {
            string ddd = Session["SelectedID"].ToString();

            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from service_request where id= '" + ddd + "' ", conn);
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = conn;
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                TextBox6.Text = dr["id"].ToString();
                TextBox7.Text = dr["extn"].ToString();
                TextBox8.Text = dr["emailid"].ToString();
                TextBox9.Text = dr["category"].ToString();
                TextBox10.Text = dr["sub_category"].ToString();
                TextBox11.Text = dr["service_request"].ToString();
                TextBox12.Text = dr["detail"].ToString();
                TextBox13.Text = dr["location"].ToString();
                TextBox14.Text = dr["status"].ToString();
                TextBox1.Text = dr["feedback"].ToString();
                TextBox3.Text = dr["remark"].ToString();
                TextBox2.Text = dr["create_date"].ToString();
                TextBox15.Text = dr["close_date"].ToString();
            }
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("SupportAdminView.aspx");
        }
    }
}