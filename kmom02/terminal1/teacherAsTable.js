/**
 * Holds the teacherAsTable function used by viewTeachers function.
 *
 * @author Usama Saleem
 */
"use strict";

/**
 * Creates the outline of table function.
 * @async
 * @returns void
 */

function teacherAsTable(res) {
    let str;

    str  = "+-----------+---------------------+-----------+----------+-----------+------------+\n";
    str += "| Akronym   | Namn                | Avdelning |   Lön    | Kompetens |    Född    |\n";
    str += "|-----------|---------------------|-----------|----------|-----------|------------|\n";
    for (const row of res) {
        str += "| ";
        str += row.akronym.padEnd(10);
        str += "| ";
        str += (row.fornamn + " " + row.efternamn).padEnd(20);
        str += "| ";
        str += row.avdelning.padEnd(10);
        str += "| ";
        str += row.lon.toString().padStart(9);
        str += "| ";
        str += row.kompetens.toString().padStart(10);
        str += "| ";
        str += row.fodd.toString().padStart(8);
        str += " |\n";
    }
    str += "+-----------+---------------------+-----------+----------+-----------+------------+\n";

    return str;
}

module.exports = {
    "teacherAsTable": teacherAsTable
};
