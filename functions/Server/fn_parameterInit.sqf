//Load default params for SP && Editor
if (isNil "paramsArray") then
{
    private ["_c", "_i", "_paramName"];
    paramsArray=[];

    if (isClass (missionConfigFile/"Params")) then
    {
        _c=count (missionConfigFile/"Params");
        for [ {_i=0}, {_i<_c}, {_i=_i+1} ] do
        {
            _paramName = (configName ((missionConfigFile >> "Params") select _i));
            paramsArray=paramsArray+[ getNumber (missionConfigFile >> "Params" >> _paramName >> "default") ];
        };
    };
};

private["_paramLoading","_params"];
_paramLoading = paramsArray select 0;
switch (_paramLoading) do 
{ 
  case 0: 
  {
    ["Saving parameters."] call a3e_fnc_rptLog;
    uiNamespace setVariable ["A3E_SavedParams", paramsArray];    
  }; 
  case 1: 
  {
      //Load params if existing in UINamespace
      _params = uiNamespace getVariable ["A3E_SavedParams",[]];
      if(count(_params)==0 || count(_params)!=count(paramsArray)) then {
          ["No parameters found or params were updated, loading default."] call a3e_fnc_rptLog;
          uiNamespace setVariable ["A3E_SavedParams", paramsArray];
      } else {
          ["Parameters loaded"] call a3e_fnc_rptLog;
          paramsArray = _params;
          publicvariable "paramsArray";
      };
  }; 
  case 2: 
  {
      "Using manual parameters." call a3e_fnc_rptLog;
  }; 
};
if((paramsArray select 2)==0) then {
    A3E_Debug = false;
} else {
    A3E_Debug = true;
};
publicVariable "A3E_Debug";
[paramsArray,"a3e_fnc_WriteParamBriefing",true,true] call BIS_fnc_MP;