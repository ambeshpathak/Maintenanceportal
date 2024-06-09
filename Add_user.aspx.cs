using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maintenance_System
{
    public partial class Add_user : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["maintanceConnectionString"].ConnectionString);
        string IPaddressvalue = ConfigurationManager.AppSettings["IPaddressvalue"];

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

        protected void txtPSNumber_TextChanged(object sender, EventArgs e)
        {
            string psNumber = TextBox1.Text;

            if (int.TryParse(psNumber, out int _))
            {
                bool userExists = CheckUserExists(psNumber);

                if (userExists)
                {
                    Response.Write("<script>alert('User Already Exists')</script>");
                    TextBox1.Text = "";
                    TextBox6.Text = "";
                    TextBox7.Text = "";
                    TextBox8.Text = "";
                    DropDownList1.Text = "";


                }
            }
            else
            {
                Response.Write("<script>alert('Please enter valid  PSNO')</script>");
            }
        }

        private bool CheckUserExists(string psNumber)
        {
            // Implement your database connection and query here
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM user_data WHERE ps_no = @ps_no";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ps_no", psNumber);
                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd1 = new SqlCommand("select * from user_data where email = @EmailAddress", conn);
                cmd1.Parameters.AddWithValue("@EmailAddress", TextBox7.Text);
                conn.Open();
                SqlDataReader checkmail = cmd1.ExecuteReader();
                if (checkmail.HasRows)
                {
                    // Close the DataReader before proceeding
                    checkmail.Close();
                    Response.Write("<script>alert('Email Already Exists');</script>");
                }
                else
                {
                    // Close the DataReader before proceeding
                    checkmail.Close();
                    string qry = "INSERT INTO user_data (ps_no, user_name, email, password, role) VALUES (@ps_no, @username, @email, @psd, @role)";
                    SqlCommand cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@ps_no", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@username", TextBox6.Text);
                    cmd.Parameters.AddWithValue("@email", TextBox7.Text);
                    cmd.Parameters.AddWithValue("@psd", TextBox8.Text);
                    cmd.Parameters.AddWithValue("@role", DropDownList1.SelectedItem.Text);
                    int rowsAffected = cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("<script>alert('User added successfully');</script>");
                    TextBox1.Text = "";
                    TextBox6.Text = "";
                    TextBox7.Text = "";
                    TextBox8.Text = "";
                    DropDownList1.Text = "";
                }
            }
            catch (Exception ex)
            {
                // Handle specific exceptions or log them for debugging
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
            finally
            {
                // Always close the connection after using it
                if (conn.State == ConnectionState.Open)
                    conn.Close();
            }

            try
            {

                string emailId = TextBox7.Text;
                string fullName = TextBox6.Text;

                

                string emailSubject = "Maintenace Portal Registration Successfull ";

                string emailBody = "Hi, " + fullName + "</h1>";

                emailBody += "<a href='https://" + IPaddressvalue + "/login.aspx'>Login Now</a>";

                string msg = SendMail(emailSubject, emailBody, emailId);


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Enter Valid Email-Id');</script>");
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
            TextBox1.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            DropDownList1.SelectedValue = "";
        }
    }
}