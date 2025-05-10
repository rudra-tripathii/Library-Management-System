<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewbooks.aspx.cs" Inherits="WebApplication1.viewbooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container py-5">
        <h2 class="text-center mb-4">📚 Book Inventory List</h2>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString2 %>"
            SelectCommand="SELECT * FROM [book_master_tbl]">
        </asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" CssClass="table table-borderless" 
            AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1" 
            ShowHeader="False">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <div class="row">
                                    <!-- Book Details -->
                                    <div class="col-lg-10 col-md-9 col-sm-12">
                                        <h4 class="fw-bold"><%# Eval("book_name") %></h4>
                                        <p class="mb-1 text-muted">
                                            <strong>Author:</strong> <%# Eval("author_name") %> |
                                            <strong>Genre:</strong> <%# Eval("genre") %> |
                                            <strong>Language:</strong> <%# Eval("language") %>
                                        </p>
                                        <p class="mb-1 text-muted">
                                            <strong>Publisher:</strong> <%# Eval("publisher_name") %> |
                                            <strong>Published:</strong> <%# Eval("publish_date") %> |
                                            <strong>Pages:</strong> <%# Eval("no_of_pages") %> |
                                            <strong>Edition:</strong> <%# Eval("edition") %>
                                        </p>
                                        <p class="mb-1 text-muted">
                                            <strong>Cost:</strong> ₹<%# Eval("book_cost") %> |
                                            <strong>Actual Stock:</strong> <%# Eval("actual_stock") %> |
                                            <strong>Available:</strong> <%# Eval("current_stock") %>
                                        </p>
                                        <p class="mt-2"><em><strong>Description:</strong> <%# Eval("book_description") %></em></p>
                                    </div>

                                    <!-- Book Image -->
                                    <div class="col-lg-2 col-md-3 col-sm-12 text-center">
                                        <asp:Image ID="Image1" runat="server" CssClass="img-fluid rounded"
                                            ImageUrl='<%# Eval("book_img_link") %>' AlternateText="Book Image" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <div class="text-center mt-4">
            <a href="homepage.aspx" class="btn btn-outline-primary">&laquo; Back to Home</a>
        </div>
    </div>

</asp:Content>
