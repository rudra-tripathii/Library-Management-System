<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookissuing.aspx.cs" Inherits="WebApplication1.adminbookissuing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
            border-radius: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }
        h2 {
            font-weight: bold;
            color: #2c3e50;
        }
        .form-label {
            font-weight: 600;
        }
        .btn {
            border-radius: 10px;
        }
        .table th, .table td {
            vertical-align: middle;
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid px-2 px-sm-4">
        <div class="row gy-4">
            <!-- Left Panel: Book Issue Form -->
            <div class="col-12 col-lg-5">
                <div class="card p-4">
                    <h2 class="text-center mb-3">Book Issuing</h2>
                    <hr />
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-12 col-md-6">
                                <asp:Label ID="lblMemberID" runat="server" CssClass="form-label" AssociatedControlID="TextBox1" Text="Member ID"></asp:Label>
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Placeholder="Member Id"></asp:TextBox>
                            </div>

                            <div class="col-12 col-md-6">
                                <asp:Label ID="lblBookID" runat="server" CssClass="form-label" AssociatedControlID="TextBox2" Text="Book ID"></asp:Label>
                                <div class="input-group">
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Placeholder="Book ID"></asp:TextBox>
                                    <asp:Button ID="btnGo" runat="server" Text="Go" CssClass="btn btn-primary" OnClick="btnGo_Click" />
                                </div>
                            </div>

                            <div class="col-12 col-md-6">
                                <asp:Label ID="lblMemberName" runat="server" CssClass="form-label" AssociatedControlID="TextBox3" Text="Member Name"></asp:Label>
                                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Placeholder="Member Name" ReadOnly="true"></asp:TextBox>
                            </div>

                            <div class="col-12 col-md-6">
                                <asp:Label ID="lblBookName" runat="server" CssClass="form-label" AssociatedControlID="TextBox4" Text="Book Name"></asp:Label>
                                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Placeholder="Book Name" ReadOnly="true"></asp:TextBox>
                            </div>

                            <div class="col-12 col-md-6">
                                <asp:Label ID="lblStartDate" runat="server" CssClass="form-label" AssociatedControlID="txtStartDate" Text="Start Date"></asp:Label>
                                <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" TextMode="Date" Placeholder="Start Date"></asp:TextBox>
                            </div>

                            <div class="col-12 col-md-6">
                                <asp:Label ID="lblEndDate" runat="server" CssClass="form-label" AssociatedControlID="txtEndDate" Text="End Date"></asp:Label>
                                <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" TextMode="Date" Placeholder="End Date"></asp:TextBox>
                            </div>

                            <div class="col-12 col-md-6">
                                <asp:Button ID="Button1" runat="server" Text="Issue" CssClass="btn btn-primary w-100" OnClick="btnIssue_Click" />
                            </div>

                            <div class="col-12 col-md-6">
                                <asp:Button ID="Button2" runat="server" Text="Return" CssClass="btn btn-success w-100" OnClick="btnReturn_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Panel: Issued Book List -->
            <div class="col-12 col-lg-7">
                <div class="card p-4">
                    <h2 class="text-center mb-3">Issued Book List</h2>
                    <hr />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString4 %>" 
                        ProviderName="<%$ ConnectionStrings:elibraryDBConnectionString4.ProviderName %>" 
                        SelectCommand="SELECT * FROM [book_issue_table]">
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" 
                        CssClass="table table-striped table-bordered table-hover" 
                        AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource1" 
                        OnRowDataBound="GridView1_RowDataBound"
                        GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                            <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                            <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                            <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name" />
                            <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                            <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <div class="text-center mt-4">
            <asp:HyperLink ID="lnkBackHome" runat="server" NavigateUrl="~/homepage.aspx" CssClass="btn btn-outline-secondary">
                &laquo; Back to Home
            </asp:HyperLink>
        </div>
    </div>
</asp:Content>
