# Data Model

## Overview

The Customer Support Operations Analytics Platform follows a dimensional modeling approach using a Star Schema.

This model is optimized for analytical reporting rather than transactional processing, allowing dashboards and SQL queries to efficiently aggregate millions of customer support events.

The central fact table captures the lifecycle of every customer support case, while surrounding dimension tables provide descriptive business attributes.

---

# Data Warehouse Design

```
                    dim_date
                        │
                        │
dim_agent ──────────────┤
                        │
dim_queue ──────────────┤
                        │
dim_customer ───────────┤
                        │
dim_channel ────────────┤
                        │
dim_region ─────────────┤
                        │
dim_status ─────────────┤
                        │
                fact_case_journey
                        │
              SLA • IRT • RR • CSAT
```

---

# Fact Table

## fact_case_journey

The fact table stores one record for each customer support case session.

Each row represents the operational state of a support case and contains the metrics required for business reporting.

### Key Measures

- Cases Created
- Cases Closed
- Initial Response Time (IRT)
- Response Received Time (RR)
- Resolution Time
- SLA Met Flag
- Customer Satisfaction Score
- Agent Handling Time
- Queue Waiting Time
- Number of Agent Touches

---

# Dimension Tables

## dim_date

Provides calendar and fiscal reporting attributes.

Example fields:

- Date
- Week
- Month
- Quarter
- Fiscal Week
- Fiscal Month
- Fiscal Year

---

## dim_agent

Stores employee information.

Example fields:

- Agent ID
- Agent Name
- Team
- Manager
- Site
- Hire Date
- Employment Status

---

## dim_queue

Represents operational support queues.

Example fields:

- Queue Name
- Business Unit
- Priority
- Queue Category

---

## dim_customer

Stores customer information.

Example fields:

- Customer ID
- Customer Segment
- Industry
- Region

---

## dim_channel

Communication channel.

Examples:

- Chat
- Email
- Messaging

---

## dim_region

Operational region.

Examples:

- North America
- EMEA
- APAC
- LATAM

---

## dim_status

Support case status.

Examples:

- New
- Assigned
- In Progress
- Response Received
- Pending
- Solved
- Closed

---

# Relationships

Each support case references:

- One Agent
- One Queue
- One Customer
- One Channel
- One Region
- One Date

This structure enables efficient slicing and filtering across all operational KPIs.

---

# Reporting KPIs

The data model supports calculation of:

- Initial Response Time (IRT)
- Response Received (RR)
- SLA Compliance
- Average Resolution Time
- Queue Aging
- Case Volume
- Agent Productivity
- Customer Satisfaction (CSAT)
- Queue Performance
- Regional Performance

---

# Design Decisions

The model follows dimensional modeling best practices.

### Star Schema

A Star Schema was selected because it:

- Simplifies reporting
- Improves query performance
- Reduces SQL complexity
- Supports scalable dashboard development

### Surrogate Keys

Dimension tables use surrogate integer keys to improve joins and maintain historical consistency.

### Fact Grain

The fact table is maintained at the **case journey/session level**, allowing analysis of:

- Queue transitions
- Response cycles
- SLA performance
- Customer experience
- Operational efficiency

---

# Future Enhancements

Future versions of the model may include:

- Fact Agent Activity
- Fact Workforce Productivity
- Fact Quality Audits
- Fact Customer Surveys
- Slowly Changing Dimensions (SCD Type 2)
- Incremental Fact Loading