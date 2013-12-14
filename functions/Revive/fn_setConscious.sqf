private["_unit"];
    _unit = _this select 0;
    _unit setcaptive false;
    if(local _unit) then {
	_unit setdammage 0.2;
	[[_unit,"AmovPpneMstpSrasWrflDnon"],"at_fnc_playMove",true] call BIS_fnc_MP;
	_unit setvariable["AT_IsConscious",true,true];
};