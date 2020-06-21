INSERT INTO user(username,password,role) VALUES ('admin','$2a$10$e.fSjS5Ik7qWMtCPKf4ZD.Wqm5ow/5pqKVmIJT/7RsqNj7LLOPDs6', 'ROLE_ADMIN');
INSERT INTO user(username,password,role) VALUES ('raphael','$2a$10$r1EaGxS3EE37WkRz7jwjSe3jjGPjle4R.hBfzqksWpnMLlRcbK7XG',  'ROLE_USER');
INSERT INTO user(username,password,role) VALUES ('max','$2a$10$6wj.T2.LCkJh2CKTf/CpwevenTXBNUAYzdstUlIKy/57ObbSwHwSq',  'ROLE_USER');
INSERT INTO user(username,password,role) VALUES ('clemens','$2a$10$Rl8mw/TOt2qIkOKcXVX9Ru3BmI.hJ.XPcKuTCjvCw0DPccBFyd9UW',  'ROLE_USER');

INSERT INTO game(language, name, release_year, version) VALUES ('Japanisch', 'Super Mario 64', '1996.01.01', 1.0);
INSERT INTO game(language, name, release_year, version) VALUES ('Englisch', 'Dark Souls', '2011.01.01', 1.0);
-- Mario world snes
-- witcher 3 PC
-- shovel knight PC
-- sonic 1 genesis



INSERT INTO platform(name) VALUES ('PC');
INSERT INTO platform(name) VALUES ('XBOX 360');
INSERT INTO platform(name) VALUES ('Nintendo 64');

INSERT INTO type_of_run(category) VALUES ('Any%');
INSERT INTO type_of_run(category) VALUES ('100%');
INSERT INTO type_of_run(category) VALUES ('Any% Glitchless');
INSERT INTO type_of_run(category) VALUES ('Blindfolded');


INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2020.01.01', '00:01:20', '', 'validated', 'http://www.youtube.com', 1, 3, 2, 1);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);

INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2020.01.01', '00:02:10', '', 'validated', 'http://www.youtube.com', 1, 3, 2, 1);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);

INSERT INTO speedrun(date, in_game_time, notes, state, validationurl, game_id, platform_id, runner_id, type_of_run_id) VALUES ('2020.01.01', '01:03:30', '', 'validated', 'http://www.youtube.com', 1, 3, 2, 1);
INSERT INTO run_validation(notes, status, validated_by_id) VALUES ('', 'validated', 1);







