<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminmembermanagement.aspx.cs" Inherits="WebApplication1.adminmembermanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .readonly-field {
            background-color: #f8f9fa !important;
            color: #6c757d;
            border: 1px solid #ced4da;
        }

        .table-responsive {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }

        .card-header {
            background-color: #3498db;
            color: white;
            font-weight: bold;
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

        .btn-group button {
            border-radius: 25px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-lg-6 mb-4 mb-lg-0">
                <div class="card shadow-lg">
                    <div class="card-header text-center">
                        <h3>Member Details</h3>
                    </div>
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col-12 col-md-3">
                                <label for="MemberID" class="form-label">Member ID</label>
                                <div class="input-group">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="MemberId" />
                                    <asp:Button ID="Button5" runat="server" Text="Go" CssClass="btn btn-primary" OnClick="Button5_Click" />
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <label for="Name" class="form-label">Full Name</label>
                                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control readonly-field" placeholder="Full Name" ReadOnly="True" />
                            </div>
                            <div class="col-12 col-md-5">
                                <label class="form-label">Account Status</label>
                                <div class="input-group">
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control readonly-field" placeholder="Status" ReadOnly="True" />
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-success mx-1 rounded-1" Text="✓" OnClick="Button2_Click" />
                                    <asp:Button ID="Button3" runat="server" CssClass="btn btn-warning me-1 rounded-1" Text="○" OnClick="Button3_Click" />
                                    <asp:Button ID="Button4" runat="server" CssClass="btn btn-danger rounded-1" Text="×" OnClick="Button4_Click" />
                                </div>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-12 col-md-3">
                                <label for="DOB" class="form-label">DOB</label>
                                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control readonly-field" placeholder="DOB" ReadOnly="True" />
                            </div>
                            <div class="col-12 col-md-4">
                                <label class="form-label">Contact No</label>
                                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control readonly-field" placeholder="Contact No" TextMode="Number" ReadOnly="True" />
                            </div>
                            <div class="col-12 col-md-5">
                                <label class="form-label">Email ID</label>
                                <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control readonly-field" placeholder="Email ID" TextMode="Email" ReadOnly="True" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-12 col-md-5">
                                <label class="form-label">State</label>
                                <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control readonly-field" placeholder="State" ReadOnly="True" />
                            </div>
                            <div class="col-12 col-md-4">
                                <label class="form-label">City</label>
                                <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control readonly-field" placeholder="City" ReadOnly="True" />
                            </div>
                            <div class="col-12 col-md-3">
                                <label class="form-label">Pin Code</label>
                                <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control readonly-field" placeholder="Pin Code" ReadOnly="True" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-12">
                                <label class="form-label">Full Portal Address</label>
                                <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control readonly-field" TextMode="MultiLine" Rows="3" placeholder="Full Portal Address" ReadOnly="True" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-8 mx-auto">
                                <asp:Button ID="ButtonDelete" runat="server" CssClass="btn btn-danger w-100" Text="Delete User Permanently" OnClick="ButtonDelete_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-12 col-lg-6">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString2 %>" SelectCommand="SELECT * FROM [member_master_table]"></asp:SqlDataSource>
                <div class="card shadow-lg mb-4">
                    <div class="card-header text-center">
                        <h3>Member List</h3>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="member_id" HeaderText="ID" SortExpression="member_id" />
                                    <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                    <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                                    <asp:BoundField DataField="contact_no" HeaderText="Contact" SortExpression="contact_no" />
                                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                    <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                    <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:HyperLink ID="lnkBackHome" runat="server" NavigateUrl="~/homepage.aspx" CssClass="back-link">&lt;&lt; Back to Home</asp:HyperLink>
</asp:Content>
