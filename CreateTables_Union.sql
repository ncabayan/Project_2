-- Create and use customer_db
DROP DATABASE twitch_db;
CREATE DATABASE twitch_db;
USE twitch_db;

-- Create tables for raw data to be loaded into
CREATE TABLE ninja_follower (
  `id` INTEGER AUTO_INCREMENT NOT NULL,
  player_id int,
  time datetime,
  follower_count int,
  primary key(id)
);

CREATE TABLE tfue_follower (
  `id` INTEGER AUTO_INCREMENT NOT NULL,
  player_id int,
  time datetime,
  follower_count int,
  primary key(id)
);

CREATE TABLE shroud_follower (
  `id` INTEGER AUTO_INCREMENT NOT NULL,
  player_id int,
  time datetime,
  follower_count int,
  primary key(id)
);

CREATE TABLE riot_games_follower (
  `id` INTEGER AUTO_INCREMENT NOT NULL,
  player_id int,
  time datetime,
  follower_count int,
  primary key(id)
);

CREATE TABLE summit_follower (
  `id` INTEGER AUTO_INCREMENT NOT NULL,
  player_id int,
  time datetime,
  follower_count int,
  primary key(id)
);

CREATE TABLE ninja_stream (
  `id` INTEGER AUTO_INCREMENT NOT NULL,
  player_id int,
  time datetime,
  stream_viewers int,
  primary key(id)
);

CREATE TABLE tfue_stream (
  `id` INTEGER AUTO_INCREMENT NOT NULL,
  player_id int,
  time datetime,
  stream_viewers int,
  primary key(id)
);

CREATE TABLE shroud_stream (
  `id` INTEGER AUTO_INCREMENT NOT NULL,
  player_id int,
  time datetime,
  stream_viewers int,
  primary key(id)
);

CREATE TABLE riot_games_stream (
  `id` INTEGER AUTO_INCREMENT NOT NULL,
  player_id int,
  time datetime,
  stream_viewers int,
  primary key(id)
);

CREATE TABLE summit_stream (
  `id` INTEGER AUTO_INCREMENT NOT NULL,
  player_id int,
  time datetime,
  stream_viewers int,
  primary key(id)
);

CREATE TABLE streamers (
  player_id int,
  player_name text
  );
  
INSERT INTO streamers ( `player_id`, `player_name`)
VALUES (1, 'Ninja'),
(2, 'Riot Games'),
(3, 'Shroud'),
(4, 'Summit1g'),
(5, 'Tfue');

-- RUN THIS AFTER RUNNING PYNB FILE TO IMPORT DATA
CREATE TABLE twitch_overall as
SELECT 
player_id, 
id as ping_id,
f.time as follower_ping,
coalesce(follower_count,0) follower_count,
s.time as stream_ping, 
coalesce(stream_viewers,0) as stream_viewers, 
player_name
FROM ninja_follower f
JOIN streamers using (player_id)
JOIN ninja_stream s using (player_id, id)
union
SELECT 
player_id, 
id as ping_id,
f.time as follower_ping,
coalesce(follower_count,0) follower_count,
s.time as stream_ping, 
coalesce(stream_viewers,0) as stream_viewers, 
player_name
FROM tfue_follower f
JOIN streamers using (player_id)
JOIN tfue_stream s using (player_id, id)
union
SELECT 
player_id, 
id as ping_id,
f.time as follower_ping,
coalesce(follower_count,0) follower_count,
s.time as stream_ping, 
coalesce(stream_viewers,0) as stream_viewers, 
player_name
FROM shroud_follower f
JOIN streamers using (player_id)
JOIN shroud_stream s using (player_id, id)
union
SELECT 
player_id, 
id as ping_id,
f.time as follower_ping,
coalesce(follower_count,0) follower_count,
s.time as stream_ping, 
coalesce(stream_viewers,0) as stream_viewers, 
player_name
FROM riot_games_follower f
JOIN streamers using (player_id)
JOIN riot_games_stream s using (player_id, id)
union
SELECT 
player_id, 
id as ping_id,
f.time as follower_ping,
coalesce(follower_count,0) follower_count,
s.time as stream_ping, 
coalesce(stream_viewers,0) as stream_viewers, 
player_name
FROM summit_follower f
JOIN streamers using (player_id)
JOIN summit_stream s using (player_id, id);




