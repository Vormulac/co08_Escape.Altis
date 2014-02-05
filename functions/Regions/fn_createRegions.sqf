private["_logic"];
_southWest = getpos SouthWest;
_northEast = getpos NorthEast;

_x = _southWest select 0;
_y = _southWest select 1;

while{(_y +A3E_RegionOverlap)<(_northEast select 1)} do {
    
    _pos = [_x + A3E_RegionSize/2,_y + A3E_RegionSize/2]; 
    
    //Check if region is wateronly
    if(!(surfaceIsWater _pos 
    && surfaceIsWater [(_pos select 0)+ A3E_RegionSize/2, (_pos select 1)+ A3E_RegionSize/2]
    && surfaceIsWater [(_pos select 0)+ A3E_RegionSize/2, (_pos select 1)- A3E_RegionSize/2]
    && surfaceIsWater [(_pos select 0)- A3E_RegionSize/2, (_pos select 1)+ A3E_RegionSize/2]
    && surfaceIsWater [(_pos select 0)- A3E_RegionSize/2, (_pos select 1)- A3E_RegionSize/2])) then {
        

        _logic = createVehicle [A3E_HelperObject, _pos, [], 0, "NONE"];
        _logic = [_logic,"RegionHelper"] call BIS_fnc_ObjectVar;
        _logic = call compile _logic;
        
        _markername = format["A3E_RegionMarker%1",A3E_RegionID];
        //Create a Debug Marker
        _markerstr = createMarker[_markername,_pos];
        _markerstr setMarkerShape "RECTANGLE";
        _markerstr setMarkerSize [(A3E_RegionSize/2)-10,(A3E_RegionSize/2)-10];
        _markerstr setMarkerAlpha 0.2;
        //Create the ActivationTrigger
        _ATrg=createTrigger["EmptyDetector",_pos];
        _ATrg setTriggerArea[(A3E_RegionSize/2)+A3E_RegionOverlap,(A3E_RegionSize/2)+A3E_RegionOverlap,0,true];
        _ATrg setTriggerActivation[A3E_SideStrings select A3E_PlayerSide,"PRESENT",true];
        _ATrg setTriggerStatements["this && isServer", format["[%1] spawn A3E_fnc_activateRegion;",A3E_RegionID], ""];

        //Create the deaktivation trigger
        _DTrg=createTrigger["EmptyDetector",_pos];
        _DTrg setTriggerArea[(A3E_RegionSize/2)+A3E_RegionOverlap+A3E_RegionDeactivateOffset,(A3E_RegionSize/2)+A3E_RegionOverlap+A3E_RegionDeactivateOffset,0,true];
        _DTrg setTriggerActivation[A3E_SideStrings select A3E_PlayerSide,"NOT PRESENT",true];
        _DTrg setTriggerStatements["this && isServer",  format["[%1] spawn A3E_fnc_deactivateRegion;",A3E_RegionID], ""]; 


        A3E_Regions set [A3E_RegionID,[false,_markerstr,_logic,_ATrg,_DTrg]];
        A3E_RegionID = A3E_RegionID + 1;
    };
    _x = _x + A3E_RegionSize;
    if((_x +A3E_RegionOverlap)>=(_northEast select 0)) then {
        _x = _southWest select 0;
        _y = _y + A3E_RegionSize;
    };
};