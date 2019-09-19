
--[[
creator : yyx,
email:yanyuxuanonline@163.com/921832579.com
]]
DEBUG = true

--开启/关闭调试
function _setdebug(bool)
	DEBUG = bool
end

--是否开启调试
function _isdebug()
	return DEBUG
end

--调试输出,str消息,time停留时间
function  _debug(contents,time)
	if (time == nil) or (time == 0) then 
		time = 0
	else 
		time = time
	end
	if _isdebug() then
		toast(contents,time)
	end	
end

function  _点击(xy)
	if (type(xy[1]) == "table") then
		for k,v in pairs(xy) do
			_点击(v)
			mSleep(v[3])
		end
	else
		touchDown(xy[1],xy[2])
		mSleep(50)
		touchUp(xy[1], xy[2])
	end	

end

function _滑动(fromXY,pix,fx)
	fx = fx or "down"
	touchDown(fromXY[1],fromXY[2])
	mSleep(50)
	for i = 0, pix, 50 do 
		if (fx == "down")then
			touchMove(fromXY[1], fromXY[2]+i); 
		elseif(fx == "up") then
			touchMove(fromXY[1], fromXY[2]-i); 
		elseif(fx == "left") then
			touchMove(fromXY[1]-i, fromXY[2]); 
		elseif (fx == "right")then
			touchMove(fromXY[1]+i, fromXY[2]); 
		end
		mSleep(50);        --延迟
	end
		if (fx == "down")then
			touchUp(fromXY[1], fromXY[2]+pix)
		elseif(fx == "up") then
			touchUp(fromXY[1], fromXY[2]-pix)
		elseif(fx == "left") then
			touchUp(fromXY[1]-pix, fromXY[2])
		elseif (fx == "right")then
			touchUp(fromXY[1]+pix, fromXY[2])
		end
	
end




--多点找色
function _多点找色(Arr_colors,jd)
		-- 默认找色精度90
	jd = jd or 90
	for _,val in pairs(Arr_colors) do
			if (isColor(val[1],val[2],string.format("0x%x\n",val[3]),jd) == false) then
				--_debug("未匹配到".."("..val[1]..","..val[2]..","..string.format("0x%x",val[3])..")")
				return false
			end
			mSleep(20)
		end
	return true
end


--0x48739e
--多点找色并点击
function _多点找色并点击(Arr_colors,Arr_point,jd)
	jd = jd or 90
	if _多点找色(Arr_colors,jd) then
		_点击(Arr_point)
	end
end
--[[
example/例子：--该点可通过触动采色插件获取。
arrcolors = {["某特征页面的几个点"] = {{
	{ 1367,  642, 0x4f4030},
	{ 1363,  642, 0x615043},
	{ 1354,  643, 0x554d47},
	{ 1370,  657, 0xfffbdb},
	{ 1407,  696, 0x9d753e},
	{ 1403,  693, 0x291805},
	{ 1415,  677, 0x361709},
}}}
arrpoint = {["某特征页面的几个点"] = {500,500}}

调用实现多点找色并点击arrpoint处！
_多点找色并点击(arrcolors.某特征页面的几个点,arrpoint.某特征页面的几个点)

]]

--区域多点找色
function _区域多点找色(colors,area,jd)
	--默认精度98
	jd = jd or 98
	return findMultiColorInRegionFuzzy( string.format("0x%x\n",colors.color), colors.posandcolor, jd, area.X1, area.Y1, area.X2, area.Y2)
	
end



function _区域找图(path,area,jd)
	jd = jd or 70
	return findImageInRegionFuzzy(path, jd, area.X1, area.Y1, area.X2,area.Y2,1); 
	
end

--字符串分割
function Split(szFullString, szSeparator)  
local nFindStartIndex = 1  
local nSplitIndex = 1  
local nSplitArray = {}  
while true do  
   local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)  
   if not nFindLastIndex then  
    nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))  
    break  
   end  
   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)  
   nFindStartIndex = nFindLastIndex + string.len(szSeparator)  
   nSplitIndex = nSplitIndex + 1  
end  
return nSplitArray  
end



