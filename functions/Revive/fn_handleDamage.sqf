private["_unit","_selection","_damage","_source","_projectile","_hit","_return"];
//Passed Array  [unit, selectionName, damage, source, projectile]
_unit = _this select 0;
_selection = _this select 1;
_hit = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

if((_unit getvariable "AT_isConscious")) then {
   // player sidechat format["Hit %1 with %2",_selection,_hit];
    if(_hit>=0.80 && (_selection =="") || _hit>=0.9 && (_selection =="head")) then { 
            _unit allowDamage false;
            _hit = 0.7;
            if((getOxygenRemaining _unit)<1) then {
                _unit setdammage 0;
            };     
           //_unit setOxygenRemaining 1;
            if(surfaceIsWater (position _unit)) then {
                [_unit] spawn at_fnc_washAshore;
            };
            [_unit] spawn at_fnc_setUnconscious;
    } else {
        if(_hit>=0.8) then {
            _hit = 0.8;    
        };
    };
} else {
    if((_unit getvariable "AT_isCrawling")) then {
        _unit setvariable ["AT_isCrawling",false,false]; 
        _unit setcaptive true;
        [[_unit,"AinjPpneMstpSnonWrflDnon"],"at_fnc_playMove",true] call BIS_fnc_MP;      
    };
     if(_hit>=0.8) then {
        _hit = 0.8;    
    };
};
_hit;