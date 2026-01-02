# assignment3L2b6

ERD Diagram: https://drawsql.app/teams/asraf-1/diagrams/vehicle-rental-system
github link: https://github.com/GreenerAsraf/assignment3L2b6
video link :

# Vehicle Rental System - Database Design & SQL Queries

## 📋 Overview

This project involves designing and implementing a database system for a **Vehicle Rental System**. The assignment evaluates understanding of database design principles, Entity-Relationship Diagrams (ERD), and SQL query writing.

## 🎯 Objectives

By completing this assignment, we will demonstrate the ability to:

- Design an ERD with **1:1**, **1:Many**, and **Many:1** relationships
- Understand and implement **Primary Keys** and **Foreign Keys**
- Write SQL queries using **JOIN**, **EXISTS**, **WHERE**, **GROUP BY**, and **HAVING**

---

## 🗂️ Database Structure

### System Components

The database manages three core entities:

1. **Users** - System users (Admins and Customers)
2. **Vehicles** - Rental vehicles available in the system
3. **Bookings** - Rental transactions connecting users and vehicles

### Business Logic Requirements

#### Users Table

Must store:

- User role (Admin or Customer)
- Name, email, password, phone number
- Email must be **unique** (no duplicate accounts)

#### Vehicles Table

Must store:

- Vehicle name, type (car/bike/truck), model
- Registration number (must be **unique**)
- Rental price per day
- Availability status (available/rented/maintenance)

#### Bookings Table

Must store:

- User who made the booking (Foreign Key to Users)
- Vehicle that was booked (Foreign Key to Vehicles)
- Start date and end date of rental
- Booking status (pending/confirmed/completed/cancelled)
- Total cost of the booking

---

## 📊 Part 1: ERD Design (Mandatory)

### Required Tables

- **Users**
- **Vehicles**
- **Bookings**

### Relationship Requirements

Your ERD must clearly demonstrate:

| Relationship Type | Description                                                      |
| ----------------- | ---------------------------------------------------------------- |
| **One to Many**   | User → Bookings (One user can have multiple bookings)            |
| **Many to One**   | Bookings → Vehicle (Multiple bookings can reference one vehicle) |
| **One to One**    | Each booking connects exactly one user and one vehicle           |

### ERD Must Include

- ✅ Primary Keys (PK)
- ✅ Foreign Keys (FK)
- ✅ Relationship cardinality
- ✅ Status fields (booking status, vehicle availability)

### 📤 Submission Format

- Use **Lucidchart ERD Tool**
- Submit a **public, shareable ERD link**

⚠️ **Note:** ERD submission is mandatory. Without it, you will receive 0 marks.

---

## 💻 Part 2: SQL Queries

Write SQL queries based on your designed schema. Refer to the **QUERY.md** file for sample input/output.

### Query 1: JOIN

**Task:** Retrieve booking information along with customer name and vehicle name.

**Concepts:** `INNER JOIN`

### Query 2: EXISTS

**Task:** Find all vehicles that have never been booked.

**Concepts:** `NOT EXISTS`

### Query 3: WHERE

**Task:** Retrieve all available vehicles of a specific type (e.g., cars).

**Concepts:** `SELECT`, `WHERE`

### Query 4: GROUP BY and HAVING

**Task:** Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.

**Concepts:** `GROUP BY`, `HAVING`, `COUNT`

---

## 🎤 Part 3: Theory Questions (Viva Practice)

Answer the following questions in your own words and record them on camera in **Bengali or English**. Spend approximately **two minutes** on each question.

> _"This video is a safe space to practice - confidence grows every time you speak."_

### Question 1

**What is a foreign key and why is it important in relational databases?**

### Question 2

**What is the difference between WHERE and HAVING clauses in SQL?**

### Question 3

**What is a primary key and what are its characteristics?**

### Question 4

**What is the difference between INNER JOIN and LEFT JOIN in SQL?**

---

## 📁 Project Structure

```
vehicle-rental-system/
├── README.md              # This file
├── ERD/                   # Entity Relationship Diagram
│   └── drawsql-link.txt
├── SQL/                   # SQL query files
│   ├── query1_join.sql
│   ├── query2_exists.sql
│   ├── query3_where.sql
│   └── query4_group_by.sql
├── QUERY.md              # Sample query results
└── VIVA/                 # Theory question recordings

```

---

## 📚 Resources

- drawsql ERD Tutorial from Shafayath vai's tutorial(facebook post)
- SQL JOIN Documentation
- Database Normalization Guidelines
- Video Recording Best Practices

---
