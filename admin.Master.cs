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
    public partial class admin : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                if (!IsUserAdmin())
                {
                    
                    Response.Redirect("access_denied.aspx");
                }
                else
                {
                    label2.Text = Session["user_name"].ToString();
                    Session["username"].ToString();
                }
            }
            else
            {
                Response.Write("<script>alert('Please Login...')</script>");
                Response.Redirect("login.aspx");
            }

        }
        private bool IsUserAdmin()
        {
            // Check if user role is admin
            if (Session["role"] != null)
            {
                string role = Session["role"].ToString();

                if (role == "Admin")
                {
                    return role.Equals("Admin", StringComparison.OrdinalIgnoreCase);
                }
                return false;
            }
            return false;

        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
           
                if (Session["username"] != null)
                {
                    Response.Buffer = true;
                    Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
                    Response.Expires = -1500;
                    Response.CacheControl = "no-cache";
                    Response.Cache.SetNoStore();
                    Session.Clear();
                    Session.Abandon();
                    Session.RemoveAll();
                    Response.Redirect("login.aspx");

                }
                else
                {
                    Response.Buffer = true;
                    Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
                    Response.Expires = -1500;
                    Response.CacheControl = "no-cache";
                    Response.Cache.SetNoStore();
                    Session.Clear();
                    Session.Abandon();
                    Session.RemoveAll();
                    Response.Write("<script>alert('Your Session is Expire Please Login...')</script>");
                    Response.Redirect("login.aspx");
                }
        }
    }
}