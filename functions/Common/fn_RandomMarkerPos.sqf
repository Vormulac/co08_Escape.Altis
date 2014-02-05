private["_marker","_size","_pos","_shape","_dir","_x_pos","_y_pos","_a","_b","_i"];
_marker = [_this, 0, "noMarker", [""]] call BIS_fnc_param;


_size = getMarkerSize _marker;
_pos = getMarkerPos _marker;
_dir = -(markerDir _marker);
_shape = markerShape _marker;
_x_pos = 0;
_y_pos = 0;
if(_shape == "ELLIPSE") then {
    _i = random 360;
    _a = (_size select 0)*(random 1.0)*cos(_i);
    _b = (_size select 1)*(random 1.0)*sin(_i);
    _x_pos = (_pos select 0)+(_a*cos(_dir)-_b*sin(_dir));
    _y_pos = (_pos select 1)+(_a*sin(_dir)+_b*cos(_dir));
} else {
    _a = 2*random(_size select 0)-(_size select 0);
    _b = 2*random(_size select 1)-(_size select 1);
    _x_pos = (_pos select 0)+(_a*cos(_dir)-_b*sin(_dir));
    _y_pos = (_pos select 1)+(_a*sin(_dir)+_b*cos(_dir));
};


[_x_pos,_y_pos,0];