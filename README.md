# Calories Cut – AI-Powered Health Tracking Platform
🔗 [Live Demo](https://health.wadeverse.net/) | 🔗 [API Service](https://health-api.wadeverse.net/)

![Java](https://img.shields.io/badge/Java-Spring%20MVC-red)
![Python](https://img.shields.io/badge/Python-Flask%20%7C%20TensorFlow-blue)
![MySQL](https://img.shields.io/badge/Database-MySQL-orange)
![DevOps](https://img.shields.io/badge/Infrastructure-Oracle%20Cloud%20%7C%20Raspberry%20Pi-green)

---

## Project Overview
**Calories Cut** is a full-stack web application designed to automate dietary tracking using Computer Vision.
Unlike simple CRUD apps, this project focuses on **end-to-end system architecture**—integrating a Java Spring backend, a Python AI microservice, and a self-hosted Linux infrastructure.

The goal was to build a **production-grade system** that handles real-time image inference, complex data relationships, and automated deployments.

---

## System Architecture & Infrastructure

This project implements a **Hybrid Cloud & Edge Architecture** to optimize cost and performance.

```mermaid
flowchart TD
    %% User Environment
    subgraph Client_Side ["User Environment"]
        User["User Browser"]
        GitHub["GitHub Actions (CI/CD)"]
    end

    %% Oracle Cloud (Relay for Deployment only)
    subgraph Cloud_Infrastructure ["Oracle Cloud (Deployment Relay)"]
        VM["Oracle VM (SSH Jump Host)"]
        note["Runs only during Deployment"]
    end

    %% Raspberry Pi (Actual Production Server)
    subgraph Edge_Server ["Raspberry Pi 5 (Production Server)"]
        Tunnel["Cloudflare Tunnel (Ingress)"]
        Nginx["Nginx Reverse Proxy"]
        Spring["Spring Boot Backend :8080"]
        MySQL[("MySQL Database")]
        Flask["Flask AI Service :5000"]
    end

    %% 1. User Traffic Flow (Solid Lines)
    User ==>|"HTTPS (wadeverse.net)"| Tunnel
    Tunnel ==>|"Secure Local Traffic"| Nginx
    Nginx -->|"Proxy Pass"| Spring
    Spring -->|"JDBC Read/Write"| MySQL
    Spring -->|"REST API Call (Image)"| Flask
    Flask -->|"Inference JSON"| Spring

    %% 2. Deployment Pipeline Flow (Dotted Lines)
    GitHub -.->|"1. Build & SCP WAR"| VM
    VM -.->|"2. Relay WAR (SSH Tunnel)"| Edge_Server
    
    %% Styling (Optional)
    linkStyle 0,1 stroke-width:2px,fill:none,stroke:green;
    linkStyle 6,7 stroke-width:2px,fill:none,stroke:red,stroke-dasharray: 5 5;
```

### Infrastructure Highlights
* **Self-Hosted Server:** Configured a **Raspberry Pi 5** as a production server, managed via **SSH** and **Linux (Ubuntu)**.
* **Network Security:** Implemented **Cloudflare Tunnel** to expose local services securely (HTTPS) without opening vulnerable ports on the router.
* **Process Management:** Used **PM2** to ensure zero-downtime for Node.js and Python services, with automated log rotation.
* **CI/CD Pipeline:** Automated deployment using **GitHub Actions**, pushing artifacts to Oracle VM and syncing with the Edge Server.

---

## Tech Stack

| Domain | Technologies |
| :--- | :--- |
| **Backend** | Java (Spring MVC), MyBatis, Maven |
| **AI Microservice** | Python, Flask, TensorFlow/Keras, OpenCV |
| **Database** | MySQL (Normalized Schema, Complex JOINs) |
| **Frontend** | JSP, JSTL, jQuery (AJAX), Chart.js, Bootstrap |
| **DevOps** | Linux (Ubuntu), Nginx, Cloudflare Tunnel, PM2, GitHub Actions |

---

## Key Features & Engineering

### 1. Backend Architecture (Spring MVC)
* **Modular Design:** Strictly followed `Controller` → `Service` → `DAO` layers to separate business logic from data access.
* **Transaction Management:** Applied `@Transactional` annotations to ensure data integrity during multi-step processes (e.g., saving image metadata + updating user logs).
* **Session Security:** Implemented `HttpSession` interceptors to protect sensitive routes and manage user authentication states.

### 2. AI Integration (Flask + TensorFlow)
* **Microservice Pattern:** Decoupled the heavy AI inference logic (Python) from the main web server (Java) to prevent blocking threads.
* **Model Optimization:** Trained a custom CNN model on 3,200+ images and converted it to **TFLite** with XNNPACK delegates for faster inference on ARM architecture (Raspberry Pi).

### 3. Database Modeling
* Designed a relational schema with **7+ entities** (Users, Diaries, Images, Nutrition, Exercise, Goals, etc.).
* Optimized SQL queries using **MyBatis Dynamic SQL** to handle complex filtering and aggregation (e.g., "Weekly Calorie Avg").

---

## Technical Challenges Solved

### Issue 1: AI Model Accuracy & Overfitting
* **Problem:** Initial model had <50% accuracy due to noisy dataset.
* **Solution:** Applied **Data Augmentation** (rotation, zoom) and implemented **EarlyStopping** & **Dropout (0.5)** layers.
* **Result:** Achieved **82.5% accuracy** on validation data.

### Issue 2: Full-Stack Integration Mismatch
* **Problem:** Passing `MultipartFile` images from Spring to Flask caused encoding errors.
* **Solution:** Standardized JSON communication and implemented proper multipart-form handling in the Flask endpoint using `werkzeug`.

### Issue 3: Deployment Reliability
* **Problem:** The Python server would occasionally crash due to memory spikes.
* **Solution:** Deployed the service using **PM2**, configuring auto-restart policies and memory limits to ensure 24/7 availability.

---

## Screenshots

### Start Page
<img width="300" height="300" alt="Start Page" src="https://github.com/user-attachments/assets/33b8f979-2545-4ffb-994c-407f969b1e66" />

### Main Page
<img width="450" height="450" alt="Main Page" src="https://github.com/user-attachments/assets/10a6d772-5ead-499f-b8b9-823d19be96ae" />

### Recipe Page
<img width="450" height="350" alt="Recipe Page" src="https://github.com/user-attachments/assets/05326154-7beb-46d9-8d42-cb16ff23f57c" />

### Recipe Detail Page
<img width="450" height="350" alt="Recipe Detail Page" src="https://github.com/user-attachments/assets/84e86c3f-704e-4071-96f8-6360248a5c1a" />

### News Page
<img width="460" height="450" alt="News Page" src="https://github.com/user-attachments/assets/cc3eeaab-bc44-48ce-b626-c45a6c4267b0" />

### Exercise Page
<img width="450" height="450" alt="Exercise Page" src="https://github.com/user-attachments/assets/b706f82e-e813-4afd-94dd-8dd08962e665" />

### Diary Page
<img width="450" height="450" alt="Diary Page 1" src="https://github.com/user-attachments/assets/edf6dca2-fc73-48e1-ae53-2758b7011ae8" />
<img width="450" height="600" alt="Diary Page 2" src="https://github.com/user-attachments/assets/7c2a4026-d3a0-487d-8bf5-b1c4cbdb0288" />

### Machine Learning Result
<img width="450" height="450" alt="ML Result" src="https://github.com/user-attachments/assets/075e570f-b89b-4ff5-869f-13e240ad7203" />

---

## How to Run

### Prerequisites
* Java 17+, Maven, MySQL 8.0
* Python 3.10+

### Backend Setup
```bash
git clone [https://github.com/humanwade/healthML.git](https://github.com/humanwade/healthML.git)
cd healthML
# Configure src/main/resources/application-dev.properties
mvn clean package
java -jar target/healthML-0.0.1.war
```

### AI Server Setup
```bash
cd flask-api
pip install -r requirements.txt
python3 photoDBinsert.py
```

---

## Future Improvements
* **Migration to Docker:** Containerize Spring and Flask apps for easier orchestration.
* **Responsive UI:** Refactor frontend using **React** for a true SPA experience.
* **Expanded Dataset:** Increase food categories from 12 to 50+.
