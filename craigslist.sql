DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE locations 
(
    id SERIAL,
    state TEXT PRIMARY KEY,
    country TEXT NOT NULL,
    region TEXT NOT NULL

);

CREATE TABLE categories 
(
    id SERIAL,
    category TEXT PRIMARY KEY
);

CREATE TABLE users 
(
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,
    state TEXT REFERENCES locations(state)
);

CREATE TABLE posts 
(
    post_id SERIAL,
    user_id INTEGER REFERENCES users (user_id),
    title TEXT NOT NULL,
    description VARCHAR(50) NOT NULL,
    state TEXT REFERENCES locations(state),
    cata_name TEXT REFERENCES categories (category)

);

INSERT INTO locations (state,country,region) 
VALUES ('Colorado','United States of America','North America'),
('Texas','United States of America','North America'),
('New York','United States of America','North America');

INSERT INTO locations (state,country,region)
VALUES ('Vienna','Austria','Central Europe'),
('Copenhagen','Denmark','Northern Europe'),
('Berlin','Germany', 'Central Europe');

INSERT INTO categories (category) VALUES ('Art'),('Educational'),
('Games'),('Entertainment'),('Music'),('Movies'),('Sports');

INSERT INTO users (user_name,password,state) 
VALUES ('cooluser', 'dogs1','Colorado'),('baduser','cats2','Texas'),
('eurouser45','chickenz48','Copenhagen');

INSERT INTO posts (user_id,title,description,state,cata_name)
VALUES (1,'Fun Movies','A list of all the movies I love!','Colorado','Movies'),
(2,'New Songs Being Released','Check out these new songs guys','Berlin','Music'),
(3, 'Bad Games', 'I HATE these games','Texas', 'Games');



select * from users;
select * from locations;
select * from categories;
select * from posts;

select user_name,title 
from posts 
join users on posts.user_id=users.user_id 
group by user_name,title;

select user_name,title 
from posts 
join users on posts.user_id=users.user_id 
group by user_name,title 
having user_name = 'baduser';

select user_name,title,region 
from posts 
join users on posts.user_id=users.user_id 
join locations on posts.state=locations.state 
group by user_name,title,region;


select user_name,title,region 
from posts 
join users on posts.user_id=users.user_id 
join locations on posts.state=locations.state 
group by user_name,title,region 
having region = 'Central Europe';