<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="WebApplication1.usersignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-center">
        <div class="card p-4 mx-auto my-2" style="width: 90vh;">
            <h2 class="text-center">User Registration</h2>
            <div class="card-body ">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Full Name</label>
                      <!--  <input type="Text" runat="server"  class="form-control" id="txtName" placeholder="full_name" required>-->
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Placeholder="full_name" />
                    </div>
                    <div class="col-md-6">
                        <label for="Birth" class="form-label">Date of Birth</label>
                  <!--      <input type="date" class="form-control" id="Birth" placeholder="dob" required>-->
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Date" CssClass="form-control" placeholder="dob" />

                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="contact_no" class="form-label">Contact Number</label>
                        <!--<input type="text" class="form-control" id="Contact" placeholder="contact_no" required>-->
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="contact_no" />
                    </div>
                    <div class="col-md-6">
                        <label for="email" class="form-label">Email  ID</label>
                      <!---  <input type="email" class="form-control" id="email" placeholder="email" required>-->
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" placeholder="email" />
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-4">
                        <label class="form-label">State</label>
                      <!--  <select class="form-select" id="stateSelect" style="max-height: 100px; overflow-y: auto">
                            <option selected disabled>Choose a state...</option>
                            <option value="CA">California</option>
                            <option value="TX">Texas</option>
                            <option value="FL">Florida</option>
                            <option value="NY">New York</option>
                            <option value="IL">Illinois</option>
                            <option value="TX">Texas</option>
                            <option value="FL">Florida</option>
                            <option value="NY">New York</option>
                            <option value="IL">Illinois</option>
                            <option value="CA">California</option>
                            <option value="TX">Texas</option>
                            <option value="FL">Florida</option>
                            <option value="NY">New York</option>
                        </select>-->
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Choose a state..." Value="" Disabled="true" Selected="True" />
                            <asp:ListItem Text="California" Value="CA" />
                            <asp:ListItem Text="Texas" Value="TX" />
                            <asp:ListItem Text="Florida" Value="FL" />
                            <asp:ListItem Text="New York" Value="NY" />
                            <asp:ListItem Text="Illinois" Value="IL" />
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <label for="City" class="form-label">City</label>
                        <!--<input type="text" class="form-control" id="City" placeholder="City" required>-->
                        <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" placeholder="City" />
                    </div>
                    <div class="col-md-4">
                        <label for="Pin" class="form-label">Pincode</label>
                       <!-- <input type="text" class="form-control" id="Pin" placeholder="Pincode" required>-->
                        <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" placeholder="Pincode" />
                    </div>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-12">
                    <label for="Address" class="form-label">Full Address</label>
               <!--     <textarea class="form-control" id="Address" placeholder="Type address here" required></textarea>-->
                    <asp:TextBox ID="TextBox8" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" placeholder="full_address" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6 mx-auto">
                    <span class="badge rounded-pill text-bg-primary">Login Credentials</span>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="User_ID" class="form-label">User ID</label>
                <!--    <input type="text" class="form-control" id="User_ID" placeholder="User ID" required>-->
                    <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" placeholder="member_id" />

                </div>
                <div class="col-md-6">
                    <label for="Password" class="form-label">Password</label>
                  <!--  <input type="password" class="form-control" id="Password" placeholder="Password" required>-->
                    <asp:TextBox ID="TextBox10" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group text-center">
                        <asp:Button ID="Button1" runat="server" Text="Sign up" CssClass="btn btn-success" OnClick="Button1_Click" />
                    </div>
                </div>
            </div>

            <!--  <button type="submit" class="btn btn-primary w-100" id="btnSubmit" onclick="Button_CLick">Sign Up</button>-->
        </div>
    </div>
</asp:Content>  