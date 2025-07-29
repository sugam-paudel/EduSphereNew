<%@ Page Title="Manage Courses" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageCourses.aspx.cs" Inherits="EduSphere.Admin.ManageCourses" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Manage Courses</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="~/Admin/AddCourse.aspx" Text="Add New Course" CssClass="btn btn-primary" />
    </p>
    <asp:GridView ID="CoursesGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="CourseID"
        OnRowDeleting="CoursesGridView_RowDeleting" OnRowEditing="CoursesGridView_RowEditing">
        <Columns>
            <asp:BoundField DataField="CourseID" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="Title" HeaderText="Title" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:BoundField DataField="CreatedBy" HeaderText="Created By" />
            <asp:BoundField DataField="CreatedDate" HeaderText="Created Date" />
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>