using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

using System.Web.UI.WebControls;

namespace Maintenance_System
{
    public partial class addcategory : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["maintanceConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateContinentsDropDownList();
                get_location();

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

            ListItem liLocation = new ListItem("Select Location", "-1");
            DropDownList1.Items.Insert(0, liLocation);

            ddlCountries.Enabled = false;

            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
        }

        private DataSet GetData(string SPName, SqlParameter SPParameter)
        {
        
             
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

        
        protected void addcate()
        {
            try
            {
                if (ddlContinents.Text == "Select service")
                {
                    string qry = "INSERT INTO Service_tbl (servicename) values(@ps_no)";
                    // Set up the SQL command with parameters to prevent SQL injection

                    conn.Open();
                    SqlCommand cmd = new SqlCommand(qry, conn);

                    cmd.Parameters.AddWithValue("@ps_no", TextBox1.Text);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
                else
                {
                    Response.Write("<script>alert('Select Service Name')</script>");
                }
            }
            catch (Exception ex)
            {
             

            }

        }
        
        
        protected void Submit_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != "") 
            {
                addcate();
                PopulateContinentsDropDownList();
                Response.Write("<script>alert('Category Added Successfully')</script>");
            }
            else
            {
                Response.Write("<script>alert('Enter Service Name')</script>");
            }

        }

        protected void addsubcate()
        {
            try
            {
                if(ddlCountries.Text != "Select sub_service")
                {
                    string qry = "INSERT INTO Sub_Service (sub_service_name,fk_service_id) values(@subcat,@catid)";
                    // Set up the SQL command with parameters to prevent SQL injection

                    SqlCommand cmd = new SqlCommand(qry, conn);

                    cmd.Parameters.AddWithValue("@subcat", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@catid", ddlContinents.SelectedValue);
                    conn.Open();

                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
                else
                {
                    Response.Write("<script>alert('Select Sub-Service Name')</script>");

                }

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Enter Sub-Service Name')</script>");
            }

        }

        protected void Submit_Click1(object sender, EventArgs e)
        {
            if (TextBox2.Text == "")
            {
                Response.Write("<script>alert('Enter Sub-Service Name')</script>");

            }
            else
            {
                addsubcate();
                PopulateContinentsDropDownList();
                Response.Write("<script>alert('SubCategory Added Successfully')</script>");
            }

        }

        protected void get_location()
        {
            string com = "Select * from service_loc";
            SqlDataAdapter adpt = new SqlDataAdapter(com, conn);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = "location_name";
            DropDownList1.DataValueField = "ID";
            DropDownList1.DataBind();
        }
        protected void addlocation()
        {
            
            try
            {
                if (DropDownList1.Text != "Select Location")
                {
                    string qry = "INSERT INTO service_loc (location_name) values(@location)";
                    // Set up the SQL command with parameters to prevent SQL injection

                    SqlCommand cmd = new SqlCommand(qry, conn);

                    cmd.Parameters.AddWithValue("@location", TextBox3.Text);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
                else
                {
                    Response.Write("<script>alert('Select Location ')</script>");

                }

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Enter Location Name ')</script>");

            }

        }

        protected void Submit_Click2(object sender, EventArgs e)
        {
            if (TextBox3.Text != "")
            {
                addlocation();
            PopulateContinentsDropDownList();
            Response.Write("<script>alert('Location Added Successfully')</script>");
            get_location();
            }
            else
            {
                Response.Write("<script>alert('Enter Location Name')</script>");
            }
        }
    }
}