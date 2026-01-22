-- workers 
--id, identity_card, is_foreign, full_name, gender_id, department_id, position_id, payroll_type_id, area_coordination_id, status_id, created, updated
INSERT INTO general.workers OVERRIDING SYSTEM VALUE VALUES 
(2, '12345678', FALSE, 'Regular User', 0, 0, 0, 0, 0, 1, CURRENT_DATE, NULL);

SELECT pg_catalog.setval('general.workers_id_seq', 3, true);

-- Users
INSERT INTO regions.users OVERRIDING SYSTEM VALUE VALUES 
(2, 2, 'user', '$2a$10$z/N3ZdEEs6K7az5lQvVGMeDMCGcDadI4q5NGVJgzQv91RJF0I2o96', 2);
-- password admin

SELECT pg_catalog.setval('regions.users_id_seq', 3, true);