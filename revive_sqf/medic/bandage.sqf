// bandage.sqf
// OCTOBER 2013 - norrin
private ["_name","_var","_med_supplies"];
_name = _this select 3;
//Uneccesary actions removed & drop body added 
if (!isNil "NORRN_bandageAction") then {_name removeAction NORRN_bandageAction};
_name playMove "AinvPknlMstpSlayWrflDnon_healed";
_var = _name getVariable "Norrn_bandages";
_name setVariable ["Norrn_bandages", (_var - 1), true]; 
_med_supplies = format ["Medpacks Remaining: %1\nBandages  Remaining: %2",(_name getVariable "Norrn_medpacks"),(_name getVariable "Norrn_bandages")];
if (_name == player) then {hint _med_supplies};
// Set variables
if (NORRN_R_SP) then {	
	_name setVariable ["NORRN_bleedDamage", (_name getVariable "NORRN_totalDamage"), false];
}else{
	_name setVariable ["NORRN_bleedDamage", (getDammage _name), false];
};
_name setVariable ["NORRN_Bleed", false, true];
_name setVariable ["NORRN_stopBleed", true, true];