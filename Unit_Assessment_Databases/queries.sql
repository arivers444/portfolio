CREATE TABLE players(
	player_id INT NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	hand VARCHAR NOT NULL,
	country_code VARCHAR NOT NULL);
SELECT * FROM players;

CREATE TABLE matches(
	loser_age FLOAT(24) NOT NULL,
	loser_id INT NOT NULL,
	loser_name VARCHAR NOT NULL,
	loser_rank INT NOT NULL,
	winner_age FLOAT(24) NOT NULL,
	winner_id INT NOT NULL,
	winner_name VARCHAR NOT NULL,
	winner_rank INT NOT NULL);
SELECT * FROM matches;

-- How many times did Serena Williams win?
SELECT COUNT(winner_id)
FROM matches
WHERE winner_name = ('Serena Williams');

-- Number of right handed players.
SELECT COUNT(player_id)
FROM players
WHERE hand = ('R');

-- Number of left handed players.
SELECT COUNT(player_id)
FROM players
WHERE hand = ('L');

-- Wins by handers.
-- Join tables.
SELECT COUNT(ma.winner_id),
	pl.hand
INTO wins_by_hands
FROM matches as ma
	LEFT JOIN players as pl
		ON ma.winner_id = pl.player_id
GROUP BY pl.hand;
SELECT * FROM wins_by_hands;
