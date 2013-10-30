// bandage_teammate.sqf
// OCTOBER 2013 - norrin
private ["_array","_name","_wounded","_var","_med_supplies"];
_array 		= _this select 3;
_name 		= _array select 0;
_wounded 	= _array select 1;
//Uneccesary actions removed & drop body added 
if (!isNil "NORRN_bandageBuddyAction") then {_name removeAction NORRN_bandageBuddyAction};
if (local _wounded) then {
	_wounded playMove "AmovPpneMstpSnonWnonDnon_healed";
}else{
	norrnRpvEH = [NORRN_rplayAnim, [_wounded,"AmovPpneMstpSnonWnonDnon_healed"]];
	publicVariable "norrnRpvEH";
};
_name playMove "AinvPknlMstpSlayWrflDnon_medic";
_var = _name getVariable "Norrn_bandages";
_name setVariable ["Norrn_bandages", (_var - 1), true]; 
_med_supplies = format ["Medpacks Remaining: %1\nBandages  Remaining: %2", (_name getVariable "Norrn_medpacks"), (_name getVariable "Norrn_bandages")];
hint _med_supplies;
// Set variables
if (NORRN_R_SP) then {	
	_wounded setVariable ["NORRN_bleedDamage", (_wounded getVariable "NORRN_totalDamage"), true];
}else{
	_wounded setVariable ["NORRN_bleedDamage", (getDammage _wounded), true];
};
_wounded setVariable ["NORRN_Bleed", false, true];
_wounded setVariable ["NORRN_stopBleed", true, true];
