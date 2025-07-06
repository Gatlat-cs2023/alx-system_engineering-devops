# 0x0F. Load Balancer

This project focuses on setting up a load balancer and managing web servers using Nginx and HAProxy. It also emphasizes automation using Bash scripts and Puppet to ensure server consistency and easy scaling.

---

## 📌 Tasks

### 0. Double the number of webservers
**File:** `0-custom_http_response_header`  
Configures an Ubuntu server to:
- Install Nginx
- Add a custom HTTP response header `X-Served-By: <hostname>`
- Restart Nginx to apply the change

Used to help track which web server responds to a given HTTP request when behind a load balancer.

---

### 1. Install your load balancer
**File:** `1-install_load_balancer`  
Sets up a server with HAProxy to:
- Load balance traffic between two web servers
- Use the roundrobin algorithm for fair request distribution
- Manage HAProxy with init system
- Load balancer listens on port `80` and forwards requests to `web-01` and `web-02`

---

### 2. Add a custom HTTP header with Puppet
**File:** `2-puppet_custom_http_response_header.pp`  
Puppet manifest that:
- Installs Nginx
- Adds the `X-Served-By` HTTP header with the server's hostname
- Ensures Nginx service is enabled and running

This task automates the same behavior as Task 0, but using Puppet for declarative configuration.

---

## 🛠 Technologies Used

- Ubuntu 20.04 LTS (or later)
- Nginx (web server)
- HAProxy (load balancer)
- Puppet (infrastructure automation)
- Bash (scripting)

---

## 🧪 Example Usage

Check which web server served your request:
```bash
curl -sI http://<server-ip> | grep X-Served-By
```

---

Test load balancing:
```bash
while true; do curl -sI http://<load-balancer-ip> | grep X-Served-By; sleep 1; done
```

## 👤 Author

### Gatlat Both

ALX Backend Engineer | [GitHub](https://github.com/Gatlat-cs2023/)
