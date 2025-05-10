<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aboutUs.aspx.cs" Inherits="WebApplication1.aboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section -->
    <section class="container-fluid p-0">
        <div class="text-center bg-light py-5">
            <h1 class="fw-bold display-5">About Our Library Management System</h1>
        </div>
        <img src="Images/about-library.jpg" alt="Library Overview" class="img-fluid w-100"
             style="object-fit: cover; height: 300px;" />
    </section>

    <!-- About Purpose -->
    <section class="container py-5">
        <div class="row align-items-center">
            <div class="col-md-6">
                <img src="Images/purpose.jpg" class="img-fluid rounded shadow-sm" alt="Purpose Image" />
            </div>
            <div class="col-md-6">
                <h3 class="fw-semibold">Purpose of this System</h3>
                <p class="text-muted">This Library Management System is designed to digitally streamline library operations including book tracking, member registration, issuing and returns. It improves efficiency, accuracy, and accessibility for both librarians and users. The system allows students and readers to explore a vast digital catalog with ease.</p>
                <p class="text-muted">Our goal is to modernize the traditional library experience and make it user-friendly, efficient, and fully accessible.</p>
            </div>
        </div>
    </section>

    <!-- About Admin -->
    <section class="container py-5 bg-light rounded">
        <div class="text-center mb-4">
            <h3 class="fw-semibold">Meet the Admin</h3>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-4 text-center">
                <img src="Images/admin.jpg" class="img-fluid rounded-circle mb-3 shadow-sm" style="width: 150px; height: 150px;" alt="Admin" />
                <h5 class="fw-bold">Rudra Tripathi</h5>
                <p class="text-muted">System Administrator & Developer</p>
                <p class="text-muted">Rudra Tripathi oversees the development, maintenance, and security of the Library Management System. He is passionate about building smart solutions for educational environments and enhancing student experiences.</p>
            </div>
        </div>
    </section>

    <!-- Mission Section -->
    <section class="container py-5">
        <div class="text-center mb-4">
            <h3 class="fw-semibold">Our Mission</h3>
            <p class="text-muted">Empowering libraries through technology to serve knowledge seamlessly.</p>
        </div>
        <div class="row text-center g-4">
            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Efficiency</h5>
                        <p class="card-text">Automate manual tasks and reduce human errors with intelligent tools.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Accessibility</h5>
                        <p class="card-text">Let users access the library resources from anywhere, anytime.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Transparency</h5>
                        <p class="card-text">Keep operations transparent with user-friendly data and reports.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
