/**
 * Guess my number, a sample CLI client.
 */
"use strict";

// Read from commandline
const readline = require("readline");

// Import teachers file
const teachers = require("./teacher.js");

/**
 * Main function.
 *
 * @returns void
 */
(function() {
    const r1 = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    });

    r1.setPrompt("Choose something: ");
    r1.prompt();

    r1.on("close", process.exit);
    r1.on("line", async (line) => {
        line = line.trim();
        let lineArray = line.split(" ");

        switch (lineArray[0]) {
            case "menu":
            case "help":
                showMenu();
                break;
            case "exit":
            case "quit":
                process.exit();
                break;
            case "larare":
                await teachers.larare();
                break;
            case "sok":
                await teachers.sok(lineArray[1]);
                break;
            case "kompetens":
                await teachers.kompetens();
                break;
            case "lon":
                await teachers.lon();
                break;
            case "nylon":
                await teachers.nylon(lineArray[1], lineArray[2]);
                break;
            default:
                showMenu();
                break;
        }

        r1.prompt();
    });
})();

/**
 * Menu function.
 */
function showMenu() {
    console.info(`
        Choose something from the menu:

        exit, quit: Quit the program
        menu, help: Show this menu
        larare: Show info about teachers
        kompetens: Show report on teacher's competence
        lon: Show report on the change in pay
        sok <string>: Search for teachers
        nylon <acronym> <integer>: Changes the pay for teacher
        `);
}
