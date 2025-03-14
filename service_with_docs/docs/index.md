# 🐱 Meow Status - HTTP Status Cats API

[![GitHub License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![Build Status](https://github.com/aludmila-gdev/meow_status/actions/workflows/ci.yml/badge.svg)](https://github.com/aludmila-gdev/meow_status/actions)
[![OpenAPI](https://img.shields.io/badge/OpenAPI-3.0-blue)](./openapi.yaml)

Meow Status is a service that returns cat images based on HTTP status codes. 🔥  
Inspired by [http.cat](https://http.cat/), it's perfect for fun HTTP response debugging.

---

## 🐾 Features

- 📡 **Simple API**: Get cat images for HTTP codes.  
- 🖼️ **Image Response**: A corresponding cat for each HTTP code.  
- 🔄 **Flexible Deployment**: Can run locally or via Docker.  
- 📄 **Documented**: Includes an OpenAPI specification for easy integration.

---

## 🛠️ Tech Stack

Meow Status uses the following technologies:

- [Node.js](https://nodejs.org/) - JavaScript backend runtime.
- [Express](https://expressjs.com/) - Fast and minimalist API framework.
- [Jest](https://jestjs.io/) - Automated testing.
- [Docker](https://www.docker.com/) - Containerization.
- [OpenAPI](https://swagger.io/specification/) - API documentation.

---

## 🚀 Installation

### 🔧 Prerequisites

- [Node.js](https://nodejs.org/) v16+ or [Docker](https://www.docker.com/) installed.

### 📥 Clone the Repository

'git clone https://github.com/aludmila-gdev/meow_status.git'  
'cd meow_status'  

### 📌 Install Dependencies

'npm install'  

### ▶️ Start the Server

'npm start'  

---

## 🐳 Docker

### 📦 Build and Run the Container

'docker build -t meow-status .'  
'docker run -p 3000:3000 meow-status'  

---

## 📡 API

The API returns cat images representing HTTP status codes.  

### 🔍 **Example Usage**

'curl -X GET http://localhost:3000/status/404'  

📷 **Response:** A cat image representing **404 Not Found**.

### 📝 **Endpoints Table**

| Method | Endpoint        | Description                                       |
|--------|----------------|---------------------------------------------------|
| 'GET'  | '/status/:code' | Returns a cat image based on the HTTP status code. |

### 📄 **OpenAPI Documentation**
The full specification can be found in ['openapi.yaml'](./openapi.yaml).

---

## 🧪 Tests

Run unit tests using **Jest**:

'npm test'  

---

## 🎯 Contributing

Want to contribute? Awesome! Follow these steps:

1. **Fork** the repository 🍴  
2. **Create** a new branch ('git checkout -b feature/new-feature')  
3. **Commit** your changes ('git commit -m "Add new feature 🚀"')  
4. **Push** to your branch ('git push origin feature/new-feature')  
5. **Open a Pull Request** ✅  

---

## 📄 License

MIT  

> **Free Software, Hell Yeah!** 😸🎉
