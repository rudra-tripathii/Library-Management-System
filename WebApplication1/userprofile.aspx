<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="WebApplication1.userprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
            border-radius: 1rem;
            box-shadow: 0 0.5rem 1rem rgba(0,0,0,0.15);
        }

        .badge {
            font-size: 0.9rem;
        }

        .form-label {
            font-weight: 500;
        }

        .btn {
            border-radius: 0.5rem;
        }

        @media (max-width: 576px) {
            .card {
                width: 100% !important;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-4">
        <div class="row gy-4">
            <!-- Profile Section -->
            <div class="col-lg-5 col-md-12">
                <div class="card p-4">
                    <h3 class="text-center mb-3">Your Profile</h3>

                    <p class="text-center">
                        Account Status - 
                        <asp:Label ID="lblAccountStatus" runat="server" CssClass="badge bg-success" Text="Active"></asp:Label>
                    </p>

                    <div class="row g-3">
                        <div class="col-md-6">
                            <asp:Label runat="server" AssociatedControlID="txtFullName" CssClass="form-label" Text="Full Name" />
                            <asp:TextBox runat="server" ID="txtFullName" CssClass="form-control" Placeholder="Enter your full name" />
                        </div>
                        <div class="col-md-6">
                            <asp:Label runat="server" AssociatedControlID="txtBirthDate" CssClass="form-label" Text="Date of Birth" />
                            <asp:TextBox runat="server" ID="txtBirthDate" CssClass="form-control" TextMode="Date" />
                        </div>
                        <div class="col-md-6">
                            <asp:Label runat="server" AssociatedControlID="txtContact" CssClass="form-label" Text="Contact Number" />
                            <asp:TextBox runat="server" ID="txtContact" CssClass="form-control" Placeholder="Contact Number" />
                        </div>
                        <div class="col-md-6">
                            <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="form-label" Text="Email ID" />
                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" TextMode="Email" Placeholder="Email ID" />
                        </div>
                        <div class="col-md-4">
                            <asp:Label runat="server" AssociatedControlID="ddlState" CssClass="form-label" Text="State" />
                            <asp:DropDownList runat="server" ID="ddlState" CssClass="form-select">
                                <asp:ListItem Text="Choose a state..." Value="" Disabled="True" Selected="True" />
                                <asp:ListItem Text="California" Value="CA" />
                                <asp:ListItem Text="Texas" Value="TX" />
                                <asp:ListItem Text="Florida" Value="FL" />
                                <asp:ListItem Text="New York" Value="NY" />
                                <asp:ListItem Text="Illinois" Value="IL" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-4">
                            <asp:Label runat="server" AssociatedControlID="txtCity" CssClass="form-label" Text="City" />
                            <asp:TextBox runat="server" ID="txtCity" CssClass="form-control" Placeholder="City" />
                        </div>
                        <div class="col-md-4">
                            <asp:Label runat="server" AssociatedControlID="txtPin" CssClass="form-label" Text="Pincode" />
                            <asp:TextBox runat="server" ID="txtPin" CssClass="form-control" Placeholder="Pincode" />
                        </div>
                        <div class="col-12">
                            <asp:Label runat="server" AssociatedControlID="txtAddress" CssClass="form-label" Text="Full Address" />
                            <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control" TextMode="MultiLine" Rows="3" Placeholder="Type address here" />
                        </div>

                        <!-- Login Section -->
                        <div class="col-12 text-center">
                            <span class="badge text-bg-primary">Login Credentials</span>
                        </div>

                        <div class="col-md-4">
                            <asp:Label runat="server" AssociatedControlID="txtUserID" CssClass="form-label" Text="User ID" />
                            <asp:TextBox runat="server" ID="txtUserID" CssClass="form-control" ReadOnly="True" />
                        </div>
                        <div class="col-md-4">
                            <asp:Label runat="server" AssociatedControlID="txtOldPassword" CssClass="form-label" Text="Old Password" />
                            <asp:TextBox runat="server" ID="txtOldPassword" CssClass="form-control" TextMode="Password" ReadOnly="True" />
                        </div>
                        <div class="col-md-4">
                            <asp:Label runat="server" AssociatedControlID="txtNewPassword" CssClass="form-label" Text="New Password" />
                            <asp:TextBox runat="server" ID="txtNewPassword" CssClass="form-control" TextMode="Password" />
                        </div>

                        <div class="col-12 mt-3">
                            <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary w-100" Text="Update" OnClick="btnUpdate_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Issued Books Section -->
            <div class="col-lg-7 col-md-12">
                <div class="card p-4">
                    <h3 class="text-center mb-3">Your Issued Books</h3>
                    <div class="text-center mb-2">
                        <span class="badge bg-info">Info about book due date</span>
                    </div>
                    <hr />
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover text-center" AutoGenerateColumns="True" OnRowDataBound="GridView1_RowDataBound">
                    </asp:GridView>
                </div>
            </div>
        </div>

        <div class="text-center mt-4">
            <a href="homepage.aspx" class="btn btn-outline-secondary">&laquo; Back to Home</a>
        </div>
    </div>
</asp:Content>
