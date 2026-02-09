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

INSERT INTO regions.achievements_base VALUES (1, 2, '2025-01-07', 1, '2025-01-16', '22:14:29', 1, 1, 2, 1, 1, 10, ' ', true, ' ');
INSERT INTO regions.achievements_base VALUES (2, 1, '2025-01-07', 1, '2025-02-16', '22:14:30', 1, 1, 2, 1, 1, 10, ' ', true, ' ');
INSERT INTO regions.achievements_base VALUES (3, 1, '2025-01-07', 1, '2025-01-22', '22:15:19', 2, 9, 1, 2, 9, 45, 'hola otra vez', true, ' ');
INSERT INTO regions.achievements_base VALUES (4, 1, '2025-01-07', 1, '2025-02-25', '22:16:19', 1, 1, 1, 1, 1, 11, 'hola', true, ' ');
INSERT INTO regions.achievements_base VALUES (5, 1, '2025-01-07', 1, '2025-01-25', '22:16:19', 1, 1, 1, 1, 1, 11, ' ', true, ' ');
INSERT INTO regions.achievements_base VALUES (6, 1, '2025-01-07', 1, '2025-01-25', '22:16:20', 1, 1, 1, 1, 1, 11, 'hola', true, ' ');
INSERT INTO regions.achievements_base VALUES (7, 3, '2025-01-07', 1, '2025-01-25', '22:16:20', 1, 1, 1, 1, 1, 11, ' ', true, ' ');
INSERT INTO regions.achievements_base VALUES (8, 1, '2025-01-07', 1, '2025-03-25', '22:16:20', 1, 1, 1, 1, 1, 11, ' ', true, ' ');
INSERT INTO regions.achievements_base VALUES (9, 2, '2025-01-07', 1, '2025-01-25', '22:20:36', 1, 1, 1, 9, 101, 341, ' ', true, ' ');
INSERT INTO regions.achievements_base VALUES (10, 1, '2025-01-15', 1, '2025-01-24', '12:22:57', 2, 10, 1, 18, 241, 793, ' ', true, 'hola');
INSERT INTO regions.achievements_base VALUES (12, 3, '2025-01-15', 1, '2025-01-24', '12:26:04', 4, 21, 5, 0, 0, 0, ' ', true, 'hola otra vez');
INSERT INTO regions.achievements_base VALUES (13, 1, '2025-01-15', 1, '2025-01-11', '13:49:33', 2, 10, 1, 22, 324, 1075, 'hola', false, ' ');
INSERT INTO regions.achievements_base VALUES (14, 1, '2025-01-15', 1, '2025-01-11', '13:52:56', 2, 13, 1, 22, 326, 1084, 'hola', false, ' ');
INSERT INTO regions.achievements_base VALUES (15, 1, '2025-01-15', 1, '2025-01-14', '13:57:44', 2, 15, 2, 22, 0, 0, 'hello', false, ' ');
INSERT INTO regions.achievements_base VALUES (16, 1, '2025-01-15', 1, '2025-01-15', '19:47:09', 1, 5, 1, 21, 310, 1019, 'nada', false, ' ');
INSERT INTO regions.achievements_base VALUES (17, 1, '2025-01-15', 1, '2025-01-15', '19:47:48', 1, 6, 1, 0, 0, 0, 'nada', false, ' ');
INSERT INTO regions.achievements_base VALUES (18, 1, '2025-01-15', 1, '2025-04-12', '19:53:38', 1, 3, 1, 0, 0, 0, 'hola', false, ' ');
INSERT INTO regions.achievements_base VALUES (19, 1, '2025-01-16', 1, '2025-01-15', '11:09:04', 1, 7, 1, 1, 1, 9, 'nada', false, ' ');
INSERT INTO regions.achievements_base VALUES (20, 1, '2025-01-16', 1, '2025-01-11', '11:12:49', 1, 7, 1, 23, 331, 1104, 'nada', false, ' ');
INSERT INTO regions.achievements_base VALUES (21, 1, '2025-01-16', 1, '2025-01-16', '11:24:16', 1, 7, 1, 23, 331, 1104, 'hola', false, ' ');
INSERT INTO regions.achievements_base VALUES (22, 1, '2025-01-16', 1, '2025-01-16', '11:28:54', 1, 6, 1, 21, 312, 1029, 'hola', false, ' ');
INSERT INTO regions.achievements_base VALUES (23, 1, '2025-01-16', 1, '2025-01-14', '12:30:17', 1, 4, 1, 0, 1, 1079, 'hola', false, ' ');
INSERT INTO regions.achievements_base VALUES (24, 1, '2025-01-16', 1, '2025-01-11', '12:30:43', 1, 4, 1, 21, 304, 976, 'nada', false, ' ');
INSERT INTO regions.achievements_base VALUES (25, 1, '2025-01-16', 1, '2025-01-16', '12:32:27', 1, 4, 1, 0, 0, 0, 'nada', false, ' ');
INSERT INTO regions.achievements_base VALUES (26, 1, '2025-01-16', 1, '2025-01-16', '13:29:12', 1, 5, 1, 21, 308, 1011, 'hola', false, ' ');
INSERT INTO regions.achievements_base VALUES (27, 1, '2025-01-16', 1, '2025-01-16', '15:08:36', 2, 16, 1, 20, 296, 961, 'nada', false, ' ');
INSERT INTO regions.achievements_base VALUES (28, 1, '2025-01-16', 1, '2025-01-16', '15:08:50', 2, 16, 1, 19, 276, 899, ' ', false, ' ');
INSERT INTO regions.achievements_base VALUES (29, 1, '2025-01-16', 1, '2025-01-16', '15:09:00', 2, 16, 1, 18, 246, 810, ' ', false, ' ');
INSERT INTO regions.achievements_base VALUES (30, 1, '2025-01-16', 1, '2025-01-16', '15:09:08', 2, 16, 1, 19, 274, 888, ' ', false, ' ');
INSERT INTO regions.achievements_base VALUES (31, 1, '2025-01-16', 1, '2025-01-16', '15:58:00', 1, 2, 1, 22, 324, 1076, 'nada', false, ' ');
INSERT INTO regions.achievements_base VALUES (32, 1, '2025-01-16', 1, '2025-01-12', '15:58:29', 1, 2, 1, 14, 188, 628, ' ', false, ' ');
INSERT INTO regions.achievements_base VALUES (33, 1, '2025-01-16', 1, '2025-01-16', '16:10:48', 2, 8, 1, 8, 91, 301, 'nada', false, ' ');
INSERT INTO regions.achievements_base VALUES (34, 1, '2025-01-16', 1, '2025-01-14', '16:11:16', 2, 8, 1, 21, 310, 1019, 'nada', false, ' ');
INSERT INTO regions.achievements_base VALUES (35, 1, '2024-01-19', 1, '2024-01-26', '18:50:04', 1, 7, 1, 1, 1, 8, NULL, true, ' ');

