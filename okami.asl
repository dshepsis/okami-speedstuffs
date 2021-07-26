state("Okami")
{
	// In Game Time
	// IGT is measured by frames in game. Time will start if you started a new
	// game from the title menu, or by loading a NG+ file.
	int time : "main.dll", 0xB217FC;
	int minigame_timer : "main.dll", 0xB1DC5C;

	// For Holy Eagle, Digging Champ, etc.
	byte movement_tech : "main.dll", 0xB4DFA2;

	bool game_pause_boolean : "flower_kernel.m2::render::Context::_pCurrentContext", 0x44;

	// Multi-use flags
	// Area ID list: https://docs.google.com/spreadsheets/d/1IoZ1XFeblOTb6Qq9PHfBq1KRdcpgYRz8pTObhF3qMrs/edit?usp=sharing
	// `results_money` will be used to signify boss fights have ended in
	// specific areas. The issue with this value is that it only triggers when
	// there is a bonus value on the results screen. For most runners, there
	// will usually be a value there. Will probably find a better method later.
	int area_id : "main.dll", 0xB6B2C8;
	int exit_id : "main.dll", 0xB65E74;
	int results_money : "main.dll", 0xB1DBA0;

	// Key Items
	int canine_tracker : "main.dll", 0xB206B4;
	int duty_orb : "main.dll", 0xB206D0;
	int justice_orb : "main.dll", 0xB206CE;
	int loyalty_orb : "main.dll", 0xB206CC;
	int mask : "main.dll", 0xB206C2;
	int ogre : "main.dll", 0xB206C4;
	int lips : "main.dll", 0xB206C6;
	int eyeball : "main.dll", 0xB206C8;
	int horn : "main.dll", 0xB206CA;

	// Kusa dogs that you feed. They take up the four most significant bits in this byte.
	int feed_dog_bitfield : "main.dll", 0xB213C9;

	// Endgame
	// Timing ends on the "Final Results" screen for IGT.
	// Other possible final result values: https://my.mixtape.moe/aeoxal.png
	int final_results : "main.dll", 0xB5262C;
}

