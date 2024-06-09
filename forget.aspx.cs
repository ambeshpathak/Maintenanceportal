using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Net;

namespace Maintenance_System
{
    public partial class forget : System.Web.UI.Page
    {
		string IPaddressvalue = ConfigurationManager.AppSettings["IPaddressvalue"];

		protected void Page_Load(object sender, EventArgs e)
        {

        }
		static string DBCS = ConfigurationManager.ConnectionStrings["maintanceConnectionString"].ConnectionString;

		protected void btnForgotPass_Click(object sender, EventArgs e)

		{

			try
			{
				SqlConnection conn = new SqlConnection(DBCS);

				SqlCommand cmd = new SqlCommand("select * from user_data where email = @EmailAddress", conn);
				cmd.Parameters.AddWithValue("@EmailAddress", TextBox1.Text);
				conn.Open();
				SqlDataReader sqlRdr = cmd.ExecuteReader();

				if (sqlRdr.HasRows)

				{

					while (sqlRdr.Read())

					{

						int userId = sqlRdr.GetInt32(1);

						string fullName = sqlRdr.GetString(2);

						string emailId = sqlRdr.GetString(3);

						var guid = Guid.NewGuid();

						sqlRdr.Close();


						SqlCommand cmd1 = new SqlCommand("insert into ForgotPass values(@Id, @ps_no, @RequestDateTime)", conn);

						{

							cmd1.Parameters.AddWithValue("@id", guid);

							cmd1.Parameters.AddWithValue("@ps_no", userId);

							cmd1.Parameters.AddWithValue("@RequestDateTime", DateTime.Now);


							cmd1.ExecuteNonQuery();

							conn.Close();

							Response.Write("<script>alert('Sent Reset Link on Your Email-Id');</script>");
							TextBox1.Text = "";

							string emailSubject = "Maintenace Portal Password Reset Link ";

							string emailBody = "Hi, " + fullName + "</h1>";

							emailBody += "<a href='https://" + IPaddressvalue + "/Resetpwd.aspx?Guid=" + guid.ToString() + "'>Reset Password</a>";

							string msg = SendMail(emailSubject, emailBody, emailId);
						}
					}
				}
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

		protected void btnClear_Click(object sender, EventArgs e)
		{
			TextBox1.Text = "";
		}
	}
}