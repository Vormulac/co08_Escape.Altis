private["_regionID","_region","_groups"];
_regionID = [_this, 0, 0] call BIS_fnc_param;

_region = A3E_Regions select _regionID;
if((_region select 0)) then {
    (_region select 1) setMarkerColor "ColorRed";
    _region set [0,false];
    A3E_Regions set [_regionID,_region];
    _groups = (_region select 2) getVariable ["A3E_AmbientInfantryGroups",[]];
    [format["Deactivating Region %1 (AmInf: %2)",_regionID,count(_groups)]] call a3e_fnc_debugChat;
    {
        {deletevehicle _x;} foreach units _x;
        deleteGroup _x;
    } foreach _groups;

     //delete roadblocks
     _roadblock = (_region select 2) getVariable ["A3E_Roadblock",[]];
     if((count _roadblock) > 0) then {
     	
	     _rbGroup = _roadblock select 0;
	     _rbVehicles = _roadblock select 1;
	     
		 {deletevehicle _x;} foreach units _rbGroup;
	     deleteGroup _rbGroup;
	 	 
	 	 {
	 	  	deletevehicle _x;
	 	 } foreach _rbVehicles;
	 };
};