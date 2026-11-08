# Kigali International Airport Operations

## Database Management System Project

**Group Name:** SQL Boyz  
**Group Leader:** Daugla Dourah  
**Project Topic:** Kigali International Airport Operations

## 1. Introduction

This project focuses on the design of a database for managing basic operations at Kigali International Airport.

The database is designed to organize information about airlines, flights, airport gates, passengers, tickets, and check-ins. It provides a structured way to store and manage these records.

## 2. Project Objectives

The main objectives are to:

- Store airline and flight information.
- Manage airport gates and their status.
- Keep passenger records.
- Record ticket and booking information.
- Manage passenger check-in details.
- Connect related records using primary and foreign keys.

## 3. Database Structure

The database contains six main tables:

| Table | Description |
|---|---|
| AIRLINES | Stores airline information. |
| FLIGHTS | Stores flight details and status. |
| GATES | Stores airport gate information. |
| PASSENGERS | Stores passenger details. |
| TICKETS | Stores ticket and booking information. |
| CHECK_INS | Stores passenger check-in records. |

## 4. Relationships Between Tables

The database uses the following relationships:

- One airline can operate several flights.
- One gate can be assigned to several flights over time.
- One flight can have several tickets.
- One passenger can have several tickets.
- One ticket can have one check-in record.

Primary keys identify records, while foreign keys connect related tables and maintain data consistency.

## 5. Technologies Used

- **Database:** MySQL
- **Language:** SQL
- **Version Control:** Git and GitHub
- **Diagram Design:** draw.io

## 6. Project Structure

```text
Kigali_International_Airport_Operations/
│
├── README.md
├── docs/
│   └── DESIGN_NOTES.md
│
├── er-diagram/
│   └── er_diagram.mmd
│
├── sql/
│   └── kigali_airport_operations.sql
│
└── students/
    ├── README.md
    └── Individual SQL files
```

## 7. Database Setup

1. Install MySQL Server and MySQL Workbench.
2. Open the SQL file located in the `sql` folder.
3. Execute the script to create the database and its tables.
4. Check that all six tables have been created successfully.

**Database name:** `kigali_airport_operations`

## 8. Group Members

| No. | Name | Registration Number | Role |
|---:|---|---|---|
| 1 | Daugla Dourah | 202512707 | Group Leader |
| 2 | Mustafa Mahadi Mohamed | 202512507 | Member |
| 3 | Mousa Mohamed Abakar Jomaa | 202512517 | Member |
| 4 | Hasoon | 202511533 | Member |
| 5 | Abdallah | 202511866 | Member |
| 6 | Osman | 202511534 | Member |
| 7 | Koumakang bonheur | 202411208 | Member |
| 8 | Anas | 202512831 | Member |
| 9 | Anfal | 202511770 | Member |
| 10 | Loai | 202511452 | Member |

## 9. Project Repository

The project files are maintained in the group's GitHub repository:

https://github.com/asermbai/Kigali_International_Airport_Operations

---

**SQL Boyz**  
*Kigali International Airport Operations Database Project*