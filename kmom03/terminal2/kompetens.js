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

async function kompetens(db) {
    let sql;
    let res;

    sql = `
    SELECT
        l.akronym AS "Akronym",
        l.fornamn AS "Förnamn",
        l.efternamn AS "Efternamn",
        p.kompetens AS "Kompetens innan",
        l.kompetens AS "Kompetens nu",
        l.kompetens - p.kompetens AS Diffkomp
    FROM larare AS l
        JOIN larare_pre AS p
            ON l.akronym = p.akronym
    ORDER BY Diffkomp DESC;
    `;
    res = await db.query(sql);
    return res;
}

module.exports = {
    "kompetens": kompetens
};
