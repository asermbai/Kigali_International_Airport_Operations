# Kigali International Airport Operations

A centralized relational database project for managing key airport operations at Kigali International Airport. The project is developed by **SQL Boyz**, a group of 10 students, using MySQL 8.0.

> **Project allocation:** This topic was officially assigned to the group by the Class President (CP). The group has not independently selected or exchanged its topic.

## 1. Project Overview

Kigali International Airport Operations is a database project intended to organize information about airlines, flights, airport gates, passengers, tickets, and passenger check-ins.

The database is designed around the relationships shown in the group's initial Entity Relationship Diagram (ERD). It provides a structured foundation for storing and querying airport operational data.

## 2. Group Information

**Group name:** SQL Boyz  
**Group leader:** Daugla Dourah  
**Group size:** 10 members  
**Assigned project:** Kigali International Airport Operations  
**Database management system:** MySQL 8.0

| # | Name provided | Registration number | Role |
|---:|---|---|---|
| 1 | Daugla Dourah | 202512707 | Leader |
| 2 | Mustafa Mahadi Mohamed | 202512507 | Member |
| 3 | Mousa Mohamed Abakar Jomaa | 202512517 | Member |
| 4 | Hasoon | 202511533 | Member |
| 5 | Abdallah | 202511866 | Member |
| 6 | Osman | 202511534 | Member |
| 7 | Koumakang Bonheur | 202411208 | Member |
| 8 | Anas | 202512831 | Member |
| 9 | Anfal | 202511770 | Member |
| 10 | Loai | 202511452 | Member |

*Names are reproduced as supplied by the group. Where only one name was available, no surname has been assumed.*

## 3. Project Objectives

- Design and implement a relational database for airport operations.
- Store airline and flight information.
- Manage airport gates and their operational status.
- Maintain passenger records.
- Record flight tickets and seat information.
- Track passenger check-in details.
- Apply primary keys, foreign keys, unique constraints, and appropriate data types.
- Write SQL queries to retrieve and analyze operational information.

## 4. Database Entities

The initial model contains six main entities:

| Table | Purpose |
|---|---|
| `airlines` | Airline name, country, and contact email |
| `gates` | Gate number, terminal, and gate status |
| `flights` | Flight number, departure and arrival times, status, airline, and assigned gate |
| `passengers` | Passenger names, passport number, and nationality |
| `tickets` | Booking reference, seat number, ticket status, flight, and passenger |
| `check_ins` | Check-in time, status, baggage count, and associated ticket |

### Main relationships

- One airline can operate many flights; each flight references one airline.
- One gate can be assigned to many flights over time; each flight references one gate.
- One flight can have many tickets; each ticket references one flight.
- One passenger can hold many tickets; each ticket references one passenger.
- A ticket can have zero or one check-in record; each check-in belongs to one unique ticket.

## 5. Entity Relationship Diagram

The editable Mermaid ERD source is available at [`er-diagram/er_diagram.mmd`](er-diagram/er_diagram.mmd).

## 6. Repository Structure

```text
Kigali_International_Airport_Operations/
├── README.md
├── docs/
│   └── DESIGN_NOTES.md
├── er-diagram/
│   └── er_diagram.mmd
├── sql/
│   └── kigali_airport_operations.sql
└── students/
    ├── README.md
    ├── 202512707_daugla_dourah.sql
    ├── 202512507_mustafa_mahadi_mohamed.sql
    ├── 202512517_mousa_mohamed_abakar_jomaa.sql
    ├── 202511533_hasoon.sql
    ├── 202511866_abdallah.sql
    ├── 202511534_osman.sql
    ├── 202411208_koumakang_bonheur.sql
    ├── 202512831_anas.sql
    ├── 202511770_anfal.sql
    └── 202511452_loai.sql
```

## 7. Requirements

- MySQL Server 8.0 or later
- MySQL Workbench (recommended) or another MySQL client
- Git
- A GitHub account

## 8. Installation

### Option A — MySQL Workbench

1. Start your MySQL Server.
2. Open MySQL Workbench and connect to your server.
3. Choose **File → Open SQL Script**.
4. Open `sql/kigali_airport_operations.sql`.
5. Review the script, then execute it.
6. Refresh the Schemas panel and confirm that `kigali_airport_operations` exists.

### Option B — MySQL command-line client on Windows

From PowerShell in the project root, run:

```powershell
cmd /c 'mysql -u root -p < "sql\kigali_airport_operations.sql"'
```

This command assumes the MySQL client is installed and available on `PATH`. Enter your own MySQL password when prompted.

### Verify the database

```sql
USE kigali_airport_operations;
SHOW TABLES;
```

The setup script uses `CREATE DATABASE IF NOT EXISTS` and `CREATE TABLE IF NOT EXISTS`; it does not intentionally drop the database.

## 9. SQL Work by Group Members

The `students/` directory contains one starter SQL file per listed group member. Members should add their own queries, tests, and comments to their assigned file after the group agrees on task allocation.

The starter files are intentionally blank apart from identifying comments. They do not imply that individual tasks have already been assigned.

## 10. Project Development Workflow

1. Discuss and agree on task allocation within the group.
2. Keep the shared database schema consistent with the ERD.
3. Develop and test SQL changes locally.
4. Document changes and assumptions.
5. Commit changes with clear Git messages.
6. Push reviewed work to the central GitHub repository.

## 11. Current Scope and Future Improvements

This starter version implements the six entities shown in the supplied ERD. Before final submission, the group should validate requirements with the lecturer and consider whether additional airport concepts are required, such as terminals, destinations, aircraft, baggage handling, or payments. These should only be added after agreement and an updated ERD.

## 12. Academic and Data Note

Any sample records added during development should be clearly identified as fictional demonstration data. Do not add real passenger passport numbers, personal contact details, or other sensitive passenger information to a public repository.

---

**Project:** Kigali International Airport Operations  
**Group:** SQL Boyz  
**Database:** `kigali_airport_operations`  
**DBMS:** MySQL 8.0
