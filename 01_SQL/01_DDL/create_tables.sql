/*
=====================================================
SupportSphere Analytics Platform
Project: Customer Support Operations Analytics Platform
Description: Create all dimension and fact tables
Author: Eddiecel Marquez
=====================================================
*/

-- =====================================================
-- Dimension: Agent
-- =====================================================

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

-- =====================================================
-- Dimension: Queue
-- =====================================================

CREATE TABLE support_ops.dim_queue (

    queue_key SERIAL PRIMARY KEY,

    queue_name VARCHAR(100),

    business_unit VARCHAR(100),

    priority VARCHAR(30),

    queue_category VARCHAR(100)

);

-- =====================================================
-- Dimension: Channel
-- =====================================================

CREATE TABLE support_ops.dim_channel (

    channel_key SERIAL PRIMARY KEY,

    channel_name VARCHAR(30)

);

-- =====================================================
-- Dimension: Region
-- =====================================================

CREATE TABLE support_ops.dim_region (

    region_key SERIAL PRIMARY KEY,

    region_name VARCHAR(50)

);

-- =====================================================
-- Dimension: Status
-- =====================================================

CREATE TABLE support_ops.dim_status (

    status_key SERIAL PRIMARY KEY,

    status_name VARCHAR(50)

);

-- =====================================================
-- Dimension: Customer
-- =====================================================

CREATE TABLE support_ops.dim_customer (

    customer_key SERIAL PRIMARY KEY,

    customer_id VARCHAR(30),

    customer_segment VARCHAR(50),

    industry VARCHAR(100),

    region VARCHAR(50)

);

-- =====================================================
-- Fact Table: Case Journey
-- =====================================================

CREATE TABLE support_ops.fact_case_journey (

    case_key BIGSERIAL PRIMARY KEY,

    case_id VARCHAR(40),

    created_date DATE,

    closed_date DATE,

    agent_key INT,

    customer_key INT,

    queue_key INT,

    channel_key INT,

    region_key INT,

    status_key INT,

    irt_minutes NUMERIC(10,2),

    rr_minutes NUMERIC(10,2),

    resolution_minutes NUMERIC(10,2),

    handling_minutes NUMERIC(10,2),

    queue_wait_minutes NUMERIC(10,2),

    sla_met BOOLEAN,

    csat_score NUMERIC(4,2),

    touches INT,

    FOREIGN KEY (agent_key)
        REFERENCES support_ops.dim_agent(agent_key),

    FOREIGN KEY (customer_key)
        REFERENCES support_ops.dim_customer(customer_key),

    FOREIGN KEY (queue_key)
        REFERENCES support_ops.dim_queue(queue_key),

    FOREIGN KEY (channel_key)
        REFERENCES support_ops.dim_channel(channel_key),

    FOREIGN KEY (region_key)
        REFERENCES support_ops.dim_region(region_key),

    FOREIGN KEY (status_key)
        REFERENCES support_ops.dim_status(status_key)

);