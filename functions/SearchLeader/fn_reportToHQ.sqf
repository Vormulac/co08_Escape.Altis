private["_position","_unit"];
_unit = [_this, 0, objNull] call BIS_fnc_param;
_position = [_this, 1, [], [[]]] call BIS_fnc_param;

[format["%1 is reporting...",name _unit]] call a3e_fnc_debugChat;

sleep (A3E_ReportingTime + random(A3E_ReportingTimeRandom));

if(alive _unit) then {
    _unit setVariable["A3E_isReporting",false];
    [format["%1 reported enemys at %2.",name _unit,_position]] call a3e_fnc_debugChat;
    
 } else {
     [format["%1 died before reporting.",name _unit]] call a3e_fnc_debugChat;
 };