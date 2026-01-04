# php74-mysql-docker-mailserver
Why this works:  php74 → PHP version  mysql → MySQL included  docker → Docker setup  mailserver → Your project folder / PHPMailer focus



**Build & Run Containers**
docker-compose down
docker-compose up -d --build


**Access Services**

PHP Web: http://localhost:8080 or http://<PC_IP>:8080 from Wi-Fi

phpMyAdmin: http://localhost:8081 or http://<PC_IP>:8081
Login: Server=db, User=testuser, Password=testpass


**Composer & PHPMailer**
docker exec -it php74_web composer require phpmailer/phpmailer -d /var/www/html/mailserver

**PHP CLI Usage**
docker exec -it php74_web bash

**MySQL Access**
docker exec -it mysql_db mysql -u root -p root


**Verify**
# PHP version
docker exec -it php74_web php -v

# PHP extensions
docker exec -it php74_web php -m | grep mysqli

# Composer version
docker exec -it php74_web composer --version

# Notes

Ports: 8080 → PHP, 8081 → phpMyAdmin, 3306 → MySQL

Use __DIR__ for autoload paths

Always rebuild after Dockerfile changes: docker-compose up -d --build

Start the server
Step 1: Open CMD / Terminal

Navigate to your project folder:

cd D:\dockers\php74-docker

Step 2: Build and start containers
docker-compose up -d --build


up → starts the containers

-d → detached mode (runs in background)

--build → rebuilds Dockerfile if changed

Step 3: Verify containers are running
docker ps

# ========================================================================
1️⃣ Start the server
Step 1: Open CMD / Terminal

Navigate to your project folder:

cd D:\dockers\php74-docker

Step 2: Build and start containers
docker-compose up -d --build


up → starts the containers

-d → detached mode (runs in background)

--build → rebuilds Dockerfile if changed

Step 3: Verify containers are running
docker ps


You should see:

2️⃣ Stop the server
Option 1: Stop without removing containers
docker-compose stop


Keeps containers on disk (so next start is faster)

Ports are freed

Option 2: Stop and remove containers
docker-compose down


Stops containers and deletes them

Keeps volumes (db_data) unless you add -v

Verify containers stopped
docker ps -a

All web, db, phpmyadmin containers should be Exited

3️⃣ Restart the server

If already built:

docker-compose start


Or rebuild (after Dockerfile changes):

docker-compose up -d --build

4️⃣ Access services after start
Service	URL
PHP Web	http://localhost:8080
 (or http://<PC_IP>:8080 from Wi-Fi)
phpMyAdmin	http://localhost:8081
 (or http://<PC_IP>:8081)
MySQL CLI	docker exec -it mysql_db mysql -u testuser -p
✅ Quick Reference Commands
Action	Command
Start & build	docker-compose up -d --build
Start existing	docker-compose start
Stop (keep containers)	docker-compose stop
Stop & remove	docker-compose down
Check running	docker ps
Check all	docker ps -a
