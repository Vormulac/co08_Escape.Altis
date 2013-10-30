// createBody.sqf
// norrin, APRIL 2013
_name 			= _this select 0;
_assItems		= _this select 1;
_allItems		= _this select 2;
_dir			= _this select 3;
_pos 			= _name getVariable "NORRN_uncPos";
_unit_type 		= typeOf _name;
call compile format ["norrn_dead_%1 = objNull", _name];

call compile format ["_unit_type createUnit [(getMarkerPos 'Boot_hill'), group server, 'this setcaptive true;
										    this switchMove ''DeadState'';
											this disableAI ''ANIM'';
											this setVehicleVarName ''norrn_dead_%1'';											    
											norrn_dead_%1 = this;']", _name];
while {isNull (call compile format ["norrn_dead_%1", _name])} do {sleep 0.1};											
_deadUnit = call compile format ["norrn_dead_%1", _name];
[_name,_assItems,_allItems ] call NORRN_rLoadOut;
_deadUnit setDir _dir;
_deadUnit setPos _pos;
sleep 0.2;
_deadUnit setdamage 1.0;
