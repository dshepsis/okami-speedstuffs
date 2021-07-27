state("Okami")
{
	// In Game Time
	// IGT is measured by frames in game. Time will start if you started a new
	// game from the title menu, or by loading a NG+ file.
	int time : "main.dll", 0xB217FC;
	int minigameTimer : "main.dll", 0xB1DC5C;

	// For Holy Eagle, Digging Champ, etc.
	byte movementTech : "main.dll", 0xB4DFA2;

	// Multi-use flags
	// Area ID list: https://docs.google.com/spreadsheets/d/1IoZ1XFeblOTb6Qq9PHfBq1KRdcpgYRz8pTObhF3qMrs/edit?usp=sharing
	// `resultsMoney` will be used to signify boss fights have ended in
	// specific areas. The issue with this value is that it only triggers when
	// there is a bonus value on the results screen. For most runners, there
	// will usually be a value there. Will probably find a better method later.
	int areaId : "main.dll", 0xB6B2C8;
	int exitId : "main.dll", 0xB65E74;
	int resultsMoney : "main.dll", 0xB1DBA0;

	// Kusa dogs that you feed. They take up the four most significant bits in this byte.
	int feedDogBitfield : "main.dll", 0xB213C9;

	// Endgame
	// Timing ends on the "Final Results" screen for IGT.
	// Other possible final result values: https://my.mixtape.moe/aeoxal.png
	int finalResults : "main.dll", 0xB5262C;
}

