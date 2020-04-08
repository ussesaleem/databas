/**
 * Collects information from the database and presents it, using the
 * functions viewTeachers and teacherAsTable, with the ability to search
 * in the database.
 *
 * @author Usama Saleem
 */
"use strict";

const readline = require("readline");
const r1 = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});
const mysql = require("promise-mysql");
const config = require("./config.json");
let utils = require("./searchTeachersBetween.js");

/**
 * Search function to search between two values in pay and competence.
 * @async
 * @returns void
 */

(async function() {
    const db = await mysql.createConnection(config);
    let str;

    r1.question("Ange min: ", async (min) => {
        r1.question("Ange max: ", async (max) => {
            str = await utils.searchTeachersBetween(db, min, max);
            console.info(str);

            r1.close();
            db.end();
        });
    });
})();
