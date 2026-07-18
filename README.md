# Collaborative Study Room

## Overview

Collaborative Study Room is a Java web application developed as part of my journey in learning Advanced Java. The project focuses on implementing core Java EE concepts such as Servlets, JSP, MVC architecture, session management, and DAO-based database interaction.

The application allows users to register, log in, create or join study rooms, and interact through dedicated room interfaces. The primary objective of this project was to gain practical experience in building dynamic web applications using the Java Servlet and JSP ecosystem.

---

## Features

- User registration and authentication
- Secure login and logout functionality
- Session-based user management
- Create and access study rooms
- Dynamic JSP-based user interface
- MVC architecture using Servlets as controllers
- DAO layer for database operations
- Organized project structure following Java web development best practices

---

## Technologies Used

- Java
- Advanced Java (Servlets & JSP)
- Apache NetBeans
- Apache Tomcat
- HTML
- CSS
- JDBC
- MySQL
- Maven (if applicable)

---

## Project Structure

```
StudyRoom
│
├── Web Pages
│   ├── index.jsp
│   ├── login.jsp
│   ├── register.jsp
│   ├── room.jsp
│   ├── chat.jsp
│   ├── logout.jsp
│   ├── META-INF
│   └── WEB-INF
│
├── Source Packages
│   ├── dao
│   ├── model
│   └── servlet
│
├── Test Packages
├── Libraries
└── Configuration Files
```

---

## Architecture

The project follows the MVC (Model-View-Controller) design pattern.

- **Model** – Represents the application's data and business entities.
- **View** – JSP pages responsible for rendering the user interface.
- **Controller** – Java Servlets that process requests, manage application flow, and communicate with the DAO layer.
- **DAO** – Handles all database interactions using JDBC.

---

## Learning Outcomes

This project was built to strengthen my understanding of:

- Java Servlet lifecycle
- JSP fundamentals
- Request forwarding and redirection
- Session management
- Form handling
- JDBC connectivity
- CRUD operations
- DAO Design Pattern
- MVC Architecture
- Building Java web applications using Apache Tomcat

---

## Getting Started

### Prerequisites

- JDK 17 or later
- Apache NetBeans IDE
- Apache Tomcat
- MySQL Server

### Clone the Repository

```bash
git clone https://github.com/PriyanshuuuSinghh/Collaborative-Study-Room.git
```

### Running the Project

1. Open the project in Apache NetBeans.
2. Configure the MySQL database and update the JDBC connection details.
3. Deploy the project on Apache Tomcat.
4. Run the application.
5. Open the application in your browser.

---

## Future Improvements

- Real-time messaging using WebSockets
- File sharing within study rooms
- Video conferencing integration
- Role-based user management
- Responsive user interface
- Notification system
- Persistent chat history

---

## Purpose

This repository represents one of my learning projects while studying Advanced Java. The goal was to apply theoretical concepts in a practical web application and gain hands-on experience with Java web technologies and software architecture.

---

## Author

**Priyanshu Kumar**

This project was developed for educational purposes as part of learning Advanced Java and Java Web Development.
