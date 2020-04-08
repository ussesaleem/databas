/**
 * Money transfer CLI client.
 */
"use strict";

// Read from commandline
const readline = require("readline");

// Import
const transfer = require("./src/transfer.js");

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

    r1.setPrompt("Bank: ");
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
            case "move":
                await transfer.transfer();
                break;
            case "balance":
                await transfer.balance();
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

        exit, quit, ctrl-d: Quit the program
        menu, help:         Show this menu
        move:               Move 1.5 peng to Eva
        balance:            View the accounts and balance
        `);
}
