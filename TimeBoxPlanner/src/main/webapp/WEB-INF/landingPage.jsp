<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>The-Time-Box-TBP</title>
    <!-- Bootstrap CSS -->
<!--     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet"> -->
    <!-- NeoBrutalism CSS -->
    <link href="https://cdn.jsdelivr.net/gh/rajnandan1/brutopia@latest/dist/assets/compiled/css/app.css" rel="stylesheet" crossorigin="anonymous">    
    <!-- Your custom styles -->
    <link rel="stylesheet" href="styles.css">
</head>

<body>

    <!-- Header Section -->
    <header class="text-center">
        <h1 class="mt-5">The-Time-Box-TBP</h1>
        <!-- Navigation Links -->
        <nav class="mt-4">
            <a href="#features">Features</a> |
            <a href="#download">Download</a> |
            <a href="#testimonials">Testimonials</a> |
            <a href="#contact">Contact</a>
        </nav>
    </header>

    <!-- Hero Section -->
    <section class="hero text-center">
        <img src="time_management_image.jpg" alt="Time Management Illustration" class="img-fluid">
        <h2 class="mt-4">Master Your Time with The-Time-Box-TBP</h2>
        <!-- Call-to-Action Button -->
        <a href="#download" class="btn btn-primary mt-3">Start Your Journey</a>
    </section>

    <!-- Features Section -->
    <section id="features" class="features text-center mt-5">
        <h3>Key Features</h3>
        <!-- Highlight Key Features using Bootstrap Cards -->
        <div class="card-deck mt-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Timeboxing Excellence</h5>
                    <p class="card-text">Embrace the essence of timeboxing, a methodology endorsed by industry leaders.</p>
                </div>
            </div>
            <!-- Add more cards for other features -->
        </div>
    </section>

    <!-- Download Section -->
    <section id="download" class="download text-center mt-5">
        <h3>Download Now</h3>
        <!-- Download Now Button -->
        <a href="#download" class="btn btn-success mt-3">Download Now</a>
        <!-- Include options for different platforms -->
        <p class="mt-3">Available for Windows, macOS, Linux</p>
    </section>

    <!-- Testimonials Section -->
    <section id="testimonials" class="testimonials text-center mt-5">
        <h3>User Testimonials</h3>
        <!-- Positive testimonials using Bootstrap Carousel -->
        <div id="testimonialCarousel" class="carousel slide mt-4" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <blockquote class="blockquote">
                        <p class="mb-0">"The-Time-Box-TBP revolutionized my daily routine. Highly recommended!"</p>
                        <footer class="blockquote-footer">John Doe</footer>
                    </blockquote>
                </div>
                <!-- Add more carousel items for other testimonials -->
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="contact text-center mt-5">
        <h3>Contact Us</h3>
        <!-- Contact Form using Bootstrap Form -->
        <form>
            <div class="form-group mt-4">
                <input type="text" class="form-control" placeholder="Your Name">
            </div>
            <div class="form-group">
                <input type="email" class="form-control" placeholder="Your Email">
            </div>
            <div class="form-group">
                <textarea class="form-control" rows="3" placeholder="Your Message"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </section>

    <!-- Footer Section -->
    <footer class="text-center mt-5">
        <p>&copy; 2024 The-Time-Box-TBP. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<!--     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script> -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>

</html>
