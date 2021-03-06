﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ACMasterPage.master" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="Lab_3.AddStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="App_Themes/SiteStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Add Student Records</h1>

    <asp:Label ID="courseLbl" runat="server" Text="Course: " class="col-2"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control col-8" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" >
        <asp:ListItem Value="0">Please select a course</asp:ListItem>
    </asp:DropDownList>
    <%-- Required Field Validator --%>
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="DropDownList1" 
                ErrorMessage="This information is required!" InitialValue="0" ForeColor="Red"></asp:RequiredFieldValidator>  <br /><br />

    <asp:Label ID="studentNumberLbl" runat="server" Text="Student Number:" class="col-2"></asp:Label>
    <asp:TextBox ID="studentNumberTxt" runat="server" class="form-control col-8"></asp:TextBox>
    <%-- Required Field Validator --%>
     <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="studentNumberTxt" 
                ErrorMessage="This information is required!" InitialValue="" ForeColor="Red"></asp:RequiredFieldValidator><br />

    <asp:Label ID="studentNameLbl" runat="server" Text="Student Name:" class="col-2"></asp:Label>
    <asp:TextBox ID="studentNameTxt" runat="server" class="form-control col-8"></asp:TextBox>
    <%-- Required Field Validator --%>
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="studentNameTxt" 
                ErrorMessage="This information is required!" InitialValue="" ForeColor="Red"></asp:RequiredFieldValidator><br />            
    <asp:RegularExpressionValidator ID="RegularExpValidator" ValidationExpression="[a-zA-Z]+\s+[a-zA-Z]+" 
                ControlToValidate="studentNameTxt" CssClass="error" Display="Dynamic" ErrorMessage="Must be in first_name last_name!" 
                runat="server"/>

    <asp:Label ID="gradeLbl" runat="server" Text="Grade:" class="col-2"></asp:Label>
    <asp:TextBox ID="gradeTxt" runat="server" class="form-control col-8"></asp:TextBox>
    <%-- Required Field Validator --%>
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="gradeTxt" 
                ErrorMessage="This information is required!" InitialValue="" ForeColor="Red"></asp:RequiredFieldValidator> 
    <%-- Add Range Validator --%><br />
    <asp:RangeValidator ID="RequiredRangeValidator" runat="server" ControlToValidate="gradeTxt"
                Type="Integer" ErrorMessage="Grade must be between 0 and 100!" MaximumValue="100" MinimumValue="0" 
                Display="Dynamic" ForeColor="Red"></asp:RangeValidator>
    

    <asp:Button ID="addBtn" runat="server" Text="Add to Course" Width="222px" OnClick="addBtn_Click" CssClass="btn btn-small btn-primary" />

    <asp:Table runat="server" ID="tableSort" CssClass="table" >
    <asp:TableRow>
        <asp:TableHeaderCell>ID</asp:TableHeaderCell>
        <asp:TableHeaderCell>Name</asp:TableHeaderCell>    
        <asp:TableHeaderCell>Grade</asp:TableHeaderCell> 
    </asp:TableRow>
    </asp:Table> 
</asp:Content>
