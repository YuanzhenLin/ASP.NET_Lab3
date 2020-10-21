<%@ Page Title="" Language="C#" MasterPageFile="~/ACMasterPage.master" AutoEventWireup="true" CodeBehind="AddCourse.aspx.cs" Inherits="Lab_3.AddCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="App_Themes/SiteStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 class="text-center p-3">Add New Course</h1>

    <div  class="form-group row">
        <asp:Label ID="Label1" runat="server" Text="Course Number: "></asp:Label>
        <asp:TextBox ID="txtCourseNumber" runat="server" class="form-control col-2"></asp:TextBox>   
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ErrorMessage="Required!" ControlToValidate="txtCourseNumber" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div  class="form-group row">
        <asp:Label ID="Label2" runat="server" Text="Course Name: " class="col-2"></asp:Label>
        <asp:TextBox ID="txtCourseName" runat="server" class="form-control col-8"></asp:TextBox>      
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ErrorMessage="Required!" ControlToValidate="txtCourseName" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div  class="form-group row">
        <asp:Button ID="add" runat="server" Text="Submit Course Information" CssClass="btn btn-small btn-primary"
                OnClick="Button_Click" />
    </div>

    <p>The following courses are currently in the system:</p> 

    <asp:Table runat="server" ID="tableSort" CssClass="table" >
    <asp:TableRow>
        <asp:TableHeaderCell><a href="AddCourse.aspx?sort=code">Course Code</a></asp:TableHeaderCell>
        <asp:TableHeaderCell><a href="AddCourse.aspx?sort=title">Couse Title</a></asp:TableHeaderCell>    
    </asp:TableRow>
    </asp:Table>

</asp:Content>
