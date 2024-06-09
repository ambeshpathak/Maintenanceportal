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
    public partial class Users : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                Label1.Text = Session["user_name"].ToString();
            }
            else
            {
                Response.Write("<script>alert('Please Login...')</script>");
                Response.Redirect("login.aspx");
            }
        }

        
        protected void logout_all(object sender, EventArgs e)
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