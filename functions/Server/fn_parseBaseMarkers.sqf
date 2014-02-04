private["_list","_buildings","_positions","_obj"];
_list = ["Base_"] call a3e_fnc_getMarkerList;
[format["Found %1 Basemarker... initializing",count(_list)]] spawn a3e_fnc_debugChat;
{
   _x setMarkerAlpha 0; //Hide marker
   _buildings = [_x] call a3e_fnc_getBuildingsInMarker;
   [format["Found %1 Buildings... initializing",count(_buildings)]] spawn a3e_fnc_debugChat;
   {
       _positions = [_x] call a3e_fnc_findSpawnPosBuilding;
       [format["Found %1 positions... initializing",count(_positions)]] spawn a3e_fnc_debugChat;
       {
           _cpos = [_x select 0, _x select 1,_x select 2];
           _obj = createVehicle ["SmokeShell", _cpos, [], 0, "NONE"];
           _obj setposASL _cpos;
           _obj setdir (_x select 4);
       } foreach _positions;
   } foreach _buildings;
   
} foreach _list;