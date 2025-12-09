-- Create all tables (No data is inserted)

--############################################################################
-- Create tables with public data
CREATE TABLE IF NOT EXISTS genders(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    gender varchar NOT NULL UNIQUE,
    primary key(id)
);

CREATE TABLE IF NOT EXISTS states(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1 MAXVALUE 24),
    state varchar NOT NULL,
    primary key(id)
);

CREATE TABLE IF NOT EXISTS municipalities(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1 MAXVALUE 335),
    state_id integer NOT NULL,
    municipality varchar NOT NULL,
    primary key(id)
);

CREATE TABLE IF NOT EXISTS parishes(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1 MAXVALUE 1134),
    municipality_id integer NOT NULL,
    parish varchar NOT NULL,
    primary key(id)
);

CREATE TABLE IF NOT EXISTS countries(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1 MAXVALUE 240),
    country varchar NOT NULL,
    primary key(id)
);

CREATE TABLE IF NOT EXISTS month(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1 MAXVALUE 12),
    month varchar NOT NULL,
    primary key(id)
);

--############################################################################
-- Create tables with private general data
CREATE SCHEMA general;

CREATE TABLE IF NOT EXISTS general.contact(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    worker_id integer NOT NULL UNIQUE,
    email varchar(200) DEFAULT '',
    email2 varchar(200) DEFAULT '',
    phone varchar(20) DEFAULT '',
    phone2 varchar(20) DEFAULT '',
    primary key(id)
);

CREATE TABLE IF NOT EXISTS general.department(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    department varchar(200) NOT NULL UNIQUE,
    primary key(id)
);

CREATE TABLE IF NOT EXISTS general.position(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    position varchar(200) NOT NULL UNIQUE,
    primary key(id)
);

CREATE TABLE IF NOT EXISTS general.payroll_type(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    name varchar(200) NOT NULL UNIQUE,
    primary key(id)
);

CREATE TABLE IF NOT EXISTS general.area_coordination(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    area varchar(200) NOT NULL UNIQUE,
    primary key(id)
);

CREATE TABLE IF NOT EXISTS general.worker_status (
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    status varchar(100) NOT NULL UNIQUE,
    primary key(id)
);

CREATE TABLE IF NOT EXISTS general.workers (
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    identity_card integer NOT NULL UNIQUE,
    is_foreign boolean NOT NULL DEFAULT false,
    full_name varchar(160) NOT NULL,
    gender_id integer NOT NULL DEFAULT 1 REFERENCES genders(id),
    department_id integer NOT NULL REFERENCES general.department(id),
    position_id integer NOT NULL REFERENCES general.position(id),
    payroll_type_id integer NOT NULL REFERENCES general.payroll_type(id),
    area_coordination_id integer NOT NULL DEFAULT 0 REFERENCES general.area_coordination(id),
    status_id integer NOT NULL DEFAULT 1 REFERENCES general.worker_status(id),
    created date DEFAULT CURRENT_DATE,
    updated date,
    primary key(id)
);

CREATE TABLE IF NOT EXISTS general.location(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    worker_id integer NOT NULL UNIQUE REFERENCES general.workers(id),
    state_id integer NOT NULL REFERENCES states(id),
    municipality_id integer NOT NULL REFERENCES municipalities(id),
    parish_id integer NOT NULL REFERENCES parishes(id),
    address text DEFAULT '',
    primary key(id)
);

--############################################################################
-- Creates the tables necessary for the operation of the system
CREATE SCHEMA regions;

-- user
CREATE TABLE regions.roles(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    role varchar(100) NOT NULL UNIQUE,
    primary key(id)
);

-- achievements_base
create table regions.users (
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    worker_id integer NOT NULL UNIQUE,
    username varchar(100) NOT NULL UNIQUE,
    password varchar NOT NULL,
    role_id integer NOT NULL REFERENCES regions.roles(id),
    is_active boolean NOT NULL DEFAULT true,
    created date DEFAULT CURRENT_DATE,
    primary key(id)
);

CREATE TABLE regions.type_action(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    type_action varchar(100) NOT NULL UNIQUE,
    primary key(id)
);

CREATE TABLE regions.type_activity(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    type_action_id integer NOT NULL,
    type_activity varchar(100) NOT NULL UNIQUE,
    primary key(id)
);

CREATE TABLE regions.status(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    status varchar(100) NOT NULL UNIQUE,
    primary key(id)
);

CREATE TABLE regions.management_unit(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    management_unit varchar(100) NOT NULL UNIQUE,
    primary key(id)
);

create table regions.achievements_base (
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    status_id integer NOT NULL DEFAULT 1 REFERENCES regions.status(id),
    created_on date DEFAULT CURRENT_DATE,
    created_by integer NOT NULL REFERENCES regions.users(id),
    date date NOT NULL,
    hour time NOT NULL,
    action_id integer NOT NULL REFERENCES regions.type_action(id),
    activity_id integer NOT NULL REFERENCES regions.type_activity(id),
    management_unit_id integer NOT NULL REFERENCES regions.management_unit(id),
    state_id integer NOT NULL REFERENCES public.states(id),
    municipality_id integer DEFAULT 0 REFERENCES public.municipalities(id),
    parish_id integer DEFAULT 0 REFERENCES public.parishes(id),
    observation text,
    previously_scheduled boolean NOT NULL DEFAULT false,
    observation_schedule text,
    primary key(id)
);

-- achievements_others
CREATE TABLE regions.place(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    place varchar(100) NOT NULL UNIQUE,
    primary key(id)
);

