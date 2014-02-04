private["_player","_didJIP"];

_player = _this select 0;
_didJIP =  _this select 1;

if(_player == HC) then {
    ["HC present. Offloading AI."] spawn a3e_fnc_debugChat;
    A3E_HC_ID = owner _player;
    if(A3E_HC_ID==0) exitwith {
         ["Getting HC ID failed!"] spawn a3e_fnc_debugChat;
    };
} else {
    [format["%1 joined the Game!",name _player]] spawn a3e_fnc_debugChat;

    A3E_Players = A3E_Players + [_player];
    publicVariable "A3E_Players";

    waituntil{sleep 0.1; count(A3E_StartPos)>0};
   // _player setpos [(A3E_StartPos select 0)+random 5.0-2.5,(A3E_StartPos select 1)+random 5.0-2.5,0];
   // _player setdir (random 360);
};
