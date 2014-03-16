private ["_generatorTrailer", "_unit", "_id"];
private ["_marker", "_extractionPointNo", "_count", "_text"];

_generatorTrailer = _this select 0;
_unit = _this select 1;
_id = _this select 2;

_count = A3E_HackTime;
if (typeOf _unit == "B_engineer_F") then {
	_count = _count / 3;
};


while {(_count > 0) && (_unit distance _generatorTrailer < 3)} do
{
	_text = "HIJACKING " + str _count;

	cutText [_text, "Plain", 1];
	sleep 1;

	_count = _count - 1;
};



if (_count > 0 && _unit distance _generatorTrailer > 3) exitWith {
    cutText ["You must get closer!", "Plain", 1];
};

cutText ["", "Plain", 1];


//### The Range for extraction is hardcoded at the moment... should be changed to a param
//### mode 0: totally random
//### mode 1: try to pick a close extraction point
//### mode 2: try to pick a extraction far away 
_mode = 0;
if(isServer) then {
	_mode = paramsArray select 7;
} else {
	_mode = 1;
};

_max_range = 3000;
_min_range = 3000;

if (_count == 0) then {

	_flag = false;
	//If selection fails ten times, a random point is selected-
	for[{_i = 0},{_i<10},{_i = _i +1}] do {
		_extractionPointNo = (floor random count A3E_ExtractionPointsA) + 1;
		drn_var_Escape_ExtractionMarkerPos = getMarkerPos ("drn_Escape_ExtractionPos" + str _extractionPointNo);

		if((_mode == 0)) exitwith {};
		if((_generatorTrailer distance drn_var_Escape_ExtractionMarkerPos)<_max_range AND (_mode == 1)) exitwith {};
		if((_generatorTrailer distance drn_var_Escape_ExtractionMarkerPos)>_min_range AND (_mode == 2)) exitwith {};
	};

    publicVariable "drn_var_Escape_ExtractionMarkerPos";
    
    if (!isNil "drn_var_Escape_ExtractionMarker") then {
        deleteMarker drn_var_Escape_ExtractionMarker;
    };
    drn_var_Escape_ExtractionMarker = createMarker ["drn_visibleGoalMarker", drn_var_Escape_ExtractionMarkerPos];
    drn_var_Escape_ExtractionMarker setMarkerType "Flag_NATO";
    
    [_extractionPointNo] call A3E_fnc_CreateExtractionPoint;
    
    ["drn_hijackTasks", "SUCCEEDED"] call drn_SetTaskStateOnAllMachines;
    ["Task complete: Hijack Communication Center (Rendezvous point marked on map)"] call drn_fnc_CL_ShowTitleTextAllClients;
    
    _generatorTrailer removeAction _id;
};