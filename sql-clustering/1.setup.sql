drop table if exists T cascade;
drop table if exists C cascade;
drop table if exists C0 cascade;
drop table if exists M cascade;

CREATE TABLE T (
    id SERIAL PRIMARY KEY,
    x  REAL,
    y  REAL,
    z  REAL );

CREATE TABLE C (
    cid INT NOT NULL PRIMARY KEY,
    x   REAL,
    y   REAL,
    z   REAL
);

CREATE TABLE C0 (
    cid INT NOT NULL PRIMARY KEY,
    x   REAL,
    y   REAL,
    z   REAL
);


CREATE TABLE M (
    id INT,
    cid INT
);
