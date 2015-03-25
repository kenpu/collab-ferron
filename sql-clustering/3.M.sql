-- Compute the membership

DELETE FROM M;

WITH V AS (
    select id, 
           cid, 
           (T.x-C.x)^2 + (T.y-C.y)^2 + (T.z-C.z)^2 as d
    FROM T, C
), U AS (
    SELECT id, cid, d, min(d) OVER (PARTITION BY id) as dmin
    FROM V
)
INSERT INTO M(id, cid)
    SELECT id, cid
    FROM U
    WHERE d = dmin;

-- Compute the new centroid
DELETE FROM C0;
INSERT INTO C0 SELECT * FROM C;

DELETE FROM C;
INSERT INTO C(cid, x, y, z)
    SELECT cid, avg(x), avg(y), avg(z)
    FROM M join T using(id)
    GROUP BY cid;

SELECT sum(abs(C0.x-C.x)^2 + abs(C0.y-C.y)^2 + abs(C0.z-C.z)^2)
FROM C join C0 using (cid)
