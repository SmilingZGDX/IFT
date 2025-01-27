create database cricket
use cricket

create table players(
player_ID int primary key,
player_name varchar(50),
team_name varchar(50),
role enum('Batsman','Bowler','All-rounder','Wicket-keeper') not null)

insert into players values(1,'Ben Adler','England','Batsman')
insert into players values(2,'Keith Rivers','America','Bowler')
insert into players values(3,'Virat Kohli','India','Batsman')
insert into players values(4,'MS Dhoni','India','Bowler')

select * from players

create table batting(
batting_ID int primary key,
player_ID int not null,
matches_played int,
runs_scored int,
balls_faced int,
highest_score int,
foreign key(player_ID) references players(player_ID))

insert into batting values(01,1,250,12000,11000,183)
insert into batting values(02,3,85,3000,2500,155)

select * from batting

create table bowling(
bowling_ID int primary key,
player_ID int not null,
matches_played int,
overs_bowled int,
wickets_taken int,
runs_conceded int,
best_figures varchar(10),
foreign key(player_ID) references players(player_ID))

insert into bowling values(01,2,75,450,350,3500,'6/19')
insert into bowling values(02,4,85,250,90,2200,'4/32')

select * from bowling