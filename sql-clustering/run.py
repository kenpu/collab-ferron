import psycopg2 as pg
import time


def runSql(conn, filename):
    "runs a SQL file and returns the runtime."
    c = conn.cursor()
    start = time.time()
    with open(filename, "r") as f:
        sql = f.read()
        c.execute(sql)
    c.close()
    return time.time() - start


conn = pg.connect(database="cluster")
for f in ["1.setup.sql", "2.populate.sql"]:
    runSql(conn, f)

for i in range(10):
    t = runSql(conn, "3.M.sql")
    print "[%d]: %.2f seconds" % (i, t)

conn.close()

