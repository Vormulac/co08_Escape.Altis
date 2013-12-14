private["_unit","_flag","_exit","_crawlHandler","_displayHandler","_displayNumber","_unitvar","_run","_respawned","_corpse"];
_unit = _this select 0;
_unitvar = [_unit] call BIS_fnc_objectVar;
disableSerialization;
//This will prevent a unconscious unit from taking more damage while unconscious
_run = true;
_respawned = false;
while{_run} do {
            while{(_unit getvariable "AT_isConscious")} do {
                    sleep 0.1;
            };
            //This should be put in a local function
            if(!alive _unit) then { 
                _unit = [] call compile _unitvar;
                _corpse = _unit getvariable ["AT_Corpse",ObjNull];
                _unit setvariable ["AT_Corpse",nil];
                [[format["%1 died while unconscious.",name _unit]],"at_fnc_debug",true] call BIS_fnc_MP;
                if(!isNull _corpse) then {
                    [[format["%1 respawned. Copy gear from old body %2",name _unit,_corpse]],"at_fnc_debug",true] call BIS_fnc_MP;
                    [_unit,_corpse,false] call at_fnc_copyGear;
                    _unit setpos getpos _corpse;
                    deletevehicle _corpse;
                } else {
                    [[format["Can't find a corpse!"]],"at_fnc_debug",true] call BIS_fnc_MP;
                };
            };
            if(_respawned) then {
                 [[format["%1 has respawned and is now unconscious again.",name _unit]],"at_fnc_debug",true] call BIS_fnc_MP;
                 [_unit] call at_fnc_setUnconscious;
            } else {
                [[format["%1 is unconscious",name _unit]],"at_fnc_debug",true] call BIS_fnc_MP;
            };
            _unit setcaptive true;

            //Prevent AI from using FAKs
            if(_unit != player) then {
                _unit setdammage 0;
            };
            _crawlHandler = _unit addeventhandler["AnimChanged",{_this call at_fnc_startCrawling}];
            //_unit setvariable["AT_isConscious",false,true];
            if((vehicle _unit) != _unit) then {
                    _unit action ["Eject", vehicle _unit];
            };
            [_unit] spawn {
                sleep 1;
                [[(_this select 0)],"at_fnc_addReviveAction",true] call BIS_fnc_MP;
            };
            if(_unit == player) then {
                showHud false;
                _displayNumber = [] call BIS_fnc_DisplayMission;
                _displayHandler = _displayNumber displayAddEventHandler 
                    [	
                            "KeyDown",
                            "
                                    private ['_actions', '_nrofactions', '_returnvalue', '_actionKeys' ];
                                    _returnvalue = _false;
                                    _actions = [ 'TimeDec', 'TimeInc', 'Gear', 'Throw', 'Fire', 'ReloadMagazine', 'SwitchWeapon', 'Diary', 'MoveLeft', 'MoveRight' ]; 

                                    _actionKeys = [];
                                    {
                                            _actionkeys = _actionkeys + actionKeys _x;
                                    } forEach _actions;

                                    if( (_this select 1) in _actionKeys ) then { _returnvalue = true };
                                    _returnvalue
                            "
                    ];
            };
            //if(surfaceIsWater (position _unit)) then {
            //    [_unit] spawn at_fnc_washAshore;
            //};
            _unit allowDamage true;
            while{!(_unit getvariable "AT_isConscious") && (alive _unit)} do {
                    sleep 0.1;
            };
            //_unit removeeventhandler _crawlHandler; //This is throwing an integer given, array expected error (especialy with AI)
            
            _respawn = false;
            if(!alive _unit) then { 
                _unit = [] call compile _unitvar;
                _corpse = _unit getvariable ["AT_Corpse",ObjNull];
                _unit setvariable ["AT_Corpse",nil];
                [[format["%1 died while unconscious.",name _unit]],"at_fnc_debug",true] call BIS_fnc_MP;
                if(!isNull _corpse) then {
                    [[format["%1 respawned. Copy gear from old body %2",name _unit,_corpse]],"at_fnc_debug",true] call BIS_fnc_MP;
                    [_unit,_corpse,false] call at_fnc_copyGear;
                    _unit setpos getpos _corpse;
                    deletevehicle _corpse;
                } else {
                    [[format["Can't find a corpse!"]],"at_fnc_debug",true] call BIS_fnc_MP;
                };
                _respawn = true;
            } else {
                [[format["%1 is now conscious again.",name _unit]],"at_fnc_debug",true] call BIS_fnc_MP;
                _unit setcaptive false;
            };
            _unit removeAllEventHandlers "AnimChanged"; //This could possibly break something in other scripts

            [[_unit],"at_fnc_removeReviveAction",true] call BIS_fnc_MP;
            if(_unit == player) then {
                _displayNumber displayRemoveEventHandler [ "keydown", _displayHandler];
                showHud true;
            };
    };
