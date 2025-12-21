# 🌐 HTTP / HTTPS Web Server | AWS ALB + Route 53 + Terraform  

![Status](https://img.shields.io/badge/Status-Production_Ready-brightgreen)
![AWS](https://img.shields.io/badge/Cloud-AWS-orange)
![Terraform](https://img.shields.io/badge/IaC-Terraform_1.x-purple)
![LoadBalancer](https://img.shields.io/badge/ELB-Application_Load_Balancer-blue)
![Route53](https://img.shields.io/badge/DNS-Route53-yellow)
![ACM](https://img.shields.io/badge/SSL-ACM_Certificate-red)
![HTTPS](https://img.shields.io/badge/Port-443-green)
![Global](https://img.shields.io/badge/Regions-MultiCountry-black)

---

## 1️⃣ Project Overview 🚀

### This project deploys a **high-availability global web system** using

- 🌐 **AWS Application Load Balancer (HTTPS)**  
- 🧭 **Route 53 DNS domain routing**  
- 🔐 **ACM SSL Certificate**  
- 📈 **Auto Scaling** EC2 instances  
- 🌍 Themed country webservers (Hungary 🇭🇺 & Japan 🇯🇵)

### Each web server includes

- 🖼️ Dynamic image slideshows  
- 🧾 EC2 metadata cards  
- 🎨 National-themed UI  
- 🎵 Integrated YouTube music playback  

**Infrastructure is fully automated with Terraform.**

---

## 2️⃣ Port 443 / Port 80 Demo 🎬

### 🔒 **Port 443 (HTTPS) Demo**

<https://github.com/user-attachments/assets/ec5407c0-a211-4b40-a5c7-4020fb82a97e>

---

### 🌍 **Port 80 (HTTP) Demo**

![hungary-az1.jpg](/Screenshots/hungary-az1.jpg)  
![hungary-az2.jpg](/Screenshots/hungary-az2.jpg)  
![hungary-az3.jpg](/Screenshots/hungary-az3.jpg)  

---

## 3️⃣ Project Structure 📁

```plaintext
assignment-12162025/
├── 0-authentication.tf
├── 1-vpc.tf
├── 2-subnets.tf
├── 3-igw.tf
├── 4-nat.tf
├── 5-rtb.tf
├── 6a-webserver-sg.tf
├── 6b-lb-sg.tf
├── 7-instances.tf
├── 8-target-groups.tf
├── 9-load-balancer.tf
├── 10-autoscale-policy.tf
├── 11-launch-template.tf
├── 12-sns.tf
├── 13-key.tf
├── 14-route53.tf
│
├── A-backend.tf
├── B-output.tf
│
├── hungary.sh 🇭🇺
└── japan.sh 🇯🇵
```

---

## 4️⃣ Deployment Steps ⚙️

### Step 1 — Initialize, Validate & Format Terraform 🛠️

```bash
terraform init
terraform validate
terraform fmt
```

![terraform-init-validate-fmt.jpg](/Screenshots/terraform-init-validate-fmt.jpg)

---

### Step 2 — Preview Changes 🔍

```bash
terraform plan
```

![terraform-plan.jpg](/Screenshots/terraform-plan.jpg)

---

### Step 3 — Deploy Infrastructure 🚀

```bash
terraform apply -auto-approve
```

![terraform-apply.jpg](/Screenshots/terraform-apply.jpg)

---

### ✔️ This deployment includes

1. 🌐 **VPC**  
2. 🌍 **Subnets**  
3. 🚪 **Internet Gateway**  
4. 🌉 **NAT Gateway**  
5. 🛣️ **Route Tables**  
6. 🔐 **Security Groups (Web + ALB)**  
7. 📦 **Launch Template**  
8. 📈 **Auto Scaling Group**  
9. ⚖️ **Application Load Balancer (HTTPS + redirect)**  
10. 🎯 **Target Groups**  
11. 🔔 **SNS Notifications**  
12. 🔒 **ACM SSL Certificate**  

---

## 5️⃣ HTTPS + Route 53 Notes 🌐🔐

### ACM Certificate (SSL) 🔒

Your certificate must match:

![acm-pt1.jpg](/Screenshots/acm-pt1.jpg)
![acm-pt2.jpg](/Screenshots/acm-pt2.jpg)

---

### Route 53 A Records 🧭

Terraform automatically creates:

- 🅰️ **A (Alias → ALB)**  

Ensure:

- Hosted zone name matches certificate  
- ALB region matches certificate region  

![route53-a-record.jpg](/Screenshots/route53-a-record.jpg)

---

## 6️⃣ Country Theme Scripts 🇭🇺🇯🇵

Each script:

- 📦 Installs Apache  
- 🧑‍💻 Deploys custom themed HTML  
- 🛰 Injects EC2 metadata  
- 🖼️ Creates a slideshow  
- 🎵 Adds YouTube music player  

### 🇭🇺 `hungary.sh` — Hungary Theme  

```bash
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
```

### 🇯🇵 `japan.sh` — Japan Theme  

```bash
#!/bin/bash
# User data script for EC2 with Apache + metadata HTML (Ethiopia Edition)

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
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Japan - Port 443 - HTTPS</title>

  <style>
    :root {
      --jp-black: #0b0b0b;
      --jp-white: #ffffff;
      --jp-red: #bc002d;

      --radius: 18px;
      --border: 14px;

      --glass: rgba(0, 0, 0, 0.55);
      --line: rgba(255, 255, 255, 0.14);
      --glow: rgba(188, 0, 45, 0.55);
    }

    * { box-sizing: border-box; }
    html, body { height: 100%; }

    body {
      margin: 0;
      font-family: system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif;
      color: #fff;
      overflow-x: hidden;
      background:
        linear-gradient(0deg, rgba(0,0,0,.55), rgba(0,0,0,.55)),
        url("https://wallpapers.com/images/hd/gray-cloth-of-a-japan-flag-db4mw9wdyh7ht1ay.jpg")
          center/cover no-repeat fixed;
    }

    h1 {
      margin-top: 20px;
      letter-spacing: 1px;
      text-shadow: 0 0 10px rgba(0,0,0,0.9);
    }

    .frame {
      position: relative;
      width: min(1200px, calc(100vw - 28px));
      height: min(720px, calc(100vh - 28px));
      margin: 14px auto;
      border-radius: var(--radius);
      padding: var(--border);
      filter: drop-shadow(0 18px 45px rgba(0,0,0,.55));
      isolation: isolate;
    }

    .frame::before {
      content: "";
      position: absolute;
      inset: 0;
      border-radius: var(--radius);
      background: linear-gradient(90deg, var(--jp-black), var(--jp-white), var(--jp-red));
      z-index: 0;
      opacity: .95;
    }

    .frame::after {
      content: "";
      position: absolute;
      inset: 0;
      border-radius: var(--radius);
      pointer-events: none;
      animation: borderFlash 5s steps(1,end) infinite;
    }

    @keyframes borderFlash {
      0%, 92% { box-shadow: none; }
      93%, 97% { box-shadow: 0 0 22px var(--glow); }
      98%, 100% { box-shadow: none; }
    }

    .stage {
      position: relative;
      width: 100%;
      height: 100%;
      border-radius: calc(var(--radius) - var(--border));
      background: rgba(0,0,0,.25);
      backdrop-filter: blur(6px);
      overflow: hidden;
      z-index: 1;
    }

    .strip {
      position: absolute;
      z-index: 3;
      overflow: hidden;
      pointer-events: none;
      background: rgba(0,0,0,.40);
      border: 1px solid var(--line);
      backdrop-filter: blur(4px);
    }

    .top, .bottom {
      left: 10px;
      right: 10px;
      height: 44px;
      border-radius: 999px;
      display: flex;
      align-items: center;
    }
    .top { top: 10px; }
    .bottom { bottom: 10px; }

    .left, .right {
      top: 10px;
      bottom: 10px;
      width: 44px;
      border-radius: 999px;
    }
    .left { left: 10px; }
    .right { right: 10px; }

    .lane {
      display: flex;
      align-items: center;
      gap: 18px;
      white-space: nowrap;
      font-weight: 900;
      letter-spacing: 1.6px;
      text-transform: uppercase;
      font-size: 12px;
      padding: 0 14px;
      opacity: .96;
    }

    .pill {
      display: inline-flex;
      align-items: center;
      gap: 10px;
      padding: 6px 12px;
      border-radius: 999px;
      background: rgba(0,0,0,.35);
      border: 1px solid rgba(255,255,255,.10);
    }

    .dot {
      width: 8px;
      height: 8px;
      border-radius: 50%;
      background: var(--jp-red);
      box-shadow: 0 0 10px rgba(188,0,45,.55);
      display: inline-block;
    }

    .moveX { animation: moveX 50s linear infinite; padding-left: 100%; }

    @keyframes moveX {
      0% { transform: translateX(0); }
      100% { transform: translateX(-100%); }
    }

    .vwrap {
      position: absolute;
      inset: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      overflow: hidden;
    }

    .moveY { animation: moveY 23s linear infinite; padding-left: 100%; }

    @keyframes moveY {
      0% { transform: rotate(90deg) translateX(0); }
      100% { transform: rotate(90deg) translateX(-100%); }
    }

    .content {
      position: absolute;
      top: 76px;
      left: 66px;
      right: 66px;
      bottom: 92px;
      border-radius: 14px;
      background: linear-gradient(180deg, rgba(0,0,0,.55), rgba(0,0,0,.35));
      padding: 18px;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .slideshow {
      position: relative;
      width: 100%;
      height: 100%;
      border-radius: 14px;
      overflow: hidden;
      border: 1px solid rgba(255,255,255,.12);
      background: rgba(0,0,0,.45);
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .slide {
      position: absolute;
      inset: 14px;
      width: calc(100% - 28px);
      height: calc(100% - 28px);
      object-fit: contain;
      border-radius: 12px;
      opacity: 0;
      transition: opacity 900ms ease;
      outline: 1px solid rgba(255,255,255,.08);
      background: rgba(0,0,0,.25);
    }

    .slide.active { opacity: 1; }

    .controls {
      position: absolute;
      left: 0;
      right: 0;
      bottom: 16px;
      z-index: 4;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .btn {
      border: none;
      border-radius: 999px;
      padding: 10px 16px;
      font-weight: 900;
      cursor: pointer;
      background: linear-gradient(
        90deg,
        rgba(11, 11, 11, .85),
        rgba(255, 255, 255, .75),
        rgba(188, 0, 45, .85)
      );
      color: #111;
    }

    .btn:disabled {
      opacity: .7;
      cursor: not-allowed;
    }

    #ytWrap { position: absolute; width: 1px; height: 1px; overflow: hidden; left: -9999px; }

    .cards {
      width: min(1200px, calc(100vw - 28px));
      margin: 28px auto 40px;
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
      gap: 16px;
      padding: 0 14px;
    }

    .card {
      background: rgba(0,0,0,.45);
      border: 1px solid rgba(255,255,255,.12);
      border-radius: 14px;
      padding: 16px;
      backdrop-filter: blur(6px);
    }

    .card h3 { margin: 0 0 10px; font-size: 16px; }
    .card p { margin: 6px 0; font-size: 13px; line-height: 1.35; }

    .highlight { color: #fff; font-weight: 900; }

    .jp-red { color: var(--jp-red); font-weight: 900; }
    .jp-white { color: #fff; font-weight: 900; }
    .jp-black { color: #d9d9d9; font-weight: 900; }
  </style>
</head>

<body>

  <h1 class="fade-in"><center>Japan - Port 443 - HTTPS</center></h1>

  <div class="frame">
    <div class="stage">
      <div class="strip top"><div class="lane moveX" id="laneTop"></div></div>
      <div class="strip bottom"><div class="lane moveX" id="laneBottom"></div></div>

      <div class="strip left">
        <div class="vwrap"><div class="lane moveY" id="laneLeft"></div></div>
      </div>

      <div class="strip right">
        <div class="vwrap"><div class="lane moveY" id="laneRight"></div></div>
      </div>

      <div class="content">
        <div class="slideshow" id="slideshow">
          <img class="slide active" id="slide0" alt="Slide 1" />
          <img class="slide" id="slide1" alt="Slide 2" />
          <img class="slide" id="slide2" alt="Slide 3" />
        </div>
      </div>

      <div class="controls">
        <button class="btn" id="playBtn" type="button">Play Music</button>
      </div>

      <div id="ytWrap" aria-hidden="true"><div id="ytPlayer"></div></div>
    </div>
  </div>

  <div class="cards">
    <div class="card">
      <h3>AWS Instance Details</h3>
      <p><b>Instance Name:</b> <span class="highlight">${hostname_fqdn}</span></p>
      <p><b>Private IP:</b> <span class="highlight">${local_ipv4}</span></p>
      <p><b>Availability Zone:</b> <span class="highlight">${az}</span></p>
      <p><b>VPC ID:</b> <span class="highlight">${vpc}</span></p>
    </div>

    <div class="card">
      <h3>Task Deliverables</h3>
      <p><b>Location:</b> <span class="jp-red">Celebrating the spirit of Japan</span></p>
      <p><b>Highlight:</b> <span class="jp-white">Red • White • Minimalism</span></p>
      <p><b>Next Lesson:</b> <span class="jp-black">WAF and Jenkins</span></p>
    </div>
  </div>

  <script>
    const messages = [
      "Location: Japan • AWS Region • 日本 (Nihon)",
      "Reason: Celebrating Japanese culture, tradition, and precision",
      "Highlight: Red • White • Minimalism",
      "Next Lesson: WAF • Jenkins • Security Automation"
    ];

    const lanes = {
      top: document.getElementById("laneTop"),
      right: document.getElementById("laneRight"),
      bottom: document.getElementById("laneBottom"),
      left: document.getElementById("laneLeft")
    };

    function build(text) {
      return \`<span class="pill"><span class="dot"></span>\${text}<span class="dot"></span></span>\`.repeat(8);
    }

    let borderIdx = 0;
    function rotateBorder() {
      lanes.top.innerHTML = build(messages[(0 + borderIdx) % 4]);
      lanes.right.innerHTML = build(messages[(1 + borderIdx) % 4]);
      lanes.bottom.innerHTML = build(messages[(2 + borderIdx) % 4]);
      lanes.left.innerHTML = build(messages[(3 + borderIdx) % 4]);
      borderIdx = (borderIdx + 1) % 4;
    }

    rotateBorder();
    setInterval(rotateBorder, 5000);

    const slideUrls = [
      "https://i.ebayimg.com/images/g/5OkAAOSwTnpmC4Xb/s-l1200.jpg",
      "https://i.ebayimg.com/images/g/QNwAAOSw7EhnwEFd/s-l1200.jpg",
      "https://i.bosity.com/product_img/260/71022304/71022304_9_image.jpg"
    ];

    const slideEls = [
      document.getElementById("slide0"),
      document.getElementById("slide1"),
      document.getElementById("slide2")
    ];

    slideEls.forEach((el, i) => { el.src = slideUrls[i]; });

    let active = 0;
    setInterval(() => {
      const next = (active + 1) % slideEls.length;
      slideEls[active].classList.remove("active");
      slideEls[next].classList.add("active");
      active = next;
    }, 5000);

    const videoId = "phhUFZ12zxg";
    let player = null;
    let ready = false;

    function loadYT() {
      return new Promise((resolve, reject) => {
        if (window.YT && window.YT.Player) return resolve();

        const existing = document.querySelector('script[src="https://www.youtube.com/iframe_api"]');
        if (existing) {
          const wait = setInterval(() => {
            if (window.YT && window.YT.Player) {
              clearInterval(wait);
              resolve();
            }
          }, 100);
          setTimeout(() => { clearInterval(wait); reject(new Error("YT API load timeout")); }, 8000);
          return;
        }

        const s = document.createElement("script");
        s.src = "https://www.youtube.com/iframe_api";
        document.head.appendChild(s);

        window.onYouTubeIframeAPIReady = () => resolve();
        setTimeout(() => reject(new Error("YT API load timeout")), 8000);
      });
    }

    function toggle() {
      const btn = document.getElementById("playBtn");
      const state = player.getPlayerState();

      if (state === 1) {
        player.pauseVideo();
        btn.textContent = "Play Music";
        return;
      }

      player.mute();
      player.playVideo();
      setTimeout(() => player.unMute(), 600);
      btn.textContent = "Pause Music";
    }

    document.getElementById("playBtn").addEventListener("click", async () => {
      const btn = document.getElementById("playBtn");
      btn.disabled = true;
      btn.textContent = "Loading...";

      try {
        if (!player) {
          await loadYT();
          player = new YT.Player("ytPlayer", {
            videoId,
            playerVars: { autoplay: 0, controls: 0, loop: 1, playlist: videoId },
            events: { onReady: () => (ready = true) }
          });
        }

        const waitUntilReady = () => new Promise((res, rej) => {
          const started = Date.now();
          (function check() {
            if (ready) return res();
            if (Date.now() - started > 6000) return rej(new Error("Player not ready"));
            setTimeout(check, 100);
          })();
        });

        await waitUntilReady();
        btn.disabled = false;
        toggle();
      } catch (e) {
        btn.disabled = false;
        btn.textContent = "Play Music";
        console.log("Music load failed:", e);
        alert("Music could not load (YouTube blocked or no outbound internet).");
      }
    });
  </script>
</body>
</html>
EOF
```

---

## 7️⃣ Screenshots — 📸 Show Your Work

| Feature      | Screenshot                                                           |
|--------------|----------------------------------------------------------------------|
| SNS          | ![sns-pt1.jpg](/Screenshots/sns-pt1.jpg)                             |
| SNS          | ![sns-pt2.jpg](/Screenshots/sns-pt2.jpg)                             |
| SNS          | ![sns-pt3.jpg](/Screenshots/sns-pt3.jpg)                             |
| SNS          | ![sns-pt4.jpg](/Screenshots/sns-pt4.jpg)                             |
| Instances    | ![instances.jpg](/Screenshots/instances.jpg)                         |
| ASG          | ![autoscaling-group-pt1.jpg](/Screenshots/autoscaling-group-pt1.jpg) |
| ASG          | ![autoscaling-group-pt2.jpg](/Screenshots/autoscaling-group-pt2.jpg) |
| ALB          | ![load-balancer-pt1.jpg](/Screenshots/load-balancer-pt1.jpg)         |
| ALB          | ![load-balancer-pt2.jpg](/Screenshots/load-balancer-pt2.jpg)         |
| ALB          | ![load-balancer-pt3.jpg](/Screenshots/load-balancer-pt3.jpg)         |
| ALB          | ![load-balancer-pt4.jpg](/Screenshots/load-balancer-pt4.jpg)         |
| TargetGroup  | ![target-group-pt1.jpg](/Screenshots/target-group-pt1.jpg)           |
| TargetGroup  | ![target-group-pt2.jpg](/Screenshots/target-group-pt2.jpg)           |

---

## 8️⃣ Troubleshooting 🔧

### 🔒 HTTPS Not Working?

- Certificate not validated  
- Certificate issued in wrong region  
- ALB HTTPS listener not configured or misconfigured  
- Route 53 alias pointing to wrong ALB or region  

---

### ⚠️ ALB Shows **503**

- Instances are failing health checks  
- Target group port does not match Apache port (default: 80)  
- Instance security group does not allow traffic from ALB security group  

---

### 🧩 Terraform State Errors

- Backend S3 bucket missing or not configured  
- DynamoDB lock table missing or contains stale lock entries  
- AWS credentials expired or wrong profile in use  

---

### 🎵 Music Player Not Working

- YouTube API script blocked by browser or network  
- Autoplay blocked; user must click Play first  
- YouTube video ID removed or changed  

---

## 9️⃣ Teardown 🧹

Destroy infrastructure created by Terraform:

```bash
terraform destroy -auto-approve
```

![terraform-destroy.jpg](/Screenshots/terraform-destroy.jpg)

Then manually clean up if applicable:

- 🪣 S3 backend bucket  
- 🔐 ACM certificates no longer in use  
- 🧭 Route 53 hosted zone (if you no longer need the domain)  

---

## 🔟 Authors & Acknowledgments ✍️

- **Author:** T.I.Q.S  
- **Group Leader:** John Sweeney  

---
