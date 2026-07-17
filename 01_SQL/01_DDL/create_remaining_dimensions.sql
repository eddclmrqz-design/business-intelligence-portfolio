/*
=====================================================
SupportSphere Analytics Platform
Additional Dimension Tables
Author: Eddiecel Marquez
=====================================================
*/

-- ==========================================
-- Dimension: Priority
-- ==========================================

CREATE TABLE support_ops.dim_priority (

    priority_key SERIAL PRIMARY KEY,

    priority_name VARCHAR(20) NOT NULL,

    sla_target_minutes INT NOT NULL

);

-- ==========================================
-- Dimension: Shift
-- ==========================================

CREATE TABLE support_ops.dim_shift (

    shift_key SERIAL PRIMARY KEY,

    shift_name VARCHAR(30),

    region VARCHAR(50),

    shift_start TIME,

    shift_end TIME

);

-- ==========================================
-- Dimension: Team
-- ==========================================

CREATE TABLE support_ops.dim_team (

    team_key SERIAL PRIMARY KEY,

    team_name VARCHAR(100),

    manager_name VARCHAR(100),

    business_unit VARCHAR(100)

);