class CfgFunctions
{
	class A3E
	{
		class Common
		{
			class addHijackAction {};
			class addHealAtMedicalBuildingAction {};
			class RandomMarkerPos {};
			class GetSideColor {};
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
		};
		class AI
		{
			class RandomPatrolRoute {};
			class EngageReportedGroup {};
			class InCombat {};
			class Move {};
			class Search {};
			class Patrol {};
			class Flee {};
			class FireArtillery {};
			class OrderSearch {};
			class SetTaskState {};
			class GetTaskState {};
			class AquaticPatrol {};
		};
		class Debug
		{
			class unit_debug_marker {};
			class drawMapLine {};
			class trackGroup {};
                        class rptLog {};
                        class groupChat {};
		};
		class Server
		{
                    class watchKnownPosition {};
                    class AmbientInfantry {}; 
                    class initServer {
                        preInit = 0; // 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
                        postInit = 1; // 1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit"]
                        recompile = 1; // 1 to recompile the function upon mission start
                    };
                    class parameterInit {}; 
                    class createComCenters {};
                    class createAmmoDepots {};

		};
                class Templates
                {
                    class BuildPrison {};
                    class BuildComCenter {};
                    class AmmoDepot {};
                };
	};
	class drn
	{
		class DRN
		{
			class AmbientInfantry {}; 
			class MoveInfantryGroup {}; 
			class MonitorEmptyGroups {};
			class PopulateLocation {};
			class DepopulateLocation {};
			class InitGuardedLocations {};
			class DynamicWeatherEffects {};
			class InsertionTruck {};
			class MilitaryTraffic {};
			class MoveVehicle {};
			class MotorizedSearchGroup {};
			class RoadBlocks {};	
			class SearchChopper {};
			class SearchGroup {};
			class InitVillageMarkers{};
			class PopulateVillage {};
			class DepopulateVillage {};
			class InitVillagePatrols {};
			class InitAquaticPatrols {};
			class PopulateAquaticPatrol {};
			class DepopulateAquaticPatrol {};
			class InitAquaticPatrolMarkers {};
		};
	};
	class AT
	{
		class Revive
		{
			class debug {};
			class handleDamage {};
			class revive {};
			class addReviveAction {};
			class removeReviveAction {};
			class initRevive {};
			class setUnconscious {};
			class setConscious {};
			class playMove {};
			class switchMove {};
			class animDone {};
			class animChanged {};
			class respawn {};
			class serverCheck {};
                        class startCrawling{};
                        class washAshore{};
                        class killed{};
                        class consciousHandler {};
			class copyGear{};
                        class handleHeal{};
                        class ragdoll{};
                        class hide{};
                        class unhide{};
		};
	};
};