startup
{
	// SETTINGS START //
	// Kamiki Village
	settings.Add("kamiki",              true,  "Kamiki Village");
	settings.Add("river_nagi",          false, "Enter Cave of Nagi",     "kamiki");
	settings.Add("nagi_river",          false, "Exit Cave of Nagi",      "kamiki");
	settings.Add("restore_kamiki",      false, "Restore Kamiki Village", "kamiki");
	settings.Add("kamiki_shinshu",      true,  "Enter Shinshu Field",    "kamiki");

	// Hana Valley
	settings.Add("hana",                true,  "Hana Valley");
	settings.Add("shinshu_hana",        false, "Enter Hana Valley", "hana");
	settings.Add("hana_shinshu",        true,  "Exit Hana Valley",  "hana");

	// Tsuta Ruins
	settings.Add("ruins",               true,  "Tsuta Ruins");
	settings.Add("shinshu_agata",       true,  "Enter Agata Forest",      "ruins");
	settings.Add("agata_fishing",       true,  "Agata Fishing Minigames", "ruins");
	settings.Add("agata_ruins",         true,  "Enter Tsuta Ruins",       "ruins");
	settings.Add("ruins_spider",        false, "Enter Spider Queen",      "ruins");
	settings.Add("spider_queen",        true,  "Defeat Spider Queen",     "ruins");

	// Kusa Village
	settings.Add("kusa",                true,  "Kusa Village");
	settings.Add("agata_taka",          true,  "Enter Taka Pass",    "kusa");
	settings.Add("taka_kusa",           false, "Enter Kusa Village", "kusa");
	settings.Add("canine_tracker",      true,  "Get Canine Tracker", "kusa");
	settings.Add("rei",                 true,  "Feed Rei",           "kusa");
	settings.Add("chi",                 true,  "Feed Chi",           "kusa");
	settings.Add("shin",                true,  "Feed Shin",          "kusa");
	settings.Add("ko",                  true,  "Feed Ko",            "kusa");
	settings.Add("kusa_taka",           true,  "Exit Kusa Village",  "kusa");

	// Sasa Sanctuary
	settings.Add("sasa",                true,  "Sasa Sanctuary");
	settings.Add("taka_sasa",           true,  "Enter Sasa Sanctuary",                 "sasa");
	settings.Add("sasa_digging",        true,  "Mr. Bamboo / Kaguya Digging Minigame", "sasa");
	settings.Add("duty_orb",            true,  "Get Duty Orb",                         "sasa");

	// Canine Tracking
	settings.Add("canines",             true,  "Canine Tracking");
	settings.Add("justice_orb",         true,  "Get Justice Orb", "canines");
	settings.Add("loyalty_orb",         true,  "Get Loyalty Orb", "canines");

	// Gale Shrine
	settings.Add("gale",                true,  "Gale Shrine");
	settings.Add("kusa_gale",           true,  "Enter Gale Shrine",   "gale");
	settings.Add("gale_crimson",        false, "Enter Crimson Helm",  "gale");
	settings.Add("crimson_helm",        true,  "Defeat Crimson Helm", "gale");

	// Moon Cave
	settings.Add("moon_cave",           true,  "Moon Cave");
	settings.Add("enter_moon_cave",     true,  "Enter Moon Cave",       "moon_cave");
	settings.Add("mask",                false, "Get Mask",              "moon_cave");
	settings.Add("calcified_interior",  false, "Exit Calcified Cavern", "moon_cave");
	settings.Add("ogre",                true,  "Get Ogre Liver",        "moon_cave");
	settings.Add("lips",                true,  "Get Lips of Ice",       "moon_cave");
	settings.Add("eyeball",             true,  "Get Eyeball of Fire",   "moon_cave");
	settings.Add("horn",                true,  "Get Black Demon Horn",  "moon_cave");
	settings.Add("interior_orochi",     false, "Enter Orochi",          "moon_cave");
	settings.Add("orochi",              true,  "Defeat Orochi",         "moon_cave");

	// Ryoshima Coast/Sei-An
	settings.Add("ryo",                 true,  "Ryoshima Coast");
	settings.Add("checkpoint_coast",    true,  "Exit City Checkpoint",         "ryo");
	settings.Add("bloom_ryo",           true,  "Bloom Ryoshima Coast",         "ryo");
	settings.Add("holy_eagle",          true,  "Attain Holy Eagle",            "ryo");
	settings.Add("dojo_exit",           false, "Exit Dojo",                    "ryo");
	settings.Add("coast_city",          false, "Enter Sei-an City",            "ryo");
	settings.Add("city_digging",        true,  "Sei-an City Digging Minigame", "ryo");
	settings.Add("city_fishing",        true,  "Sei-an City Fishing Minigame", "ryo");
	settings.Add("coast_ship",          true,  "Enter Ghost Ship",             "ryo");
	settings.Add("ship_coast",          true,  "Exit Ghost Ship",              "ryo");

	// Imperial Palace
	settings.Add("palace",              true,  "Imperial Palace");
	settings.Add("palace_garden",       true,  "Enter Imperial Palace", "palace");
	settings.Add("garden_blight",       false, "Enter Blight",          "palace");
	settings.Add("blight",              true,  "Defeat Blight",         "palace");

	// Water Dragon
	settings.Add("dragon",              true,  "Water Dragon");
	settings.Add("ncoast_catcall",      true,  "Enter Catcall Tower", "dragon");
	settings.Add("catcall_coast",       true,  "Exit Catcall Tower",  "dragon");
	settings.Add("ncoast_dpalace",      true,  "Enter Dragon Palace", "dragon");
	settings.Add("dpalace_dragon",      false, "Enter Water Dragon",  "dragon");
	settings.Add("dragon_dpalace",      true,  "Exit Water Dragon",   "dragon");

	// Oni Island
	settings.Add("oni",                 true,  "Oni Island");
	settings.Add("rao",                 true,  "Defeat Evil Rao",           "oni");
	settings.Add("ncoast_oni",          true,  "Enter Oni Island",          "oni");
	settings.Add("oni_ex_oni_int",      true,  "Enter Oni Island Interior", "oni");
	settings.Add("oni_interior1",       false, "Oni Island Lower Floors",   "oni");
	settings.Add("oni_interior2",       false, "Oni Island 2D Segment",     "oni");
	settings.Add("oni_ninetails",       false, "Enter Ninetails",           "oni");
	settings.Add("ninetails",           true,  "Defeat Ninetails",          "oni");

	// Wawku Shrine
	settings.Add("wawku",               true,  "Wawku Shrine");
	settings.Add("shinshu_kamui",       true,  "Enter Kamui",              "wawku");
	settings.Add("kamui_wepkeer",       true,  "Enter Wep'keer",           "wawku");
	settings.Add("wepkeer_ezofuji",     true,  "Enter Ezofuji",            "wawku");
	settings.Add("ezofuji_wawku",       true,  "Enter Wawku Shrine",       "wawku");
	settings.Add("wawku_nechku",        false, "Enter Nechku",             "wawku");
	settings.Add("nechku",              true,  "Defeat Nechku",            "wawku");
	settings.Add("wawku_lechku_nechku", false, "Enter Lechku and Nechku",  "wawku");
	settings.Add("lechku_nechku",       true,  "Defeat Lechku and Nechku", "wawku");

	// Ark of Yamato
	settings.Add("yamato",              true,  "Ark of Yamato");
	settings.Add("ezofuji_yamato",      true,  "Enter Ark of Yamato",   "yamato");
	settings.Add("ninetails2",          false, "Defeat Ninetails 2",    "yamato");
	settings.Add("crimson_helm2",       false, "Defeat Crimson Helm 2", "yamato");
	settings.Add("spider_queen2",       false, "Defeat Spider Queen 2", "yamato");
	settings.Add("orochi3",             false, "Defeat True Orochi 2",  "yamato");
	settings.Add("blight2",             false, "Defeat Blight 2",       "yamato");

	// Endgame
	settings.Add("endgame",             true,  "End Game");
	settings.Add("yamato_yami",         true,  "Enter Yami",    "endgame");
	settings.Add("yami",                false, "Defeat Yami",   "endgame");
	settings.Add("final",               true,  "Final Results", "endgame");

	// SETTINGS END //

	// HashSet to prevent double-splitting
	vars.splitDone = new HashSet<string>();
}

