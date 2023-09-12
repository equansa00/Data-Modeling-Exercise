-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Teams" (
    "team_id" SERIAL   NOT NULL,
    "team_name" VARCHAR(255)   NOT NULL,
    "founding_year" INT   NOT NULL,
    "stadium_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "team_id"
     ),
    CONSTRAINT "uc_Teams_team_name" UNIQUE (
        "team_name"
    )
);

CREATE TABLE "Players" (
    "player_id" SERIAL   NOT NULL,
    "team_id" INT   NOT NULL,
    "first_name" VARCHAR(100)   NOT NULL,
    "last_name" VARCHAR(100)   NOT NULL,
    "position" VARCHAR(50)   NOT NULL,
    "date_of_birth" DATE   NOT NULL,
    "nationality" VARCHAR(100)   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "player_id"
     )
);

CREATE TABLE "Goals" (
    "goal_id" SERIAL   NOT NULL,
    "player_id" INT   NOT NULL,
    "match_id" INT   NOT NULL,
    "goal_time" TIME   NOT NULL,
    "goal_type" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "goal_id"
     )
);

CREATE TABLE "Referees" (
    "referee_id" SERIAL   NOT NULL,
    "first_name" VARCHAR(100)   NOT NULL,
    "last_name" VARCHAR(100)   NOT NULL,
    "certification_date" DATE   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "referee_id"
     )
);

CREATE TABLE "Matches" (
    "match_id" SERIAL   NOT NULL,
    "home_team_id" INT   NOT NULL,
    "away_team_id" INT   NOT NULL,
    "referee_id" INT   NOT NULL,
    "match_date" DATE   NOT NULL,
    "score_home" INT   NOT NULL,
    "score_away" INT   NOT NULL,
    CONSTRAINT "pk_Matches" PRIMARY KEY (
        "match_id"
     )
);

CREATE TABLE "Seasons" (
    "season_id" SERIAL   NOT NULL,
    "start_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "league_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Seasons" PRIMARY KEY (
        "season_id"
     )
);

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("team_id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("player_id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("match_id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_home_team_id" FOREIGN KEY("home_team_id")
REFERENCES "Teams" ("team_id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_away_team_id" FOREIGN KEY("away_team_id")
REFERENCES "Teams" ("team_id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_referee_id" FOREIGN KEY("referee_id")
REFERENCES "Referees" ("referee_id");

