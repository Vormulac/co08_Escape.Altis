private["_list","_targets"];
_list = [_this, 0, [], [[]]] call BIS_fnc_param;
{
  private["_player"];
  _player = _x;
  _nearEnemys = nearestObjects  [(position _x),["Man","Car","Air","Tank"],500];
  {
    if((side _x)==(A3E_Sides select A3E_PlayerSide)) exitwith {};
    private["_enemy"];
    _targets = _x nearTargets 500;  
    _detected = false;
    _enemy = _x;
    {
        if((_x select 2)==(A3E_Sides select A3E_PlayerSide)) exitwith {
            if(!(_enemy getVariable["A3E_isReporting",false])) then {
                _enemy setVariable["A3E_isReporting",true];
                [_enemy,(_x select 0)] spawn A3E_fnc_reportToHQ;
            };
        };
    } foreach _targets;
  } foreach _nearEnemys;
} foreach _list;