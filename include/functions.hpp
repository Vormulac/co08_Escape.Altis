class A3E
{
	class Common
	{
            class RandomMarkerPos {};
            class RandomSpawnPos {};
            class KeyDown {};
            class RandomPatrolPos {};
            class Config {
                    file = "config.sqf";
                    preInit = 1; // 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
                    postInit = 0; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit"]
                    recompile = 1; // 1 to recompile the function upon mission start
            };
            class WriteParamBriefing {};
            class CountPlayers {};
            class GetPlayers {};
            class RotatePosition {};
            class findFlatArea{};
            class groupChat {};
            class getMarkerList {};
            class getBuildingsInMarker {};
            class calcMarkerArea {};
            class Hijack {};
	};
	class AI
	{
            class findSpawnPosBuilding;
            class spawnGarisson;
            class spawnGroup;
            class patrol;
            class move;
            class SetTaskState;
            class GetTaskState;
            //class createGroup;
           // class createUnit;
	};
	class Debug
	{
            class unit_debug_marker {};
            class drawMapLine {};
            class trackGroup {};
            class rptLog {};
            class debugChat {};
	};
	class Server
	{
            class initServer {
                    preInit = 0; // 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
                    postInit = 1; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit"]
                    recompile = 1; // 1 to recompile the function upon mission start
            };
            class parameterInit {}; 
            class createComCenters {};
            class createAmmoDepots {};
            class HCExec {};
            class parseBaseMarkers {}; //Obsolet
            class RunExtraction {};
            class AddHijackAction {};
            class CreateExtractionPoint {};

	};
        class Searchleader 
        {
            class initSearchLeader {};
            //class startSearchChopper {};
            class reportToHQ {};
            class enemyDetected {};
        };
        class Regions
        {
            class createRegions {};
            class activateRegion {};
            class deactivateRegion {};
            class initRegion {};
            class spawnAmbientInfantry {};
            class despawnAmbientInfantry {};
            class spawnPatrols {};
            class despawnPatrols {};
            class BuildRoadblock {};
        };
	class Templates
	{
            class BuildPrison {};
            class BuildComCenter {};
            class AmmoDepot {};
            class BasicRoadBlock {};         
	};
};
