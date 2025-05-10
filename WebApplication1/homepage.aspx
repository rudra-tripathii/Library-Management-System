<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="WebApplication1.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section -->
    <section class="container-fluid p-0">
        <div class="text-center bg-light py-5">
            <h1 class="fw-bold display-5">Welcome to our Library Management System</h1>
        </div>
        <img src="Images/library.jpeg" alt="Library Image" class="img-fluid w-100"
            style="object-fit: cover; height: 300px;" />
    </section>

    <!-- Features Section -->
    <section class="container py-5">
        <div class="text-center mb-4">
            <h3 class="fw-semibold">Our Features</h3>
            <p class="text-muted">Explore the core functionalities of our system</p>
        </div>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">Digital Book Inventory</h5>
                        <p class="card-text">Easily search books by title, author, genre, or publication year in our digital inventory.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">Search Books</h5>
                        <p class="card-text">Quickly locate any book using our intuitive search functionality across all categories.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">Defaulter List</h5>
                        <p class="card-text">Check overdue books and user defaulter records with just one click.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Second Image Section -->
    <section class="container-fluid p-0">
        <d  iv class="text-center bg-light py-5">
            <h1 class="fw-bold display-6">Modern Legacy Library System</h1>
        </d>
        <img src="Images/library.jpeg" alt="Library Image" class="img-fluid w-100"
            style="object-fit: cover; height: 300px;" />
    </section>

    <!-- Process Section -->
    <section class="container py-5">
        <div class="text-center mb-4">
            <h3 class="fw-semibold">Our Process</h3>
            <p class="text-muted">Easy steps to get started</p>
        </div>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">Sign Up</h5>
                        <p class="card-text">Register online in minutes and become a member of our digital library.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">Search Books</h5>
                        <p class="card-text">Use the search bar to find your desired book from our extensive collection.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">Visit Us</h5>
                        <p class="card-text">Collect your book or explore more in person at our modern library facility.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
