import bingo from '../js/bingo.js'

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
  "Bloom 6 Cursed Patches",
  "Complete 3 ball pushing minigames (Yami counts)",
  // "Deliver the Acorn to Sleepy",
  // "Deliver the Beehive to Sleepy",
  "Deliver Inaba to the Animal Lover",
  "Take Susano to Nagi’s Statue",
  "Obtain 40 Demon Fangs",
  "Use 6 Meat Feedbags",
  "Use 6 Grass Feedbags",
  "Use 6 Seeds Feedbags",
  "Use 6 Fish Feedbags",
  "Find 5 Zodiac Statues",
  "Race Kai",
  "Deliver the Prayer Slips to Rao",
  "Upgrade 2 weapons With Gold Dust",
  "Defeat 2 Blockheads",
  "Rescue Chun",
  "Get 3 Hidden Brush Techniques (Includes Upgrades)",
  "Cut Down 2 Fruits From Sakuya’s Tree",
  "Successfully enchant one of Yoichi’s arrows",
  "Pick up all the treasures in Jamba’s Room",
  "Clear 6 Devil Gates",
  "Eat One of Mrs. Orange’s Cherry Cakes",
  "Learn Hardhead",
  "Get 10 Brush Techniques (Hidden/Upgrades Included)",
  "Collect 10 Crystals",
  "Deliver a Vase to 3 Guardian Statues",
  "Use 3 Lockjaw Keys",
  "Complete 2 Digging Minigames",
  "Get Fed by 3 Separate NPCs",
  "Get Whacked by 3 Separate NPCs",
  "Sculpt 5 Snow Statues in Kamui",
  "Race Tobi 3 Times",
  "Fish in 3 different locations (Sei-an bridge and palace are separate)",
  "Activate 8 Mermaid Springs",
  "Successfully draw 2 popular designs for Mr. Chic",
  "Turn 5 Oina Into Wolves",
  "Collect 10 Pearls",
  "Fight the Fire Doom Mirror",
  "Get Attacked by 3 Different Animals",
  "Defeat 3 Blue Demon Scrolls",
  "Find 5 Incense Burners",
  "Obtain 20 Stray Beads",
  "Pick up all the treasures in the locked building in Sei-an",
  "Obtain 2 Dungeon Maps",
  "Do the Snowball Quest in Wep’Keer",
  "Complete Komuso’s Challenge in Kusa",
  "Learn 2 Dojo Weapon Techniques",
  "Clear Mika’s Monster List (Shinshu)",
  "Clear Haruka’s Monster List (Kusa)",
  "Clear Wali’s Monster List (Kamui)",
  "Clear the Samurai’s Monster List (Sei-an)",
  "Get all Stray Beads from Kamiki Village",
  "Obtain all Stray Beads from Sasa Sanctuary",
  "Obtain all Stray Beads from Kusa Village",
  "Obtain all Stray Beads from the Sunken Ship",
  "Catch the Living Sword",
  "Buy 2 Weapons",
  "Obtain All Three End-Game Weapons",
  "Finish the Ryoshima Devil Gate Trial",
  "Die In-Game",
  "Visit All the Islands in North Ryoshima",
  "Take the Aspiring Carpenter to Naguri",
  "Feed All the Cats in Catcall Tower",
  "Obtain the Sun Fragment in Hana Valley",
  "Collect the Snake Statue on the Twin Rocks in Ryoshima",
  "Bloom the Clovers at the Top of Taka Pass",
  "Get People Drunk in the Kamiki Festival",
  "Interrupt Susano and Kushi’s Moment in Cave of Nagi",
  "Push the Ball in Moon Cave",
  "Fill In the Entire River of the Heavens",
  "Fully Restore the Kusa Flower Patch",
  "Fill an astral pouch without the aid of Rice Stew",
  // "Eat 20 Different Types of Food", // Difficult to track
  "Get Eaten by the Water Dragon",
  "Deliver the Treasure Box to Urashima",
  // "Swim in 15 Different Water Sources", // Difficult to track
  "Talk to the Cutters in Cursed Taka",
  "Obtain the Sun Fragment in Catcall Tower",
  "Pay a Visit to Waka’s HQ",
  "Catch 3 2-round or 3-round fish",
  "Catch All the Night Fish From One Area",
  "Catch All the Day Fish From One Area",
  "Collect 15 Different Treasures",
  "Buy From an Imp Merchant",
  // "Buy From 10 Separate Merchants", // Difficult to track
  // "Cross 4 Galestorm Bridges", // Difficult to track
  "Lay a Reflector Smackdown on 3 Enemies in One Battle",
  // "Get Repelled by 4 Different Barriers", // Difficult to track
  "Bloom 3 Clovers Buried Under Hard Ground",
  "Ride 3 Elevators",
  "Deliver the Kusa Pinwheel to the Tea Customer",
  "Obtain 5 Sun Fragments",
  "Complete a Fish Page",
  "Collect 10 Travel Guides",
  "Obtain 6 Different Tassels",
  "Complete a Bestiary Page",
  "Defeat the Seaweed Monster in Sunken Ship",
  "Fill In the Eyes of Two Daruma Dolls",
  "Get the Holy Bone L From the Ryoshima Bell",
  "Kill 3 Ghost Imps in Sunken Ship",
  "Get 3 different fortunes from Madame Fawn",
  "Talk to Isshaku",
  "Steal an item with the Thief's Glove",
  "Part the sea off Ryoshima Coast",
  "Finish-off any enemy using Ink Bullet",
  "Hold 3 items in Ammy's mouth (keys, sake, vases, etc.)"
]

$(function() { bingo(challengePool); });
