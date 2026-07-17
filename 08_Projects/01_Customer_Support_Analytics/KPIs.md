# KPI Definitions

## Overview

The Customer Support Operations Analytics Platform provides standardized operational metrics that enable leadership to evaluate service performance, workforce efficiency, and customer experience.

Each KPI is calculated consistently across all reports to ensure a single source of truth for business decision-making.

---

# Operational KPIs

## 1. Cases Created

### Business Definition

The total number of new customer support cases created during the selected reporting period.

### Business Purpose

Measures incoming support demand.

### Formula

Cases Created = COUNT(Case ID)

---

## 2. Cases Closed

### Business Definition

The total number of support cases resolved and closed during the reporting period.

### Business Purpose

Measures operational throughput.

### Formula

Cases Closed = COUNT(Closed Case ID)

---

## 3. Initial Response Time (IRT)

### Business Definition

The elapsed time between case creation and the first response provided to the customer.

### Business Purpose

Measures how quickly support teams acknowledge new customer requests.

### Formula

Average IRT = Average(First Response Timestamp − Case Created Timestamp)

### Target

Lower values indicate better performance.

---

## 4. Response Received (RR)

### Business Definition

Measures the elapsed time required to respond after a case re-enters the support queue.

### Business Purpose

Evaluates responsiveness throughout the lifecycle of an ongoing customer interaction.

### Formula

Average RR = Average(Response Timestamp − Queue Re-entry Timestamp)

---

## 5. SLA Compliance

### Business Definition

The percentage of cases that meet the organization's defined service level targets.

### Business Purpose

Measures operational reliability and customer service performance.

### Formula

SLA % =
(Cases Meeting SLA ÷ Total Eligible Cases) × 100

---

## 6. Resolution Time

### Business Definition

The total elapsed time from case creation until final resolution.

### Business Purpose

Measures end-to-end operational efficiency.

### Formula

Average Resolution Time =
Average(Case Closed Timestamp − Case Created Timestamp)

---

## 7. Queue Aging

### Business Definition

The amount of time cases remain waiting within a support queue before being worked.

### Business Purpose

Identifies operational bottlenecks.

---

## 8. Agent Productivity

### Business Definition

Measures operational output produced by each support agent.

### Example Measures

- Cases Closed
- Average Handling Time
- SLA Achievement
- Customer Satisfaction

---

## 9. Customer Satisfaction (CSAT)

### Business Definition

Represents customer feedback collected after case resolution.

### Formula

CSAT % =
(Positive Surveys ÷ Total Surveys) × 100

---

## 10. Average Handling Time (AHT)

### Business Definition

Average amount of active working time spent resolving customer cases.

### Formula

Average Handling Time =
Total Handling Minutes ÷ Cases Handled

---

# Dashboard KPI Summary

The Executive Dashboard includes:

- Cases Created
- Cases Closed
- Initial Response Time (IRT)
- Response Received (RR)
- SLA Compliance
- Resolution Time
- Queue Aging
- Average Handling Time
- Customer Satisfaction (CSAT)
- Agent Productivity

---

# KPI Design Principles

Each KPI follows these principles:

- Clearly defined business meaning
- Consistent calculation logic
- Repeatable across reports
- Easy for business stakeholders to understand
- Aligned with operational decision-making

---

# Notes

All data presented in this project is generated using synthetic datasets designed to simulate enterprise customer support operations.

Metric definitions are inspired by common customer support reporting practices and are intended solely for demonstration and portfolio purposes.