startup
{
	// SETTINGS START //
	// Kamiki Village
	settings.Add("kamiki", true, "Kamiki Village");
	settings.Add("river_nagi", false, "Enter Cave of Nagi", "kamiki");
	settings.Add("nagi_river", false, "Exit Cave of Nagi", "kamiki");
	settings.Add("restore_kamiki", false, "Restore Kamiki Village", "kamiki");
	settings.Add("kamiki_shinshu", true, "Enter Shinshu Field", "kamiki");

	// Hana Valley
	settings.Add("hana", true, "Hana Valley");
	settings.Add("shinshu_hana", false, "Enter Hana Valley", "hana");
	settings.Add("hana_shinshu", true, "Exit Hana Valley", "hana");

	// Tsuta Ruins
	settings.Add("ruins", true, "Tsuta Ruins");
	settings.Add("shinshu_agata", true, "Enter Agata Forest", "ruins");
	settings.Add("agata_fishing", true, "Agata Fishing Minigames", "ruins");
	settings.Add("agata_ruins", true, "Enter Tsuta Ruins", "ruins");
	settings.Add("ruins_spider", false, "Enter Spider Queen", "ruins");
	settings.Add("spider_queen", true, "Defeat Spider Queen", "ruins");

	// Kusa Village
	settings.Add("kusa", true, "Kusa Village");
	settings.Add("agata_taka", true, "Enter Taka Pass", "kusa");
	settings.Add("taka_kusa", false, "Enter Kusa Village", "kusa");
	settings.Add("canine_tracker", true, "Get Canine Tracker", "kusa");
	settings.Add("rei", true, "Feed Rei", "kusa");
	settings.Add("chi", true, "Feed Chi", "kusa");
	settings.Add("shin", true, "Feed Shin", "kusa");
	settings.Add("ko", true, "Feed Ko", "kusa");
	settings.Add("kusa_taka", true, "Exit Kusa Village", "kusa");

	// Sasa Sanctuary
	settings.Add("sasa", true, "Sasa Sanctuary");
	settings.Add("taka_sasa", true, "Enter Sasa Sanctuary", "sasa");
	settings.Add("sasa_digging", true, "Mr. Bamboo / Kaguya Digging Minigame", "sasa");
	settings.Add("duty_orb", true, "Get Duty Orb", "sasa");

	// Canine Tracking
	settings.Add("canines", true, "Canine Tracking");
	settings.Add("justice_orb", true, "Get Justice Orb", "canines");
	settings.Add("loyalty_orb", true, "Get Loyalty Orb", "canines");

	// Gale Shrine
	settings.Add("gale", true, "Gale Shrine");
	settings.Add("kusa_gale", true, "Enter Gale Shrine", "gale");
	settings.Add("gale_crimson", false, "Enter Crimson Helm", "gale");
	settings.Add("crimson_helm", true, "Defeat Crimson Helm", "gale");

	// Moon Cave
	settings.Add("moon_cave", true, "Moon Cave");
	settings.Add("enter_moon_cave", true, "Enter Moon Cave", "moon_cave");
	settings.Add("mask", false, "Get Mask", "moon_cave");
	settings.Add("calcified_moon", false, "Exit Calcified Cavern", "moon_cave");
	settings.Add("ogre", true, "Get Ogre Liver", "moon_cave");
	settings.Add("lips", true, "Get Lips of Ice", "moon_cave");
	settings.Add("eyeball", true, "Get Eyeball of Fire", "moon_cave");
	settings.Add("horn", true, "Get Black Demon Horn", "moon_cave");
	settings.Add("interior_orochi", false, "Enter Orochi", "moon_cave");
	settings.Add("orochi", true, "Defeat Orochi", "moon_cave");

	// Ghost Ship
	settings.Add("ghost", true, "Ryoshima Coast");
	settings.Add("checkpoint_coast", true, "Exit City Checkpoint", "ghost");
	settings.Add("holy_eagle", true, "Attain Holy Eagle", "ghost");
	settings.Add("dojo_exit", false, "Exit Dojo", "ghost");
	settings.Add("coast_city", false, "Enter Sei-an City", "ghost");
	settings.Add("city_digging", true, "Sei-an City Digging Minigame", "ghost");
	settings.Add("city_fishing", true, "Sei-an City Fishing Minigame", "ghost");
	settings.Add("coast_ship", true, "Enter Ghost Ship", "ghost");
	settings.Add("ship_coast", true, "Exit Ghost Ship", "ghost");

	// Imperial Palace
	settings.Add("palace", true, "Imperial Palace");
	settings.Add("palace_garden", true, "Enter Imperial Palace", "palace");
	settings.Add("garden_blight", false, "Enter Blight", "palace");
	settings.Add("blight", true, "Defeat Blight", "palace");

	// Water Dragon
	settings.Add("dragon", true, "Water Dragon");
	settings.Add("ncoast_catcall", true, "Enter Catcall Tower", "dragon");
	settings.Add("catcall_coast", true, "Exit Catcall Tower", "dragon");
	settings.Add("ncoast_dpalace", true, "Enter Dragon Palace", "dragon");
	settings.Add("dpalace_dragon", false, "Enter Water Dragon", "dragon");
	settings.Add("dragon_dpalace", true, "Exit Water Dragon", "dragon");

	// Oni Island
	settings.Add("oni", true, "Oni Island");
	settings.Add("rao", true, "Defeat Evil Rao", "oni");
	settings.Add("ncoast_oni", true, "Enter Oni Island", "oni");
	settings.Add("oni_ex_oni_int", true, "Enter Oni Island Interior", "oni");
	settings.Add("oni_interior1", false, "Oni Island Lower Floors", "oni");
	settings.Add("oni_interior2", false, "Oni Island 2D Segment", "oni");
	settings.Add("oni_ninetails", false, "Enter Ninetails", "oni");
	settings.Add("ninetails", true, "Defeat Ninetails", "oni");

	// Wawku Shrine
	settings.Add("wawku", true, "Wawku Shrine");
	settings.Add("shinshu_kamui", true, "Enter Kamui", "wawku");
	settings.Add("kamui_wepkeer", true, "Enter Wep'keer", "wawku");
	settings.Add("wepkeer_ezofuji", true, "Enter Ezofuji", "wawku");
	settings.Add("ezofuji_wawku", true, "Enter Wawku Shrine", "wawku");
	settings.Add("wawku_nechku", false, "Enter Nechku", "wawku");
	settings.Add("nechku", true, "Defeat Nechku", "wawku");
	settings.Add("wawku_lechku_nechku", false, "Enter Lechku and Nechku", "wawku");
	settings.Add("lechku_nechku", true, "Defeat Lechku and Nechku", "wawku");

	// Ark of Yamato
	settings.Add("yamato", true, "Ark of Yamato");
	settings.Add("ezofuji_yamato", true, "Enter Ark of Yamato", "yamato");
	settings.Add("ninetails2", false, "Defeat Ninetails 2", "yamato");
	settings.Add("crimson_helm2", false, "Defeat Crimson Helm 2", "yamato");
	settings.Add("spider_queen2", false, "Defeat Spider Queen 2", "yamato");
	settings.Add("orochi3", false, "Defeat True Orochi 2", "yamato");
	settings.Add("blight2", false, "Defeat Blight 2", "yamato");

	// Endgame
	settings.Add("endgame", true, "End Game");
	settings.Add("yamato_yami", true, "Enter Yami", "endgame");
	settings.Add("yami", false, "Defeat Yami", "endgame");
	settings.Add("final", true, "Final Results", "endgame");

	// SETTINGS END //
}

