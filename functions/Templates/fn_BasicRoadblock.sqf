//A3E_fnc_BasicRoadblock.sqf
private["_pos", "_group", "_barrier"];
  
_pos = [_this, 0, [],[[]],[2,3]] call BIS_fnc_param;
    
_group = [[_pos,A3E_LocalSide,A3E_AmbientGroupMembers + (random 2)] call a3e_fnc_spawnGroup];
_pos = [(_pos select 0) + (random 4) - 2, (_pos select 1) + (random 4) - 2, (_pos select 2) + (random 4) - 2];
_barrier = "RoadCone_L_F" createVehicle _pos;
_group = _group + [[_barrier]];
_group;
    