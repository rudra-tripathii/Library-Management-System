<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="WebApplication1.adminlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .login-card {
            max-width: 400px;
            border-radius: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .form-label {
            font-weight: 600;
        }
        h3 {
            font-weight: bold;
            color: #2c3e50;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #3498db;
            font-weight: 500;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-center vh-100 px-3">
        <div class="row w-100">
            <div class="col-12 d-flex justify-content-center">
                <div class="card login-card p-4">
                    <div class="card-body">
                        <h3 class="text-center mb-3">Admin Login</h3>
                        <hr />
                        <div class="mb-3">
                            <label for="TextBox1" class="form-label">Admin ID</label>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter Admin ID" />
                        </div>
                        <div class="mb-3">
                            <label for="TextBox2" class="form-label">Password</label>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password" />
                        </div>
                        <div class="d-grid">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
                        </div>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/homepage.aspx" CssClass="back-link">&laquo; Back to Home</asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
