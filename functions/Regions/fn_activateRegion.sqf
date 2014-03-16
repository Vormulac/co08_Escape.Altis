private["_regionID","_region"];
_regionID = [_this, 0, 0] call BIS_fnc_param;

_region = A3E_Regions select _regionID;
if(!(_region select 0)) then {
    (_region select 1) setMarkerColor "ColorGreen";
    _region set [0,true];
    A3E_Regions set [_regionID,_region];
    
    //Spawn Ambient Infantry
    [[_region select 1, _region select 2],"a3e_fnc_spawnAmbientInfantry"] call a3e_fnc_HCExec;

    //Spawn Roadblock
    if((random 1) <= A3E_RoadblockProbability) then {
    	["Region should have roadblock."] spawn a3e_fnc_debugChat;
    	[[_region select 1, _region select 2],"a3e_fnc_BuildRoadblock"] call a3e_fnc_HCExec;
    };
};