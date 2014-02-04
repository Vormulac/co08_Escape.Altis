//Loading world specific configs
call compile preprocessFileLineNumbers ("islands\"+ worldName +"\WorldConfig.sqf");
call compile preprocessFileLineNumbers ("islands\"+ worldName +"\VillageMarkers.sqf");
call compile preprocessFileLineNumbers ("islands\"+ worldName +"\PatrolBoatMarkers.sqf");
call compile preprocessFileLineNumbers ("islands\"+ worldName +"\CommunicationCenterMarkers.sqf");

A3E_Debug = true; //Can be overwritten by parameters

//Settings
//Side and Faction of Player [Side,Faction]
       
A3E_Sides = [EAST, WEST, RESISTANCE];
A3E_PlayerSide = 1;
A3E_LocalSide = 2;
A3E_EnemySide = 0;


A3E_TeamLeaders = [
["O_Soldier_TL"],//East
["B_soldier_TL"],//West
["I_Soldier_TL"]//Guer
];
A3E_GroupMembers = [
["O_Soldier_F"],//East
["B_soldier_F"],//West
["I_Soldier_F"]//Guer
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