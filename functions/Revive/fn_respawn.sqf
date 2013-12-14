private["_unit","_corpse"];
_unit = _this select 0;
_corpse = _this select 1;


_unit setvariable ["AT_Revive_Action",-1,true];
_unit setvariable ["AT_isHealing",[],true];
_unit setcaptive false;
_unit setvariable ["AT_Corpse",_corpse,false];
//waituntil{alive _unit};

if((_unit getvariable "AT_isConscious")) then {
    //Died somehow (drowning?) or pressing respawn while conscious
    //_unit setpos getpos _corpse;
    //[_unit] call at_fnc_setUnconscious;
} else {
    //Pressed Respawn while unconscious
    //_unit setpos getpos _corpse;
    //[_unit] call at_fnc_setUnconscious;
};