init
{
	IntPtr main_dll = modules.Single(m => m.ModuleName == "main.dll").BaseAddress;

	// Prevents resetting when we haven't even started yet
	vars.is_running = false;

	// HashSet to prevent double-splitting
	HashSet<string> split_done = new HashSet<string>();

	Dictionary<string, int> feed_dog_bitfield = new Dictionary<string, int>
	{
		{"shin", 0x10},
		{"rei", 0x20},
		{"ko", 0x40},
		{"chi", 0x80},
	};

	// TODO: Maybe turn this into a string[,] where each element is of the form
	// {<setting_name>, <from_area_key>, <to_area_key>}
	// Where <{from,to}_area_key> maps to the keys in `area_ids`
	Dictionary<string, int[]> transitions = new Dictionary<string, int[]>
	{
		{"river_nagi", new int[]{30, 2}},
		{"nagi_river", new int[]{2, 30}},
		{"restore_kamiki", new int[]{1, 3}},
		{"kamiki_shinshu", new int[]{3, 71}},
		{"shinshu_hana", new int[]{71, 4}},
		{"hana_shinshu", new int[]{4, 71}},
		{"shinshu_agata", new int[]{71, 72}},
		{"agata_fishing", new int[]{67, 72}},
		{"agata_ruins", new int[]{72, 5}},
		{"ruins_spider", new int[]{5, 7}},
		{"agata_taka", new int[]{72, 74}},
        {"taka_sasa", new int[]{74, 10}},
        {"sasa_digging", new int[]{12, 10}},
        {"taka_kusa", new int[]{74, 9}},
		{"kusa_gale", new int[]{9, 8}},
        {"gale_crimson", new int[]{8, 14}},
        {"kusa_taka", new int[]{9, 74}},
        {"enter_moon_cave", new int[]{73, 17}},
        {"calcified_moon", new int[]{15, 16}},
        {"interior_orochi", new int[]{16, 17}},
        {"checkpoint_coast", new int[]{6, 75}},
		{"dojo_exit", new int[]{13, 75}},
		{"coast_city", new int[]{75, 32}},
        {"city_digging", new int[]{12, 32}},
        {"city_fishing", new int[]{65, 31}},
        {"coast_ship", new int[]{75, 36}},
        {"ship_coast", new int[]{36, 75}},
        {"palace_garden", new int[]{37, 38}},
        {"garden_blight", new int[]{38, 42}},
        {"ncoast_catcall", new int[]{77, 41}},
        {"catcall_coast", new int[]{41, 75}},
		{"ncoast_dpalace", new int[]{77, 34}},
        {"dpalace_dragon", new int[]{34, 35}},
        {"dragon_dpalace", new int[]{35, 34}},
		{"ncoast_oni", new int[]{77, 44}},
        {"oni_ex_oni_int", new int[]{44, 39}},
        {"oni_interior1", new int[]{39, 46}},
        {"oni_interior2", new int[]{46, 45}},
        {"oni_ninetails", new int[]{45, 40}},
		{"shinshu_kamui", new int[]{71, 78}},
        {"kamui_wepkeer", new int[]{78, 47}},
        {"wepkeer_ezofuji", new int[]{47, 79}},
        {"ezofuji_wawku", new int[]{79, 49}},
        {"wawku_nechku", new int[]{49, 50}},
        {"wawku_lechku_nechku", new int[]{49, 64}},
        {"ezofuji_yamato", new int[]{79, 53}},
        {"yamato_yami", new int[]{53, 62}},
	};

	// As mentioned above, the area ID list is at https://docs.google.com/spreadsheets/d/1IoZ1XFeblOTb6Qq9PHfBq1KRdcpgYRz8pTObhF3qMrs/edit?usp=sharing
	Dictionary<string, int> area_ids = new Dictionary<string, int>
	{
		{"loading_screen", 0},
		{"cursed_kamiki_village", 1},
		{"cave_of_nagi", 2},
		{"kamiki_village", 3},
		{"hana_valley", 4},
		{"tsuta_ruins", 5},
		{"city_checkpoint", 6},
		{"spider_queen", 7},
		{"gale_shrine", 8},
		{"kusa_village", 9},
		{"sasa_sanctuary", 10},
		{"digging_minigame", 12},
		{"dojo", 13},
		{"crimson_helm", 14},
		{"calcified_cavern", 15},
		{"moon_cave_interior", 16},
		{"orochi", 17}, // Listed as "Moon Cave Orochi" in Google Doc
		{"kamui_demon_trials", 26},
		{"opening_cutscene", 29},
		{"river_of_the_heavens", 30},
		{"sei-an_city_aristocratic_qtr", 31},
		{"sei-an_city_commoners_qtr", 32},
		{"queens_palace", 33}, // Old autosplitter checks this for Rao. Test it out.
		{"dragon_palace", 34},
		{"inside_the_dragon", 35},
		{"sunken_ship", 36},
		{"imperial_palace", 37}, // Old autosplitter checks this for Blight. Test it out.
		{"imperial_palace_garden", 38},
		{"oni_island_lower_floors", 39},
		{"ninetails", 40},
		{"catcall_tower", 41},
		{"blight", 42}, // Old autosplitter does NOT check this for Blight. Test it out.
		{"oni_island_exterior", 44},
		{"oni_island_upper_floors", 45},
		{"oni_island_2d_room", 46},
		{"wep_keer", 47},
		{"wawku_shrine", 49},
		{"nechku", 50},
		{"ponc_tan", 51},
		{"ark_of_yamato", 53},
		{"spider_queen_2", 54},
		{"true_orochi_2", 55},
		{"blight_2", 56},
		{"ninetails_2", 57},
		{"crimson_helm_2", 58},
		{"yoshpet", 60},
		{"inner_yoshpet", 61},
		{"yami", 62},
		{"wep_keer_square", 63},
		{"lechku_nechku", 64}, // Listed as "Lechku and Nechku" in Google Doc
		{"the_living_sword_fishing_minigame", 65},
		{"agata_fishing_minigame", 67},
		{"shinshu_field", 71},
		{"agata_forest", 72},
		{"moon_cave_entrance", 73},
		{"taka_pass", 74},
		{"ryoshima_coast", 75},
		{"n_ryoshima_coast", 77},
		{"kamui", 78},
		{"kamui_ezofuji", 79},
		{"title_screen", 65535},
	};

	// We track non-Ark bosses differently, by simply checking for both your area ID and whether you've gotten
	// more results money. Hopefully we'll find out how to check for boss defeats more directly.
	// Also this is a misnomer, cuz Yami is included in here. But what can you do.
	string[] non_ark_bosses = new string[]{
		"spider_queen",
		"crimson_helm",
		"orochi",
		"blight",
		"rao", // Old autosplitter checks area_ids.queens_palace for this
		"ninetails",
		"nechku",
		"lechku_nechku",
		"yami",
	};

	Dictionary<string, int> ark_bosses = new Dictionary<string, int>{
		{"blight2", 0xB3552C},
		{"crimson_helm2", 0xB356F4},
		{"ninetails2", 0xB35610},
		{"orochi3", 0xB35448},
		{"spider_queen2", 0xB35364},
	};

	Func<int, KeyValuePair<string, int>, bool> _check_dog_fed = ((current_state, dog) =>
	{
		return (settings[dog.Key] && (current_state & dog.Value) == dog.Value);
	});

	Func<string, bool> _is_set_and_not_done_yet = ((key) => settings[key] && !split_done.Contains(key));

	vars.CheckDogFed = (Func<dynamic, dynamic, bool>)((curr, prev) =>
	{
		if (curr.feed_dog_bitfield == prev.feed_dog_bitfield) return false;
		foreach (KeyValuePair<string, int> dog in feed_dog_bitfield)
		{
			if (_check_dog_fed(curr.feed_dog_bitfield, dog))
			{
				return true;
			}
		}
		return false;
	});

	vars.CheckRyoBloomed = (Func<dynamic, dynamic, bool>)((curr, prev) =>
	{
		return curr.area_id == area_ids["ryoshima_coast"] && curr.exit_id == 0xFF0F0A && prev.exit_id == 0xF09;
	});

	// TODO: Do the same thing with `vars.CheckArkBossDefeated`
	vars.CheckItemCollected = (Func<dynamic, dynamic, bool>)((curr, prev) => {
		return ((settings["canine_tracker"] && curr.canine_tracker > prev.canine_tracker) ||
			(settings["duty_orb"] && curr.duty_orb > prev.duty_orb) ||
			(settings["justice_orb"] && curr.justice_orb > prev.justice_orb) ||
			(settings["loyalty_orb"] && curr.loyalty_orb > prev.loyalty_orb) ||
			(settings["mask"] && curr.mask > prev.mask) ||
			(settings["ogre"] && curr.ogre > prev.ogre) ||
			(settings["lips"] && curr.lips > prev.lips) ||
			(settings["eyeball"] && curr.eyeball > prev.eyeball) ||
			(settings["horn"] && curr.horn > prev.horn));
	});

	vars.CheckInNewArea = (Func<dynamic, dynamic, bool>)((curr, prev) =>
	{
		foreach (KeyValuePair<string, int[]> transition in transitions)
		{
			if (_is_set_and_not_done_yet(transition.Key) && prev.area_id == transition.Value[0] && curr.area_id == transition.Value[1])
			{
				split_done.Add(transition.Key);
				return true;
			}
		}
		return false;
	});

	vars.CheckHolyEagleObtained = (Func<dynamic, bool>)((curr) => {
		if (_is_set_and_not_done_yet("holy_eagle") && ((curr.movement_tech & 1) == 1))
		{
			split_done.Add("holy_eagle");
			return true;
		}
		return false;
	});

	vars.CheckNonArkBossDefeated = (Func<dynamic, dynamic, bool>)((curr, prev) =>
	{
		foreach (string boss in non_ark_bosses)
		{
			if (_is_set_and_not_done_yet(boss) && curr.area_id == area_ids[boss] && curr.results_money > prev.results_money)
			{
				return true;
			}
		}
		return false;
	});

	vars.CheckArkBossDefeated = (Func<dynamic, dynamic, bool>)((curr, prev) =>
	{
		foreach (KeyValuePair<string, int> boss in ark_bosses)
		{
			if (_is_set_and_not_done_yet(boss.Key) && memory.ReadValue<int>(main_dll + boss.Value) == 0x112A880)
			{
				split_done.Add(boss.Key);
				return true;
			}
		}
		return false;
	});

	vars.CheckGameDone = (Func<dynamic, dynamic, bool>)((curr, prev) =>
	{
		return settings["final"] && curr.final_results > prev.final_results && curr.final_results == 65536 && current.area_id == area_ids["yami"];
	});

	vars.ClearSplitDoneSet = (Action)(() => split_done.Clear());

	vars.IsInLoadingOrTitleScreen = (Func<int, bool>)((current_area_id) =>
	{
		return (current_area_id == area_ids["title_screen"] || current_area_id == area_ids["loading_screen"]);
	});
}

