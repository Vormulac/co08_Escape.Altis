private["_group","_state"];
_group = _this select 0;
_state = _this select 1;

_group setvariable ["a2e_TaskState",_state,false];

if(A3E_Debug) then {
        //[format["%1 is now in state %2",_group,_state]] call a3e_fnc_debugChat;
};