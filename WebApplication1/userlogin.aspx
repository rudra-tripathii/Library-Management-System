<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlogin.aspx.cs" Inherits="WebApplication1.userlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="row justify-content-center w-100">
            <div class="col-12 col-md-8 col-lg-6">
                <div class="card shadow-lg p-4 mx-auto w-100">
                    <div class="card-body">
                        <h3 class="text-center mb-4">Member Login</h3>
                        <hr />
                        <div class="mb-3">
                            <label for="userId" class="form-label">User ID</label>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter your User ID" />
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your Password" />
                        </div>
                        <div class="d-grid gap-2">
                            <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-primary w-100" OnClick="Button1_Click" />
                            <asp:Button ID="Button2" runat="server" Text="Sign Up" CssClass="btn btn-success w-100" OnClick="Button2_Click" />
                        </div>
                    </div>
                </div>
                <div class="text-center mt-3">
                    <a href="homepage.aspx" class="btn btn-link"><< Back to Home</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