init
{
	IntPtr mainDll = modules.Single(m => m.ModuleName == "main.dll").BaseAddress;

	Dictionary<string, int> keyItems = new Dictionary<string, int>
	{
		{"canine_tracker", 0xB206B4},
		{"duty_orb",       0xB206D0},
		{"justice_orb",    0xB206CE},
		{"loyalty_orb",    0xB206CC},
		{"mask",           0xB206C2},
		{"ogre",           0xB206C4},
		{"lips",           0xB206C6},
		{"eyeball",        0xB206C8},
		{"horn",           0xB206CA},
	};

	Dictionary<string, int> feedDogBitfield = new Dictionary<string, int>
	{
		{"shin", 0x10},
		{"rei",  0x20},
		{"ko",   0x40},
		{"chi",  0x80},
	};

	// As mentioned above, the area ID list is at https://docs.google.com/spreadsheets/d/1IoZ1XFeblOTb6Qq9PHfBq1KRdcpgYRz8pTObhF3qMrs/edit?usp=sharing
	Dictionary<string, int> areaIds = new Dictionary<string, int>
	{
		{"loading_screen",                        0},
		{"cursed_kamiki_village",                 1},
		{"cave_of_nagi",                          2},
		{"kamiki_village",                        3},
		{"hana_valley",                           4},
		{"tsuta_ruins",                           5},
		{"city_checkpoint",                       6},
		{"spider_queen",                          7},
		{"gale_shrine",                           8},
		{"kusa_village",                          9},
		{"sasa_sanctuary",                       10},
		{"digging_minigame",                     12},
		{"dojo",                                 13},
		{"crimson_helm",                         14},
		{"calcified_cavern",                     15},
		{"moon_cave_interior",                   16},
		{"orochi",                               17}, // Listed as "Moon Cave Orochi" in Google Doc
		{"kamui_demon_trials",                   26},
		{"opening_cutscene",                     29},
		{"river_of_the_heavens",                 30},
		{"sei-an_city_aristocratic_qtr",         31},
		{"sei-an_city_commoners_qtr",            32},
		{"queens_palace",                        33}, // Old autosplitter checks this for Rao. Test it out.
		{"dragon_palace",                        34},
		{"inside_the_dragon",                    35},
		{"sunken_ship",                          36},
		{"imperial_palace",                      37}, // Old autosplitter checks this for Blight. Test it out.
		{"imperial_palace_garden",               38},
		{"oni_island_lower_floors",              39},
		{"ninetails",                            40},
		{"catcall_tower",                        41},
		{"blight",                               42}, // Old autosplitter does NOT check this for Blight. Test it out.
		{"oni_island_exterior",                  44},
		{"oni_island_upper_floors",              45},
		{"oni_island_2d_room",                   46},
		{"wep_keer",                             47},
		{"wawku_shrine",                         49},
		{"nechku",                               50},
		{"ponc_tan",                             51},
		{"ark_of_yamato",                        53},
		{"spider_queen_2",                       54},
		{"true_orochi_2",                        55},
		{"blight_2",                             56},
		{"ninetails_2",                          57},
		{"crimson_helm_2",                       58},
		{"yoshpet",                              60},
		{"inner_yoshpet",                        61},
		{"yami",                                 62},
		{"wep_keer_square",                      63},
		{"lechku_nechku",                        64}, // Listed as "Lechku and Nechku" in Google Doc
		{"the_living_sword_fishing_minigame",    65},
		{"agata_fishing_minigame",               67},
		{"shinshu_field",                        71},
		{"agata_forest",                         72},
		{"moon_cave_entrance",                   73},
		{"taka_pass",                            74},
		{"ryoshima_coast",                       75},
		{"n_ryoshima_coast",                     77},
		{"kamui",                                78},
		{"kamui_ezofuji",                        79},
		{"title_screen",                      65535},
	};

	string[,] levelTransitions = new string[47, 3]
	{
		{"river_nagi",          "river_of_the_heavens",         "cave_of_nagi"},
		{"nagi_river",          "cave_of_nagi",                 "river_of_the_heavens"},
		{"restore_kamiki",      "cursed_kamiki_village",        "kamiki_village"},
		{"kamiki_shinshu",      "kamiki_village",               "shinshu_field"},
		{"shinshu_hana",        "shinshu_field",                "hana_valley"},
		{"hana_shinshu",        "hana_valley",                  "shinshu_field"},
		{"shinshu_agata",       "shinshu_field",                "agata_forest"},
		{"agata_fishing",       "agata_fishing_minigame",       "agata_forest"},
		{"agata_ruins",         "agata_forest",                 "tsuta_ruins"},
		{"ruins_spider",        "tsuta_ruins",                  "spider_queen"},
		{"agata_taka",          "agata_forest",                 "taka_pass"},
		{"taka_sasa",           "taka_pass",                    "sasa_sanctuary"},
		{"sasa_digging",        "digging_minigame",             "sasa_sanctuary"},
		{"taka_kusa",           "taka_pass",                    "kusa_village"},
		{"kusa_gale",           "kusa_village",                 "gale_shrine"},
		{"gale_crimson",        "gale_shrine",                  "crimson_helm"},
		{"kusa_taka",           "kusa_village",                 "taka_pass"},
		{"enter_moon_cave",     "moon_cave_entrance",           "orochi"},
		{"calcified_interior",  "calcified_cavern",             "moon_cave_interior"},
		{"interior_orochi",     "moon_cave_interior",           "orochi"},
		{"checkpoint_coast",    "city_checkpoint",              "ryoshima_coast"},
		{"dojo_exit",           "dojo",                         "ryoshima_coast"},
		{"coast_city",          "ryoshima_coast",               "sei-an_city_commoners_qtr"},
		{"city_digging",        "sei-an_city_commoners_qtr",    "digging_minigame"},
		{"city_fishing",        "sei-an_city_aristocratic_qtr", "the_living_sword_fishing_minigame"},
		{"coast_ship",          "ryoshima_coast",               "sunken_ship"},
		{"ship_coast",          "sunken_ship",                  "ryoshima_coast"},
		{"palace_garden",       "imperial_palace",              "imperial_palace_garden"},
		{"garden_blight",       "imperial_palace_garden",       "blight"},
		{"ncoast_catcall",      "n_ryoshima_coast",             "catcall_tower"},
		{"catcall_coast",       "catcall_tower",                "ryoshima_coast"},
		{"ncoast_dpalace",      "n_ryoshima_coast",             "dragon_palace"},
		{"dpalace_dragon",      "dragon_palace",                "inside_the_dragon"},
		{"dragon_dpalace",      "inside_the_dragon",            "dragon_palace"},
		{"ncoast_oni",          "n_ryoshima_coast",             "oni_island_exterior"},
		{"oni_ex_oni_int",      "oni_island_exterior",          "oni_island_lower_floors"},
		{"oni_interior1",       "oni_island_lower_floors",      "oni_island_2d_room"},
		{"oni_interior2",       "oni_island_2d_room",           "oni_island_upper_floors"},
		{"oni_ninetails",       "oni_island_upper_floors",      "ninetails"},
		{"shinshu_kamui",       "shinshu_field",                "kamui"},
		{"kamui_wepkeer",       "kamui",                        "wep_keer"},
		{"wepkeer_ezofuji",     "wep_keer",                     "kamui_ezofuji"},
		{"ezofuji_wawku",       "kamui_ezofuji",                "wawku_shrine"},
		{"wawku_nechku",        "wawku_shrine",                 "nechku"},
		{"wawku_lechku_nechku", "wawku_shrine",                 "lechku_nechku"},
		{"ezofuji_yamato",      "kamui_ezofuji",                "ark_of_yamato"},
		{"yamato_yami",         "ark_of_yamato",                "yami"},
	};

	int levelTransitionsLength = levelTransitions.GetLength(0);

	// We track non-Ark bosses differently, by simply checking for both your area ID and whether you've gotten
	// more results money. Hopefully we'll find out how to check for boss defeats more directly.
	// Also this is a misnomer, cuz Yami is included in here. But what can you do.
	string[] nonArkBosses = new string[9]
	{
		"spider_queen",
		"crimson_helm",
		"orochi",
		"blight",
		"rao",
		"ninetails",
		"nechku",
		"lechku_nechku",
		"yami",
	};

	Dictionary<string, int> arkBosses = new Dictionary<string, int>{
		{"blight2",       0xB3552C},
		{"crimson_helm2", 0xB356F4},
		{"ninetails2",    0xB35610},
		{"orochi3",       0xB35448},
		{"spider_queen2", 0xB35364},
	};

	Func<int, KeyValuePair<string, int>, bool> _CheckDogFed = (current_state, dog) =>
	{
		return (settings[dog.Key] && (current_state & dog.Value) == dog.Value);
	};

	Func<string, bool> _IsSetAndNotDoneYet = (key) => settings[key] && !vars.splitDone.Contains(key);

	vars.CheckDogFed = (Func<dynamic, dynamic, string>)((curr, prev) =>
	{
		if (curr.feedDogBitfield == prev.feedDogBitfield) return null;
		foreach (KeyValuePair<string, int> dog in feedDogBitfield)
		{
			if (_CheckDogFed(curr.feedDogBitfield, dog))
			{
				return dog.Key;
			}
		}
		return null;
	});

	vars.CheckRyoBloomed = (Func<dynamic, dynamic, string>)((curr, prev) =>
	{
		return (_IsSetAndNotDoneYet("bloom_ryo")
			&& curr.areaId == areaIds["ryoshima_coast"]
			&& curr.exitId == 0xFF0F0A
			&& prev.exitId == 0xF09) ? "bloom_ryo" : null;
	});

	vars.CheckItemCollected = (Func<string>)(() => {
		foreach (KeyValuePair<string, int>item in keyItems)
		{
			if (_IsSetAndNotDoneYet(item.Key) && memory.ReadValue<ushort>(mainDll + item.Value) == 1)
			{
				return item.Key;
			}
		}
		return null;
	});

	vars.CheckInNewArea = (Func<dynamic, dynamic, string>)((curr, prev) =>
	{
		for (int i = 0; i < levelTransitionsLength; i++)
		{
			if (_IsSetAndNotDoneYet(levelTransitions[i, 0]) && prev.areaId == areaIds[levelTransitions[i, 1]] && curr.areaId == areaIds[levelTransitions[i, 2]])
			{
				return levelTransitions[i, 0];
			}
		}
		return null;
	});

	vars.CheckHolyEagleObtained = (Func<dynamic, string>)((curr) => {
		if (_IsSetAndNotDoneYet("holy_eagle") && ((curr.movementTech & 1) == 1))
		{
			return "holy_eagle";
		}
		return null;
	});

	vars.CheckNonArkBossDefeated = (Func<dynamic, dynamic, string>)((curr, prev) =>
	{
		foreach (string boss in nonArkBosses)
		{
			if (_IsSetAndNotDoneYet(boss) && curr.areaId == areaIds[boss == "rao" ? "queens_palace" : boss] && curr.resultsMoney > prev.resultsMoney)
			{
				return boss;
			}
		}
		return null;
	});

	vars.CheckArkBossDefeated = (Func<string>)(() =>
	{
		foreach (KeyValuePair<string, int> boss in arkBosses)
		{
			if (_IsSetAndNotDoneYet(boss.Key) && memory.ReadValue<int>(mainDll + boss.Value) == 0x112A880)
			{
				return boss.Key;
			}
		}
		return null;
	});

	vars.CheckGameDone = (Func<dynamic, dynamic, bool>)((curr, prev) =>
	{
		return settings["final"] && curr.finalResults > prev.finalResults && curr.finalResults == 65536 && current.areaId == areaIds["yami"];
	});

	vars.IsInLoadingOrTitleScreen = (Func<int, bool>)((current_areaId) =>
	{
		return (current_areaId == areaIds["title_screen"] || current_areaId == areaIds["loading_screen"]);
	});
}

start {
	// IGT is measured by frames, 60fps. This starts counting when the game
	// starts for the first time, and resets when a new game is loaded.
	// The previous frame count is loaded when a file is loaded as well.
	return ((current.areaId != 65535 || current.areaId != 0) && current.time < old.time);
}

reset {
	if (vars.IsInLoadingOrTitleScreen(current.areaId))
	{
		vars.splitDone.Clear();
		return true;
	}
	return false;
}

isLoading {
	// Ensures the timer doesn't start while on the title screen.
	return vars.IsInLoadingOrTitleScreen(current.areaId);
}

split
{
	string key;
	if ((key = (
		vars.CheckInNewArea(current, old)
		?? vars.CheckItemCollected()
		?? vars.CheckDogFed(current, old)
		?? vars.CheckRyoBloomed(current, old)
		?? vars.CheckHolyEagleObtained(current)
		?? vars.CheckNonArkBossDefeated(current, old)
		?? vars.CheckArkBossDefeated()
	)) != null)
	{
		vars.splitDone.Add(key);
		return true;
	}

	return vars.CheckGameDone(current, old);
}

exit {
	// Just in case
	vars.splitDone.Clear();
}
