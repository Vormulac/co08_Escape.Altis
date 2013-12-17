private["_unit","_script","_ragdoll"];
    _unit = _this select 0;
    if(count(_this)>1) then {
        _ragdoll = _this select 1;
    } else {
        _ragdoll = true;
    };
    _unit setcaptive true;  
    if(local _unit) then {    
       // [[_unit,"AinjPpneMstpSnonWrflDnon"],"at_fnc_playMove",true] call BIS_fnc_MP;
        if(!(surfaceIsWater (position _unit)) && _ragdoll && (vehicle _unit == _unit)) then {
                [_unit] spawn at_fnc_ragdoll;
            };
        if((vehicle _unit) != _unit) then {
             _unit action ["Eject", vehicle _unit];
        };
        if(surfaceIsWater (position _unit)) then {
           [_unit] spawn at_fnc_washAshore;
        };
	_unit setvariable["AT_IsConscious",false,true];
        _script = [_unit] spawn at_fnc_consciousHandler;       
};