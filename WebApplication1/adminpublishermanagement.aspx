<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminpublishermanagement.aspx.cs" Inherits="WebApplication1.adminpublishermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-7 mb-4 mb-lg-0">
                <div class="card shadow-lg p-4">
                    <div class="card-header text-center">
                        <h3>Publisher Details</h3>
                    </div>
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col-12 col-md-4">
                                <label for="PublisherID" class="form-label">Publisher ID</label>
                                <div class="input-group">
                                    <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Publisher ID" runat="server"></asp:TextBox>
                                    <asp:Button ID="Button2" runat="server" Text="Go" CssClass="btn btn-primary" OnClick="Button2_Click" />
                                </div>
                            </div>
                            <div class="col-12 col-md-8">
                                <label for="Publisher Name" class="form-label">Publisher Name</label>
                                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" placeholder="Publisher Name"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 col-sm-4 mb-3 mb-sm-0">
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-success w-100" Text="Add" OnClick="Button1_Click" />
                            </div>
                            <div class="col-12 col-sm-4 mb-3 mb-sm-0">
                                <asp:Button ID="Button3" runat="server" CssClass="btn btn-warning w-100" Text="Update" OnClick="Button3_Click" />
                            </div>
                            <div class="col-12 col-sm-4">
                                <asp:Button ID="Button4" runat="server" CssClass="btn btn-danger w-100" Text="Delete" OnClick="Button4_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-12 col-lg-5">
                <div class="card shadow-lg p-4">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString3 %>" ProviderName="<%$ ConnectionStrings:elibraryDBConnectionString3.ProviderName %>" SelectCommand="SELECT * FROM [publisher_master_table]"></asp:SqlDataSource>
                    <div class="card-header text-center">
                        <h3>Publisher List</h3>
                    </div>
                    <div class="card-body">
                        <asp:GridView ID="GridView1" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="publisher_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="publisher_id" HeaderText="Publisher ID" ReadOnly="True" SortExpression="publisher_id" />
                                <asp:BoundField DataField="publisher_name" HeaderText="Publisher Name" SortExpression="publisher_name" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="text-center mt-3">
        <asp:HyperLink ID="lnkBackHome" runat="server" NavigateUrl="~/homepage.aspx" CssClass="btn btn-link"><< Back to Home</asp:HyperLink>
    </div>
</asp:Content>
