//Loading world specific configs
call compile preprocessFileLineNumbers ("islands\"+ worldName +"\WorldConfig.sqf");
call compile preprocessFileLineNumbers ("islands\"+ worldName +"\VillageMarkers.sqf");
call compile preprocessFileLineNumbers ("islands\"+ worldName +"\PatrolBoatMarkers.sqf");
call compile preprocessFileLineNumbers ("islands\"+ worldName +"\CommunicationCenterMarkers.sqf");

A3E_Debug = true; //Can be overwritten by parameters

//Settings
//Side and Faction of Player [Side,Faction]
       
A3E_Sides = [EAST, WEST, RESISTANCE];
A3E_SideStrings = ["EAST","WEST","GUER"];
A3E_PlayerSide = 1;
A3E_LocalSide = 2;
A3E_EnemySide = 0;


A3E_TeamLeaders = [
["O_Soldier_TL_F"],//East
["B_soldier_TL_F"],//West
["I_Soldier_TL_F"]//Guer
];
A3E_GroupMembers = [
["O_engineer_F", "O_medic_F", "O_Soldier_A_F", "O_Soldier_AA_F", "O_Soldier_AR_F", "O_Soldier_AT_F", "O_Soldier_exp_F", "O_soldier_F", "O_Soldier_GL_F", "O_Soldier_LAT_F", "O_Soldier_lite_F", "O_Soldier_M_F", "O_Soldier_repair_F", "O_officer_F", "O_engineer_F", "O_medic_F", "O_Soldier_A_F", "O_Soldier_AR_F", "O_Soldier_exp_F", "O_soldier_F", "O_Soldier_GL_F", "O_Soldier_LAT_F", "O_Soldier_lite_F", "O_Soldier_M_F", "O_Soldier_repair_F", "O_officer_F", "O_engineer_F", "O_medic_F", "O_Soldier_A_F", "O_Soldier_AR_F", "O_Soldier_exp_F", "O_soldier_F", "O_Soldier_GL_F", "O_Soldier_lite_F", "O_Soldier_M_F", "O_Soldier_repair_F","O_soldier_UAV_F","O_Soldier_AAR_F", "O_support_AMG_F", "O_support_AMort_F", "O_Soldier_AAA_F", "O_Soldier_AAT_F", "O_support_GMG_F", "O_support_MG_F", "O_support_Mort_F"],//East
["B_soldier_F"],//West
["I_engineer_F", "I_medic_F", "I_medic_F", "I_medic_F", "I_Soldier_A_F", "I_Soldier_AA_F", "I_Soldier_AR_F", "I_Soldier_AT_F", "I_Soldier_exp_F", "I_soldier_F", "I_Soldier_GL_F", "I_Soldier_LAT_F", "I_Soldier_lite_F", "I_Soldier_M_F", "I_Soldier_repair_F", "I_officer_F", "I_engineer_F", "I_medic_F", "I_Soldier_A_F", "I_Soldier_AR_F", "I_Soldier_exp_F", "I_soldier_F", "I_Soldier_GL_F", "I_Soldier_LAT_F", "I_Soldier_lite_F", "I_Soldier_M_F", "I_Soldier_repair_F", "I_officer_F", "I_engineer_F", "I_medic_F", "I_Soldier_A_F", "I_Soldier_AR_F", "I_Soldier_exp_F", "I_soldier_F", "I_Soldier_GL_F", "I_Soldier_lite_F", "I_Soldier_M_F", "I_Soldier_repair_F","I_soldier_UAV_F","I_Soldier_AAR_F", "I_support_AMG_F", "I_support_AMort_F", "I_Soldier_AAA_F", "I_Soldier_AAT_F", "I_support_GMG_F", "I_support_MG_F", "I_support_Mort_F"]//Guer
];

A3E_RoadblockVehicles = [
[],//East
[],//West
[]//Guer
];

A3E_ExtractionHelicopters = [
"B_Heli_Transport_01_F"
];

//GlobalVariables (NO SETTINGS)
A3E_Players = []; //A list of the connected players
A3E_StartPos = [];  //The Startposition
A3E_HC_ID = 0;

//Creating Sides
if(isserver) then {
    createcenter (A3E_Sides select A3E_LocalSide);
    createcenter (A3E_Sides select A3E_EnemySide);
    (A3E_Sides select A3E_PlayerSide) setFriend [(A3E_Sides select A3E_LocalSide), 0];
    (A3E_Sides select A3E_PlayerSide) setFriend [(A3E_Sides select A3E_EnemySide), 0];
    (A3E_Sides select A3E_LocalSide) setFriend [(A3E_Sides select A3E_EnemySide), 1];
    (A3E_Sides select A3E_EnemySide) setFriend [(A3E_Sides select A3E_LocalSide), 1];
};

//RegionSettings and Vars
A3E_RegionSize = 1000;
A3E_RegionOverlap = 250;
A3E_RegionDeactivateOffset = 25;
A3E_RegionID = 0; //Incrementing number for regions

//0 Boolean (status),1 String(Marker),2 object (Region logic),3 Trg(Aktivation),4 Trg(Deaktivation),5 Array(ZoneMarker)
A3E_Regions = []; //Array holding all the regiondata

A3E_HelperObject = "Land_HelipadEmpty_F";
//AmbientInfantry
A3E_GroupsPerSqKm = 4;
A3E_AmbientSpawnDistance = 250;
A3E_AmbientGroupMembers = 2;


A3E_ReportingTime = 20; //Minimal reporting time
A3E_ReportingTimeRandom = 30; //Random reporting time addition

A3E_RoadblockProbability = 0.25;

A3E_HackTime = 30;

//Helper for landing choppers
A3E_HelperObject = "Land_HelipadEmpty_F";

//Extraction Marker nameS
A3E_ExtractionPointsA = [
"ExtractionA_1",
"ExtractionA_2",
"ExtractionA_3",
"ExtractionA_4",
"ExtractionA_5",
"ExtractionA_6",
"ExtractionA_7",
"ExtractionA_8",
"ExtractionA_9",
"ExtractionA_10",
"ExtractionA_11",
"ExtractionA_12",
"ExtractionA_13",
"ExtractionA_14",
"ExtractionA_15",
"ExtractionA_16",
"ExtractionA_17",
"ExtractionA_18",
"ExtractionA_19",
"ExtractionA_20",
"ExtractionA_21",
"ExtractionA_22",
"ExtractionA_23",
"ExtractionA_24",
"ExtractionA_25",
"ExtractionA_26",
"ExtractionA_27",
"ExtractionA_28",
"ExtractionA_29",
"ExtractionA_30"
];

A3E_ExtractionPointsB = [
"ExtractionB_1",
"ExtractionB_2",
"ExtractionB_3",
"ExtractionB_4",
"ExtractionB_5",
"ExtractionB_6",
"ExtractionB_7",
"ExtractionB_8",
"ExtractionB_9",
"ExtractionB_10",
"ExtractionB_11",
"ExtractionB_12",
"ExtractionB_13",
"ExtractionB_14",
"ExtractionB_15",
"ExtractionB_16",
"ExtractionB_17",
"ExtractionB_18",
"ExtractionB_19",
"ExtractionB_20",
"ExtractionB_21",
"ExtractionB_22",
"ExtractionB_23",
"ExtractionB_24",
"ExtractionB_25",
"ExtractionB_26",
"ExtractionB_27",
"ExtractionB_28",
"ExtractionB_29",
"ExtractionB_30"
];