start {
	// IGT is measured by frames, 60fps. This starts counting when the game
	// starts for the first time, and resets when a new game is loaded.
	// The previous frame count is loaded when a file is loaded as well.
	if ((current.area_id != 65535 || current.area_id != 0) && current.time < old.time) {
		vars.kamiki_shinshu = false;
		vars.taka_kusa = false;
		vars.kusa_taka = false;
		vars.coast_city = false;

		vars.is_running = true;

		return true;
	} else {
		return false;
	};
}

update {
}

reset {
	vars.ClearSplitDoneSet();
	return vars.is_running && vars.IsInLoadingOrTitleScreen(current.area_id);
}

isLoading {
	// Ensures the timer doesn't start while on the title screen.
	return vars.IsInLoadingOrTitleScreen(current.area_id);
}

split
{
	return (
		(vars.CheckInNewArea(current, old)) ||
		(vars.CheckItemCollected(current, old)) ||
		(vars.CheckDogFed(current, old)) ||
		(vars.CheckRyoBloomed(current, old)) ||
		(vars.CheckHolyEagleObtained(current, old)) ||
		(vars.CheckNonArkBossDefeated(current, old)) ||
		(vars.CheckArkBossDefeated(current, old)) ||
		(vars.CheckGameDone(current, old))
	);
}
