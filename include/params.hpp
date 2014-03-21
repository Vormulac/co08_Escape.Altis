class Params
{
    class EnemySkill
    {
	//paramsArray[0]
            title = "Enemy Skill";
            values[] = {0, 1, 2, 3, 4, 5, 6};
            texts[] = {"Cadet", "Easy", "Normal", "Hard", "Extreme", "Manual Settings (below)", "Use this setting for AI mods such as Zeus AI"};
            default = 2;
	};
	class EnemyFrequency
	{
		// paramsArray[1]
		title="Enemy Frequency";
		values[]={1,2,3};
		texts[]={"Few (suitable for 1-3 players)", "Some (suitable for 4-6 players)", "A lot (suitable for 7-8 players)"};
		default = 3;
	};
	class TimeOfDay	
	{	
		// paramsArray[2]
	      	title="Time Of Day";
		values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24};
		texts[]={"00:00","01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00","Random"};
		default = 24;
	};
	class initialWeather {
          title = "Starting Weather";
          values[] = {0,1,2,3,4};
          texts[] = {"Clear","Overcast","Rain","Fog","Random"};
          default = 4;
       };
	class Grass
	{	
		// paramsArray[4]
		title="Grass";
		values[]={50,25,12,6,2};
		texts[]={"No Grass", "Proximity", "Normal", "Far", "Very Far"};
		default = 12;
	};
	class EnemySpawnDistance
	{
		// paramsArray[5]
		title="Enemy Spawn Distance";
		values[]={800,1050,1300};
		texts[]={"Short (better performance)", "Medium", "Far (for good rigs)"};
		default = 1300;
	};
	class VillageSpawnCount
	{
		//paramsArray[6]
		title="Village Patrol Spawns";
		values[]={80000, 40000, 10000};
		texts[]={"Low (better performance)", "Medium", "High (Very demanding)"};
		default = 40000;
	};
	class ExtractionSelection
	{
		//paramsArray[7]
		title="Extraction Points";
		values[]={0, 1, 2};
		texts[]={"Random", "Close", "Far"};
		default = 1;
	};
	class AccuracySelection
	{
		//paramsArray[8]
		title="AI Accuracy";
		values[]={0, .05, .1, .15, .2, .25, .3, .35, .4, .45, .5, .55, .6, .65, .7, .75, .8, .85, .9, .95, 1};
		texts[]={"0", ".05", ".1", ".15", ".2", ".25", ".3", ".35", ".4", ".45", ".5", ".55", ".6", ".65", ".7", ".75", ".8", ".85", ".9", ".95", "1"};
		default = 1;
	};
	class AimShakeSelection
	{
		//paramsArray[9]
		title="AI Aming Shake";
		values[]={0, .05, .1, .15, .2, .25, .3, .35, .4, .45, .5, .55, .6, .65, .7, .75, .8, .85, .9, .95, 1};
		texts[]={"0", ".05", ".1", ".15", ".2", ".25", ".3", ".35", ".4", ".45", ".5", ".55", ".6", ".65", ".7", ".75", ".8", ".85", ".9", ".95", "1"};
		default = 1;
	};
	class AimSpeedSelection
	{
		//paramsArray[10]
		title="AI Aiming Speed";
		values[]={0, .05, .1, .15, .2, .25, .3, .35, .4, .45, .5, .55, .6, .65, .7, .75, .8, .85, .9, .95, 1};
		texts[]={"0", ".05", ".1", ".15", ".2", ".25", ".3", ".35", ".4", ".45", ".5", ".55", ".6", ".65", ".7", ".75", ".8", ".85", ".9", ".95", "1"};
		default = 1;
	};
	class EnduranceSelection
	{
		//paramsArray[11]
		title="AI Endurance";
		values[]={0, .05, .1, .15, .2, .25, .3, .35, .4, .45, .5, .55, .6, .65, .7, .75, .8, .85, .9, .95, 1};
		texts[]={"0", ".05", ".1", ".15", ".2", ".25", ".3", ".35", ".4", ".45", ".5", ".55", ".6", ".65", ".7", ".75", ".8", ".85", ".9", ".95", "1"};
		default = 1;
	};
	class SpotDistanceSelection
	{
		//paramsArray[12]
		title="AI Spot Distance";
		values[]={0, .05, .1, .15, .2, .25, .3, .35, .4, .45, .5, .55, .6, .65, .7, .75, .8, .85, .9, .95, 1};
		texts[]={"0", ".05", ".1", ".15", ".2", ".25", ".3", ".35", ".4", ".45", ".5", ".55", ".6", ".65", ".7", ".75", ".8", ".85", ".9", ".95", "1"};
		default = 1;
	};
	class spotTimeSelection
	{
		//paramsArray[13]
		title="AI Spot Time";
		values[]={0, .05, .1, .15, .2, .25, .3, .35, .4, .45, .5, .55, .6, .65, .7, .75, .8, .85, .9, .95, 1};
		texts[]={"0", ".05", ".1", ".15", ".2", ".25", ".3", ".35", ".4", ".45", ".5", ".55", ".6", ".65", ".7", ".75", ".8", ".85", ".9", ".95", "1"};
		default = 1;
	};
	class CourageSelection
	{
		//paramsArray[14]
		title="AI Courage";
		values[]={0, .05, .1, .15, .2, .25, .3, .35, .4, .45, .5, .55, .6, .65, .7, .75, .8, .85, .9, .95, 1};
		texts[]={"0", ".05", ".1", ".15", ".2", ".25", ".3", ".35", ".4", ".45", ".5", ".55", ".6", ".65", ".7", ".75", ".8", ".85", ".9", ".95", "1"};
		default = 1;
	};
	class ReloadSpeedSelection
	{
		//paramsArray[15]
		title="AI Reload Speed";
		values[]={0, .05, .1, .15, .2, .25, .3, .35, .4, .45, .5, .55, .6, .65, .7, .75, .8, .85, .9, .95, 1};
		texts[]={"0", ".05", ".1", ".15", ".2", ".25", ".3", ".35", ".4", ".45", ".5", ".55", ".6", ".65", ".7", ".75", ".8", ".85", ".9", ".95", "1"};
		default = 1;
	};
	class CommandingSelection
	{
		//paramsArray[16]
		title="AI Commanding";
		values[]={0, .05, .1, .15, .2, .25, .3, .35, .4, .45, .5, .55, .6, .65, .7, .75, .8, .85, .9, .95, 1};
		texts[]={"0", ".05", ".1", ".15", ".2", ".25", ".3", ".35", ".4", ".45", ".5", ".55", ".6", ".65", ".7", ".75", ".8", ".85", ".9", ".95", "1"};
		default = 1;
	};
	class GeneralSelection
	{
		//paramsArray[17]
		title="AI General";
		values[]={0, .05, .1, .15, .2, .25, .3, .35, .4, .45, .5, .55, .6, .65, .7, .75, .8, .85, .9, .95, 1};
		texts[]={"0", ".05", ".1", ".15", ".2", ".25", ".3", ".35", ".4", ".45", ".5", ".55", ".6", ".65", ".7", ".75", ".8", ".85", ".9", ".95", "1"};
		default = 1;
	};
};