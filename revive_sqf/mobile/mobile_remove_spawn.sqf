// landy_remove_spawn.sqf
// © norrin, OCTOBER 2013
private ["_unit"];
_unit = _this select 0;
if (!isNil "NORRN_l_spawn_act") then {_unit removeAction NORRN_l_spawn_act};
if (!isNil "NORRN_l_remove_spawn_act") then {_unit removeAction NORRN_l_remove_spawn_act};
		


