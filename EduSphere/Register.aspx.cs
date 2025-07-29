using System;
using System.Web.UI;

namespace EduSphere
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if (PasswordTextBox.Text != ConfirmPasswordTextBox.Text)
            {
                ErrorMessage.Text = "Passwords do not match.";
                return;
            }

            User newUser = new User
            {
                Username = UsernameTextBox.Text,
                Password = PasswordTextBox.Text, // In production, hash this
                Email = EmailTextBox.Text,
                Role = "Member", // Default role is Member
                FirstName = FirstNameTextBox.Text,
                LastName = LastNameTextBox.Text
            };

            if (User.Register(newUser))
            {
                // Registration successful, redirect to login
                Response.Redirect("Login.aspx");
            }
            else
            {
                ErrorMessage.Text = "Registration failed. Username or email may already exist.";
            }
        }
    }
}