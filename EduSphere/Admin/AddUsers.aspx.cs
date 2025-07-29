using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EduSphere.Admin
{
    public partial class AddUsers : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUsers();
            }
        }

        private void BindUsers()
        {
            string query = "SELECT UserID, Username, Email, Role, FirstName, LastName FROM Users";
            DataTable dt = Database.ExecuteDataTable(query);
            UsersGridView.DataSource = dt;
            UsersGridView.DataBind();
        }

        protected void UsersGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userID = Convert.ToInt32(UsersGridView.DataKeys[e.RowIndex].Value);
            string query = "DELETE FROM Users WHERE UserID = @UserID";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@UserID", userID)
            };
            Database.ExecuteNonQuery(query, parameters);
            BindUsers();
        }

        protected void UsersGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int userID = Convert.ToInt32(UsersGridView.DataKeys[e.NewEditIndex].Value);
            Response.Redirect($"EditUser.aspx?UserID={userID}");
        }
    }
}