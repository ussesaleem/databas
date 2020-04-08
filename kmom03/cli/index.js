/**
 * Guess my number, a sample CLI client.
 */
"use strict";

// Read from commandline
const readline = require("readline");
const r1 = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Import the game module
const Game = require("./game.js");
const game = new Game();

// Promisify r1.question to question
const util = require("util");

r1.question[util.promisify.custom] = (arg) => {
    return new Promise((resolve) => {
        r1.question(arg, resolve);
    });
};
// const question = util.promisify(r1.question);

/**
 * Main function.
 *
 * @returns void
 */
(function() {
    r1.on("close", exitProgram);
    r1.on("line", handleInput);

    game.init();
    console.log(
        "Let's run a game of 'Guess my number'!\n"
        + "I am guessing of a number between 1 and 100.\n"
        + "Can you find out what number I'm guessing?\n"
    );

    r1.setPrompt("Guess my number: ");
    r1.prompt();
})();

/**
 * Handle input as a command and send it to a function that deals with it.
 *
 * @param {string} line The input from the user.
 *
 * @returns {void}
 */
function handleInput(line) {
    let guess;

    line = line.trim();
    switch (line) {
        case "quit":
        case "exit":
            exitProgram();
            break;
        default:
            guess = Number.parseInt(line);
            makeGuess(guess);
    }

    r1.prompt();
}

/**
 * Guess the number and check if its correct.
 *
 * @param {integer} guess The number being guessed.
 *
 * @returns {boolean} true if correct guess, otherwise false.
 */
function makeGuess(guess) {
    let match;
    let message;
    let thinking;

    thinking = Math.round(Math.random() * 100 + 1);

    match = game.check(guess);
    message = `I'm thinking of a number ${thinking}.\n`
        + `Your guess is ${guess}.\n`
        + `Was your guess correct? `
        + (match);
    console.info(message);

    return match;
}

/**
 * Close down program and exit with a status code.
 *
 * @param {number} code Exit with this value, defaults to 0.
 *
 * @returns {void}
 */
function exitProgram(code) {
    code = code || 0;

    console.info("Exiting with status code " + code);
    process.exit(code);
}
