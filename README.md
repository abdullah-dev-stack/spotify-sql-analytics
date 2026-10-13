# Spotify Enterprise Streaming & Analytics Schema

*A comprehensive, fully normalized relational database architecture modeling the backend data infrastructure of a modern music streaming platform.*

---

## 📖 Executive Overview
This repository contains an enterprise-grade SQL database designed to simulate the core transactional and analytical data flows of a major audio streaming service (e.g., Spotify, Apple Music). The project demonstrates the complete data engineering lifecycle required to process millions of simulated streams: from strictly normalized Entity-Relationship structuring (DDL), to the ingestion of realistic mock data (DML), to the execution of advanced Business Intelligence (BI) analytics.

The architecture is built on **Third Normal Form (3NF)** principles to eliminate data redundancy, ensure transactional integrity, and optimize relational query performance.

## 🏗️ Entity-Relationship Architecture
The schema is divided into four distinct tables, separating core metadata from transactional logs.

*   **`Users` (Dimension Table)**: 
    *   Manages listener accounts and registration timestamps.
    *   Utilizes SQL `ENUM` data types to strictly restrict subscription tiers to `Free` or `Premium` for accurate revenue modeling.
*   **`Artists` (Dimension Table)**: 
    *   Stores creator metadata, genre classifications, and platform onboarding dates.
*   **`Tracks` (Dimension Table)**: 
    *   Represents the core audio assets. 
    *   Linked directly to the `Artists` table via a Foreign Key, establishing a strict one-to-many relationship (one artist can have many tracks).
*   **`StreamingHistory` (Fact Table)**: 
    *   The central transactional ledger of the database. 
    *   Maps `Users` to `Tracks` with precise `DATETIME` stamps and playback durations (`SecondsPlayed`).
    *   Utilizes `ON DELETE CASCADE` constraints to automatically purge orphan records if a user deletes their account or an artist removes their catalog.

## 🗂️ Data Pipeline & File Structure
The project is modularized into three distinct architectural scripts, mirroring professional data engineering pipelines:

1.  **`01_schema.sql` (Data Definition Layer)**: Constructs the database shell, defines strict table schemas, and enforces Foreign Key constraints.
2.  **`02_seed_data.sql` (Data Manipulation Layer)**: Populates the architecture with a realistic distribution of mock artists, users, and varied multi-day listening sessions (including skipped tracks and repeat plays).
3.  **`03_analytics_queries.sql` (Business Intelligence Layer)**: Extracts platform metrics using advanced querying logic.

## 📊 Business Intelligence & Analytics Logic
The analytics script proves the ability to extract meaningful business insights from fragmented relational data across multiple tables.

*   **Session Reconstruction**: Utilizes advanced four-table `INNER JOIN` operations to transform raw ID streams into readable, chronologically ordered user listening histories.
*   **Platform Engagement Metrics**: Aggregates total listening time per user across different subscription tiers using `SUM()` and `GROUP BY` clauses, converting raw seconds into analytical minutes.
*   **Financial Royalty Dashboard (SQL VIEW)**: 
    *   Implements a virtual `ArtistRoyalties` table that calculates simulated financial payouts based on platform engagement. 
    *   **Industry Logic**: It applies conditional `WHERE` clauses (e.g., `SecondsPlayed > 30`) to filter out user "skips", adhering to the standard industry rule that a track must be played for at least 30 seconds to trigger a royalty payout.
    *   Applies dynamic mathematical calculations to convert eligible streams into simulated USD earnings.

## 💻 Technology Stack & Concepts
*   **Language**: SQL (Structured Query Language)
*   **Database Engine**: MySQL
*   **Environment**: MySQL Workbench / Visual Studio Code / Command Line Interface
*   **Core Engineering Concepts**: 
    *   Data Definition Language (DDL) & Data Manipulation Language (DML)
    *   Table Normalization & Primary/Foreign Keys
    *   SQL Views (Virtual Tables)
    *   Data Aggregations (`COUNT`, `SUM`, `ROUND`)
    *   Relational Modeling

## 🚀 How to Run Locally
1. Clone this repository to your local machine.
2. Open MySQL Workbench (or your preferred SQL IDE) and connect to your local MySQL server.
3. Execute the scripts in chronological order:
   * Run `01_schema.sql` first to build the architecture.
   * Run `02_seed_data.sql` second to inject the transactional data.
   * Run `03_analytics_queries.sql` third to view the generated business reports and royalty dashboards.