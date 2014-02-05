private["_logic","_marker","_pos","_goodPos","_groupCount","_players","_groups","_group"];
_marker = [_this, 0, "noMarker"] call BIS_fnc_param;
_logic = [_this, 1,objNull] call BIS_fnc_param;

_posFound = false;
_groupCount = ceil(A3E_GroupsPerSqKm*([_marker] call a3e_fnc_calcMarkerArea));
_groups = [];
//[format["Spawning %1 AmbientInf Patrols at %2",_groupCount,_marker]] call a3e_fnc_debugChat;

for "_x" from 1 to _groupCount do {

    _goodPos = true;

    for "_x" from 1 to 10 do {
        _pos = [_marker] call a3e_fnc_RandomMarkerPos;
        if(count(_pos)!=0) then {
            if(surfaceIsWater _pos) then {_goodPos = false;};
            _players = [] call a3e_fnc_GetPlayers;
            {
                if((_x distance _pos) < A3E_AmbientSpawnDistance) exitwith {_goodPos = false;};
            } foreach _players;
        };
        if(_goodPos) exitwith {};
    };
    if(_goodPos) then {
       _group = [_pos,A3E_LocalSide,A3E_AmbientGroupMembers + (random 2)] call a3e_fnc_spawnGroup;
       if(!(isNull _group)) then {
           [_group,_marker] call A3E_fnc_Patrol;
           if(A3E_Debug) then {
                //[format["Group %1 spawned",_group]] call a3e_fnc_debugChat;
           };
           _groups = _groups + [_group];
       };
    } else {
        [format["Finding a spawnposition for AmbientInf failed.",_groupCount]] call a3e_fnc_debugChat;
    };
        
};
_logic setvariable ["A3E_AmbientInfantryGroups",_groups,true];
