#!/bin/bash
# User data script for EC2 with Apache + metadata HTML

# Update and install Apache
yum update -y
yum install -y httpd -y
systemctl start httpd
systemctl enable httpd

# Get IMDSv2 token
TOKEN=$(curl -s -f -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Fetch metadata
local_ipv4=$(curl -s -f -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/local-ipv4)
az=$(curl -s -f -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/placement/availability-zone)
macid=$(curl -s -f -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/network/interfaces/macs/ | head -n 1)
vpc=$(curl -s -f -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/network/interfaces/macs/${macid}/vpc-id)
hostname_fqdn=$(hostname -f)

# Write HTML file
cat <<EOF > /var/www/html/index.html
<!doctype html>
<html lang="en" class="h-100">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Class 7 - November 1st 2025</title>
  <style>
    body {
      background: url("https://static.vecteezy.com/system/resources/previews/030/638/155/large_2x/flag-wallpaper-of-brazil-free-photo.jpg") no-repeat center center fixed;
      background-size: cover;
      color: #ffffff;
      font-family: Arial, sans-serif;
      text-align: center;
      margin: 0;
      padding: 0;
    }
    h1 {
      color: #ffffff;
      margin-top: 20px;
    }

    /* image row for 3 images */
    .image-row {
      display: flex;
      justify-content: center;
      align-items: center; /* Vertically centers all image-cards */
      gap: 20px;
      flex-wrap: wrap;
      margin: 25px auto 10px auto;
      max-width: 1100px;
      height: 350px; /* consistent height for centering */
    }

    .image-card {
      flex: 1 1 250px;
      max-width: 320px;
      background: rgba(0,0,0,0.4);
      border-radius: 12px;
      padding: 10px;

      /* Added for vertical centering */
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100%;
    }

    .image-card img {
      width: 100%;
      height: auto;
      border-radius: 10px;
      transition: transform 0.3s ease;
    }
    .image-card img:hover {
      transform: scale(1.03);
    }

    /* glows */
    @keyframes blueGlow {
      0%,100% { box-shadow: 0 0 12px rgba(0,168,255,0.6), 0 0 24px rgba(0,168,255,0.4); }
      50%     { box-shadow: 0 0 20px rgba(0,168,255,0.9), 0 0 40px rgba(0,168,255,0.7); }
    }
    @keyframes greenGlow {
      0%,100% { box-shadow: 0 0 12px rgba(0,255,115,0.6), 0 0 24px rgba(0,255,115,0.4); }
      50%     { box-shadow: 0 0 20px rgba(0,255,115,0.9), 0 0 40px rgba(0,255,115,0.7); }
    }
    @keyframes goldPulse {
      0%,100% { box-shadow: 0 0 12px rgba(255,215,0,0.6), 0 0 24px rgba(255,215,0,0.4); }
      50%     { box-shadow: 0 0 20px rgba(255,215,0,0.9), 0 0 40px rgba(255,215,0,0.7); }
    }

    .img-blue  img { animation: blueGlow 3s infinite; }
    .img-green img { animation: greenGlow 3s infinite; }
    .img-gold  img { animation: goldPulse 3s infinite; }

    .cards {
      display: flex;
      justify-content: center;
      gap: 20px;
      flex-wrap: wrap;
      margin: 30px auto;
      max-width: 90%;
    }
    .card {
      background: rgba(0,0,0,0.7);
      border-radius: 12px;
      padding: 20px 30px;
      flex: 1 1 300px;
      max-width: 500px;
      text-align: left;
      transition: transform 0.3s ease;
    }
    .card:hover {
      transform: scale(1.05);
    }
    .card h3 {
      margin-top: 0;
      color: #ffcc00;
      text-align: center;
    }
    .highlight {
      color: #00ffcc;
    }
    .red {
      color: #ff4444;
    }
    .yellow {
      color: #ffeb3b;
    }
    .aws-card {
      animation: goldPulse 3s infinite;
    }
    .deliverables-card {
      animation: redPulse 3s infinite;
    }
    @keyframes redPulse {
      0%,100% { box-shadow: 0 0 12px rgba(255,50,50,0.6), 0 0 24px rgba(255,50,50,0.4); }
      50%     { box-shadow: 0 0 20px rgba(255,50,50,0.9), 0 0 40px rgba(255,50,50,0.7); }
    }
  </style>
</head>
<body>
  <h1>Class 7 - November 1st 2025</h1>

  <!-- 3 images in one row, vertically centered -->
  <div class="image-row">
    <!-- Image 1: blue glow -->
    <div class="image-card img-blue">
      <img src="https://i.pinimg.com/736x/e5/56/67/e5566725cc651f4a14ed54088bfd0e55.jpg" alt="Rio de Janeiro, Brazil - Blue Glow">
    </div>
    <!-- Image 2: green glow (vertically centered) -->
    <div class="image-card img-green">
      <img src="https://i.ytimg.com/vi/urneGmbbxns/hq720.jpg" alt="Brazilian Vibes - Green Glow">
    </div>
    <!-- Image 3: gold glow -->
    <div class="image-card img-gold">
      <img src="https://colorsuper.com/cdn/shop/files/Colorsuper-Bikini-Rio3-Black-Brazilian.jpg?v=1733607695&width=1500" alt="Brazilian Style - Gold Glow">
    </div>
  </div>

  <div class="cards">
    <div class="card aws-card">
      <h3>AWS Instance Details</h3>
      <p><b>Instance Name: <span class="highlight">$hostname_fqdn</span></b></p>
      <p><b>Instance Private IP Address: <span class="highlight">$local_ipv4</span></b></p>
      <p><b>Availability Zone: <span class="highlight">$az</span></b></p>
      <p><b>Virtual Private Cloud (VPC): <span class="highlight">$vpc</span></b></p>
    </div>
    <div class="card deliverables-card">
      <h3>Task Deliverables</h3>
      <p><b>Location: <span class="red">I found my wives in Sao Paulo, Brazil!</span></b></p>
      <p><b>Names: <span class="red">Who Cares What Their Names Are</span></b></p>
      <p><b>Next Lesson: <span class="yellow">Launch Templates and Autoscaling Policies</span></b></p>
    </div>
  </div>
</body>
</html>
EOF
