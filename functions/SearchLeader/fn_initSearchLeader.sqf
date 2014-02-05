
_diagonal = [(getpos NorthEast select 0)-(getpos SouthWest select 0),(getpos NorthEast select 1)-(getpos SouthWest select 1)];
_center = [(getpos SouthWest select 0)+(_diagonal select 0)/2,(getpos SouthWest select 1)+(_diagonal select 1)/2];
_trigger = createTrigger["EmptyDetector", _center];
_trigger setTriggerArea[(_diagonal select 0)/2, (_diagonal select 1)/2, 0, true];
_trigger setTriggerActivation["WEST", "EAST D", true];
_trigger setTriggerStatements["this", "[thislist] spawn a3e_fnc_enemyDetected;", ""];

_trigger2 = createTrigger["EmptyDetector", _center];
_trigger2 setTriggerArea[(_diagonal select 0)/2, (_diagonal select 1)/2, 0, true];
_trigger2 setTriggerActivation["WEST", "GUER D", true];
_trigger2 setTriggerStatements["this", "[thislist] spawn a3e_fnc_enemyDetected;", ""];
