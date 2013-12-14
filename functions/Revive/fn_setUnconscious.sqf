private["_unit","_script"];
    _unit = _this select 0;
    if(local _unit) then {
        _unit setcaptive true;      
        [[_unit,"AinjPpneMstpSnonWrflDnon"],"at_fnc_playMove",true] call BIS_fnc_MP;
	_unit setvariable["AT_IsConscious",false,true];
        _script = _unit getvariable "AT_ConsciousScript";
        if(scriptDone _script) then {
            [[format["Warning: ConsciousHandler terminated for %1. Trying to restart!",name _unit]],"at_fnc_debug",true] call BIS_fnc_MP;
            _script = [_unit] spawn at_fnc_consciousHandler;
            _unit setvariable ["AT_ConsciousScript",_script,false];
        };
};