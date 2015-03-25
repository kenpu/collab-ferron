-- populate T(id, x, y, z)

DELETE FROM T;

INSERT INTO T(x, y, z)
    SELECT random(), random(), random()
    FROM generate_series(1, 1000000);

-- populate C(cid, x, y, z)

DELETE FROM C;

INSERT INTO C
    SELECT cid, random(), random(), random()
    FROM generate_series(1, 5) cid;


