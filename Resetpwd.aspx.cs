using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Maintenance_System
{
	public partial class Resetpwd : System.Web.UI.Page
	{
		private static int UserId;

		private static Guid guid;

		static string DBCS = ConfigurationManager.ConnectionStrings["maintanceConnectionString"].ConnectionString;

		protected void Page_Load(object sender, EventArgs e)

		{
            try
            {
				guid = new Guid(Request.QueryString["Guid"]);

				if (guid != null)

				{

					using (SqlConnection conn = new SqlConnection(DBCS))

					{

						using (SqlCommand cmd = new SqlCommand("select * from ForgotPass where id = @id", conn))

						{

							cmd.Parameters.AddWithValue("@id", guid);

							cmd.Connection = conn;

							cmd.Connection.Open();

							using (SqlDataReader sqlRdr = cmd.ExecuteReader())

							{

								if (sqlRdr.HasRows)

								{

									while (sqlRdr.Read())

									{

										UserId = sqlRdr.GetInt32(1);

									}

								}

								else
									sqlRdr.Close();


							}

						}

					}

				}
			}
			catch(Exception)
            {
				Response.Write("<script>alert(' Click on Link Again.');</script>");
			}



		}

		protected void btnResetPass_Click(object sender, EventArgs e)
		{

            try
            {
				if (TextBox1.Text == TextBox2.Text && guid != null && TextBox1.Text != "" && TextBox2.Text != "")

				{

					using (SqlConnection conn = new SqlConnection(DBCS))

					{


						using (SqlCommand cmd = new SqlCommand("update user_data set Password = @Password where ps_no = @ps_no", conn))

						{

							cmd.Parameters.AddWithValue("@Password", TextBox1.Text);

							cmd.Parameters.AddWithValue("@ps_no", UserId);

							cmd.Connection = conn;

							cmd.Connection.Open();

							cmd.ExecuteNonQuery();

							Response.Write("<script>alert('Password successfully updated.');</script>");
							TextBox1.Text = "";
							TextBox2.Text = "";


							SqlCommand cmd1 = new SqlCommand("delete from ForgotPass where id = @id", conn);

							cmd1.Parameters.AddWithValue("@id", guid);

							cmd1.Connection = conn;

							cmd1.ExecuteNonQuery();
							conn.Close();

							Response.Redirect("login.aspx");
						}

					}

				}

				else

				{
					Response.Write("<script>alert(' Input Password.');</script>");

				}
			}
			catch(Exception ex)
            {

            }

			

		}

		protected void Button2_Click(object sender, EventArgs e)
		{
			TextBox1.Text = "";
			TextBox2.Text = "";
		}
	}
}