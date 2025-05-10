<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminauthormanagement.aspx.cs" Inherits="WebApplication1.adminauthormanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
            border-radius: 10px;
        }

        .form-label {
            font-weight: bold;
        }

        .btn {
            font-weight: 500;
        }

        .table-responsive {
            overflow-x: auto;
        }

        @media (max-width: 576px) {
            .btn {
                margin-bottom: 10px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-4">
        <div class="row gy-4">
            <!-- Author Details Form -->
            <div class="col-lg-6 col-md-12">
                <div class="card p-4">
                    <h3 class="text-center mb-3">Author Management</h3>
                    <div class="row g-3">
                        <div class="col-12 col-md-5">
                            <label for="TextBox1" class="form-label">Author ID</label>
                            <div class="input-group">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter ID" />
                                <asp:Button ID="Button4" runat="server" Text="Go" CssClass="btn btn-outline-primary" OnClick="Button1_Click" />
                            </div>
                        </div>
                        <div class="col-12 col-md-7">
                            <label for="TextBox2" class="form-label">Author Name</label>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Enter Author Name" />
                        </div>

                        <div class="col-12 d-flex flex-wrap gap-2">
                            <asp:Button ID="Button2" runat="server" Text="Add" CssClass="btn btn-success flex-fill" OnClick="BtnAdd_Click" />
                            <asp:Button ID="Button3" runat="server" Text="Update" CssClass="btn btn-warning flex-fill" OnClick="BtnUpdate_Click" />
                            <asp:Button ID="BtnDelete" runat="server" Text="Delete" CssClass="btn btn-danger flex-fill" OnClick="BtnDelete_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Author List Table -->
            <div class="col-lg-6 col-md-12">
                <div class="card p-4">
                    <h3 class="text-center mb-3">Author List</h3>
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                            CssClass="table table-striped table-bordered"
                            DataKeyNames="author_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="author_id" HeaderText="Author ID" ReadOnly="True" SortExpression="author_id" />
                                <asp:BoundField DataField="author_name" HeaderText="Author Name" SortExpression="author_name" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center mt-4">
            <a href="homepage.aspx" class="btn btn-outline-secondary">&laquo; Back to Home</a>
        </div>
    </div>

    <!-- Data source -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString2 %>"
        ProviderName="<%$ ConnectionStrings:elibraryDBConnectionString2.ProviderName %>"
        SelectCommand="SELECT * FROM [author_master_tbl]">
    </asp:SqlDataSource>
</asp:Content>
