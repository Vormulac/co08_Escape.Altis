private["_name","_list","_markername","_pos","_failed","_index"];

_name = [_this, 0, "NoName", [""]] call BIS_fnc_param;

_list = [];
_index = 0;
_failed = 0;
while{_failed<5} do {
    _markername = format["%1%2",_name,_index];
    _pos = getmarkerpos _markername;
    if((_pos select 0) == 0 && (_pos select 1) == 0 && (_pos select 2) == 0) then {
        _failed = _failed + 1;
    } else {
        _list set [count _list, _markername];
    };
    _index = _index +1;
};
_list;