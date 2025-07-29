using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EduSphere
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register.aspx";
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string username = UsernameTextBox.Text;
            string password = PasswordTextBox.Text; // In production, hash this

            User user = User.Login(username, password);
            if (user != null)
            {
                // Create session and forms authentication ticket
                Session["User"] = user;
                // Set authentication cookie
                System.Web.Security.FormsAuthentication.RedirectFromLoginPage(user.Username, RememberMeCheckBox.Checked);
            }
            else
            {
                FailureText.Text = "Invalid username or password.";
                ErrorMessage.Visible = true;
            }
        }
    }
}