# Simple Web Infrastructure Design

## Description
A one-server web infrastructure hosting `www.foobar.com` using:
- 1 physical/virtual server
- 1 web server (Nginx)
- 1 application server
- 1 database (MySQL)
- 1 domain name configured with `www` record pointing to server IP `8.8.8.8`

## Components

### 1. Server
A server is a computer (physical or virtual) that provides services to clients. In this infrastructure, it runs:
- Linux OS
- Nginx (web server)
- Application server (e.g., Gunicorn/PHP-FPM)
- MySQL (database)

### 2. Domain Name (foobar.com)
- Human-readable address pointing to server IP (`8.8.8.8`)
- `www.foobar.com` uses either:
  - **A record**: Directly points to IP `8.8.8.8`
  - **CNAME record**: Alias pointing to `foobar.com`

### 3. Web Server (Nginx)
- Handles HTTP/HTTPS requests
- Serves static files (HTML, CSS, images)
- Acts as reverse proxy for dynamic content (forwards requests to application server)

### 4. Application Server
- Processes dynamic content (e.g., PHP/Python code)
- Communicates with database when needed
- Returns processed data to web server

### 5. Database (MySQL)
- Stores and manages website data (users, posts, etc.)
- Accessed by application server via queries

### 6. Communication Protocol
- Uses **HTTP/HTTPS** over **TCP/IP**
- User connects to server via port 80 (HTTP) or 443 (HTTPS)

## Infrastructure Issues

### 1. Single Point of Failure (SPOF)
- Entire website goes down if:
  - Server crashes
  - Database fails
  - Network connection is lost

### 2. Downtime During Maintenance
- Requires restarting services for updates
- Causes temporary unavailability

### 3. Scaling Limitations
- Cannot handle high traffic due to:
  - Limited server resources (CPU/RAM)
  - No load balancing

### 4. Security Risks
- All components on one server
- Compromising one service risks entire system

## Diagram
![Simple Web Stack Diagram](0-simple_web_stack.png)
*(Diagram shows user → DNS → single server with Nginx, App Server, and MySQL)*