-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Regions" (
    "region_id" SERIAL   NOT NULL,
    "region_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Regions" PRIMARY KEY (
        "region_id"
     ),
    CONSTRAINT "uc_Regions_region_name" UNIQUE (
        "region_name"
    )
);

CREATE TABLE "Users" (
    "user_id" SERIAL   NOT NULL,
    "username" VARCHAR(255)   NOT NULL,
    "password" VARCHAR(255)   NOT NULL,
    "preferred_region_id" INT   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "user_id"
     ),
    CONSTRAINT "uc_Users_username" UNIQUE (
        "username"
    )
);

CREATE TABLE "Posts" (
    "post_id" SERIAL   NOT NULL,
    "title" VARCHAR(255)   NOT NULL,
    "text" TEXT   NOT NULL,
    "user_id" INT   NOT NULL,
    "location" VARCHAR(255)   NOT NULL,
    "region_id" INT   NOT NULL,
    "category_id" INT   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "post_id"
     )
);

CREATE TABLE "Categories" (
    "category_id" SERIAL   NOT NULL,
    "category_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "category_id"
     ),
    CONSTRAINT "uc_Categories_category_name" UNIQUE (
        "category_name"
    )
);

CREATE TABLE "PostCategories" (
    "post_id" INT   NOT NULL,
    "category_id" INT   NOT NULL
);

ALTER TABLE "Users" ADD CONSTRAINT "fk_Users_preferred_region_id" FOREIGN KEY("preferred_region_id")
REFERENCES "Regions" ("region_id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_user_id" FOREIGN KEY("user_id")
REFERENCES "Users" ("user_id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_region_id" FOREIGN KEY("region_id")
REFERENCES "Regions" ("region_id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_category_id" FOREIGN KEY("category_id")
REFERENCES "Categories" ("category_id");

ALTER TABLE "PostCategories" ADD CONSTRAINT "fk_PostCategories_post_id" FOREIGN KEY("post_id")
REFERENCES "Posts" ("post_id");

ALTER TABLE "PostCategories" ADD CONSTRAINT "fk_PostCategories_category_id" FOREIGN KEY("category_id")
REFERENCES "Categories" ("category_id");

