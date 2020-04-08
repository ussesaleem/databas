/**
 * Holds the viewTeachers function which is used in teachers.js.
 *
 * @author Usama Saleem
 */
"use strict";

/**
 * Gets the information from database to feed into table function.
 * @async
 * @returns void
 */

async function lon(db) {
    let sql;
    let res;

    sql = `
    SELECT
        l.akronym AS "Akronym",
        l.fornamn AS "Förnamn",
        l.efternamn AS "Efternamn",
        p.lon AS "Lön innan",
        l.lon AS "Lön nu",
        l.lon - p.lon AS "Diff",
        (l.lon - p.lon) / p.lon * 100 AS "Löneförändring %",
        IF(((l.lon - p.lon) / p.lon * 100) > 2, "ok", "nok") AS Mini
    FROM larare AS l
        JOIN larare_pre AS p
            ON l.akronym = p.akronym
    ORDER BY (l.lon - p.lon) / p.lon * 100 DESC;
    `;
    res = await db.query(sql);
    return res;
}

module.exports = {
    "lon": lon
};
