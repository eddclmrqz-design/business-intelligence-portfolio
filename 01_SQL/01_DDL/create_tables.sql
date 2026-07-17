/*
=====================================================
SupportSphere Analytics Platform
Project: Customer Support Operations Analytics Platform
Description: Create Dimension and Fact Tables
Author: Eddiecel Marquez
=====================================================
*/

-- ==========================================
-- Dimension: Agent
-- ==========================================

CREATE TABLE support_ops.dim_agent (

    agent_key SERIAL PRIMARY KEY,

    agent_id VARCHAR(20) UNIQUE,

    agent_name VARCHAR(100),

    manager_name VARCHAR(100),

    team_name VARCHAR(100),

    site VARCHAR(50),

    hire_date DATE,

    employment_status VARCHAR(30)

);

-- ==========================================
-- Dimension: Queue
-- ==========================================

CREATE TABLE support_ops.dim_queue (

    queue_key SERIAL PRIMARY KEY,

    queue_name VARCHAR(100),

    business_unit VARCHAR(100),

    priority VARCHAR(30),

    queue_category VARCHAR(100)

);

-- ==========================================
-- Dimension: Channel
-- ==========================================

CREATE TABLE support_ops.dim_channel (

    channel_key SERIAL PRIMARY KEY,

    channel_name VARCHAR(30)

);

-- ==========================================
-- Dimension: Region
-- ==========================================

CREATE TABLE support_ops.dim_region (

    region_key SERIAL PRIMARY KEY,

    region_name VARCHAR(50)

);

-- ==========================================
-- Dimension: Status
-- ==========================================

CREATE TABLE support_ops.dim_status (

    status_key SERIAL PRIMARY KEY,

    status_name VARCHAR(50)

);

-- ==========================================
-- Dimension: Customer
-- ==========================================

CREATE TABLE support_ops.dim_customer (

    customer_key SERIAL PRIMARY KEY,

    customer_id VARCHAR(30),

    customer_segment VARCHAR(50),

    industry VARCHAR(100),

    region VARCHAR(50)

);

-- ==========================================
-- Fact: Case Journey
-- ==========================================

CREATE TABLE support_ops.fact_case_journey (

    case_key BIGSERIAL PRIMARY KEY,

    case_id VARCHAR(40) UNIQUE,

    created_timestamp TIMESTAMP,

    assignment_timestamp TIMESTAMP,

    first_response_timestamp TIMESTAMP,

    response_received_timestamp TIMESTAMP,

    closed_timestamp TIMESTAMP,

    agent_key INT,

    customer_key INT,

    queue_key INT,

    channel_key INT,

    region_key INT,

    status_key INT,

    priority_key INT,

    shift_key INT,

    team_key INT,

    irt_minutes NUMERIC(10,2),

    rr_minutes NUMERIC(10,2),

    resolution_minutes NUMERIC(10,2),

    handling_minutes NUMERIC(10,2),

    queue_wait_minutes NUMERIC(10,2),

    sla_met BOOLEAN,

    csat_score NUMERIC(4,2),

    touches INT,

    CONSTRAINT fk_agent
        FOREIGN KEY (agent_key)
        REFERENCES support_ops.dim_agent(agent_key),

    CONSTRAINT fk_customer
        FOREIGN KEY (customer_key)
        REFERENCES support_ops.dim_customer(customer_key),

    CONSTRAINT fk_queue
        FOREIGN KEY (queue_key)
        REFERENCES support_ops.dim_queue(queue_key),

    CONSTRAINT fk_channel
        FOREIGN KEY (channel_key)
        REFERENCES support_ops.dim_channel(channel_key),

    CONSTRAINT fk_region
        FOREIGN KEY (region_key)
        REFERENCES support_ops.dim_region(region_key),

    CONSTRAINT fk_status
        FOREIGN KEY (status_key)
        REFERENCES support_ops.dim_status(status_key),

    CONSTRAINT fk_priority
        FOREIGN KEY (priority_key)
        REFERENCES support_ops.dim_priority(priority_key),

    CONSTRAINT fk_shift
        FOREIGN KEY (shift_key)
        REFERENCES support_ops.dim_shift(shift_key),

    CONSTRAINT fk_team
        FOREIGN KEY (team_key)
        REFERENCES support_ops.dim_team(team_key)

);