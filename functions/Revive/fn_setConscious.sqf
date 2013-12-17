private["_unit"];
    _unit = _this select 0;
    _unit setcaptive false;
    if(local _unit) then {
	_unit setdammage 0.2;
	[[_unit,"AmovPpneMstpSrasWrflDnon"],"at_fnc_playMove",true] call BIS_fnc_MP;
        if(!(isplayer _unit)) then {
            _unit enableAI "ANIM";
        };
	_unit setvariable["AT_IsConscious",true,true];
        if(_unit getvariable "AT_isCrawling") then {
               _unit setvariable ["AT_isCrawling",false,false];
        };
};