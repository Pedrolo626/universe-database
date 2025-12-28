#  Universe Database

Relational database modeling celestial bodies using PostgreSQL.

##  Tables
- galaxy
- star
- planet
- moon
- planet_atmospheres

## 🔗 Relationships
- galaxy 1:N star
- star 1:N planet
- planet 1:N moon
- planet 1:1 planet_atmospheres

##  Data
- Solar System planets
- Dwarf planets
- Major moons
- Planetary atmospheres

##  Technologies
- PostgreSQL
- SQL (DDL & DML)

##  How to run
```bash
psql -U postgres
\i universe.sql
