// Revive_player.sqf
// norrin, October 2013
private ["_unit","_units","_name","_respawn","_conscious","_group","_leader","_c","_cc","_d","_doMove_time","_respawn_at_base","_dead",
	   "_busy","_unc_unit","_revive_array","_unit_type","_r_marker_side","_revive_units","_marker_pos",
	   "_mrkr_ex","_revives","_revives_remain","_max_respawns","_no_revives","_close_array","_unc_array","_mags","_goto_reviver","_close_unc",
	   "_smoke_rounds","_busy","_round","_bloggs_pos","_bloggs_offset","_sav_pos","_sav_dir","_doMove_time","_water","_body","_pos","_dir",
	   "_offset","_weapons","_magazines","_AI_dismount","_assItems","_allItems","_counter","_baseAllItems","_baseAssItems","_respawn_at_base_assItems",
	   "_respawn_at_base_allItems","_isLeader","_groupMembers","_ai_disabled"];
//Define variables
_unit 						= 	_this select 0;
_units 						= 	_this select 1;
while{call compile format["isNull %1",_unit]} do {sleep 0.1};
_name = call compile format["%1",_unit];
// Booleans
_respawn 					= false;
_conscious 					= false;
_respawn_at_base 			= false;
_dead 						= false;
NORRN_load_wounded_action 	= false;
r_drag_sqf					= false;
r_carry_sqf					= false;
all_dead_check 				= false;
_isLeader					= false;
_revived_position 			= false;
// Arrays
_revive_array 				= NORRN_revive_array;
_my_group					= [];
_revive_units 				= [];
_baseAllItems 				= [];
_near_Objects				= [];
_magazines					= [];
_weapons					= [];
_potRevivers				= [];
_assItems 					= assignedItems _name;
_allItems 					= [_name] call NORRN_cLoadOut;
// Numbers
_c 							= 0;
_cc 						= 0;
_ccc						= 0;
_cccc						= 0;
_ccccc						= 0;
_cccccc						= 0;
_ccccccc					= 0;
_counter					= 0;	
_d 							= 0;
_dd							= 0;
_ddd						= 0;
_dddd						= 0;
_ddddd						= 0;
_dir						= 0;
_doMove_time				= 0;
_NORRN_random 				= 0;
_bleed_damage				= 0;
_total_medpacks				= 0;
_total_bandages				= 0;
_blackout					= 0;
_bonus 						= 0;
_respawns 					= 0;
_respawn_chance 			= 0; 
_var 						= 0;
_reviveWait					= 0;
NORRN_max_slope 			= 0.78;
_damage						= 0;
//Strings
_bagType 					= "";
// Objects
if (_name == player) then {unconscious_body = objNull};
_unc_unit 					= objNull;
_goto_reviver				= objNull;
_goto_protect				= objNull;
_near_dragUnit				= objNull;
_near_loadUnit				= objNull;
_reviver 					= objNull;
GetSlopeObject				= objNull;
_bag						= objNull;
_mySaviour 					= objNull;
NORRN_REVIVE_cam			= objNull;
_group 						= group _name;
_unit_type 					= typeOf _name;
_leader 					= leader _group;
_groupID 					= groupID _group;
_groupMembers				= units _group;
_unconscious_markers 		= _revive_array select 4;
_call_out_function 			= _revive_array select 6;
_revive_timer 				= _revive_array select 7;
_goto_revive 				= _revive_array select 9;
_respawn_at_base_addWeapons	= _revive_array select 11;
_no_respawn_points  		= _revive_array select 12;
_Base_1 					= _revive_array select 13;
_Base_2 					= _revive_array select 14;
_Base_3 					= _revive_array select 15;
_Base_4 					= _revive_array select 16;
_can_revive 				= _revive_array select 18;
_can_revive_2 				= _revive_array select 19;
_can_be_revived 			= _revive_array select 20;
_can_be_revived_2 			= _revive_array select 21;
_medic_1					= _revive_array select 76;
_medic_2					= _revive_array select 77;
_enemy_side_1				= _revive_array select 23;
_enemy_side_2				= _revive_array select 24;
_revive_time_limit 			= _revive_array select 27;
_respawn_position 			= _revive_array select 28;
_goto_revive_distance 		= _revive_array select 33;
_respawn_at_base_assItems 	= _revive_array select 34;
_respawn_at_base_allItems	= _revive_array select 35;
_revive_damage 				= _revive_array select 37;
_max_respawns 				= _revive_array select 38;
_JIP_respawns				= _revive_array select 63;
_unc_drag 					= _revive_array select 39;
_AI_smoke					= _revive_array select 40;
_visible_timer				= _revive_array select 41;
_water_dialog				= _revive_array select 45;
_enemy_units_1				= _revive_array select 47;
_enemy_units_2				= _revive_array select 48;
_mobile_spawn 				= _revive_array select 51;
_QG_animation				= _revive_array select 54;
_load_wounded				= _revive_array select 61;
_caseVAC					= _revive_array select 64;
_chance_ofDeath				= _revive_array select 66;
_medpacks					= _revive_array select 80;
_bleeding 					= _revive_array select 82;
_medic_medpacks 			= _revive_array select 83;
_unit_medpacks 				= _revive_array select 84;
_medic_bandages 			= _revive_array select 85;		
_unit_bandages 				= _revive_array select 86;
_deadSpectator_cam			= _revive_array select 92;
_drop_weapons 				= _revive_array select 93;
_cadaver					= _revive_array select 94;
_reward_function 			= _revive_array select 96;
_revives_required 			= _revive_array select 97;
_team_kill_function 		= _revive_array select 98;
_no_team_kills 				= _revive_array select 99;
_ai_disabled 				= getNumber(missionConfigFile >> "AIdisabled"); //missionConfigFile instead of className
////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (_name == _leader) then {_isLeader = true};
////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (_QG_animation == 1) then {	
	r_unc_animation = "ainjppnemstpsnonwrfldnon";
}else{
	r_unc_animation = "AmovPpneMstpSnonWnonDnon_healed";
};
NORRN_r_commentsBrian = ["Brian_Im_hit","Brian_Im_bleeding","Brian_Medic","Brian_Bastards","Brian_Shit_Man_down","Brian_Oh_no","Brian_Fuck","Brian_Fuck_it","Brian_Shit","Brian_Need_help","Brian_A_little_help_here"];
_medVclArray = ["B_Truck_01_medical_F","Land_Hospital_main_F","Land_Hospital_side1_F","Land_Hospital_side2_F","Land_Medevac_house_V1_F","Land_Medevac_HQ_V1_F","B_Truck_01_medical_F"];
// Respawn marker name of unit
_r_marker_side = switch (side _name) do {
	case west: {"respawn_west"};
	case east: {"respawn_east"};
	case resistance: {"respawn_guerrila"};
	case civilian: {"respawn_civilian"};
};
NORRN_respawn_mrkr = markerPos _r_marker_side;
// Create revivable unit array
{call compile format ["if (!isNull %1) then {_revive_units = _revive_units + [%1]}", _x]} forEach _units;
// Create group array - moved and changed 060509
{if (!isNull _x && _x in _revive_units) then {_my_group = _my_group + [_x]}}forEach (units _group);
////////////////////////////////////////////////////////////////////////////////////////////////////////////
// New variables for damageEH - added for SP
if (NORRN_R_SP) then {
	[_name] call NORRN_addEH;
};
_name setVariable ["NORRN_totalDamage", 0, false]; //Moved out of if statement as needed for both SP & MP otherwise heal will not work
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
sleep 2;
// Added to respawn at base with original mission load-out - 260409
if (_respawn_at_base_addWeapons == 1 && count _respawn_at_base_assItems == 0 && count _respawn_at_base_allItems == 0) then {
	_baseAssItems = assignedItems _name;
	_baseAllItems = [_name] call NORRN_cLoadOut;	
}; 
// JIP respawns
if (_max_respawns != 1000 && (_JIP_respawns select 0) != 0) then {	
	if (time > (_JIP_respawns select 1)) then {
		_max_respawns = (_JIP_respawns select 0);
	};
};	
// Set variables if unit local
if (local _name) then {
	[_name] call NORRN_createGVars;
	//Define the number of medpacks
	if ( format ["%1", (_name getVariable "NORRN_medpacks")] == "<null>")         then {_name setVariable ["NORRN_medpacks", _unit_medpacks, true]};
	if (_name isKindOf _medic_1 || _name isKindOf _medic_2) then {_name setVariable ["NORRN_medpacks", _medic_medpacks, true]};
	_total_medpacks = _name getVariable "NORRN_medpacks";
	if ( format ["%1", (_name getVariable "NORRN_bandages")] == "<null>")         then {_name setVariable ["NORRN_bandages", _unit_bandages, true]};
	if (_name isKindOf _medic_1 || _name isKindOf _medic_2) then {_name setVariable ["NORRN_bandages", _medic_bandages, true]};
	_total_bandages = _name getVariable "NORRN_bandages";
	
	if (_name getVariable "NORRN_unconscious") then	{	
		_respawn = true; 
		_conscious = false;
		if (_name == player) then {unconscious_body =_name};
		_revived_position = true;
		_pos = getPos _name;
		_dir = getDir _name;
		_offset = _name distance _pos;
	};
	// Get and set existing unconscious markers
	{if (!isNull _x && _unconscious_markers == 1 && isplayer _name) then {	
		if (!isNull _x && (_x getVariable 'NORRN_unconscious')) then {
			_mrker_pos = getPos _x;
			_mrkr_ex = format ["%1 is down", _x];
			createMarkerlocal [_mrkr_ex, _mrker_pos];
			_mrkr_ex setMarkerColorlocal "ColorBlue";
			_mrkr_ex setMarkerTypelocal "hd_flag";
			_mrkr_ex setMarkerTextlocal (format ["%1 is down", name _x]);
			_mrkr_ex setMarkerSizelocal [0.4, 0.4];
		};
	}}forEach _revive_units;	
	// Prompt joining player the no revives remaining
	if (_max_respawns != 1000 && _name == player) then {
		_revives = _name getVariable "NORRN_lives_used"; 
		_revives_remain = _max_respawns - _revives;
		_no_revives = format ["Lives remaining: %1 out of %2", _revives_remain, _max_respawns];
		if (_name == player) then {hint _no_revives};
	};
	if (_max_respawns == 1000 && _name == player) then {
		hint "Unlimited lives";
	};
	// Initialise team kill function
	if (_team_kill_function == 1 && _max_respawns != 1000) then {_name addEventHandler ["killed", {_this execVM "revive_sqf\team_killer.sqf"}];};	
	// Chance of Death eventhandlers
	if ((_chance_ofDeath select 0) == 1 || (_chance_ofDeath select 1) == 1) then {	
		[_name] call NORRN_addCOD_EH;
	};	
	if (_name == player) then {
		GetSlopeObject = "HeliHEmpty" CreateVehicleLocal [0,0,0];
	};
};
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Revive Loop
while {true} do {	
	scopeName "Revive_01";
	if(!alive _name) then {_respawn = true; _conscious = false;_busy = 0};
	_name = call compile format ["%1", _name];
	while{!isNull _name && !local _name || isNull _name} do	{	
		if (!alive _name) then {
			//while{!alive (call compile format["%1",_unit])} do {sleep 0.1};
			while {!alive call compile format["%1",_unit]} do {sleep 0.1};
		};
		_name = call compile format ["%1", _unit];
		if (isnull _name) exitWith {breakOut "Revive_01"};
		if (_name getVariable "NORRN_unconscious") then {
			_respawn = true; 
			_conscious = false;
			if (!surfaceIsWater getPos _name) then {
				_revived_position = true;
			} else {
				_revived_position = false;
			};  	
		} else {
			_respawn = false; 
			_conscious = false;
			_c = 0;
			_d = 0;
			_respawn_at_base = false;
			_revived_position = false;
		};
		sleep 1.5;
	};
	// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	// Unit alive
	while {alive _name && !_respawn && !_conscious} do {	
		_name = call compile format ["%1", _name];
		_group = group _name;
		if (!isnull _name && !local _name || isnull _name) exitWith {};	
		//Added for SP
		if (NORRN_R_SP) then {	
			if (_name getVariable "NORRN_unconscious") then {_respawn = true; _conscious = false;_busy = 0;_name playMoveNow "deadState"};
			if (vehicle _name != _name) then {
				if (!alive (vehicle _name)) then  {_respawn = true; _conscious = false;_busy = 0;_name playMoveNow "deadState"};
			};
		};						
		//add revive action for when player gets in range of unconcious unit
		if (count (nearestObjects [_name, [_can_be_revived, _can_be_revived_2], 2]) > 1 && _name == player) then {	
			_nearest_unit = (nearestObjects [_name, [_can_be_revived, _can_be_revived_2], 2] select 1);	
			_c = [_nearest_unit,_can_revive,_can_revive_2,_medic_1,_medic_2,_can_be_revived,_can_be_revived_2,_c] call NORRN_addRevive;
		};
		if (count (nearestObjects [_name, [_can_be_revived, _can_be_revived_2], 2]) == 1 && _c == 1) then {
			_name removeAction Norrn_reviveAction;
			_c = 0;	
		};
		// Add drag action for when player gets in range of unconcious unit
		if (_unc_drag == 1 && _name == player) then {
			if (count (nearestObjects [_name, [_can_be_revived, _can_be_revived_2], 3]) > 1) then {	
				_cc = [_name,_can_be_revived, _can_be_revived_2,_cc] call NORRN_addDrag;
			};
			if (count (nearestObjects [_name, [_can_be_revived, _can_be_revived_2], 3]) == 1 && _cc == 1) then {
				_name removeAction Norrn_dragAction;
				_cc = 0;		
			};			
			// Carry on shoulder
			if (r_drag_sqf && _ccc == 0) then {	
				_near_carryUnit = (nearestObjects [_name, [_can_be_revived, _can_be_revived_2], 4] select 1);
				Norrn_carryAction = _name addAction ["Carry body", "revive_sqf\carry.sqf",_near_carryUnit, 0, false, true];
				_ccc = 1;
			};
			if (!r_drag_sqf && _ccc ==1) then {	
				_name removeAction Norrn_carryAction;
				_ccc = 0;
			};
			// Load unconscious unit onto vehicle
			if (_load_wounded == 1 && r_drag_sqf && count (nearestObjects [_name, ["Car","Tank","Helicopter","Plane"], 5]) > 0) then {
				_vcl = (nearestObjects [_name, ["Car","Tank","Helicopter","Plane"], 5]) select 0;
				_near_loadUnit = (nearestObjects [_name, [_can_be_revived, _can_be_revived_2], 4] select 1);			
				if (_dd == 0 && count (nearestObjects [_name, ["Car","Tank","Helicopter","Plane"], 5]) > 0 && alive _near_loadUnit) then {	
					_action = format ["Load Wounded on %1", (typeOf _vcl)];
					NORRN_loadWoundedAction = _name addAction [_action, "revive_sqf\load_wounded\Load_act.sqf",[_name, _vcl, _near_loadUnit], 0, true, true];
					_dd = 1;	
				};
			};
			if (_load_wounded == 1 && !r_drag_sqf && _dd == 1 || _load_wounded == 1 && _dd == 1 && count (nearestObjects [_name, ["Car","Tank","Helicopter","Plane"], 5]) == 0 || _load_wounded == 1 && _dd == 1 && NORRN_load_wounded_action || _load_wounded == 1 && _dd == 1 && !alive _near_loadUnit) then {
				_name removeAction NORRN_loadWoundedAction;
				NORRN_load_wounded_action = false;
				_dd = 0;
			};		
			// Remove unconscious unit from vehicle 
			if (_load_wounded == 1 && count (nearestObjects [_name, ["Car","Tank","Helicopter","Plane"], 5]) > 0) then {
				_ddd =  [_name,_ddd] call NORRN_addUnload;
			};	
			if (_load_wounded == 1 && _ddd == 1  && count (nearestObjects [_name, ["Car","Tank","Helicopter","Plane"], 5]) == 0) then {
				_name removeAction NORRN_pullOutAction;
				_ddd = 0;
			};			
		};
		// Force AI to heal if they are with 4 metres of an unconscious unit
		if (_dddd  == 1 && !(_name getVariable "NORRN_AI_help")) then {_dddd = 0};
		if (_ddddd == 1 && _reviveWait < time) then {_ddddd = 0};
		if (_goto_revive == 0 && !isplayer _name && (count (nearestObjects [_name, [_can_be_revived, _can_be_revived_2], 4])) > 1 ) then {
			[_name,_medpacks,_can_revive,_can_revive_2,_medic_1,_medic_2] call NORRN_addAIRevive;
		};	
		// AI run AI behaviour function
		if (_goto_revive == 1 && !isplayer _name) then {[_name,_units] call Norrn_AIBehaviour};		
		//Medic resupply script
		if (_medpacks == 1 || _bleeding == 1) then {
			if (count (nearestObjects [_name, _medVclArray, 5]) > 0) then {	
				if (_cccc == 0 && (_name getVariable "NORRN_medpacks") < _total_medpacks || _cccc == 0 && (_name getVariable "Norrn_bandages") < _total_bandages) then {
					if (_name == player) then {	
						NORRN_medSuppliesAction = _name addAction ["Take medical supplies", "revive_sqf\medic\supplies.sqf","", 0, false, true]; 
						_cccc = 1;
					} else {
						_name setVariable ["NORRN_medpacks", _unit_medpacks, true];
						if (_name isKindOf _medic_1 || _name isKindOf _medic_2) then {_name setVariable ["NORRN_medpacks", _medic_medpacks, true]};
						_name setVariable ["NORRN_bandages", _unit_bandages, true];
						if (_name isKindOf _medic_1 || _name isKindOf _medic_2) then {_name setVariable ["NORRN_bandages", _medic_bandages, true]};
					};
				};
			};
			if (_cccc == 1 && count (nearestObjects [_name, _medVclArray, 5]) == 0 && _name == player) then	{			
				_name removeAction NORRN_medSuppliesAction;
				_cccc = 0;
				NORRN_medic_sup = false;
			};
		};		
		// Start bleeding
		if (_bleeding == 1) then {
			if (NORRN_R_SP) then {
				_damage = _name getVariable "NORRN_totalDamage";
				if (_damage > 0.4 && !(_name getVariable "NORRN_stopBleed") && !(_name getVariable "NORRN_Bleed")) then {_name setVariable ["NORRN_Bleed", true, true]; _name setVariable ["NORRN_bleedDamage", _damage, true]; _ccccccc = 0;};   
				if (_damage > ((_name getVariable "NORRN_bleedDamage") + 0.2) && (_name getVariable "NORRN_stopBleed")) then {_name setVariable ["NORRN_Bleed", true, true]; _name setVariable ["NORRN_bleedDamage", _damage, true]; _ccccccc = 0;};
				if (_damage <= 0.4) then {_name setVariable ["NORRN_Bleed", false, true]; _name setVariable ["NORRN_stopBleed", false, true]};
			} else {
				
				if ((getdammage _name) > 0.4 && !(_name getVariable "NORRN_stopBleed") && !(_name getVariable "NORRN_Bleed")) then {_name setVariable ["NORRN_Bleed", true, true]; _name setVariable ["NORRN_bleedDamage", (getDammage _name), true]; _ccccccc = 0;};   
				if ((getdammage _name) > ((_name getVariable "NORRN_bleedDamage") + 0.2) && (_name getVariable "NORRN_stopBleed")) then {_name setVariable ["NORRN_Bleed", true, true]; _name setVariable ["NORRN_bleedDamage", (getDammage _name), true]; _ccccccc = 0;};
				if (getdammage _name <= 0.4) then {_name setVariable ["NORRN_Bleed", false, true]; _name setVariable ["NORRN_stopBleed", false, true]};
			};			
			if (_name == player) then {
				// Add Bandage wound action
				if ((_name getVariable "NORRN_Bleed") && (_name getVariable "Norrn_bandages") > 0 && _ccccc == 0) then	{
					NORRN_bandageAction = _name addAction ["Bandage wound", "revive_sqf\medic\bandage.sqf",_name, 0, false, true]; 
					_ccccc = 1;		
				};					
				if (!(_name getVariable "NORRN_Bleed") && _ccccc == 1 || (_name getVariable "Norrn_bandages") == 0 && _ccccc == 1) then {
					_name removeAction NORRN_bandageAction;
					_ccccc = 0; 		
				};
				// Add Bandage teamate action
				if (count (nearestObjects [_name, [_can_be_revived, _can_be_revived_2], 2]) > 1 && (_name getVariable "Norrn_bandages") > 0) then {	
					_bloggs = (nearestObjects [player, [_can_be_revived, _can_be_revived_2], 2] select 1);
				
					if (_cccccc == 0 && (_bloggs getVariable "NORRN_Bleed")) then {
						NORRN_bandageBuddyAction = _name addAction ["Bandage Teamate", "revive_sqf\medic\bandage_teammate.sqf",[_name, _bloggs], 0, false, true]; 
						_cccccc = 1;		
					};					
					if (!(_bloggs getVariable "NORRN_Bleed") && _cccccc == 1) then {
						_name removeAction NORRN_bandageBuddyAction;
						_cccccc = 0;
							
					};
				};
				if (count (nearestObjects [_name, [_can_be_revived, _can_be_revived_2], 2]) == 1 && _cccccc == 1 || (_name getVariable "Norrn_bandages") == 0 && _cccccc == 1) then	{
					_name removeAction NORRN_bandageBuddyAction;
					_cccccc = 0;		
				};	
			};		
			// Bleeding and blackout
			if (_name getVariable "NORRN_Bleed") then {
				if (_ccccccc == 0 && _name == player) then {
					titleCut ["You are bleeding","PLAIN DOWN", 0.2]
				} else {
					if (_ccccccc in [10,30,50,70,90]) then {	
						if (!NORRN_R_SP) then
						{
							if ((getdammage _name) > 0.4 && (getdammage _name) <= 0.7) then {_blackout = random 0.2};
							if ((getdammage _name) > 0.7) then {_blackout = random 0.4};
						} else {
							if (_damage > 0.4 && _damage <= 0.7) then {_blackout = random 0.2};
							if (_damage > 0.7) then {_blackout = random 0.4};
						};
						if (_name == player) then {
							titleText ["", "BLACK", 1];
							sleep _blackout;
							titleText ["", "BLACK IN", 1];
						};
					} else {
						if (_ccccccc == 100) then {	
							if (NORRN_R_SP) then {_damage_unit = _damage} else {_damage_unit = getdammage _name};
							_damage_unit = _damage_unit + 0.05;
							
							if (NORRN_R_SP) then {
								_name setVariable ["NORRN_totalDamage", _damage_unit, false];
							}else{
								_name setdammage _damage_unit;
							};
							_ccccccc = -1;
						};
					};
				};
				_ccccccc = _ccccccc + 1;		
			};
		};	
		// Teamkill function
		if ((_name getVariable "NORRN_teamkill_punish") == _no_team_kills && _team_kill_function == 1 && _max_respawns != 1000) then {	
			if (NORRNCustomExec2 != "") then {call compile NORRNCustomExec2};
			_no_respawns = (_name getVariable "NORRN_lives_used") + 1;
			_respawns_left = _max_respawns - _no_respawns;
			_no_left = "You have lost a life for excessive team killing.";
			if (local _name) then {hint _no_left};
			_name setVariable ["NORRN_lives_used", _no_respawns, false]; 
			_name setVariable ["NORRN_teamkill_punish", 0, true];
		}; 		
		// Revive/reward function
		if ((_name getVariable "Norrn_bonus_life") >= _revives_required && _reward_function == 1 && _max_respawns != 1000) then {	
			_no_respawns = (_name getVariable "Norrn_lives_used") - 1;
			_respawns_left = _max_respawns - _no_respawns;
			if (_name == player) then {hint "You have received a bonus life for teamplay."};
			_name setVariable ["Norrn_lives_used", _no_respawns, true]; 
			_name setVariable ["Norrn_bonus_life", 0, true];
			_bonus = 0;
		};
		// Prompt the number of revives required for next bonus
		if (_reward_function == 1 && _max_respawns != 1000 && _bonus != (_name getVariable "Norrn_life_bonus") && _name == player) then {
			_bonus = _name getVariable "Norrn_life_bonus";
			_revives_till_bonus = _revives_required - _bonus;
			_hint = format ["Revives required for next bonus: %1", _revives_till_bonus];
			hint _hint;
		};
		if (_counter == 60) then
		{
			_assItems = assignedItems _name;
			_allItems = [_name] call NORRN_cLoadOut;
			_counter = 0;
		};
		_counter = _counter + 1;
		sleep 0.5;
	};
	if (NORRN_R_SP && !alive _name) then {_dead = true; _pos = getPos _name};
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
// Unit falls unconscious	
	if (_respawn && !_conscious && !_dead) then {	
		scopeName "Revive_02";
		_body = _name;
		_water = false;
		if (_body == player) then {titleText ["","BLACK FADED",10]};
		_body setVariable ["NORRN_stopBleed", false, true];
		_body setVariable ["NORRN_Bleed", false, true];
		_ccccc = 0; //reset the bandage variable		
		// Set _name rating as zero if less than zero - 180710 - SP
		if (NORRN_R_SP && rating _name < 0) then {
			_rating = rating _name;
			_name addRating -(_rating);
		};			
		//  Get body's current position and load-out 
		_dir = (getDir _body) + 0.1;
		_offset = _body distance (getPos _body);
		_pos = [((getPos _body) select 0),((getPos _body) select 1), _offset];	
		_body setVariable ["NORRN_uncPos", _pos, true];		
		//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		//Chance of death
		if ((_chance_ofDeath select 0) == 1 || (_chance_ofDeath select 1) == 1) then {
			_respawns = _respawns + 1;	
			if ((_body getVariable "NORRN_kh_killer") == _body) then {
				if ((_chance_ofDeath select 0) == 1) then {
					_respawn_chance = 500; 
				};
			}else{
				//determine where player hit and chance of survival	
				if ((_chance_ofDeath select 0) == 1) then {_respawn_chance = [_body, _respawns] call Norrn_respawn_Chance;};
				if ((_chance_ofDeath select 1) == 1) then {_revive_time_limit   = [_body, _respawns] call Norrn_respawn_Time;};
			};
			if (_respawns == 6) then {_dead = true};
			_random_chance = ceil (random 100);	
			if ((_chance_ofDeath select 0) == 1 && _random_chance > _respawn_chance) then {_dead = true};
		};
		//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		// Code added to prevent group leader running code on player leaving server if AI disabled
		if (_AI_disabled == 0) then {
			if (format["%1", name _body] == "Error: No unit") exitWith {
				_respawn = false;
				_conscious = false;
				breakout "Revive_01";
			};
		};		
		//remove all actions - poosibly give unconscious units a different variable - will remove some checks 
		if (_body == player) then {	
			if (_c  == 1) then {_body removeAction Norrn_reviveAction};
			if (_cc == 1) then {_body removeAction Norrn_dragAction};
			if (_dd == 1) then {_body removeAction NORRN_loadWoundedAction};
		};
		// sickboy's code modified by _xeno 
		if (!isNil "T_Server" && !isNil "T_Client") then {
			if (!T_Server && T_Client && _body == player) then {disableUserInput true};
		} else {
			if (_body == player) then {disableUserInput true;}; 
		};
		if (_revived_position) then {
			while{!alive call compile format["%1",_unit]} do {sleep 0.1};
			_body = call compile format["%1",_unit];
		};
		if (player == _name) then {NORRN_r_time_expire = false};
		// If respawn limit has been reached, define unit as dead
		if (local _name || NORRN_R_SP && !alive _name) then {if (_max_respawns  <= (_name getVariable "NORRN_lives_used") || NORRN_R_SP && !alive _name) then {_dead = true}};		
		// Vehicle eject fix
		if (vehicle _body != _body) then {_vcl_pos = getpos vehicle _body; _body setPos [((_vcl_pos select 0)- 5), (_vcl_pos select 1), 0]};		
		// Anti-water code
		if (surfaceIsWater getPos _body && !_dead && _offset < 10) then	{_body = [_body, _unit,_pos] call Norrn_WaterFix};
		_pos = (_body getVariable "NORRN_uncPos");		
		// Anti-slope code
		_slope = [_pos, 1] call GetTerrainSlope; //1209010 changed height/x value in function original value  was 8 now 64 - need to test
		if (_slope >= NORRN_max_slope) then {[_pos, _slope, _body] call Norrn_SlopeFix};		
		if (_body == player) then {enableRadio false};		
		_respawn = true;
		_water = false;		
		while {!alive (call compile format["%1",_unit])} do {sleep 0.1};
		_name = call compile format["%1",_unit];
		if (_isLeader) then {_leader = _name};
		// Reset variables 
		[_name,_dir,_pos] call NORRN_resetVars;
		// If player is down start camera - moved code 260409
		if (_name  == player) then {titlecut [" ","BLACK FADED",1]};
		if (_name == player && !_dead) then {	
			_bee = "ButterFly_random" createVehicle [_pos select 0, _pos select 1, (_pos select 2) + 1];
			[_bee, _pos] spawn NORRN_UNC_CAM;
		};	
		// Create marker at scene of unconscious player - moved 060509 as a fix for ArmA report - WARNING: Function 'name' - So-and-so is dead
		if (_unconscious_markers == 1 && !surfaceIsWater _pos  && !_dead && local _name) then {	
			_mrkr = format["%1 is down", _name]; 
			createMarker [_mrkr, _pos];
			_mrkr setMarkerColor "ColorBlue";
			_mrkr setMarkerType "hd_flag";
			_mrkr setMarkerText format["%1 is down", name _name]; 
			_mrkr setMarkerSize [0.4, 0.4];
		};
		// Give player weapon and mag loadout they had prior to dying
		if (!NORRN_R_SP) then {	
			[_name,_assItems,_allItems] call NORRN_rLoadOut;
		};	
		// Reset the wound variables - added for SP
		if (NORRN_R_SP) then {
			[_name] call NORRN_resetSPVars;
		};		
		if (!NORRN_R_SP && !alive _body) then {deleteVehicle _body};						
		if (local _name) then {disableUserInput false};
		if (_name == player) then {unconscious_body = _name};
		_name playMoveNow "AinjPpneMstpSnonWnonDnon";		
		// Disable AI
		_name stop true;
		if (_name == leader (group _name)) then {	
			{if (currentCommand _x == "") then {_x doMove getPos _x;} }forEach (units group _name); 
		};	
		_conscious = true;
	};	
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
// While unconscious
	if (alive _name && _respawn && _conscious && !_respawn_at_base && !_dead) then {	
		_name = call compile format["%1",_unit];
		_revive_time = time + _revive_time_limit;		
		//Start revive timer
		if(_revive_timer == 1 && _visible_timer == 1 && _name == player) then {[]spawn NORRN_uncTimer};
		sleep 0.01;				
		while {_revive_timer == 0 && alive _name && _respawn && _conscious && !_respawn_at_base && !_dead ||
			 _revive_timer == 1 && alive _name && _respawn && _conscious && !_respawn_at_base && !_dead && time < _revive_time} do {	
			if(!local _name) exitWith {}; //270409				
			if (_name getVariable "Norrn_respawn_at_base") then {_respawn_at_base = true};			
			// Call-out while unconscious
			if (_d == 0 && !all_dead_check) then {_NORRN_random = [_name] call Norrn_CallOut};
			_d = _d + 1;
			if (_d == _NORRN_random) then {_d = 0};  
			// Loll about timer
			if (!(_name getVariable "NORRN_unit_dragged")) then {			
				if (_d == 22) then {	
					_name playMoveNow "AinjPpneMstpSnonWnonDnon";
				};
			};
			sleep 0.3;		
			// Reviver is within the revive radius and is reviving - unit revived or unconscious unit is taken to a CASEVAC facilty for treatement 
			if (alive _name && _respawn && _conscious && !_respawn_at_base && count (nearestObjects [_name, [_can_be_revived, _can_be_revived_2], 4.5]) > 1 ||
				count _caseVAC > 0) then {	
				if (_name getVariable "Norrn_respawn_at_base") then {_respawn_at_base = true};			
				// Added for CASEvac - modified 090809 - body must be dragged to CASEVAC, if vehicle  - vehicle must be stationary with engine off 
				_caseVAC_check = false;
				{if (count (nearestObjects [_name, [_x], 5]) > 0 && (_caseVAC select 0) == 1 && (_name getVariable "NORRN_unit_dragged")) then {	
					_MASHvcl = (nearestObjects [_name, [_x], 5]) select 0; 
					if (_MASHvcl isKindOf "LandVehicle" || _MASHvcl isKindOf "Air") then {	
						if (speed _MASHvcl == 0 && _name in (crew _MASHvcl)) then {
							_caseVAC_check = true;
						};
					} else {
						_caseVAC_check = true
					};
				};} forEach (_caseVAC select 1);			
				_near_Objects = nearestObjects [_name, [_can_revive, _can_revive_2, _medic_1, _medic_2], 4.5];
				//Added for multiple unit revive bug v0.50
				_near_Objects = _near_Objects - [_name];
				_potRevivers = [];
				_nearUncMates = [];
				_mySaviour = objNull;
				_e = 0;
				{if (alive _x) then {
						if (_QG_animation == 1 && isplayer _x && animationState _x == "ainvpknlmstpsnonwnondr_medic0" || 
							_QG_animation == 1 && !isplayer _x && animationState _x == "AinvPknlMstpSlayWrflDnon_medic" || 
							_QG_animation == 0 && animationState _x == "AinvPknlMstpSlayWrflDnon_medic") then {_potRevivers = _potRevivers + [_x]};
						if  (_x getVariable "Norrn_unconscious")  then {_nearUncMates = _nearUncMates + [_x]};
				 };} forEach _near_Objects;
				if (count _potRevivers > 0) then {	
					_mySaviour = (_potRevivers select 0);
					_tryAgain = false;
					if (count _nearUncMates > 0) then {
						{if ((_name distance _mySaviour) > (_x distance _mySaviour)) then {_tryAgain = true}} forEach _nearUncMates;
					};
					if (!_tryAgain && !(_mySaviour getVariable "NORRN_heyImBusy")) then {_e = 1};
				};
				if (_e == 1 || _caseVAC_check) then {	
					_reviver = objNull;
					if (_e == 1) then {
						_reviver = _mySaviour;
						_reviver setVariable ["NORRN_heyImBusy", true, true];
						// Create var for reviver's name
						if (local _name) then {
							_revive_message  = format ["%1 has been revived by %2", name _name, name _reviver];
							call compile format ["reviver_%1 = '%2';publicVariable 'reviver_%1';", _name, _revive_message];	
						};
					};
					if (_caseVAC_check) then {	
						if (vehicle _name != _name) then {_name action ["EJECT", (vehicle _name)]; sleep 1};
						_name playMoveNow "AmovPpneMstpSnonWnonDnon_healed";
					};				
					// roll unit unconscious onto belly and start the heal animation - if altAnim unc enabled
					if (isplayer _reviver && _QG_animation == 1) then {sleep 8;};
					_name playMoveNow "AmovPpneMstpSnonWnonDnon_healed";							
					// Return player to position where they were shot
					if (_name == player) then {titletext [" ","BLACK", 3]};	
					if (NORRN_R_SP) then {
						_name setVariable ["NORRN_totalDamage", _revive_damage, false]
					} else {
						_name setdamage _revive_damage;
					};
					// allowDamage
					norrnRpvEH = [NORRN_rAllowDamage,[_name]];
					publicVariable "norrnRpvEH";
					[[_name]] call NORRN_rAllowDamage;
					_name playMoveNow "AmovPpneMstpSnonWnonDnon_healed"; 				
					// User's code
					if (NORRNCustomExec1 != "") then {call compile NORRNCustomExec1};									
					// Reset unconscious variable
					_name setVariable ["NORRN_unconscious", false, true];
					_name setVariable ["NORRN_AIunconscious", false, true];						
					// Re-enable AI and radio
					_name stop false;
					enableRadio true;					
					if (_unconscious_markers == 1) then {deleteMarker format["%1 is down", _name]};					
					// Increment respawn counter
					if (local _name && _max_respawns != 1000) then {[_name, _max_respawns]call Norrn_LivesRemain};
					sleep 1;			
					// Prompt reviver's name
					if (local _name && !isNull _reviver) then {	
						//publicEH
						norrnRName = _name;
						publicVariable "norrnRName";
					};				
					// BLACK IN and revive message
					if (_name == player) then {	
						if (!isNull _reviver) then {	
							_revived_by = format ["\nYou have been revived by %1", name _reviver];
							titletext [_revived_by,"BLACK IN",2];
							titleCut ["","PLAIN", 0.1];
						} else {
							titletext ["\nYou have been revived by CASEVAC","BLACK IN",2];
							titleCut ["","PLAIN", 0.1];
						};
					};				
					// Fix for leader
					[_leader, _group, _groupID,_groupMembers] call Norrn_LeaderFix;
					_name doMove getPos _name;										
					// Reset variables
					_name setVariable ["NORRN_AIReviver", objNull, true];
					_respawn = false;
					_conscious = false;
					if (_AI_smoke == 1) then {_name setVariable ["NORRN_AISmoke", [false,""], true]};
					_c = 0;
					_d = 0;
					sleep 2;
				};
			};
		};
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
// Respawn timer elapses
		if (_revive_timer == 1 && alive _name && _respawn && _conscious && !_respawn_at_base && time >= _revive_time && !_dead) then {	
			// Unit respawns at mission start
			if (_respawn_position == 0) then {	
				if (local _name && isplayer _name) then {titleText ["Revive timer has been exceeded. Respawning at base", "PLAIN", 0.3]};
				sleep 2;
				[1, _name] execVM "revive_sqf\respawn_at_base.sqf"; 
				_respawn_at_base = true
			}; 
			// Unit respawns at closest enemy free base
			if (_respawn_position == 1) then {_respawn_at_base = [_name, _pos] call Norrn_RespawnPos1};
			// Unit respawns at chosen location if player
			if (_respawn_position == 2 &&  isplayer _name) then {_respawn_at_base = [_name] call Norrn_RespawnPos2};								
			// Unit respawns closest to leader if not player
			if (_respawn_position == 2 && !isplayer _name) then {_respawn_at_base = [_name, _pos] call Norrn_RespawnPos2AI};
			// Player is dead if timer elapses
			if (_respawn_position == 3) then {_dead = true};	
		};
	};
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Respawn at base
	if (alive _name && _respawn && _conscious && _respawn_at_base && !_dead) then {	
		titleCut["","plain down", 0.1];
		if (count(_name getVariable "NORRN_uncPos") != 0) then {[_name,_assItems,_allItems,_dir] spawn Norrn_createBody};	
		_name enableAI "ANIM";
		_name playMoveNow "AmovPpneMstpSnonWnonDnon_healed";
		// allowDamage
		norrnRpvEH = [NORRN_rAllowDamage,[_name]];
		publicVariable "norrnRpvEH";
		[[_name]] call NORRN_rAllowDamage;		
		// Reset unconscious variable
		_name setVariable ["NORRN_unconscious", false, true];
		_name setVariable ["NORRN_AIunconscious", false, true];		
		if (_unconscious_markers == 1) then {deleteMarker format["%1 is down", _name]};
		enableRadio true;
		_name selectweapon primaryweapon _name;
		// Add respawn at base weapons if this option is being used
		if (_respawn_at_base_addWeapons == 1) then {	
			// Added code for respawning at base with original mission load-out - 260409
			if (count _respawn_at_base_assItems == 0 && count _respawn_at_base_allItems == 0) then {
				[_name,_baseAssItems,_baseAllItems] call NORRN_rLoadOut;
			} else {
				[_name, _respawn_at_base_allItems,_respawn_at_base_assItems] call NORRN_rLoadOut;
			};
		};				
		// Re-enable AI
		_name stop false;
		// Kill unconscious body
		if (!isNull _name) then {
			if (_drop_weapons == 1|| _cadaver == 0) then {	
				sleep 2;
				call compile format ["_body = norrn_dead_%1", _name];
				[_body] spawn NORRN_DropWeapons;
			};
		};				
		// Increment respawn counter
		if (local _name && _max_respawns != 1000) then {[_name, _max_respawns]call Norrn_LivesRemain};
		// Fix for leader
		[_leader, _group, _groupID,_groupMembers] call Norrn_LeaderFix;
		_name doMove getPos _name;		
		// Reset medical supplies
		if (_medpacks == 1) then {
			_name setVariable ["NORRN_medpacks", _unit_medpacks, true];
			if (_name isKindOf _medic_1 || _name isKindOf _medic_2) then {_name setVariable ["NORRN_medpacks", _medic_medpacks, true]};
		};
		if (_bleeding == 1) then {
			_name setVariable ["NORRN_bandages", _unit_bandages, true];
			if (_name isKindOf _medic_1 || _name isKindOf _medic_2) then {_name setVariable ["NORRN_bandages", _medic_bandages, true]};
		};	
		// Reset variables
		if (_name == player) then {all_dead_check = false};		
		_name setVariable ["NORRN_AIReviver", objNull, true];
		if (_AI_smoke == 1) then {_name setVariable ["NORRN_AISmoke", [false,""], true]};
		_name setVariable ["NORRN_respawn_at_base", false, true];
		if (NORRN_R_SP) then {
			_name setVariable ["NORRN_stopBleed", false, true];
			_name setVariable ["NORRN_Bleed", false, true];
		};
		_respawn_at_base = false;
		_respawn = false;
		_conscious = false;
		_c = 0;
		_d = 0;
		if (player == _name) then {NORRN_r_time_expire = false};
		sleep 2;
	};
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Dead - all lives expended	
	if (_dead) exitWith { 	
		if (local _name) then {	
			if (count(_name getVariable "NORRN_uncPos") != 0) then {[_name,_assItems,_allItems,_dir] spawn Norrn_createBody};
			[_name] join grpNull;
			_name setVariable ["NORRN_unconscious", false, true];
			_name setVariable ["NORRN_AIunconscious", false, true];
			_name setVariable ["NORRN_life_bonus", 0, true];
			_name setDammage 1;
			_name setVariable ["NORRN_dead", true, true];
			if (_name == player) then {	
				closedialog 0;
				titleText ["You are dead", "BLACK FADED", 3]; 
				sleep 2;
				if(_deadSpectator_cam == 1) then {	
					_bee = "ButterFly_random" createVehicle [_pos select 0, _pos select 1, (_pos select 2) + 1];
					[_bee, _pos] execVM "revive_sqf\cam_dead.sqf";
					sleep 0.1;
				} else {
				titleText ["Player is dead. Please press escape, return to the unit selection menu and choose another playable unit", "BLACK FADED", 10];
				};
			};
			_name setPos getMarkerPos "Boot_hill";
			_name setCaptive true;
		};
		sleep 5;
		_dead = false;
		_respawn = false;
		_conscious = false;
	};
	sleep 0.1;
};
