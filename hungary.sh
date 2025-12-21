#!/bin/bash
# User data script for EC2 with Apache + metadata HTML (Hungary Edition)

set -euo pipefail

# Update and install Apache
yum update -y
yum install -y httpd
systemctl enable httpd
systemctl start httpd

# Get IMDSv2 token (fallback-safe)
TOKEN="$(curl -sS -m 3 -f -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600" || true)"

imds_get () {
  local path="$1"
  if [[ -n "${TOKEN}" ]]; then
    curl -sS -m 3 -f -H "X-aws-ec2-metadata-token: ${TOKEN}" \
      "http://169.254.169.254/latest/${path}" || true
  else
    curl -sS -m 3 -f "http://169.254.169.254/latest/${path}" || true
  fi
}

# Fetch metadata
local_ipv4="$(imds_get meta-data/local-ipv4)"
az="$(imds_get meta-data/placement/availability-zone)"
macid="$(imds_get meta-data/network/interfaces/macs/ | head -n 1 | tr -d '/')"
vpc=""
if [[ -n "${macid}" ]]; then
  vpc="$(imds_get meta-data/network/interfaces/macs/${macid}/vpc-id)"
fi
hostname_fqdn="$(hostname -f 2>/dev/null || hostname)"

# Write HTML file
cat <<EOF > /var/www/html/index.html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Hungary - Port 80 - HTTP</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <style>
    :root {
      --hun-red: #cd2a3e;
      --hun-white: #ffffff;
      --hun-green: #436f4d;
    }

    body {
      margin: 0;
      font-family: system-ui, Arial, sans-serif;
      color: white;
      background:
        linear-gradient(rgba(0,0,0,.6), rgba(0,0,0,.6)),
        url("https://wallpapercave.com/wp/wp4211067.jpg")
        center/cover no-repeat fixed;
    }

    h1 {
      margin-top: 20px;
      letter-spacing: 1px;
      text-shadow: 0 0 10px rgba(0,0,0,0.9);
    }

    .frame {
      max-width: 1200px;
      margin: 20px auto;
      padding: 20px;
      border-radius: 18px;
      background: linear-gradient(
        90deg,
        var(--hun-red),
        var(--hun-white),
        var(--hun-green)
      );
    }

    .stage {
      background: rgba(0,0,0,.6);
      border-radius: 14px;
      padding: 20px;
    }

    .slideshow {
      position: relative;
      height: 420px;
      overflow: hidden;
      border-radius: 12px;
    }

    .slide {
      position: absolute;
      inset: 0;
      width: 100%;
      height: 100%;
      object-fit: contain;
      opacity: 0;
      transition: opacity 1s ease;
    }

    .slide.active {
      opacity: 1;
    }

    .cards {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
      gap: 16px;
      margin-top: 24px;
    }

    .card {
      background: rgba(0,0,0,.55);
      border-radius: 12px;
      padding: 16px;
    }

    h3 {
      margin-top: 0;
    }

    .btn {
      margin-top: 16px;
      padding: 10px 18px;
      border-radius: 999px;
      border: none;
      font-weight: bold;
      cursor: pointer;
      background: linear-gradient(
        90deg,
        var(--hun-red),
        var(--hun-white),
        var(--hun-green)
      );
      color: #111;
    }

    .center-btn {
      display: flex;
      justify-content: center;
      margin-top: 20px;
    }

    #ytWrap {
      position: absolute;
      left: -9999px;
      width: 1px;
      height: 1px;
      overflow: hidden;
    }
  </style>
</head>

<body>

  <h1 class="fade-in"><center>Hungary - Port 80 - HTTP</center></h1>

  <div class="frame">
    <div class="stage">

      <div class="slideshow">
        <img class="slide active" id="slide0">
        <img class="slide" id="slide1">
        <img class="slide" id="slide2">
      </div>

      <!-- Centered Play Button -->
      <div class="center-btn">
        <button class="btn" id="playBtn">Play Music</button>
      </div>

      <div class="cards">
        <div class="card">
          <h3>AWS Instance Details</h3>
          <p><b>Instance:</b> ${hostname_fqdn}</p>
          <p><b>Private IP:</b> ${local_ipv4}</p>
          <p><b>AZ:</b> ${az}</p>
          <p><b>VPC:</b> ${vpc}</p>
        </div>

        <div class="card">
          <h3>Task Deliverables</h3>
          <p><b>Location:</b> Hungary 🇭🇺</p>
          <p><b>Theme:</b> Red • White • Green</p>
          <p><b>Next:</b> WAF and Jenkins</p>
        </div>
      </div>

      <div id="ytWrap"><div id="ytPlayer"></div></div>

    </div>
  </div>

  <script>
    // Slideshow
    const images = [
      "https://cupidbrides.com/wp-content/uploads/2021/06/hungarian-women.jpg",
      "https://pannonland.com/wp-content/uploads/2021/11/FGP0907mh-scaled.jpg",
      "https://pbs.twimg.com/media/DiH39JKU8AICKWT.jpg"
    ];

    const slides = [
      document.getElementById("slide0"),
      document.getElementById("slide1"),
      document.getElementById("slide2")
    ];

    slides.forEach((s, i) => s.src = images[i]);

    let index = 0;
    setInterval(() => {
      slides[index].classList.remove("active");
      index = (index + 1) % slides.length;
      slides[index].classList.add("active");
    }, 5000);

    // Music (YouTube)
    const videoId = "_3X7nOvkWJQ";
    let player, ready = false;

    function loadYT() {
      return new Promise(resolve => {
        if (window.YT) return resolve();
        const s = document.createElement("script");
        s.src = "https://www.youtube.com/iframe_api";
        document.head.appendChild(s);
        window.onYouTubeIframeAPIReady = resolve;
      });
    }

    document.getElementById("playBtn").onclick = async () => {
      if (!player) {
        await loadYT();
        player = new YT.Player("ytPlayer", {
          videoId,
          events: { onReady: () => ready = true }
        });
      }
      if (!ready) return;
      player.playVideo();
    };
  </script>
</body>
</html>
EOF