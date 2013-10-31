// resetVars.sqf
// norrin, MAY 2013
_name 	= _this select 0;
_dir	= _this select 1;
_pos	= _this select 2;
// prevent the unit from being attacked or hurt
norrnRpvEH = [NORRN_rNoDamage,[_name]];
publicVariable "norrnRpvEH";
[[_name]] call NORRN_rNoDamage;
_name setdir _dir;
_name setPos _pos;
// Global variables set for the _name 
_name setVariable ["NORRN_unconscious", true, true];
_name setVariable ["NORRN_AIunconscious", true, true];
_name setVariable ["NORRN_AI_help", false, true];
_name setVariable ["NORRN_unit_dragged", false, true];
_name setVariable ["NORRN_AI_help", false, true];