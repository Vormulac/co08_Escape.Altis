private["_list","_buildings","_positions","_obj","_side"];
_list = ["Base_"] call a3e_fnc_getMarkerList;
[format["Found %1 Basemarker... initializing",count(_list)]] spawn a3e_fnc_debugChat;
{
   _x setMarkerAlpha 0; //Hide marker
   _buildings = [_x] call a3e_fnc_getBuildingsInMarker;
   [format["Found %1 Buildings... initializing",count(_buildings)]] spawn a3e_fnc_debugChat;
   {
       _side = [A3E_LocalSide,A3E_EnemySide] select floor(random(2));
       _group = [_x,_side] call a3e_fnc_spawnGarisson;
   } foreach _buildings;
   
} foreach _list;