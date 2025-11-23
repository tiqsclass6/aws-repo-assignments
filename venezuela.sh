#!/bin/bash
# User data script for EC2 with Apache + metadata HTML (Venezuela Edition)

# Update and install Apache
yum update -y
yum install -y httpd -y
systemctl start httpd
systemctl enable httpd

# Get IMDSv2 token
TOKEN=$(curl -s -f -X PUT "http://169.254.169.254/latest/api/token"   -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Fetch metadata
local_ipv4=$(curl -s -f -H "X-aws-ec2-metadata-token: $TOKEN"   http://169.254.169.254/latest/meta-data/local-ipv4)
az=$(curl -s -f -H "X-aws-ec2-metadata-token: $TOKEN"   http://169.254.169.254/latest/meta-data/placement/availability-zone)
macid=$(curl -s -f -H "X-aws-ec2-metadata-token: $TOKEN"   http://169.254.169.254/latest/meta-data/network/interfaces/macs/ | head -n 1)
vpc=$(curl -s -f -H "X-aws-ec2-metadata-token: $TOKEN"   http://169.254.169.254/latest/meta-data/network/interfaces/macs/${macid}/vpc-id)
hostname_fqdn=$(hostname -f)

# Write HTML file
cat <<EOF > /var/www/html/index.html
<!doctype html>
<html lang="en" class="h-100">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Venezuela - Class Showcase</title>
  <style>
    * {
      box-sizing: border-box;
    }
    body {
      background: url("https://t3.ftcdn.net/jpg/01/23/98/36/360_F_123983672_DFUWb4Ni3NjLNzq600PEhBgxttmCpTTs.jpg") no-repeat center center fixed;
      background-size: cover;
      color: #ffffff;
      font-family: Arial, Helvetica, sans-serif;
      text-align: center;
      margin: 0;
      padding: 0;
    }
    h1 {
      color: #ffffff;
      margin-top: 20px;
      text-shadow: 0 0 8px rgba(0,0,0,0.8);
      letter-spacing: 1px;
    }

    /* Fade-in animations for sections */
    @keyframes fadeIn {
      0%   { opacity: 0; transform: translateY(12px); }
      100% { opacity: 1; transform: translateY(0); }
    }
    .fade-in {
      opacity: 0;
      animation: fadeIn 1.2s ease-out forwards;
    }
    .fade-in.delay-1 { animation-delay: 0.3s; }
    .fade-in.delay-2 { animation-delay: 0.6s; }
    .fade-in.delay-3 { animation-delay: 0.9s; }

    /* Top image row */
    .image-row {
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 20px;
      flex-wrap: wrap;
      max-width: 1100px;
      margin: 25px auto 10px auto;
    }

    .image-card {
      flex: 1 1 300px;
      max-width: 330px;
      background: rgba(0,0,0,0.4);
      border-radius: 12px;
      padding: 10px;
    }

    .image-card img {
      width: 100%;
      height: 320px;
      object-fit: cover;
      object-position: center;
      border-radius: 10px;
      transition: transform 0.3s ease;
    }

    .image-card img:hover {
      transform: scale(1.03);
    }

    /* Venezuelan flag color glows: Yellow, Blue, Red */
    @keyframes yellowGlow {
      0%,100% { box-shadow: 0 0 12px rgba(255, 221, 0, 0.7), 0 0 24px rgba(255, 221, 0, 0.5); }
      50%     { box-shadow: 0 0 20px rgba(255, 221, 0, 1), 0 0 40px rgba(255, 221, 0, 0.9); }
    }
    @keyframes blueGlow {
      0%,100% { box-shadow: 0 0 12px rgba(0, 0, 153, 0.7), 0 0 24px rgba(0, 0, 153, 0.5); }
      50%     { box-shadow: 0 0 20px rgba(0, 0, 153, 1), 0 0 40px rgba(0, 0, 153, 0.9); }
    }
    @keyframes redGlow {
      0%,100% { box-shadow: 0 0 12px rgba(204, 0, 0, 0.7), 0 0 24px rgba(204, 0, 0, 0.5); }
      50%     { box-shadow: 0 0 20px rgba(204, 0, 0, 1), 0 0 40px rgba(204, 0, 0, 0.9); }
    }

    .img-yellow img { animation: yellowGlow 3s infinite; }
    .img-blue img   { animation: blueGlow 3s infinite; }
    .img-red img    { animation: redGlow 3s infinite; }

    /* Info cards */
    .cards {
      display: flex;
      justify-content: center;
      gap: 20px;
      flex-wrap: wrap;
      margin: 30px auto;
      max-width: 90%;
    }
    .card {
      background: rgba(0,0,0,0.78);
      border-radius: 12px;
      padding: 20px 30px;
      flex: 1 1 300px;
      max-width: 500px;
      text-align: left;
      transition: transform 0.3s ease;
    }
    .card:hover { transform: scale(1.05); }
    .card h3 {
      margin-top: 0;
      color: #ffdd00;
      text-align: center;
      text-shadow: 0 0 6px rgba(0,0,0,0.8);
    }
    .highlight { color: #00ffff; }
    .red { color: #ff4444; }
    .yellow { color: #ffeb3b; }

    /* Carousel: Venezuelan Beauty Spotlight */
    .carousel-wrapper {
      max-width: 900px;
      margin: 20px auto 40px auto;
      padding: 20px;
      background: rgba(0,0,0,0.82);
      border-radius: 16px;
      box-shadow: 0 0 18px rgba(0,0,0,0.6);
    }
    .carousel-title {
      font-size: 1.4rem;
      margin-bottom: 10px;
      color: #ffdd00;
      text-shadow: 0 0 6px rgba(0,0,0,0.8);
    }
    .carousel-subtitle {
      font-size: 0.95rem;
      color: #f5f5f5;
      margin-bottom: 18px;
    }
    .carousel {
      position: relative;
      height: 340px;
      overflow: hidden;
      border-radius: 14px;
    }
    .carousel-slide {
      position: absolute;
      inset: 0;
      opacity: 0;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 10px;
      transition: opacity 1s ease-in-out;
      animation: spinCarousel 18s infinite;
    }

    .carousel-slide img {
      width: 100%;
      max-width: 520px;
      height: auto;
      max-height: 75vh;
      object-fit: contain;
      object-position: center;
      border-radius: 12px;
    }

    .carousel-caption {
      margin-top: 10px;
      font-size: 0.95rem;
    }

    /* Carousel fade sequence for 3 slides */
    @keyframes spinCarousel {
      0%   { opacity: 0; }
      6%   { opacity: 1; }
      28%  { opacity: 1; }
      34%  { opacity: 0; }
      100% { opacity: 0; }
    }

    .carousel-slide:nth-child(1) { animation-delay: 0s; }
    .carousel-slide:nth-child(2) { animation-delay: 6s; }
    .carousel-slide:nth-child(3) { animation-delay: 12s; }

    /* Responsive tweaks */
    @media (max-width: 768px) {
      .image-card {
        max-width: 100%;
      }
      .cards {
        flex-direction: column;
        align-items: stretch;
      }
      .card {
        max-width: 100%;
      }
      .carousel {
        height: 320px;
      }
      .carousel-slide img {
        height: 700px;
      }
    }
  </style>
</head>
<body>
  <h1 class="fade-in">Venezuela - Class Showcase</h1>

  <!-- Top Row Images -->
  <div class="image-row fade-in delay-1">
    <div class="image-card img-yellow">
      <img src="https://images.saymedia-content.com/.image/t_share/MTc2MjY4Njg1MjI3NTMzNDg1/the-beautiful-women-of-venezuela.jpg"
           alt="Venezuelan Beauty - Left">
    </div>
    <div class="image-card img-blue">
      <img src="https://prettylatinas.net/wp-content/uploads/2021/07/Venezuelan-Women.jpg"
           alt="Venezuelan Beauty - Center">
    </div>
    <div class="image-card img-red">
      <img src="https://i.etsystatic.com/45917114/r/il/e0ec59/6495407938/il_fullxfull.6495407938_1e2o.jpg"
           alt="Venezuelan Beauty - Right">
    </div>
  </div>

  <!-- AWS Info + Task Cards -->
  <div class="cards fade-in delay-2">
    <div class="card">
      <h3>AWS Instance Details</h3>
      <p><b>Instance Name:</b> <span class="highlight">$hostname_fqdn</span></p>
      <p><b>Private IP:</b> <span class="highlight">$local_ipv4</span></p>
      <p><b>Availability Zone:</b> <span class="highlight">$az</span></p>
      <p><b>VPC ID:</b> <span class="highlight">$vpc</span></p>
    </div>
    <div class="card">
      <h3>Task Deliverables</h3>
      <p><b>Location:</b> <span class="red">Celebrating the vibrant spirit of Venezuela!</span></p>
      <p><b>Highlight:</b> <span class="yellow">Flag Colors: Yellow, Blue, Red</span></p>
      <p><b>Next Lesson:</b> <span class="highlight">Route 53 and ACM</span></p>
    </div>
  </div>

  <!-- Venezuelan Beauty Spotlight Carousel -->
  <div class="carousel-wrapper fade-in delay-3">
    <div class="carousel-title">Venezuelan Beauty Spotlight</div>
    <div class="carousel-subtitle">
      Rotating highlights inspired by the strength, style, and elegance of Venezuela.
    </div>

    <div class="carousel">
      <!-- Slide 1 -->
      <div class="carousel-slide">
        <img src="https://images.saymedia-content.com/.image/t_share/MTc2MjY4Njg1MjI3NTMzNDg1/the-beautiful-women-of-venezuela.jpg"
             alt="Venezuelan Beauty - Classic Elegance">
        <div class="carousel-caption">
          Classic elegance with a <span class="yellow">golden glow</span> of Venezuelan pride.
        </div>
      </div>

      <!-- Slide 2 -->
      <div class="carousel-slide">
        <img src="https://prettylatinas.net/wp-content/uploads/2021/07/Venezuelan-Women.jpg"
             alt="Venezuelan Beauty - Modern Glamour">
        <div class="carousel-caption">
          Modern glamour wrapped in rich <span class="highlight">Caribbean blue</span> vibes.
        </div>
      </div>

      <!-- Slide 3 -->
      <div class="carousel-slide">
        <img src="https://i.etsystatic.com/45917114/r/il/e0ec59/6495407938/il_fullxfull.6495407938_1e2o.jpg"
             alt="Venezuelan Beauty - Bold Style">
        <div class="carousel-caption">
          Bold style and confidence framed in <span class="red">passionate red</span>.
        </div>
      </div>
    </div>
  </div>
</body>
</html>
EOF
