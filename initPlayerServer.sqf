private["_player","_didJIP"];

_player = _this select 0;
_didJIP =  _this select 1;

if(_didJIP) then {
    [format["%1 jiped the Game!",name _player],"a3e_fnc_groupChat",true] call BIS_fnc_MP;
} else {
    [format["%1 joined the Game!",name _player],"a3e_fnc_groupChat",true] call BIS_fnc_MP;
};

A3E_Players = A3E_Players + [_player];
publicVariable "A3E_Players";

waituntil{sleep 0.1; count(A3E_StartPos)>0};
_player setpos [(A3E_StartPos select 0)+random 5.0-2.5,(A3E_StartPos select 1)+random 5.0-2.5,0];
_player setdir (random 360);