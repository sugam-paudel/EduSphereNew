<%@ Page Title="Manage Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddUsers.aspx.cs" Inherits="EduSphere.Admin.ManageUsers" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Manage Users</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="~/Admin/AddUser.aspx" Text="Add New User" CssClass="btn btn-primary" />
    </p>
    <asp:GridView ID="UsersGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" 
        OnRowDeleting="UsersGridView_RowDeleting" OnRowEditing="UsersGridView_RowEditing">
        <Columns>
            <asp:BoundField DataField="UserID" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="Username" HeaderText="Username" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="Role" HeaderText="Role" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>