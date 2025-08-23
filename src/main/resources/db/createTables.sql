DROP TABLE IF EXISTS tennis_match;
DROP TABLE IF EXISTS player;

CREATE TABLE player (
    id SERIAL NOT NULL PRIMARY KEY,
    name character(20) NOT NULL
);

CREATE TABLE tennis_match (
    id SERIAL PRIMARY KEY NOT NULL,
    first_player_id INT NOT NULL REFERENCES player (id),
    second_player_id INT NOT NULL REFERENCES player (id),
    score_first_player SMALLINT,
    score_second_player SMALLINT
)