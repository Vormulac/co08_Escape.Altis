/*
VECHICLE RESPAWN FOR MOBILE SPAWN ACTION SCRIPT

Respawns Vehicle for mobile_spawn scripts

© norrin, OCTOBER 2013
***********************************************************************************************************************************
Name the mobile respawn vehicle: r_mobile_spawn_vcl
And put this in the init line:

this addEventHandler ["GETIN",{if ((_this select 1) == "driver") then {NORRN_landy_script = [_this select 0, _this select 2] execVM "revive_sqf\mobile\mobile_spawn.sqf"}}];
this addEventHandler ["GETOUT",{[_this select 0] execVM "revive_sqf\mobile\mobile_remove_spawn.sqf"}]; 
call{[this, 10] execVM "revive_sqf\mobile\vcl_respawn.sqf"}

Where 10 in the last line is the time before the mobile_respawn_vcl respawns after being destroyed
***********************************************************************************************************************************
vcl_respawn.sqf
*/
if (!isServer) exitWith {};
private ["_vcl","_respawn_delay","_vcl_dir","_vcl_pos","_type_vcl","_wait","_new_pos"];
_vcl 				= _this select 0;
_respawn_delay		= _this select 1; 
_vcl_dir			= getDir _vcl;	
_vcl_pos			= getPos _vcl;
_type_vcl 			= typeOf _vcl;
while {alive _vcl} do {sleep 1};
_wait = time + _respawn_delay;
_vcl removeAction NORRN_l_spawn_act;
_vcl removeAction NORRN_l_remove_spawn_act;
if (NORRN_camo_net) then {
	_ammo_crates = nearestObjects [_vcl, ["ReammoBox"], 10];
	{deleteVehicle _x} forEach _ammo_crates;
	_shed = nearestObject [_vcl, "Land_FirePlace_F"];
	deleteVehicle _shed;
	NORRN_camo_net = false;
	publicVariable "NORRN_camo_net";
};
while {time < _wait} do {sleep 1};
_new_pos = [(_vcl_pos select 0) -(6 * cos (90 - _vcl_dir)), (_vcl_pos select 1) + (6 * sin (90 - _vcl_dir)) , 0];
_vcl_new = _type_vcl createVehicle _new_pos;
_vcl_new setDir _vcl_dir;
_vcl_new setPos _new_pos;
[[_vcl_new]] call NORRN_rmobileRespawn;
norrnRpvEH = [NORRN_rmobileRespawn, [_vcl_new]];
publicVariable "norrnRpvEH";
[_vcl_new, _respawn_delay] execVM "revive_sqf\mobile\vcl_respawn.sqf";
[_vcl_new, 0]execVM "revive_sqf\mobile\move_spawn.sqf";


