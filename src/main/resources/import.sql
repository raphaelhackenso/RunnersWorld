INSERT INTO user(username,password,role) VALUES ('admin','$2a$10$e.fSjS5Ik7qWMtCPKf4ZD.Wqm5ow/5pqKVmIJT/7RsqNj7LLOPDs6', 'ROLE_ADMIN');
INSERT INTO user(username,password,role) VALUES ('raphael','$2a$10$r1EaGxS3EE37WkRz7jwjSe3jjGPjle4R.hBfzqksWpnMLlRcbK7XG',  'ROLE_USER');
INSERT INTO user(username,password,role) VALUES ('max','$2a$10$6wj.T2.LCkJh2CKTf/CpwevenTXBNUAYzdstUlIKy/57ObbSwHwSq',  'ROLE_USER');
INSERT INTO user(username,password,role) VALUES ('clemens','$2a$10$Rl8mw/TOt2qIkOKcXVX9Ru3BmI.hJ.XPcKuTCjvCw0DPccBFyd9UW',  'ROLE_USER');

INSERT INTO game(language, name, release_year, version) VALUES ('Japanisch', 'Super Mario 64', '1996.01.01', 1.0);
INSERT INTO game(language, name, release_year, version) VALUES ('Englisch', 'Dark Souls', '2011.01.01', 2.7);
INSERT INTO game(language, name, release_year, version) VALUES ('Englisch', 'The Witcher 3: Wild Hunt', '2015.05.19', 1.32);
INSERT INTO game(language, name, release_year, version) VALUES ('Englisch', 'Shovel Knight', '2014.06.26', 4.1);
INSERT INTO game(language, name, release_year, version) VALUES ('Englisch', 'Sonic the Hedgehog', '1991.06.23', 1.2);
INSERT INTO game(language, name, release_year, version) VALUES ('Japanisch', 'Mario World', '1990.11.21', 1.1);


INSERT INTO platform(name) VALUES ('PC');
INSERT INTO platform(name) VALUES ('XBOX 360');
INSERT INTO platform(name) VALUES ('Nintendo 64');
INSERT INTO platform(name) VALUES ('SNES');
INSERT INTO platform(name) VALUES ('SEGA Genesis');
INSERT INTO platform(name) VALUES ('Nintendo Switch');

INSERT INTO type_of_run(category) VALUES ('Any%');
INSERT INTO type_of_run(category) VALUES ('100%');
INSERT INTO type_of_run(category) VALUES ('Any% Glitchless');
INSERT INTO type_of_run(category) VALUES ('Blindfolded');


INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2020.06.14', '01:21:52', '', 'validated', 'http://www.youtube.com', 6, 4, 2, 2);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);

INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2019.11.24', '01:24:57', '', 'validated', 'http://www.youtube.com', 6, 4, 3, 2);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);

INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2018.07.11', '01:25:57', '', 'validated', 'http://www.youtube.com', 6, 4, 2, 2);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);

INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2019.06.21', '02:58:22', '', 'validated', 'http://www.youtube.com', 3, 1, 3, 1);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);

INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2020.05.02', '02:59:57', '', 'validated', 'http://www.youtube.com', 3, 1, 3, 1);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);

INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2020.03.19', '03:04:26', '', 'validated', 'http://www.youtube.com', 3, 1, 2, 1);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);

INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2019.08.01', '03:06:46', '', 'validated', 'http://www.youtube.com', 3, 1, 4, 1);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);

INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2020.01.30', '00:31:14', '', 'validated', 'http://www.youtube.com', 2, 1, 1, 1);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);

INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2017.09.11', '00:39:07', '', 'validated', 'http://www.youtube.com', 2, 1, 4, 3);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);

INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2020.06.18', '00:42:07', '', 'validated', 'http://www.youtube.com', 4, 6, 3, 1);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);

INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2019.02.12', '00:42:21', '', 'validated', 'http://www.youtube.com', 4, 6, 2, 1);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);

INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2019.04.24', '00:42:58', '', 'validated', 'http://www.youtube.com', 4, 6, 4, 1);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);

INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2017.03.11', '00:43:42', '', 'validated', 'http://www.youtube.com', 4, 6, 3, 1);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);

INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2020.05.29', '01:38:28', '', 'validated', 'http://www.youtube.com', 1, 3, 4, 2);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);

INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2020.03.26', '01:38:34', '', 'validated', 'http://www.youtube.com', 1, 3, 3, 2);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);

INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2019.10.20', '01:38:54', '', 'validated', 'http://www.youtube.com', 1, 3, 2, 2);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);

INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2020.02.07', '01:39:05', '', 'validated', 'http://www.youtube.com', 1, 3, 1, 2);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);






