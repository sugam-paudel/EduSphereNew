<%@ Page Title="Member Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EduSphere.Member.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Member Dashboard</h2>
    <div class="row">
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">My Enrolled Courses</h3>
                </div>
                <div class="panel-body">
                    <asp:GridView ID="EnrolledCoursesGridView" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="Course" />
                            <asp:BoundField DataField="EnrollmentDate" HeaderText="Enrolled On" />
                            <asp:HyperLinkField DataNavigateUrlFields="CourseID" 
                                DataNavigateUrlFormatString="CourseDetails.aspx?CourseID={0}" 
                                Text="View Details" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Available Courses</h3>
                </div>
                <div class="panel-body">
                    <asp:GridView ID="AvailableCoursesGridView" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="Course" />
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="EnrollButton" runat="server" Text="Enroll" 
                                        CommandArgument='<%# Eval("CourseID") %>' OnClick="EnrollButton_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Recent Discussions</h3>
                </div>
                <div class="panel-body">
                    <asp:GridView ID="DiscussionsGridView" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="Discussion" />
                            <asp:BoundField DataField="PostedDate" HeaderText="Date" />
                            <asp:HyperLinkField DataNavigateUrlFields="DiscussionID" 
                                DataNavigateUrlFormatString="Discussion.aspx?DiscussionID={0}" 
                                Text="View" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>