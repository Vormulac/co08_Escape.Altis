//skill settings:
/*
//call with 
[_mygroupname, skill] spawn call EGG_EVO_skill;
e.g. [_guard,3] spawn call EGG_EVO_skill;
0 = random
1 = conscript
2 = irregular/rebel
3 = regular army
4 = elite infantry
5 = spec ops

*/

EGG_EVO_skill =
{
	_unit =  _this select 0;
	_skill = _this select 1;

	if (_skill==0) then {_skill=(round random 4)+1};
//	_baseskill = skillfactor; //set in init -can develop an initial base skill modifier for parameters use later

	switch (_skill) do
	{
		case 1: //conscript very low skill
		{
			{
				_x setSkill ["aimingspeed", 0.05];
				_x setSkill ["spotdistance", 0.05];
				_x setSkill ["aimingaccuracy", 0.02];
				_x setSkill ["aimingshake", 0.02];
				_x setSkill ["spottime", 0.1];
				_x setSkill ["spotdistance", 0.3];
				_x setSkill ["commanding", 0.3];
				_x setSkill ["general", 0.2];
			};
		};
		case 2: //rebels low skill
		{
			{
				_x setSkill ["aimingspeed", 0.1];
				_x setSkill ["spotdistance", 0.1];
				_x setSkill ["aimingaccuracy", 0.05];
				_x setSkill ["aimingshake", 0.05];
				_x setSkill ["spottime", 0.2];
				_x setSkill ["spotdistance", 0.4];
				_x setSkill ["commanding", 0.4];
				_x setSkill ["general", 0.3];
			};
		};
		case 3: //regular fair skill
		{
			{
				_x setSkill ["aimingspeed", 0.15];
				_x setSkill ["spotdistance", 0.15];
				_x setSkill ["aimingaccuracy", 0.1];
				_x setSkill ["aimingshake", 0.1];
				_x setSkill ["spottime", 0.3];
				_x setSkill ["spotdistance", 0.5];
				_x setSkill ["commanding", 0.5];
				_x setSkill ["general", 0.6];
			};
		};
		case 4: //elite soldiers medium skill
		{
			{
				_x setSkill ["aimingspeed", 0.2];
				_x setSkill ["spotdistance", 0.2];
				_x setSkill ["aimingaccuracy", 0.2];
				_x setSkill ["aimingshake", 0.2];
				_x setSkill ["spottime", 0.4];
				_x setSkill ["spotdistance", 0.6];
				_x setSkill ["commanding", 0.6];
				_x setSkill ["general", 0.7];
			};
		};
		case 5: // specops good skill
		{
			{
				_x setSkill ["aimingspeed", 0.3];
				_x setSkill ["spotdistance", 0.3];
				_x setSkill ["aimingaccuracy", 0.3];
				_x setSkill ["aimingshake", 0.3];
				_x setSkill ["spottime", 0.5];
				_x setSkill ["spotdistance", 0.8];
				_x setSkill ["commanding", 0.8];
				_x setSkill ["general", 0.9];
			};
		};
	};
};