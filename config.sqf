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