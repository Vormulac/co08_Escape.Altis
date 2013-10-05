/*
 * Description: This file contains vheicle types and unit types for most units spawned in the mission.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 *
 * Except for the classes specified in this file, classes are specified in the following files: CreateSearchChopper.sqf, EscapeSurprises (RUSSIANSEARCHCHOPPER) 
 * and RunExtraction.sqf, all in folder Scripts\Escape\.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

// Random array. Start position guard types.
drn_arr_Escape_StartPositionGuardTypes = ["O_Soldier_AR_F", "O_Soldier_GL_F", "O_Soldier_F", "O_Soldier_lite_F", "O_soldier_exp_F", "O_engineer_F"];

// Inner fence guard's secondary weapon (and corresponding magazine type).
drn_var_Escape_InnerFenceGuardSecondaryWeapon = "hgun_ACPC2_F";
drn_var_Escape_InnerFenceGuardSecondaryWeaponMagazine = "9Rnd_45ACP_Mag";

// Random array. Civilian vehicle classes for ambient traffic. (Can also be set to a faction name).
drn_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = ["C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_Quadbike_01_F", "C_SUV_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_Quadbike_01_F", "C_SUV_01_F", "C_Van_01_box_F", "C_Van_01_transport_F", "C_Van_01_fuel_F"];

// Random arrays. Enemy vehicle classes for ambient traffic. (Can also be set to a faction name).
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {
        drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = ["O_MRAP_02_F", "O_MRAP_02_F", "O_MRAP_02_F", "O_MRAP_02_F", "O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F", "O_Quadbike_01_F", "O_Quadbike_01_F", "O_Quadbike_01_F", "O_Truck_02_covered_F", "O_Truck_02_transport_F", "O_Truck_02_ammo_F", "O_Truck_02_box_F", "O_Truck_02_fuel_F", "O_Truck_02_medical_F", "O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_AA_F", "O_APC_Tracked_02_cannon_F", "O_MBT_02_arty_F", "O_MBT_02_cannon_F"];
    };
    case 2: {
        drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = ["O_MRAP_02_F", "O_MRAP_02_F", "O_MRAP_02_F", "O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F", "O_Quadbike_01_F", "O_Quadbike_01_F", "O_Truck_02_covered_F", "O_Truck_02_transport_F", "O_Truck_02_ammo_F", "O_Truck_02_box_F", "O_Truck_02_fuel_F", "O_Truck_02_medical_F", "O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_AA_F", "O_APC_Tracked_02_cannon_F", "O_MBT_02_arty_F", "O_MBT_02_cannon_F"];
    };
    default {
        drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = ["O_MRAP_02_F", "O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F", "O_MRAP_02_F", "O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F", "O_Quadbike_01_F", "O_Quadbike_01_F", "O_Truck_02_covered_F", "O_Truck_02_transport_F", "O_Truck_02_ammo_F", "O_Truck_02_box_F", "O_Truck_02_fuel_F", "O_Truck_02_medical_F", "O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_AA_F", "O_APC_Tracked_02_cannon_F", "O_MBT_02_arty_F", "O_MBT_02_cannon_F"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.
drn_arr_Escape_InfantryTypes = ["O_engineer_F", "O_medic_F", "O_Soldier_A_F", "O_Soldier_AA_F", "O_Soldier_AR_F", "O_Soldier_AT_F", "O_Soldier_exp_F", "O_soldier_F", "O_Soldier_GL_F", "O_Soldier_LAT_F", "O_Soldier_lite_F", "O_Soldier_M_F", "O_Soldier_repair_F", "O_officer_F", "O_engineer_F", "O_medic_F", "O_Soldier_A_F", "O_Soldier_AR_F", "O_Soldier_exp_F", "O_soldier_F", "O_Soldier_GL_F", "O_Soldier_LAT_F", "O_Soldier_lite_F", "O_Soldier_M_F", "O_Soldier_repair_F", "O_officer_F", "O_engineer_F", "O_medic_F", "O_Soldier_A_F", "O_Soldier_AR_F", "O_Soldier_exp_F", "O_soldier_F", "O_Soldier_GL_F", "O_Soldier_lite_F", "O_Soldier_M_F", "O_Soldier_repair_F"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
drn_arr_Escape_RoadBlock_MannedVehicleTypes = ["O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F", "O_GMG_01_high_F", "O_HMG_01_high_F", "O_static_AT_F"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
drn_arr_Escape_ReinforcementTruck_vehicleClasses = ["O_Truck_02_covered_F", "O_Truck_02_transport_F"];
// Total cargo for reinforcement trucks. Each element corresponds to a vehicle (array element) in array drn_arr_Escape_ReinforcementTruck_vehicleClasses above.
drn_arr_Escape_ReinforcementTruck_vehicleClassesMaxCargo = [16, 16];

// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
drn_arr_Escape_MotorizedSearchGroup_vehicleClasses = ["O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F", "O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_cannon_F", "O_APC_Wheeled_02_rcws_F"];
// Total cargo motorized search group vehicle. Each element corresponds to a vehicle (array element) in array drn_arr_Escape_MotorizedSearchGroup_vehicleClasses above.
drn_arr_Escape_MotorizedSearchGroup_vehicleClassesMaxCargo = [1, 1, 8, 8, 8];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
drn_arr_ComCenDefence_lightArmorClasses = ["O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F", "O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_cannon_F", "O_APC_Tracked_02_AA_F"];
// Random array. Heavy armored vehicles guarding the communication centers.
drn_arr_ComCenDefence_heavyArmorClasses = ["O_MBT_02_arty_F", "O_MBT_02_cannon_F", "O_MBT_02_cannon_F"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
drn_arr_ComCenStaticWeapons = ["O_GMG_01_high_F", "O_HMG_01_high_F"];
// A communication center have two parked and empty vehicles of the following possible types.
drn_arr_ComCenParkedVehicles = ["O_MRAP_02_F", "O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F", "C_Offroad_01_F", "C_Van_01_transport_F", "O_MRAP_02_F"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
drn_arr_Escape_EnemyCivilianCarTypes = ["C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_Quadbike_01_F", "C_SUV_01_F", "C_Van_01_box_F", "C_Van_01_transport_F", "C_Van_01_fuel_F"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the followin types:
drn_arr_Escape_AmmoDepot_StaticWeaponClasses = ["O_GMG_01_high_F", "O_HMG_01_high_F", "O_GMG_01_high_F", "O_HMG_01_high_F", "O_static_AT_F", "O_static_AA_F"];
// An ammo depot have one parked and empty vehicle of the following possible types.
drn_arr_Escape_AmmoDepot_ParkedVehicleClasses = ["O_MRAP_02_F", "O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F", "O_Truck_02_covered_F", "O_Truck_02_ammo_F", "O_Truck_02_box_F"];


// The following arrays define weapons and ammo contained at the ammo depots
// Index 0: Weapon classname.
// Index 1: Weapon's probability of presence (in percent, 0-100).
// Index 2: If weapon exists, crate contains at minimum this number of weapons of current class.
// Index 3: If weapon exists, crate contains at maximum this number of weapons of current class.
// Index 4: Array of magazine classnames. Magazines of these types are present if weapon exists.
// Index 5: Number of magazines per weapon that exists.

// Weapons and ammo in the basic weapons box
drn_arr_AmmoDepotBasicWeapons = [];
// CSAT weapons
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hgun_Rook40_F", 100, 4, 8, ["16Rnd_9x21_Mag", "30Rnd_9x21_Mag"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["SMG_02_F", 100, 4, 8, ["30Rnd_9x21_Mag"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_Katiba_F", 100, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_Katiba_C_F", 100, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_Katiba_GL_F", 100, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_Mk20_F", 100, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Yellow"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_Mk20_GL_F", 100, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Yellow", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_Mk20C_F", 100, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Yellow"], 6]];
// non-CSAT weapons
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hgun_P07_F", 100, 4, 8, ["16Rnd_9x21_Mag", "30Rnd_9x21_Mag"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hgun_PDW2000_F", 100, 4, 8, ["16Rnd_9x21_Mag", "30Rnd_9x21_Mag"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["hgun_ACPC2_F", 100, 4, 8, ["9Rnd_45ACP_Mag"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["SMG_01_F", 100, 4, 8, ["30Rnd_45ACP_Mag_SMG_01", "30Rnd_45ACP_Mag_SMG_01_Tracer_Green"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_MX_F", 100, 2, 4, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_MX_GL_F", 100, 2, 4, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "3Rnd_HE_Grenade_shell", "3Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F", "3Rnd_UGL_FlareWhite_F"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_MX_SW_F", 100, 2, 4, ["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_MXC_F", 100, 2, 4, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_MXM_F", 100, 2, 4, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_SDAR_F", 100, 2, 4, ["20Rnd_556x45_UW_mag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Yellow"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_TRG20_F", 100, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Yellow"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_TRG21_F", 100, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Yellow"], 6]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["arifle_TRG21_GL_F", 100, 2, 4, ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Yellow", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6]];


// Weapons and ammo in the special weapons box
drn_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["srifle_EBR_F", 100, 2, 4, ["20Rnd_762x51_Mag"], 9]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["srifle_GM6_F", 100, 2, 4, ["5Rnd_127x108_Mag"], 9]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["LMG_Zafir_F", 100, 2, 4, ["150Rnd_762x51_Box", "150Rnd_762x51_Box_Tracer"], 6]];
// non-CAST weapons
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["srifle_LRR_F", 100, 2, 4, ["7Rnd_408_Mag"], 9]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["LMG_Mk200_F", 100, 2, 4, ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], 6]];


// Weapons and ammo in the launchers box
drn_arr_AmmoDepotLaunchers = [];
// CSAT weapons
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_RPG32_F", 100, 3, 5, ["RPG32_F", "RPG32_HE_F"], 6]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_O_Titan_F", 100, 1, 1, ["Titan_AA"], 3]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_O_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3]];
// non-CSAT weapons
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_NLAW_F", 100, 3, 5, ["NLAW_F"], 6]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_I_Titan_F", 100, 1, 1, ["Titan_AA"], 3]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_I_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_B_Titan_F", 100, 1, 1, ["Titan_AA"], 3]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["launch_B_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3]];


// Weapons and ammo in the ordnance box
drn_arr_AmmoDepotOrdnance = [];
// General weapons
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, [objNull, 100, 1, 1, ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag", "ClaymoreDirectionalMine_Remote_Mag", "APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "ATMine_Range_Mag", "APERSTripMine_Wire_Mag", "SLAMDirectionalMine_Wire_Mag", "Laserbatteries"], 20]];


// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
drn_arr_AmmoDepotVehicle = [];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 100, 1, 1, ["HandGrenade", "MiniGrenade", "HandGrenade_Stone"], 50]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 100, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 100, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 100, 1, 1, ["1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell", "1Rnd_SmokePurple_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell"], 25]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 100, 1, 1, ["3Rnd_Smoke_Grenade_shell", "3Rnd_SmokeBlue_Grenade_shell", "3Rnd_SmokeGreen_Grenade_shell", "3Rnd_SmokeOrange_Grenade_shell", "3Rnd_SmokePurple_Grenade_shell", "3Rnd_SmokeRed_Grenade_shell", "3Rnd_SmokeYellow_Grenade_shell"], 25]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 100, 1, 1, ["FlareWhite_F", "FlareGreen_F", "FlareRed_F", "FlareYellow_F"], 25]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 100, 1, 1, ["UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F"], 25]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 100, 1, 1, ["3Rnd_UGL_FlareWhite_F", "3Rnd_UGL_FlareGreen_F", "3Rnd_UGL_FlareRed_F", "3Rnd_UGL_FlareYellow_F", "3Rnd_UGL_FlareCIR_F"], 25]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, [objNull, 100, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 25]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["ToolKit", 100, 10, 10, [], 0]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["Medikit", 100, 10, 10, [], 0]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["FirstAidKit", 100, 50, 50, [], 0]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["Binocular", 100, 25, 25, [], 0]];


// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

drn_arr_AmmoDepotItems = [];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["Laserdesignator", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["NVGoggles", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["Rangefinder", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["ItemCompass", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["ItemGPS", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["ItemMap", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["ItemRadio", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["ItemWatch", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["acc_flashlight", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["acc_pointer_IR", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["muzzle_snds_acp", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["muzzle_snds_B", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["muzzle_snds_H", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["muzzle_snds_H_MG", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["muzzle_snds_L", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["muzzle_snds_M", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_Aco", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_Aco_smg", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_ACO_grn", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_ACO_grn_smg", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_Arco", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_Hamr", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_Holosight", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_Holosight_smg", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_MRCO", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_Nightstalker", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_NVS", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_SOS", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_tws", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["optic_tws_mg", 100, 10, 10]];
drn_arr_AmmoDepotItems set [count drn_arr_AmmoDepotItems, ["O_UavTerminal", 100, 5, 5]];


// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.

drn_arr_CivilianCarWeapons = [];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["hgun_P07_F", "16Rnd_9x21_Mag", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["hgun_P07_snds_F", "30Rnd_9x21_Mag", 11]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["hgun_Rook40_snds_F", "30Rnd_9x21_Mag", 9]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["hgun_ACPC2_F", "9Rnd_45ACP_Mag", 12]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["arifle_MXM_Hamr_pointer_F", "30Rnd_65x39_caseless_mag_Tracer", 8]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["arifle_MX_Hamr_pointer_F", "30Rnd_65x39_caseless_mag_Tracer", 6]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["arifle_MXM_SOS_pointer_F", "30Rnd_65x39_caseless_mag_Tracer", 7]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["arifle_Katiba_C_F", "30Rnd_65x39_caseless_green", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["arifle_Mk20_GL_ACO_F", "UGL_FlareWhite_F", 8]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["SMG_01_Holo_F", "30Rnd_45ACP_Mag_SMG_01_Tracer_Green", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["SMG_02_ACO_F", "30Rnd_9x21_Mag", 12]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["launch_RPG32_F", "RPG32_F", 2]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["MineDetector", objNull, 0]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Medikit", objNull, 0]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Toolkit", objNull, 0]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Binocular", objNull, 0]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, [objNull, "SatchelCharge_Remote_Mag", 2]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, [objNull, "HandGrenade", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, [objNull, "SmokeShell", 5]];
