using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EduSphere.Admin
{
    public partial class ManageCourses : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCourses();
            }
        }

        private void BindCourses()
        {
            string query = "SELECT CourseID, Title, Description, CreatedBy, CreatedDate FROM Courses";
            DataTable dt = Database.ExecuteDataTable(query);
            CoursesGridView.DataSource = dt;
            CoursesGridView.DataBind();
        }

        protected void CoursesGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int courseID = Convert.ToInt32(CoursesGridView.DataKeys[e.RowIndex].Value);
            string query = "DELETE FROM Courses WHERE CourseID = @CourseID";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@CourseID", courseID)
            };
            Database.ExecuteNonQuery(query, parameters);
            BindCourses();
        }

        protected void CoursesGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int courseID = Convert.ToInt32(CoursesGridView.DataKeys[e.NewEditIndex].Value);
            Response.Redirect($"EditCourse.aspx?CourseID={courseID}");
        }
    }
}