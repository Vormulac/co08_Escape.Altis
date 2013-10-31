// mobile_spawn.sqf
// norrin, OCTOBER 2013
private ["_vcl","_unit","_c"];
_vcl 				= _this select 0;
_unit				= _this select 1;
NORRN_camo_reset 	= false; 
norrn_mob_mash		= objNull;
_c 					= 0;
sleep 3;
if (NORRN_camo_net) then {_c = 1};
if (player == _vcl) then {	
	if (!local player) exitWith{};
	while {true} do	{
		while {!alive player} do {sleep 0.2};
		_pos = getPos player;
		if (speed player == 0 && _c == 0 && !NORRN_camo_net && !(surfaceIsWater (getPos player)) && !(player getVariable "NORRN_unconscious")) then {
			NORRN_l_spawn_act = player addAction ["Deploy Mobile Respawn Point", "revive_sqf\mobile\deploy_camo_man.sqf", [_vcl], 10, false, true, ""];
			_c = 1;
 		};
 		if (speed player == 0 && _c == 1 && NORRN_camo_net && player distance norrn_mob_mash <= 7 && !(player getVariable "NORRN_unconscious")) then {
			NORRN_l_remove_spawn_act = player addAction ["Stow Mobile Respawn Point", "revive_sqf\mobile\stow_camo_man.sqf", [_vcl], 10, false, true, ""];
			_c = 2;
		};
		if (speed player != 0 && _c == 1 && !NORRN_camo_net || _c == 1 && surfaceIsWater (getPos player) || _c == 1 && (player getVariable "NORRN_unconscious")) then {
			if (!isNil "NORRN_l_spawn_act") then {player removeAction NORRN_l_spawn_act};
			if (!NORRN_camo_net) then {_c = 0} else {_c = 1};	
		};
		if (speed player != 0 && _c == 2 && NORRN_camo_net || _c == 2 && NORRN_camo_net && player distance norrn_mob_mash > 7 || _c == 2 && (player getVariable "NORRN_unconscious")) then {
			if (!isNil "NORRN_l_remove_spawn_act") then {player removeAction NORRN_l_remove_spawn_act};
			_c = 1;	
		};
		if (NORRN_camo_reset) then {
			NORRN_camo_reset = false;
			publicVariable "NORRN_camo_reset"; 
			_c = 0; 
		};
		sleep 1;
	};
}else{
	while {alive _vcl} do {	
		if (!local _vcl || _unit != driver _vcl|| !isplayer (driver _vcl)) exitWith {};	
		if (_unit != driver _vcl) exitWith {
			if (!isNil "NORRN_l_spawn_act") then {_vcl removeAction NORRN_l_spawn_act};
			if (!isNil "NORRN_l_remove_spawn_act") then {_vcl removeAction NORRN_l_remove_spawn_act};
		};
		_pos = getPos _vcl;
		if (speed _vcl == 0 && _c == 0 && !NORRN_camo_net && !isEngineOn _vcl) then {
			NORRN_l_spawn_act = _vcl addAction ["Deploy Mobile Respawn Point", "revive_sqf\mobile\deploy_camo.sqf", [_vcl], 10, true, true, ""];
				_c = _c + 1;
 		};	
 		if (speed _vcl == 0 && _c == 1 && NORRN_camo_net) then {
			NORRN_l_remove_spawn_act = _vcl addAction ["Stow Mobile Respawn Point", "revive_sqf\mobile\stow_camo.sqf", [_vcl], 10, true, true, ""];
			_c = 2;
		};
		if (speed _vcl != 0 || isEngineOn _vcl) then {
			if (!isNil "NORRN_l_spawn_act") then {_vcl removeAction NORRN_l_spawn_act};
			if (!isNil "NORRN_l_remove_spawn_act") then {_vcl removeAction NORRN_l_remove_spawn_act};
			_c = 0;
		};	
		if (NORRN_camo_reset) then {
			NORRN_camo_reset = false; 
			publicVariable "NORRN_camo_reset";
			_c = 0; 
		};
		sleep 1;
	};
};
