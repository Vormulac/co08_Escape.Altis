// createGVars.sqf
// norrin, MARCH 2013
private ["_name"];
_name = _this select 0;
// Probably best not to play with the following code unless you know what you are doing
// Define global variables for each unit
if ( format ["%1", (_name getVariable "NORRN_lives_used")] == "<null>")    	 then {_name setVariable ["NORRN_lives_used", 0, true]};
if ( format ["%1", (_name getVariable "NORRN_unconscious")] == "<null>")   	 then {_name setVariable ["NORRN_unconscious", false, true]};
if ( format ["%1", (_name getVariable "NORRN_AIunconscious")] == "<null>") 	 then {_name setVariable ["NORRN_AIunconscious", false, true]};
if ( format ["%1", (_name getVariable "NORRN_bonus_life")] == "<null>") 	 then {_name setVariable ["NORRN_bonus_life", 0, false]};
if ( format ["%1", (_name getVariable "NORRN_teamkill_punish")] == "<null>") then {_name setVariable ["NORRN_teamkill_punish", 0, true]};
if ( format ["%1", (_name getVariable "NORRN_stopBleed")] == "<null>") 		 then {_name setVariable ["NORRN_stopBleed", false, true]};
if ( format ["%1", (_name getVariable "NORRN_bleeding")] == "<null>") 		 then {_name setVariable ["NORRN_bleeding", false, true]};
if ( format ["%1", (_name getVariable "NORRN_bleedDamage")] == "<null>") 	 then {_name setVariable ["NORRN_bleedDamage", 0, true]};
if ( format ["%1", (_name getVariable "NORRN_dead")] == "<null>") 			 then {_name setVariable ["NORRN_dead", false, true]};
if ( format ["%1", (_name getVariable "NORRN_AI_help")] == "<null>")         then {_name setVariable ["NORRN_AI_help", false, true]};
if ( format ["%1", (_name getVariable "NORRN_AISmoke")] == "<null>")         then {_name setVariable ["NORRN_AISmoke", [false,""], true]};
if ( format ["%1", (_name getVariable "NORRN_uncPos")] == "<null>")			 then {_name setVariable ["NORRN_uncPos", [], true]};
if ( format ["%1", (_name getVariable "NORRN_AIReviver")] == "<null>")		 then {_name setVariable ["NORRN_AIReviver", objNull, true]};
if ( format ["%1", (_name getVariable "NORRN_respawn_at_base")] == "<null>") then {_name setVariable ["NORRN_respawn_at_base", false, false]};
if ( format ["%1", (_name getVariable "NORRN_heyImBusy")] == "<null>") 		 then {_name SetVariable ["NORRN_heyImBusy", false, true]};