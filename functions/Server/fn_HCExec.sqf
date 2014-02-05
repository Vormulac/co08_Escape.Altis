private["_params","_function","_spawn","_server"];
_params = [_this, 0, [], [[]]] call BIS_fnc_param;
_function = [_this, 1, "a3e_fnc_debugChat", [""]] call BIS_fnc_param;
_server = [_this, 2, false, [true]] call BIS_fnc_param;

if(A3E_HC_ID !=0) then {    //Call function on HC if present
    [_params,_function,A3E_HC_ID] call BIS_fnc_MP;
} else {    //Call on server if HC not present
    call compile format["%1 spawn %2;",_params,_function];
};
//Call if additional servercall is required
if(A3E_HC_ID !=0 && _server) then {
    _function = missionnamespace getvariable _function;
    _params call _function;
}