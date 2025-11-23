#!/bin/bash
# User data script for EC2 with Apache + metadata HTML (Panama Edition)

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
  <title>Panama - Class Showcase</title>
  <style>
    body {
      background: url("https://images.pond5.com/panama-flag-animated-background-3d-footage-229465824_iconl.jpeg") no-repeat center center fixed;
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

    .image-row {
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 20px;
      flex-wrap: wrap;
      margin: 25px auto 10px auto;
      max-width: 1100px;
      height: 350px;
    }

    .image-card {
      flex: 1 1 250px;
      max-width: 320px;
      background: rgba(0,0,0,0.4);
      border-radius: 12px;
      padding: 10px;
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

    @keyframes blueGlow {
      0%,100% { box-shadow: 0 0 12px rgba(0,0,255,0.6), 0 0 24px rgba(0,0,255,0.4); }
      50%     { box-shadow: 0 0 20px rgba(0,0,255,0.9), 0 0 40px rgba(0,0,255,0.7); }
    }
    @keyframes redGlow {
      0%,100% { box-shadow: 0 0 12px rgba(255,0,0,0.6), 0 0 24px rgba(255,0,0,0.4); }
      50%     { box-shadow: 0 0 20px rgba(255,0,0,0.9), 0 0 40px rgba(255,0,0,0.7); }
    }
    @keyframes whiteGlow {
      0%,100% { box-shadow: 0 0 12px rgba(255,255,255,0.6), 0 0 24px rgba(255,255,255,0.4); }
      50%     { box-shadow: 0 0 20px rgba(255,255,255,0.9), 0 0 40px rgba(255,255,255,0.7); }
    }

    .img-blue img { animation: blueGlow 3s infinite; }
    .img-red img  { animation: redGlow 3s infinite; }
    .img-white img { animation: whiteGlow 3s infinite; }

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
    .card:hover { transform: scale(1.05); }
    .card h3 { margin-top: 0; color: #ffcc00; text-align: center; }
    .highlight { color: #00ffff; }
    .red { color: #ff4444; }
    .yellow { color: #ffeb3b; }
  </style>
</head>
<body>
  <h1>Panama - Class Showcase</h1>

  <div class="image-row">
    <div class="image-card img-blue">
      <img src="https://womanate.com/wp-content/uploads/2023/04/WATE_Panamanian3.jpg" alt="Left - Panamanian Beauty">
    </div>
    <div class="image-card img-white">
      <img src="https://onlineforlove.com/wp-content/uploads/2020/04/image-281.jpg" alt="Center - Couple Vibes">
    </div>
    <div class="image-card img-red">
      <img src="https://www.juliemhill.com/wp-content/uploads/2025/05/Panama-Brides-e1747221281194.jpg" alt="Right - Tropical Mood">
    </div>
  </div>

  <div class="cards">
    <div class="card">
      <h3>AWS Instance Details</h3>
      <p><b>Instance Name:</b> <span class="highlight">$hostname_fqdn</span></p>
      <p><b>Private IP:</b> <span class="highlight">$local_ipv4</span></p>
      <p><b>Availability Zone:</b> <span class="highlight">$az</span></p>
      <p><b>VPC ID:</b> <span class="highlight">$vpc</span></p>
    </div>
    <div class="card">
      <h3>Task Deliverables</h3>
      <p><b>Location:</b> <span class="red">Enjoying the tropical vibes in Panama!</span></p>
      <p><b>Highlight:</b> <span class="yellow">Flag Colors: Red, White, Blue</span></p>
      <p><b>Next Lesson:</b> <span class="highlight">Route 53 and ACM</span></p>
    </div>
  </div>
</body>
</html>
EOF
