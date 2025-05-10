<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="WebApplication1.adminbookinventory" %>
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
        .card {
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-radius: 16px;
        }
        .form-label {
            font-weight: 600;
        }
        @media (max-width: 768px) {
            .btn {
                margin-top: 8px;
            }
        }
    </style>
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row gy-4">
            <!-- Book Details Card -->
            <div class="col-lg-6 col-md-12">
                <div class="card p-4">
                    <h2 class="text-center mb-3">📚 Book Details</h2>
                    <hr />
                    <div class="text-center mb-3">
                        <img id="imgview" src="book_inventory/Java.jpg" class="img-thumbnail" style="height: 150px; width: 100px;" />
                    </div>

                    <div class="mb-3">
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" onChange="readURL(this);" />
                    </div>

                    <div class="row g-3">
                        <div class="col-md-4">
                            <label class="form-label">Book ID</label>
                            <div class="input-group">
                                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" placeholder="Book ID" />
                                <asp:Button ID="Button2" runat="server" Text="Go" CssClass="btn btn-primary" OnClick="Button2_Click" />
                            </div>
                        </div>
                        <div class="col-md-8">
                            <label class="form-label">Book Name</label>
                            <asp:TextBox ID="TextBoxBookName" CssClass="form-control" runat="server" placeholder="Book Name" />
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Language</label>
                            <asp:DropDownList CssClass="form-select" ID="DropDownList1" runat="server">
                                <asp:ListItem Text="-- Select Language --" Value="" Selected="True" />
                                <asp:ListItem Text="English" Value="English" />
                                <asp:ListItem Text="Hindi" Value="Hindi" />
                                <asp:ListItem Text="Marathi" Value="Marathi" />
                                <asp:ListItem Text="French" Value="French" />
                                <asp:ListItem Text="German" Value="German" />
                                <asp:ListItem Text="Urdu" Value="Urdu" />
                            </asp:DropDownList>

                            <label class="form-label mt-3">Publisher Name</label>
                            <asp:DropDownList CssClass="form-select" ID="DropDownList2" runat="server">
                                <asp:ListItem Text="-- Select Publisher Name --" Value="" Selected="True" />
                                <asp:ListItem Text="Publisher 1" Value="Publisher 1" />
                                <asp:ListItem Text="Publisher 2" Value="Publisher 2" />
                                <asp:ListItem Text="Publisher 3" Value="Publisher 3" />
                            </asp:DropDownList>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Author Name</label>
                            <asp:DropDownList CssClass="form-select" ID="DropDownList3" runat="server">
                                <asp:ListItem Text="-- Select Author Name --" Value="" Selected="True" />
                                <asp:ListItem Text="A1" Value="A1" />
                                <asp:ListItem Text="A2" Value="A2" />
                                <asp:ListItem Text="A3" Value="A3" />
                            </asp:DropDownList>

                            <label class="form-label mt-3">Publish Date</label>
                            <asp:TextBox CssClass="form-control" ID="TextBox1" TextMode="Date" runat="server" />
                        </div>

                        <div class="col-md-12 mb-3">
                            <label class="form-label">Genre</label>
                            <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="4" CssClass="form-control rounded">
                                <asp:ListItem Text="Fiction" Value="Fiction" />
                                <asp:ListItem Text="Non-Fiction" Value="Non-Fiction" />
                                <asp:ListItem Text="Mystery" Value="Mystery" />
                                <asp:ListItem Text="Romance" Value="Romance" />
                                <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                <asp:ListItem Text="Biography" Value="Biography" />
                                <asp:ListItem Text="History" Value="History" />
                                <asp:ListItem Text="Self-Help" Value="Self-Help" />
                            </asp:ListBox>
                        </div>


                        <div class="col-md-4">
                            <label class="form-label">Edition</label>
                            <asp:TextBox ID="TextBoxEdition" CssClass="form-control" runat="server" placeholder="Edition" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Cost (per unit)</label>
                            <asp:TextBox ID="TextBoxBookCost" CssClass="form-control" runat="server" TextMode="Number" placeholder="Cost" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Pages</label>
                            <asp:TextBox ID="TextBoxPages" CssClass="form-control" runat="server" TextMode="Number" placeholder="Pages" />
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Actual Stock</label>
                            <asp:TextBox ID="TextBoxActualStock" CssClass="form-control" runat="server" TextMode="Number" placeholder="Stock" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Current Stock</label>
                            <asp:TextBox ID="TextBoxCurrentStock" CssClass="form-control readonly-field" runat="server" TextMode="Number" placeholder="Current" ReadOnly="true" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Issued Books</label>
                            <asp:TextBox ID="TextBoxIssuedBooks" CssClass="form-control readonly-field" runat="server" TextMode="Number" placeholder="Issued" ReadOnly="true" />
                        </div>

                        <div class="col-12">
                            <label class="form-label">Description</label>
                            <asp:TextBox ID="TextBoxDescription" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="3" placeholder="Description" />
                        </div>

                        <div class="col-md-4">
                            <asp:Button ID="ButtonAdd" runat="server" CssClass="btn btn-success w-100" Text="Add" OnClick="ButtonAdd_Click" />
                        </div>
                        <div class="col-md-4">
                            <asp:Button ID="ButtonUpdate" runat="server" CssClass="btn btn-warning w-100" Text="Update" OnClick="ButtonUpdate_Click" />
                        </div>
                        <div class="col-md-4">
                            <asp:Button ID="ButtonDelete" runat="server" CssClass="btn btn-danger w-100" Text="Delete" OnClick="ButtonDelete_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Inventory Table Card -->
            <div class="col-lg-6 col-md-12">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString2 %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                <div class="card p-4">
                    <h2 class="text-center mb-3">📖 Book Inventory List</h2>
                    <hr />
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="row">
                                            <div class="col-10">
                                                <div><strong><%# Eval("book_name") %></strong></div>
                                                <div>Author: <%# Eval("author_name") %> | Genre: <%# Eval("genre") %> | Language: <%# Eval("language") %></div>
                                                <div>Publisher: <%# Eval("publisher_name") %> | Date: <%# Eval("publish_date") %> | Pages: <%# Eval("no_of_pages") %></div>
                                                <div>Edition: <%# Eval("edition") %> | Cost: <%# Eval("book_cost") %> | Stock: <%# Eval("actual_stock") %> | Available: <%# Eval("current_stock") %></div>
                                                <div><em>Description: <%# Eval("book_description") %></em></div>
                                            </div>
                                            <div class="col-2">
                                                <asp:Image ID="Image1" CssClass="img-fluid rounded" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center mt-3">
            <a href="homepage.aspx" class="btn btn-outline-secondary">&laquo; Back to Home</a>
        </div>
    </div>
</asp:Content>
