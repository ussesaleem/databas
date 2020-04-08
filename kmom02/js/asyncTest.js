/**
 * A test file to try out the functions from lecture.
 *
 * @author Usama Saleem
 */
"use strict";

const fs = require("fs");
const util = require("util");
const readFile = util.promisify(fs.readFile);


async function main() {
    const path = "someText.txt";

    console.log("BEFORE TEXT");

    let data = await readFile(path, "UTF-8");

    console.log(data);
    console.log("AFTER TEXT");
}

main();

function stringRange(a, b, sep = ", ") {
    let res = "";
    let i = a;

    while (i < b) {
        res += i + sep;
        i++;
    }

    res = res.substring(0, res.length - sep.length);
    return res;
}

console.log(stringRange(1, 10, "-"));
