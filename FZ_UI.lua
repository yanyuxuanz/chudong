w,h = getScreenSize();
MyJsonString = [[
{
  "style": "default",
	"title":"欢迎使用挂机专版助手！",
  "width": ]]..w..[[,
  "height": ]]..h..[[,
  "config": "save_zhuxian.dat",
  "timer": 150,
  "bgcolor":"139,137,137",
"okname":"开始运行",
"cancelname":"取消",
  "views": [
   {
      "type": "Label",
      "text": "提示：该脚本为全自动挂机脚本,过程中不排除会出现卡顿情况,如发现角色长时间不动,请截图发给作者,谢谢配合！QQ交流群-572079085",
      "size": 10,
      "align": "left",
      "color": "238,233,233"
    },  
    {
      "type": "Label",
      "text": "点击择挂机地图",
      "size": 15,
      "align": "center",
      "color": "238,233,233"
    },
    {
      "type": "ComboBox",
      "list": "万魔殿,贵族地图,野外挂机",
      "select": "0",
	  "color": "238,233,233"
    },
	{
	"type": "RadioGroup",
	"list": "关闭玩家PK,开启玩家PK",
	"select": "1"
	}
  ]
}
]]

