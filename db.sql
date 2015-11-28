CREATE DATABASE ConferenceScheduler;
USE ConferenceScheduler

CREATE TABLE users(
	id int NOT NULL identity,
	username varchar(50) NOT NULL UNIQUE,
	email varchar(50) NOT NULL UNIQUE,
	password char(96) NOT NULL,	
	PRIMARY KEY(id)
);

CREATE TABLE roles(
	id int NOT NULL identity,
	name varchar(50) NOT NULL UNIQUE,
	PRIMARY KEY(id)
);

CREATE TABLE venue(
	id int NOT NULL identity,
	name varchar(50) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE hall(
	id int NOT NULL identity,
	name varchar(50) NOT NULL,
	venue_id int NOT NULL,
	limit int NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(venue_id) REFERENCES venue(id),
);

CREATE TABLE conference(
	id int NOT NULL identity,
	name varchar(50) NOT NULL,
	description varchar(50) NOT NULL,
	owner_id int NOT NULL,
	venue_id int NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	PRIMARY KEY(Id),
	FOREIGN KEY(owner_id) REFERENCES users(id),
	FOREIGN KEY(venue_id) REFERENCES venue(id),
);

CREATE TABLE lecture(
	id int NOT NULL identity,
	name varchar(50) NOT NULL,
	description varchar(50) NOT NULL,
	start_time date NOT NULL,
	end_time date NOT NULL,
	speaker_id int NOT NULL,
	hall_id int NOT NULL,
	conference_id int NOT NULL,
	PRIMARY KEY(Id),
	FOREIGN KEY(speaker_id) REFERENCES users(id),
	FOREIGN KEY(hall_id) REFERENCES hall(id),
	FOREIGN KEY(conference_id) REFERENCES conference(id),
);

CREATE TABLE user_roles(
	user_id int NOT NULL,
	role_id int NOT NULL,
	FOREIGN KEY(user_id) REFERENCES users(Id), 
	FOREIGN KEY(role_id) REFERENCES roles(Id)
);

CREATE TABLE user_lectures(
	user_id int NOT NULL,
	lecture_id int NOT NULL,
	FOREIGN KEY(user_id) REFERENCES users(Id), 
	FOREIGN KEY(lecture_id) REFERENCES lecture(Id)
);

CREATE TABLE conference_admins(
	conference_id int NOT NULL,
	admin_id int NOT NULL,
	FOREIGN KEY(conference_id) REFERENCES conference(Id), 
	FOREIGN KEY(admin_id) REFERENCES users(Id)
);

INSERT INTO roles (name) VALUES ('user');
INSERT INTO roles (name) VALUES ('site administrator');
INSERT INTO roles (name) VALUES ('conference owner');
INSERT INTO roles (name) VALUES ('conference administrator');

INSERT INTO users (username, password, email) VALUES ('Asen', 'e3431a8e0adbf96fd140103dc6f63a3f8fa343ab                                                        ', 'asd@asd.com');
INSERT INTO users (username, password, email) VALUES ('Ivan', 'e3431a8e0adbf96fd140103dc6f63a3f8fa343ab                                                        ', 'asdd@asdd.com');
INSERT INTO users (username, password, email) VALUES ('Aleksandur', 'e3431a8e0adbf96fd140103dc6f63a3f8fa343ab                                                        ', 'asd1234@a.com');
INSERT INTO users (username, password, email) VALUES ('Lubomir', 'e3431a8e0adbf96fd140103dc6f63a3f8fa343ab                                                        ', 'asd@b.com');
INSERT INTO users (username, password, email) VALUES ('Rado', 'e3431a8e0adbf96fd140103dc6f63a3f8fa343ab                                                        ', 'rado@b.com');

INSERT INTO user_roles (user_id, role_id) VALUES('1', '1');
INSERT INTO user_roles (user_id, role_id) VALUES('2', '1');
INSERT INTO user_roles (user_id, role_id) VALUES('3', '1');
INSERT INTO user_roles (user_id, role_id) VALUES('4', '1');
INSERT INTO user_roles (user_id, role_id) VALUES('5', '2');

INSERT INTO venue (name) VALUES ('Gabrovo Palace');
INSERT INTO venue (name) VALUES ('Conference room Varna');
INSERT INTO venue (name) VALUES ('Arena Sofia');
INSERT INTO venue (name) VALUES ('Pleven Panorama');
INSERT INTO venue (name) VALUES ('London University');
INSERT INTO venue (name) VALUES ('Bar Super Palace');
INSERT INTO venue (name) VALUES ('Slivenski hall of fame');
INSERT INTO venue (name) VALUES ('The Req Square Palace');
INSERT INTO venue (name) VALUES ('Washington DC');

INSERT INTO hall (name, venue_id, limit) VALUES ('Ground Lab', '3', '50');
INSERT INTO hall (name, venue_id, limit) VALUES ('Inspiration Lab', '2', '250');
INSERT INTO hall (name, venue_id, limit) VALUES ('The smart room Lab', '4', '1');
INSERT INTO hall (name, venue_id, limit) VALUES ('The biggest computer hall in Gabrovo', '1', '3');
INSERT INTO hall (name, venue_id, limit) VALUES ('Magnificant hall', '5', '150');
INSERT INTO hall (name, venue_id, limit) VALUES ('Unique hall', '6', '100');
INSERT INTO hall (name, venue_id, limit) VALUES ('Lonely hearts hall', '7', '10');
INSERT INTO hall (name, venue_id, limit) VALUES ('Victory hall', '8', '7');
INSERT INTO hall (name, venue_id, limit) VALUES ('Kebap hall', '9', '13');

INSERT INTO conference (description, name, owner_id, venue_id, start_date, end_date) VALUES ('SoftUni Conference', 'SoftUni Conf', '1', '1', '2015-11-22', '2015-11-23');
INSERT INTO conference (description, name, owner_id, venue_id, start_date, end_date) VALUES ('Sofia University Conference', 'SU Conf', '1', '2', '2015-11-30', '2015-12-4');
INSERT INTO conference (description, name, owner_id, venue_id, start_date, end_date) VALUES ('Technical University Conference', 'TU Conf', '2', '3', '2015-12-1', '2015-12-3');
INSERT INTO conference (description, name, owner_id, venue_id, start_date, end_date) VALUES ('Medical Conference', 'Medical Conf', '2', '4', '2015-12-2', '2015-12-5');
INSERT INTO conference (description, name, owner_id, venue_id, start_date, end_date) VALUES ('Mercedes Conference', 'Mercedes Conf', '1', '5', '2015-12-1', '2015-12-4');
INSERT INTO conference (description, name, owner_id, venue_id, start_date, end_date) VALUES ('Microsoft Conference', 'Microsoft Conf', '1', '6', '2015-12-3', '2015-12-6');

INSERT INTO conference_admins (admin_id, conference_id) VALUES ('1', '1');
INSERT INTO conference_admins (admin_id, conference_id) VALUES ('2', '2');
INSERT INTO conference_admins (admin_id, conference_id) VALUES ('3', '3');
INSERT INTO conference_admins (admin_id, conference_id) VALUES ('4', '4');
INSERT INTO conference_admins (admin_id, conference_id) VALUES ('1', '5');
INSERT INTO conference_admins (admin_id, conference_id) VALUES ('2', '6');

INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('4', 'OOP Inheritance', '2015-12-2 14:00:00', '3', 'OOP', '1', '2015-12-2 12:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('3', 'OOP Encapsulation and Polymorhism', '2015-12-1 15:00:00', '1', 'C# Lecture', '2', '2015-12-1 13:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('2', 'OOP Exception Handling', '2015-12-3 16:00:00', '2', 'Java', '4', '2015-12-3 13:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('1', 'Web Dev Basics Security', '2015-11-23 17:00:00', '4', 'Web Development', '3', '2015-11-23 14:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('6', 'ASP.NET New Features', '2015-12-3 18:00:00', '5', 'ASP.NET', '2', '2015-12-3 15:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('5', 'Use Google properly', '2015-12-3 19:00:00', '6', 'Google', '1', '2015-12-3 17:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('1', 'Strong Cohesion', '2015-11-22 19:00:00', '4', 'Strong Cohesion', '3', '2015-11-22 17:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('1', 'Loose Coopling', '2015-11-22 21:00:00', '4', 'Loose Coopling', '4', '2015-11-22 19:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('1', 'Events ', '2015-11-22 15:00:00', '4', 'Events', '1', '2015-11-22 11:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('1', 'Cloud Azure', '2015-11-23 19:00:00', '4', 'Azure', '2', '2015-11-23 17:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('2', 'Primitive types', '2015-11-30 15:00:00', '2', 'Primitive types', '3', '2015-11-30 13:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('2', 'Loops', '2015-11-30 18:00:00', '2', 'Loops', '4', '2015-11-30 16:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('2', 'Arrays', '2015-12-1 19:00:00', '2', 'Arrays', '1', '2015-12-1 17:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('2', 'Conditionals', '2015-12-3 19:00:00', '2', 'If / else', '1', '2015-12-3 17:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('3', 'C# 6 -> The future', '2015-12-3 19:00:00', '1', 'C# 6', '2', '2015-12-3 17:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('3', 'About mice and man', '2015-12-1 19:00:00', '1', 'Mice / man', '2', '2015-12-1 17:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('3', 'Social engineering', '2015-12-2 12:30:00', '1', 'Social hacks', '3', '2015-12-2 11:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('3', 'P vs NP', '2015-12-2 16:00:00', '1', 'P vs NP', '3', '2015-12-2 14:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('4', 'Greedy algorithms', '2015-12-4 19:00:00', '3', 'Greedy', '4', '2015-12-4 17:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('4', 'Graphs and graph algorithms', '2015-12-4 21:00:00', '3', 'Graphs', '4', '2015-12-4 19:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('4', 'Combinatorics', '2015-12-5 18:00:00', '3', 'Combinatorics', '1', '2015-12-5 17:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('4', 'Oracle Database Tools', '2015-12-5 16:00:00', '3', 'Oracle DB', '2', '2015-12-5 13:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('5', 'T-SQL and Microsoft SQL Tools', '2015-12-1 13:00:00', '5', 'T-SQL', '3', '2015-12-1 11:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('5', 'MySQL', '2015-12-1 19:00:00', '5', 'MySQL', '4', '2015-12-1 17:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('5', 'XML Basics', '2015-12-2 19:00:00', '5', 'XML', '1', '2015-12-2 17:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('5', 'Json Basics', '2015-12-4 19:00:00', '5', 'Json', '2', '2015-12-4 17:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('6', 'HTML Basics', '2015-12-4 11:00:00', '6', 'HTML', '3', '2015-12-4 09:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('6', 'Wordpress', '2015-12-5 16:00:00', '6', 'Wordpress', '4', '2015-12-5 13:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('6', 'Social networks', '2015-12-6 15:00:00', '6', 'Social networks', '1', '2015-12-6 12:30:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('6', 'SQL Injection ', '2015-12-6 18:30:00', '6', 'SQL Injection', '2', '2015-12-6 16:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('4', 'Algorithms', '2015-12-3 19:00:00', '3', 'Algorithms', '3', '2015-12-3 17:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('2', 'PHP Basics', '2015-12-4 19:00:00', '2', 'PHP Basics', '4', '2015-12-4 17:00:00');
INSERT INTO lecture (conference_id, description, end_time, hall_id, name, speaker_id, start_time) VALUES ('3', 'Advanced C#', '2015-12-3 22:00:00', '1', 'Advanced C#', '2', '2015-12-3 19:00:00');

INSERT INTO user_lectures (user_id, lecture_id) VALUES('1', '1');
INSERT INTO user_lectures (user_id, lecture_id) VALUES('2', '2');