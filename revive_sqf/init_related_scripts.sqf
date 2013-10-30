// init_related_scripts.sqf ArmA3 revive
// October 2013 - norrin 
private ["_mission_end_function","_Base_1","_max_respawns","_mobile_spawn","_no_enemy_sides","_mobile_man","_mobile_type","_unitsArray"];
_mission_end_function 	= NORRN_revive_array select 0;
_Base_1					= NORRN_revive_array select 13;
_max_respawns			= NORRN_revive_array select 38;
_mobile_spawn			= NORRN_revive_array select 51; 
_no_enemy_sides			= NORRN_revive_array select 22;
_mobile_man				= NORRN_revive_array select 53;
_mobile_type			= NORRN_revive_array select 60;
_unitsArray 			= NORRN_player_units;
NORRN_player_units 		= [];
NORRN_rCarryAnims		= ["acinpercmstpsraswrfldnon","acinpercmrunsraswrfldf","acinpercmrunsraswrfldfl","acinpercmrunsraswrfldfr","acinpercmrunsraswrfldl","acinpercmrunsraswrfldr","acinpercmrunsraswrfldbl","acinpercmrunsraswrfldbr","acinpercmrunsraswrfldb","acinpknlmstpsraswrfldnon_acinpercmrunsraswrfldnon","acinpercmrunsraswrfldnon","manposcarrying"];
{call compile format ["NORRN_player_units = NORRN_player_units +['%1']", _x]} forEach _unitsArray;
if (isServer && _mobile_spawn == 1) then {NORRN_camo_net = false; publicVariable "NORRN_camo_net"};
if (_mobile_spawn == 1) then {r_ms_base_1 = _Base_1};
// Added pvEH - scripts modified to remove the need for sending long strings via setVehicleInit to reduce network traffic and JIP load - 04072010
"norrnRnoAnim"  addPublicVariableEventHandler {[_this select 1] execVM "revive_sqf\pvEH\noAnim.sqf"};
"norrnRaCarUp"  addPublicVariableEventHandler {[_this select 1] execVM "revive_sqf\pvEH\carriedUp.sqf"};
"norrnRaPicUp"  addPublicVariableEventHandler {[_this select 1] execVM "revive_sqf\pvEH\pickUp.sqf"};
"norrnRName"    addPublicVariableEventHandler {[_this select 1] execVM "revive_sqf\pvEH\promptRName.sqf"};
"norrnR180" 	addPublicVariableEventHandler {[_this select 1] execVM "revive_sqf\pvEH\set180.sqf"};
"norrnRaLW"   	addPublicVariableEventHandler {[_this select 1] execVM "revive_sqf\pvEH\load_wounded.sqf"};
"norrnRLact"	addPublicVariableEventHandler {[_this select 1] execVM "revive_sqf\load_wounded\load_wounded.sqf"};
"norrnRDead"   	addPublicVariableEventHandler {[_this select 1] execVM "revive_sqf\pvEH\deadState.sqf"};
"norrnRpvEH"   	addPublicVariableEventHandler {[_this select 1] execVM "revive_sqf\pvEH\pvEH.sqf"};
// INCLUDE REQUIRED GAME CODES
#include "\A3\editor_f\Data\Scripts\dikCodes.h"
// Add Revive Functions
Norrn_AIBehaviour 			= Compile PreprocessFile "revive_sqf\functions\AIBehaviour.sqf";
Norrn_WaterFix				= Compile PreprocessFile "revive_sqf\functions\WaterFix.sqf";
GetTerrainSlope 			= Compile PreprocessFile "revive_sqf\functions\GetTerrainSlope.sqf";  //Add terrain slope function from Warfare thanks to BIS
Norrn_SlopeFix 				= Compile PreprocessFile "revive_sqf\functions\SlopeFix.sqf";
Norrn_CallOut				= Compile PreprocessFile "revive_sqf\functions\CallOut.sqf";
Norrn_UncAnimFix 			= Compile PreprocessFile "revive_sqf\functions\UncAnimFix.sqf";
Norrn_DeleteUncBody	 		= Compile PreprocessFile "revive_sqf\functions\DeleteUncBody.sqf";
Norrn_LeaderFix	 			= Compile PreprocessFile "revive_sqf\functions\LeaderFix.sqf";
Norrn_LivesRemain 			= Compile PreprocessFile "revive_sqf\functions\LivesRemain.sqf";
Norrn_RespawnPos1 			= Compile PreprocessFile "revive_sqf\functions\RespawnPos1.sqf";
Norrn_RespawnPos2			= Compile PreprocessFile "revive_sqf\functions\RespawnPos2.sqf";
Norrn_RespawnPos2AI	 		= Compile PreprocessFile "revive_sqf\functions\RespawnPos2AI.sqf";
Norrn_Call4Help				= Compile PreprocessFile "revive_sqf\functions\I_need_help.sqf";
Norrn_AI_throwSmoke			= Compile PreprocessFile "revive_sqf\functions\AI_throwSmoke.sqf";
NORRN_DropWeapons			= Compile PreprocessFile "revive_sqf\functions\dropWeapons.sqf";
NORRN_load_wounded			= Compile PreprocessFile "revive_sqf\load_wounded\load_wounded.sqf";
NORRN_respawn_chance		= Compile PreprocessFile "revive_sqf\functions\respawn_chance.sqf";
NORRN_respawn_time			= Compile PreprocessFile "revive_sqf\functions\respawn_time.sqf";
NORRN_createBody			= Compile PreprocessFile "revive_sqf\functions\createBody.sqf";
NORRN_uncTimer				= Compile preprocessfile "revive_sqf\functions\uncTimer.sqf";
NORRN_reviveDrag_C_keyDown 	= Compile preprocessfile "revive_sqf\functions\reviveDrag_C_keyDown.sqf";
NORRN_UNC_CAM				= Compile preprocessfile "revive_sqf\cam_follow.sqf";
NORRN_cLoadOut				= Compile preprocessfile "revive_sqf\newFnc\currentLoadOut.sqf";
NORRN_rLoadOut				= Compile preprocessfile "revive_sqf\newFnc\returnLoadOut.sqf";
NORRN_addRevive				= Compile preprocessfile "revive_sqf\newFnc\addRevive.sqf";
NORRN_createGVars			= Compile preprocessfile "revive_sqf\newFnc\createGVars.sqf";
NORRN_addDrag				= Compile preprocessfile "revive_sqf\newFnc\addDrag.sqf";
NORRN_addUnload				= Compile preprocessfile "revive_sqf\newFnc\addUnload.sqf";
NORRN_addAIRevive			= Compile preprocessfile "revive_sqf\newFnc\addAIRevive.sqf";
NORRN_addEH					= Compile preprocessfile "revive_sqf\newFnc\addEH.sqf";
NORRN_addCOD_EH				= Compile preprocessfile "revive_sqf\newFnc\addCOD_EH.sqf";
NORRN_resetSPVars			= Compile preprocessfile "revive_sqf\newFnc\resetSPVars.sqf";
NORRN_resetVars				= Compile preprocessfile "revive_sqf\newFnc\resetVars.sqf";
NORRN_rSetDir				= Compile preprocessfile "revive_sqf\newFnc\setDir.sqf";
NORRN_rSwitchAnim			= Compile preprocessfile "revive_sqf\newFnc\switchAnim.sqf";
NORRN_rPlayAnim				= Compile preprocessfile "revive_sqf\newFnc\playAnim.sqf";
NORRN_rJoinGroup			= Compile preprocessfile "revive_sqf\newFnc\joinGroup.sqf";
NORRN_rDoMove				= Compile preprocessfile "revive_sqf\newFnc\doMove.sqf";
NORRN_rHint					= Compile preprocessfile "revive_sqf\newFnc\hint.sqf";
NORRN_rMobileRespawn		= Compile preprocessfile "revive_sqf\mobile\mobileRespawn.sqf";
NORRN_rSay					= Compile preprocessfile "revive_sqf\newFnc\say.sqf";
NORRN_rAllowDamage			= Compile preprocessfile "revive_sqf\newFnc\allowDamage.sqf";
NORRN_rNoDamage				= Compile preprocessfile "revive_sqf\newFnc\noDamage.sqf";
NORRN_rAnimDrag				= Compile preprocessfile "revive_sqf\newFnc\animDrag.sqf";
NORRN_rattach				= Compile preprocessfile "revive_sqf\newFnc\attach.sqf";
Norrn_DialogBlink 			= 0;
//========================================================
// Initialise revive script
[] execVM "revive_sqf\revive_init.sqf";
// Initialise isplayer script
[NORRN_player_units] execVM "revive_sqf\isplayer.sqf";
if (isServer) then {
	mission_Over = false;
	publicVariable "mission_Over"; 	
	// Initialise mission end script
	if (_mission_end_function == 1) then {[NORRN_player_units] execVM "revive_sqf\mission_end.sqf"};	
	// Initialise marker color script
	if (_no_enemy_sides > 0) then {[] execVM "revive_sqf\marker_color.sqf"};	
	// Initialise mobile spawn function
	if (_mobile_spawn == 1) then { 
		if (_mobile_type == 0) then {
			[r_mobile_spawn_vcl, 0] execVM "revive_sqf\mobile\move_spawn.sqf"
		} else {
			NORRN_mobile_man = ObjNull;
			[_mobile_man, 1] execVM "revive_sqf\mobile\move_spawn.sqf"
		};
	};
};
//create mobile respawn marker
if (_mobile_spawn == 1) then {[] execVM "revive_sqf\mobile\mobile_marker.sqf"};
//initialise mobile spawn script if player is mobile respawn unit 
if (player == _mobile_man) then {
	[_mobile_man, _mobile_man] execVM "revive_sqf\mobile\mobile_spawn.sqf";
	NORRN_mobile_man = player;
	publicVariable "NORRN_mobile_man"; 
};
//Camera Options - hoz and mandoble's free cam settings, OFPEC - see: http://www.ofpec.com/forum/index.php?topic=32970.0
OFPEC_MouseCoord = [0.5,0.5];
OFPEC_MouseScroll = 0;
OFPEC_MouseButtons =[false,false];
OFPEC_camzoomspeed = 1.0;
OFPEC_maxzoomout = 400;
OFPEC_range_to_unit = 5;  //starting dist from target
if (_max_respawns == 2000) then {[]execVm "revive_sqf\respawn\init_respawn.sqf"};
if (count playableUnits == 0) then {NORRN_R_SP = true} else {NORRN_R_SP = false};

