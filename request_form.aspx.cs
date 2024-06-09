using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Web.UI.WebControls;

namespace Maintenance_System
{
    public partial class request_form : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["maintanceConnectionString"].ConnectionString);
        string IPaddressvalue = ConfigurationManager.AppSettings["IPaddressvalue"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                

            }
            else
            {
                Response.Write("<script>alert('Please Login...')</script>");
                Response.Redirect("login.aspx");
            }
            if (!IsPostBack)
            {
                PopulateContinentsDropDownList();
            }
        }


        private void PopulateContinentsDropDownList()
        {
            ddlContinents.DataSource = GetData("get_service", null);
            ddlContinents.DataBind();

            ListItem liContinent = new ListItem("Select service", "-1");
            ddlContinents.Items.Insert(0, liContinent);

            ListItem liCountry = new ListItem("Select sub_service", "-1");
            ddlCountries.Items.Insert(0, liCountry);

            ddlCountries.Enabled = false;
        }

        private DataSet GetData(string SPName, SqlParameter SPParameter)
        {
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(SPName, conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (SPParameter != null)
            {
                da.SelectCommand.Parameters.Add(SPParameter);
            }
            DataSet DS = new DataSet();
            da.Fill(DS);
            return DS;
        }

        protected void ddlContinents_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlContinents.SelectedValue == "-1")
            {
                ddlCountries.SelectedIndex = 0;
                ddlCountries.Enabled = false;
            }
            else
            {
                ddlCountries.Enabled = true;

                SqlParameter parameter = new SqlParameter();
                parameter.ParameterName = "@service_Id";
                parameter.Value = ddlContinents.SelectedValue;

                ddlCountries.DataSource = GetData("get_sub_service", parameter);
                ddlCountries.DataBind();

                ListItem liCountry = new ListItem("Select service", "-1");
                ddlCountries.Items.Insert(0, liCountry);

            }
        }

        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlContinents.SelectedValue == "-1")
            {
                ddlCountries.SelectedIndex = 0;
                ddlCountries.Enabled = false;
            }
            else
            {
                ddlCountries.Enabled = true;

                ListItem liCountry = new ListItem("Select sub_service", "-1");
                ddlCountries.Items.Insert(0, liCountry);

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try{

                conn.Open();

                // Check if the uploaded file has a valid extension
                string extension = Path.GetExtension(FileUpload1.FileName).ToLower();

                if (ddlContinents.SelectedItem.Text == "Select service" && ddlCountries.SelectedItem.Text == "" && DropDownList1.SelectedItem.Text == "Select service")
                {
                    Response.Write("<script>alert('Enter Valid Details')</script>");

                }
                else
                {

                    string psno = Session["username"].ToString();
                    string username = Session["user_name"].ToString();
                    string email = Session["email"].ToString();
                    string qry = "INSERT INTO service_request (ps_no,user_name,emailid,category,sub_category,service_request,detail,attechment,location,status,create_date) VALUES (@ps_no,@user_name,@emailid,@category,@sub_category,@service_request,@detail,@attechment,@location,@status,@create_date)";
                    // Set up the SQL command with parameters to prevent SQL injection

                    string status = "Request Created";
                    SqlCommand cmd = new SqlCommand(qry, conn);
                    cmd.Parameters.AddWithValue("@ps_no", psno);
                    cmd.Parameters.AddWithValue("@user_name", username);
                    cmd.Parameters.AddWithValue("@extn", "");
                    cmd.Parameters.AddWithValue("@emailid", email);
                    cmd.Parameters.AddWithValue("@category", ddlContinents.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@sub_category", ddlCountries.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@service_request", TextBox5.Text);
                    cmd.Parameters.AddWithValue("@detail", TextBoxMultiLine.Text);

                    // Check if a file has been uploaded
                    if (FileUpload1.HasFile)
                    {
                        string fileName = Path.GetFileName(FileUpload1.FileName);
                        cmd.Parameters.AddWithValue("@attechment", fileName);

                        // Save the file to the server
                        FileUpload1.SaveAs(Server.MapPath("~/images/") + fileName);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@attechment", DBNull.Value);
                    }

                    cmd.Parameters.AddWithValue("@location", DropDownList1.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@create_date", DateTime.Now);

                    // Execute the SQL command
                    int rowsAffected = cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("<script>alert('Request Added Successfully')</script>");
                    Response.Write("<script>window.location = 'userdash.aspx';</script>");

                    try
                    {

                        string emailId = Session["email"].ToString();
                        string fullName = Session["user_name"].ToString();

                        
                        string emailSubject = "Maintenace Portal Request Created Successfully ";

                        string emailBody = "Hi, " + fullName + "</h1>";



                        emailBody += "<h2>Request Details</h2>" +
                                     "<table style=\"width:70%; border-collapse: collapse;\">" +
                                     "<tr>" +
                                     "<th style=\"border: 1px solid black;\">Request Date:</th>" +
                                     "<td style=\"border: 1px solid black;\">" + DateTime.Now + "</td>" +
                                     "</tr>" +
                                     "<tr>" +
                                     "<th style=\"border: 1px solid black;\">Category:</th>" +
                                     "<td style=\"border: 1px solid black;\">" + ddlContinents.SelectedItem.Text + "</td>" +
                                     "</tr>" +
                                     "<tr>" +
                                     "<th style=\"border: 1px solid black;\">Sub-Category:</th>" +
                                     "<td style=\"border: 1px solid black;\">" + ddlCountries.SelectedItem.Text + "</td>" +
                                     "</tr>" +
                                     "<th style=\"border: 1px solid black;\">Service Request:</th>" +
                                     "<td style=\"border: 1px solid black;\">" + TextBox5.Text + "</td>" +
                                     "</tr>" +
                                     "<tr>" +
                                     "<th style=\"border: 1px solid black;\">Subject:</th>" +
                                     "<td style=\"border: 1px solid black;\">" + TextBoxMultiLine.Text + "</td>" +
                                     "</tr>" +
                                     "<tr>" +
                                     "<th style=\"border: 1px solid black;\">Status:</th>" +
                                     "<td style=\"border: 1px solid black;\">" + status.ToString() + "</td>" +
                                     "</tr>" +
                                     "</table>" +
                                     "</br>";


                        emailBody += "<a href='https://"+ IPaddressvalue + "/login.aspx'>Click Here to View Your Request Details</a>";

                        string msg = SendMail(emailSubject, emailBody, emailId);


                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Enter Valid Email-Id');</script>");
                    }
                }

                ddlCountries.SelectedItem.Text = "";
                ddlContinents.SelectedItem.Text = "";
                TextBox5.Text = "";
                TextBoxMultiLine.Text = "";
                





            }

            catch (Exception ex)
            {

                Response.Write("<script>alert('Enter Details ')</script>");

            }
            finally
            {
                conn.Close();
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            ddlContinents.SelectedItem.Text = "";
            ddlCountries.SelectedItem.Text = "";
            TextBox5.Text = "";
            TextBoxMultiLine.Text = "";
            
        }
    }
}