import bingo from '../js/bingo.js'
import {
  GOOGLE_SHEETS_API_KEY,
  GOOGLE_SHEETS_CLIENT_ID,
} from '../authentication.js'

// TODO(developer): Set to client ID and API key from the Developer Console
const CLIENT_ID = GOOGLE_SHEETS_CLIENT_ID;
const API_KEY = GOOGLE_SHEETS_API_KEY;

// Discovery doc URL for APIs used by the quickstart
const DISCOVERY_DOC = 'https://sheets.googleapis.com/$discovery/rest?version=v4';

// Authorization scopes required by the API; multiple scopes can be
// included, separated by spaces.
const SCOPES = 'https://www.googleapis.com/auth/spreadsheets.readonly';

let tokenClient;
let gapiInited = false;
let gisInited = false;

/**
 * Callback after api.js is loaded.
 */
window.onGoogleSheetsAPILoaded(() => {
  gapi.load('client', parseObjectives);
});

async function parseObjectives() {
  await gapi.client.init({
    'apiKey':  API_KEY,
    'discoveryDocs': [ DISCOVERY_DOC ],
  });
  let response;
  try {
    // Fetch first 10 files
    response = await gapi.client.sheets.spreadsheets.values.get({
      spreadsheetId: '1eTmfECVVlp1nswOpbsviUjMK-cUwHziLK5nLn4rbuH4',
      range: 'Objectives!A2:A',
    });
  } catch (err) {
    throw err;
  }
  const range = response.result;
  if (!range || !range.values || range.values.length == 0) {
    throw err("Didn't get any data :(");
  }
  const challengePool = range.values.map(row => row[0]);
  // Flatten to string to display
  // const output = range.values.reduce(
  //     (str, row) => `${str}${row[0]}, ${row[4]}\n`,
  //     'Name, Major:\n');
  // document.getElementById('content').innerText = output;
  $(function() {
    bingo(challengePool);
    document.body.setAttribute('data-loading', 'false');
  });
}


/**
 * A challenge that will be presented on the board.
 *
 * This is structured as <name>, as originally there also was a "cats" property
 * which was used to increase diversity of selections for a card. We're forgoing that for
 * now, but to minimise extra work on my end editing the algorithm in `js/bingo.js` to
 * accommodate for a slimmed-down version of `Challenge`, I'm keeping this same shape.
 * @typedef {Object} Challenge
 * @property {string} name Name of the challenge. It's what you'll read.
 */

/**
 * The data source the code in `js/bingo.js` uses to generate a board. Consists of
 * Challenges.
 * @typedef {Challenge[]} ChallengePool
 */

/**
 * The entire pool of challenges to choose from for the bingo. Focused on NG, restricting
 * cutscene-skipping.
 * @type {ChallengePool}
 */
 const challengePool = [

];

$(function() { bingo(challengePool); });