SELECT pg_catalog.setval('regions.achievements_base_id_seq', 36, true);

INSERT INTO regions.achievements_others VALUES (1, 1, 9, NULL, 20, 5, NULL, 'pepe', NULL);
INSERT INTO regions.achievements_others VALUES (2, 2, 9, NULL, 25, 0, NULL, 'pepe', NULL);
INSERT INTO regions.achievements_others VALUES (3, 3, 9, NULL, 50, 0, NULL, 'pepe2', NULL);
INSERT INTO regions.achievements_others VALUES (4, 4, 10, NULL, 35, 0, NULL, 'maria', NULL);
INSERT INTO regions.achievements_others VALUES (5, 5, 10, NULL, 20, 10, NULL, 'maria', NULL);
INSERT INTO regions.achievements_others VALUES (6, 6, 10, NULL, 20, 5, NULL, 'maria', NULL);
INSERT INTO regions.achievements_others VALUES (7, 7, 10, NULL, 0, 0, NULL, 'maria', NULL);
INSERT INTO regions.achievements_others VALUES (8, 8, 10, NULL, 20, 2, NULL, 'maria', NULL);
INSERT INTO regions.achievements_others VALUES (9, 9, 8, NULL, 10, 0, NULL, 'jimena', NULL);
INSERT INTO regions.achievements_others VALUES (10, 10, 1, NULL, 20, 5, NULL, 'manolo', NULL);
INSERT INTO regions.achievements_others VALUES (11, 12, 2, NULL, 0, 0, NULL, 'pepe', NULL);
INSERT INTO regions.achievements_others VALUES (12, 13, 8, NULL, 20, 10, NULL, 'manolo', '04141313552');
INSERT INTO regions.achievements_others VALUES (13, 14, 8, NULL, 50, 10, NULL, 'pepe', '04141313552');
INSERT INTO regions.achievements_others VALUES (14, 15, 1, NULL, 20, 10, NULL, 'juana', '04141313552');
INSERT INTO regions.achievements_others VALUES (15, 18, 8, NULL, 20, 2, NULL, 'manolo', '04141313552');
INSERT INTO regions.achievements_others VALUES (16, 19, 8, NULL, 20, 2, NULL, 'manolo', '04141313552');
INSERT INTO regions.achievements_others VALUES (17, 20, 8, NULL, 4, 1, NULL, 'manolo', '04141313552');
INSERT INTO regions.achievements_others VALUES (18, 21, 8, NULL, 20, 2, NULL, 'manolo', '04141313552');
INSERT INTO regions.achievements_others VALUES (19, 23, 6, NULL, 20, 1, NULL, 'manolo', '04141313552');
INSERT INTO regions.achievements_others VALUES (20, 24, 4, NULL, 20, 2, NULL, 'manolo', '04141313552');
INSERT INTO regions.achievements_others VALUES (21, 25, 4, NULL, 20, 4, NULL, 'manolo', '04141313552');
INSERT INTO regions.achievements_others VALUES (22, 31, 6, NULL, 20, 10, NULL, 'manolo', '04141313552');
INSERT INTO regions.achievements_others VALUES (23, 32, 1, NULL, 20, 5, NULL, 'manolo', '04141313552');
INSERT INTO regions.achievements_others VALUES (24, 33, 8, NULL, 20, 2, NULL, 'manolo', '04141313552');
INSERT INTO regions.achievements_others VALUES (25, 34, 8, NULL, 25, 1, NULL, 'manolo', '04141313552');
INSERT INTO regions.achievements_others VALUES (26, 35, 9, NULL, 1, 1, NULL, 'manolo', NULL);

SELECT pg_catalog.setval('regions.achievements_others_id_seq', 27, true);