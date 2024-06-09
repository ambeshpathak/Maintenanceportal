using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maintenance_System
{
    public partial class Edit_Data : System.Web.UI.Page
    {
        string IPaddressvalue = ConfigurationManager.AppSettings["IPaddressvalue"];
        
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
                TextBox14.Text = dr["create_date"].ToString();
                TextBox15.Text = dr["progress_date"].ToString();
                
            }
            dr.Close();
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



        protected void Button1_Click(object sender, EventArgs e)
        {
            string ddd = Session["SelectedID"].ToString();
            SqlCommand cmd1 = new SqlCommand("UPDATE service_request SET status = @Status WHERE id = @Id", conn);
            cmd1.Parameters.AddWithValue("@Status", DropDownList1.SelectedItem.Text);
            cmd1.Parameters.AddWithValue("@Id", ddd);
            int rowsAffected = cmd1.ExecuteNonQuery();

            if (DropDownList1.SelectedItem.Text == "In Progress")
            {
                SqlCommand cmd2 = new SqlCommand("UPDATE service_request SET progress_date = @ProgressDate WHERE id = @Id", conn);
                cmd2.Parameters.AddWithValue("@ProgressDate", DateTime.Now);
                cmd2.Parameters.AddWithValue("@Id", ddd);
                int rowsAffected2 = cmd2.ExecuteNonQuery();
            }
            else
            {
                SqlCommand cmd3 = new SqlCommand("UPDATE service_request SET close_date = @CloseDate WHERE id = @Id", conn);
                cmd3.Parameters.AddWithValue("@CloseDate", DateTime.Now);
                cmd3.Parameters.AddWithValue("@Id", ddd);
                int rowsAffected3 = cmd3.ExecuteNonQuery();
            }
            Feedback_Submit();
            conn.Close();
            Response.Write("<script>alert('Request Updated Successfully')</script>");
            Response.Write("<script>window.location = 'SupportDash.aspx';</script>");


        }

        protected void Feedback_Submit()

        {
            string userId = ""; // Initialize userId variable to store the retrieved value

            string ddd = Session["SelectedID"].ToString();

            // Use parameterized query to prevent SQL injection
            SqlCommand cmd = new SqlCommand("SELECT id, ps_no FROM service_request WHERE id = @SelectedID", conn);
            cmd.Parameters.AddWithValue("@SelectedID", ddd);

            // Execute the query and handle the results
            using (SqlDataReader drr = cmd.ExecuteReader())
            {
                // Check if there are rows returned from the query
                if (drr.Read())
                {
                    // Check if the "ps_no" column is not null before retrieving its value
                    if (!drr.IsDBNull(drr.GetOrdinal("ps_no")))
                    {
                        // Retrieve the value of "ps_no" from the data reader
                        userId = drr["ps_no"].ToString();
                    }
                    else
                    {
                        
                    }
                }
                else
                {
                   
                }
            }

            if (DropDownList1.SelectedItem.Text == "Closed")
                {
                
                SqlCommand cmd2 = new SqlCommand("SELECT user_name FROM user_data WHERE ps_no = @psNo", conn);
                cmd2.Parameters.AddWithValue("@psNo", userId);
                SqlDataReader dr = cmd2.ExecuteReader();
                string fullName = null;
                if (dr.Read())
                {
                    fullName = dr["user_name"] != DBNull.Value ? dr["user_name"].ToString() : string.Empty;
                }
                dr.Close();

                SqlCommand cmd3 = new SqlCommand("UPDATE service_request SET remark = @remark WHERE id = @Id", conn);
                cmd3.Parameters.AddWithValue("@remark", TextBox18.Text);
                cmd3.Parameters.AddWithValue("@Id", ddd);
                int rowsAffected3 = cmd3.ExecuteNonQuery();
                string emailId = TextBox8.Text;
                var guid = Guid.NewGuid();

                // Use the retrieved values as needed

                conn.Close();


                SqlCommand cmd1 = new SqlCommand("insert into feedback values(@Id, @ps_no, @RequestDateTime,@row_id)", conn);

                        cmd1.Parameters.AddWithValue("@id", guid);

                        cmd1.Parameters.AddWithValue("@ps_no", userId);

                        cmd1.Parameters.AddWithValue("@row_id", ddd);

                        cmd1.Parameters.AddWithValue("@RequestDateTime", DateTime.Now);
                        conn.Open();
                        cmd1.ExecuteNonQuery();

                    string emailSubject = "Maintenace Portal Request Closed Successfully ";

                    string emailBody = "Hi, " + fullName + "</h1>";



                    emailBody += "<h2>Request Details</h2>" +
                                 "<table style=\"width:70%; border-collapse: collapse;\">" +
                                 "<tr>" +
                                 "<th style=\"border: 1px solid black;\">Request Date:</th>" +
                                 "<td style=\"border: 1px solid black;\">" + DateTime.Now + "</td>" +
                                 "</tr>" +
                                 "<tr>" +
                                 "<th style=\"border: 1px solid black;\">Category:</th>" +
                                 "<td style=\"border: 1px solid black;\">" + TextBox9.Text + "</td>" +
                                 "</tr>" +
                                 "<tr>" +
                                 "<th style=\"border: 1px solid black;\">Sub-Category:</th>" +
                                 "<td style=\"border: 1px solid black;\">" + TextBox10.Text + "</td>" +
                                 "</tr>" +
                                 "<th style=\"border: 1px solid black;\">Service Request:</th>" +
                                 "<td style=\"border: 1px solid black;\">" + TextBox11.Text + "</td>" +
                                 "</tr>" +
                                 "<tr>" +
                                 "<th style=\"border: 1px solid black;\">Subject:</th>" +
                                 "<td style=\"border: 1px solid black;\">" + TextBox12.Text + "</td>" +
                                 "</tr>" +
                                 "<tr>" +
                                 "<th style=\"border: 1px solid black;\">Status:</th>" +
                                 "<td style=\"border: 1px solid black;\">" + DropDownList1.SelectedItem.Text + "</td>" +
                                 "</tr>" +
                                 "</table>" +
                                 "</br>";



                emailBody += "<a href='https://" + IPaddressvalue + "/feedback.aspx?Guid=" + guid.ToString() + "&Row_id=" + ddd.ToString() + "'>Click Here to Submit Your Feedback</a>";

                string msg = SendMail(emailSubject, emailBody, emailId);

                }

                else if(DropDownList1.SelectedItem.Text == "In Progress")
                {
                SqlCommand cmd2 = new SqlCommand("SELECT user_name FROM user_data WHERE ps_no = @psNo", conn);
                cmd2.Parameters.AddWithValue("@psNo", userId);
                SqlDataReader dr = cmd2.ExecuteReader();
                string fullName = null;
                if (dr.Read())
                {
                    fullName = dr["user_name"] != DBNull.Value ? dr["user_name"].ToString() : string.Empty;
                }
                dr.Close();

                    string emailId = TextBox8.Text;
                    string emailSubject = "Maintenace Portal Request In Progress Successfully ";

                    string emailBody = "Hi, " + fullName + "</h1>";



                    emailBody += "<h2>Request Details</h2>" +
                                 "<table style=\"width:70%; border-collapse: collapse;\">" +
                                 "<tr>" +
                                 "<th style=\"border: 1px solid black;\">Request Date:</th>" +
                                 "<td style=\"border: 1px solid black;\">" + DateTime.Now + "</td>" +
                                 "</tr>" +
                                 "<tr>" +
                                 "<th style=\"border: 1px solid black;\">Category:</th>" +
                                 "<td style=\"border: 1px solid black;\">" + TextBox9.Text + "</td>" +
                                 "</tr>" +
                                 "<tr>" +
                                 "<th style=\"border: 1px solid black;\">Sub-Category:</th>" +
                                 "<td style=\"border: 1px solid black;\">" + TextBox10.Text + "</td>" +
                                 "</tr>" +
                                 "<th style=\"border: 1px solid black;\">Service Request:</th>" +
                                 "<td style=\"border: 1px solid black;\">" + TextBox11.Text + "</td>" +
                                 "</tr>" +
                                 "<tr>" +
                                 "<th style=\"border: 1px solid black;\">Subject:</th>" +
                                 "<td style=\"border: 1px solid black;\">" + TextBox12.Text + "</td>" +
                                 "</tr>" +
                                 "<tr>" +
                                 "<th style=\"border: 1px solid black;\">Status:</th>" +
                                 "<td style=\"border: 1px solid black;\">" + DropDownList1.SelectedItem.Text + "</td>" +
                                 "</tr>" +
                                 "</table>" +
                                 "</br>";

                    emailBody += "<a href='https://" + IPaddressvalue + "/login.aspx'>Click Here to View Your Request Details</a>";

                    string msg = SendMail(emailSubject, emailBody, emailId);
                }
                else
                {
                    Response.Write("<script>alert('Mail Not Sent');</script>");

                }  
        }
        public static string SendMail(string emailSubject, string emailBody, string toEmail)
        {
            try

            {
                MailMessage PassRecMail = new MailMessage("lmtg.itsupport1@lntmhipower.com", toEmail);

                PassRecMail.Body = emailBody;

                PassRecMail.IsBodyHtml = true;

                PassRecMail.Subject = emailSubject;

                PassRecMail.Priority = MailPriority.High;

                SmtpClient SMTP = new SmtpClient("smtp.outlook.com", 587);

                SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;

                SMTP.UseDefaultCredentials = false;

                SMTP.UseDefaultCredentials = true;

                SMTP.Credentials = new NetworkCredential()

                {

                    UserName = "lmtg.itsupport1@lntmhipower.com",

                    Password = "Solution@123"

                };

                SMTP.EnableSsl = true;

                SMTP.Send(PassRecMail);

                return "Mail Send Successfully";

            }

            catch (Exception ex)

            {

                return "Some Error Occurred.";

            }
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("SupportDash.aspx");
        }
    }
}