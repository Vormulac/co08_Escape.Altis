class Params
{
    class Loadparams
    {
	//paramsArray[0]
            title = "Parameter Loading";
            values[] = {0, 1, 2};
            texts[] = {"Use below and save", "Load existing (Use below if not found)", "Use below without save"};
            default = 1;
	};
	class TestParam
	{
		// paramsArray[1]
		title="Test";
		values[]={1,2,3};
		texts[]={"Test1", "Test2", "Test3"};
		default = 1;
	};
        class Debug
	{
		// paramsArray[2]
		title="Debug";
		values[]={0,1};
		texts[]={"Off","On"};
		default = 1;
	};
};