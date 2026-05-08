# ATutor OSWE Docker

Docker configuration for running ATutor in a local OSWE-style practice environment.

> This project is intended for educational and authorized security research purposes only.

---

## Overview

This repository provides a reproducible Docker environment for running ATutor using:

- PHP 5.6
- Apache
- MySQL
- Docker Compose

The environment is designed for:
- OSWE preparation
- Web exploitation practice
- Source code review
- Vulnerability research
- Legacy PHP application testing

---

## Vulnerable Application

This lab is intended to be used with the vulnerable ATutor application associated with the following public exploit:

- ATutor 2.2.1 - SQL Injection / Remote Code Execution
  [Exploit-DB 39514](https://www.exploit-db.com/exploits/39514)

The environment is useful for practicing:
- Authentication bypass
- SQL injection
- Arbitrary file upload
- File inclusion
- Source code auditing
- Legacy PHP exploitation

---

## Features

- Dockerized ATutor environment
- PHP 5.6 + Apache
- MySQL with query logging enabled
- Automatic content directory creation
- Debug-friendly configuration
- Suitable for vulnerable web app practice

---

## Project Structure

```text
.
├── docker-compose.yml
├── Dockerfile
├── README.md
├── mysql/
│   └── custom.cnf
├── setup/
│   └── create-content-dir.sh
└── atutor/
```

---

## Requirements

- Docker
- Docker Compose

---

## Setup

### 1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/atutor-oswe-docker.git
cd atutor-oswe-docker
```

---

### 2. Place ATutor source code

Extract the ATutor source code into:

```text
./atutor
```

Example:

```text
./atutor/include
./atutor/mods
./atutor/install
```

---

### 3. Build containers

```bash
docker compose build --no-cache
```

---

### 4. Start environment

```bash
docker compose up
```

ATutor will be available at:

```text
http://127.0.0.1:8080
```

---

## Default Database Credentials

| Key | Value |
|---|---|
| Database | `atutor` |
| Username | `atutor` |
| Password | `atutor` |
| Root Password | `root` |

---

## Recommended Installation Credentials

### Administrator Account

| Field | Value |
|---|---|
| Username | `admin` |
| Password | `admin123` |
| Email | `admin@local.test` |

---

### Student Account

| Field | Value |
|---|---|
| Username | `student` |
| Password | `student123` |

---

## Useful Commands

### Enter ATutor container

```bash
docker compose exec atutor bash
```

---

### Enter MySQL container

```bash
docker compose exec db bash
```

---

### View Apache logs

```bash
tail -f /var/log/apache2/error.log
```

---

### View MySQL logs

```bash
tail -f /var/log/mysql/mysql.log
```

or inside host directory

```bash
tail -f ./mysql-logs/mysql.log
```

---

## Automatic Content Directory Setup

This environment automatically creates:

```text
/var/www/html/content
```

with appropriate permissions during container startup.

---

## Security Notes

This environment intentionally uses:
- legacy PHP
- permissive permissions
- debug configurations

Do NOT expose this environment to the public internet.

Recommended usage:
- localhost only
- isolated VM
- lab environment

---

## Disclaimer

This repository is provided for educational and authorized security research purposes only.

The author is not responsible for misuse or unauthorized activities performed using this project.
