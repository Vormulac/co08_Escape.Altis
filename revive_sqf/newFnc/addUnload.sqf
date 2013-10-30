// addUnload.sqf
// norrin, MARCH 2013
_name = _this select 0;
_ddd  = _this select 1;
_vcl = (nearestObjects [_name, ["Car","Tank","Helicopter","Plane"], 5]) select 0;
_crewVcl = [];
_crewVcl = crew _vcl;
if (count _crewVcl > 0) then {
	_unconscious_crew = [];
	{if (_x getVariable "NORRN_AIunconscious") then {_unconscious_crew = _unconscious_crew + [_x]}} forEach _crewVcl;
	if (count _unconscious_crew > 0 && _ddd == 0) then {	
		_action = format ["Unload Wounded from %1", (typeOf _vcl)];
		NORRN_pullOutAction = _name  addAction [_action, "revive_sqf\load_wounded\unLoad_act.sqf",[_name, _vcl, _crewVcl], 0, true, true];
		_ddd = 1;
	};
	if (count _unconscious_crew == 0 && _ddd == 1) then	{	
		_name removeAction NORRN_pullOutAction;
		_ddd = 0;
	};
};
if (_ddd == 1 && count (crew _vcl) == 0) then {
	_name removeAction NORRN_pullOutAction;
	_ddd = 0;
};
_ddd