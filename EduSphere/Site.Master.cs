using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EduSphere
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any page load logic can go here
        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            // Clear session on logout
            Session.Clear();
            Session.Abandon();
        }
    }
}