create table regions.achievements_others (
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    achievements_id integer NOT NULL UNIQUE REFERENCES regions.achievements_base(id),
    place_id integer NOT NULL REFERENCES regions.place(id),
    place_other varchar,
    n_womans integer NOT NULL DEFAULT 0,
    n_man integer NOT NULL DEFAULT 0,
    n_unspecified integer,
    responsible varchar NOT NULL,
    phone_number varchar(100),
    primary key(id)
);

-- achievements_victim_traff
create table regions.achievements_victim_traff (
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    achievements_id integer NOT NULL UNIQUE REFERENCES regions.achievements_base(id),
    country_id integer NOT NULL REFERENCES countries(id),
    gender_id integer NOT NULL REFERENCES genders(id),
    age integer NOT NULL,
    collection_method varchar NOT NULL,
    received varchar NOT NULL DEFAULT '',
    primary key(id)
);

-- achievements_telephone_service
CREATE TABLE regions.type_telephone_service(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    type_telephone_service varchar(100) NOT NULL UNIQUE,
    primary key(id)
);

create table regions.achievements_telephone_service (
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    achievements_id integer NOT NULL UNIQUE REFERENCES regions.achievements_base(id),
    type_telephone_service_id integer NOT NULL REFERENCES regions.type_telephone_service(id),
    great_mission varchar NOT NULL,
    primary key(id)
);

-- achievements_g_violence
create table regions.age_range(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    age_range varchar(100) NOT NULL UNIQUE,
    primary key(id)
);

create table regions.type_weapon(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    type_weapon varchar(100) NOT NULL UNIQUE,
    primary key(id)
);

create table regions.type_femicide(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    type_femicide varchar(100) NOT NULL UNIQUE,
    primary key(id)
);

create table regions.killer_status(
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    killer_status varchar(100) NOT NULL UNIQUE,
    primary key(id)
);

create table regions.achievements_g_violence (
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    achievements_id integer NOT NULL UNIQUE REFERENCES regions.achievements_base(id),
    age_range_id integer NOT NULL REFERENCES regions.age_range(id),
    type_weapon_id integer NOT NULL REFERENCES regions.type_weapon(id),
    type_femicide_id integer NOT NULL REFERENCES regions.type_femicide(id),
    killer_status_id integer NOT NULL REFERENCES regions.killer_status(id),
    primary key(id)
);

-- ---------- unite mobile ---------- --
create table regions.service_types (
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    service_type varchar NOT NULL,
    primary key(id)
);

create table regions.service_subtypes (
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    service_type_id integer NOT NULL REFERENCES regions.service_types(id),
    subtype varchar NOT NULL,
    primary key(id)
);

create table regions.disabilitys (
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    disability varchar NOT NULL,
    primary key(id)
);

create table regions.ethnicities (
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    ethnicity varchar NOT NULL,
    primary key(id)
);

create table regions.social_day_achievements (
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    created_by integer NOT NULL REFERENCES regions.users(id),
    created_on date DEFAULT CURRENT_DATE,
    status_id integer NOT NULL DEFAULT 2 REFERENCES regions.status(id),
    date date NOT NULL DEFAULT CURRENT_DATE,
    hour time NOT NULL DEFAULT CURRENT_TIME,
    num_mobile_units integer NOT NULL,
    num_ultrasounds integer NOT NULL,
    logistical_support varchar NOT NULL,
    responsible varchar NOT NULL,
    state_id integer NOT NULL REFERENCES public.states(id),
    municipality_id integer DEFAULT 0 REFERENCES public.municipalities(id),
    parish_id integer DEFAULT 0 REFERENCES public.parishes(id),
    place varchar NOT NULL,
    approximate integer NOT NULL,
    observation1 text,
    observation2 text,
    primary key(id)
);

create table regions.social_day_service_types (
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    social_day_id integer NOT NULL REFERENCES regions.social_day_achievements(id),
    service_type_id integer NOT NULL REFERENCES regions.service_types(id),
    service_subtype_id integer DEFAULT 0 REFERENCES regions.service_subtypes(id),
    age_range_id integer NOT NULL,
    n_mans integer NOT NULL DEFAULT 0,
    n_womans integer NOT NULL DEFAULT 0,
    primary key(id)
);

create table regions.social_day_disability (
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    social_day_id integer NOT NULL REFERENCES regions.social_day_achievements(id),
    service_type_id integer NOT NULL REFERENCES regions.service_types(id),
    service_subtype_id integer DEFAULT 0 REFERENCES regions.service_subtypes(id),
    disability_id integer NOT NULL REFERENCES regions.disabilitys(id),
    age_range_id integer NOT NULL,
    n_mans integer NOT NULL DEFAULT 0,
    n_womans integer NOT NULL DEFAULT 0,
    primary key(id)
);

create table regions.social_day_ethnicity (
    id integer NOT NULL UNIQUE GENERATED ALWAYS AS IDENTITY (START WITH 1),
    social_day_id integer NOT NULL REFERENCES regions.social_day_achievements(id),
    service_type_id integer NOT NULL REFERENCES regions.service_types(id),
    service_subtype_id integer DEFAULT 0 REFERENCES regions.service_subtypes(id),
    ethnicity_id integer NOT NULL REFERENCES regions.ethnicities(id),
    age_range_id integer NOT NULL REFERENCES regions.age_range(id),
    n_mans integer NOT NULL DEFAULT 0,
    n_womans integer NOT NULL DEFAULT 0,
    primary key(id)
);