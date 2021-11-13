-- RetroFlow Launcher - HexFlow Mod version by jimbob4000
-- Based on HexFlow Launcher  version 0.5 by VitaHEX
-- https://www.patreon.com/vitahex

-- Speed related settings
local cpu_speed = 444
System.setBusSpeed(222)
System.setGpuSpeed(222)
System.setGpuXbarSpeed(166)
System.setCpuSpeed(cpu_speed)

dofile("app0:addons/threads.lua")
local working_dir = "ux0:/app"
local appversion = "3.0"
function System.currentDirectory(dir)
    if dir == nil then
        return working_dir
    else
        working_dir = dir
    end
end

if not System.doesAppExist("RETROLNCR") then
    System.setMessage("Please install RetroFlow Adrenaline Launcher.\nThe VPK is saved here:\n\nux0:/app/RETROFLOW/payloads/\nRetroFlow Adrenaline Launcher.vpk", false, BUTTON_OK)
end


Network.init()
local onlineCovers = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/PSVita/"
local onlineCoversPSP = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/PSP/"
local onlineCoversPSX = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/PS1/"

local onlineCoversN64 = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/N64/Covers/"
local onlineCoversSNES = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/SNES/Covers/"
local onlineCoversNES = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/NES/Covers/"

local onlineCoversGBA = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/GBA/Covers/"
local onlineCoversGBC = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/GBC/Covers/"
local onlineCoversGB = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/GB/Covers/"

local onlineCoversMD = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/MD/Covers/"
local onlineCoversSMS = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/SMS/Covers/"
local onlineCoversGG = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/GG/Covers/"

local onlineCoversMAME = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/MAME/Covers/"
local onlineCoversAMIGA = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/AMIGA/Covers/"
local onlineCoversTG16 = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/TG16/Covers/"

local onlineCoversPCE = "https://raw.githubusercontent.com/jimbob4000/hexflow-covers/main/Covers/Retro/PCE/Covers/"


Sound.init()
local click = Sound.open("app0:/DATA/click2.wav")
local sndMusic = click--temp
local imgCoverTmp = Graphics.loadImage("app0:/DATA/noimg.png")
local backTmp = Graphics.loadImage("app0:/DATA/noimg.png")
local btnX = Graphics.loadImage("app0:/DATA/x.png")
local btnT = Graphics.loadImage("app0:/DATA/t.png")
local btnS = Graphics.loadImage("app0:/DATA/s.png")
local btnO = Graphics.loadImage("app0:/DATA/o.png")
local imgWifi = Graphics.loadImage("app0:/DATA/wifi.png")
local imgBattery = Graphics.loadImage("app0:/DATA/bat.png")
local imgBack = Graphics.loadImage("app0:/DATA/back_01.jpg")
local imgFloor = Graphics.loadImage("app0:/DATA/floor.png")
Graphics.setImageFilters(imgFloor, FILTER_LINEAR, FILTER_LINEAR)


local cur_dir = "ux0:/data/RetroFlow/"
local covers_psv = "ux0:/data/RetroFlow/COVERS/Sony - PlayStation Vita/"
local covers_psp = "ux0:/data/RetroFlow/COVERS/Sony - PlayStation Portable/"
local covers_psx = "ux0:/data/RetroFlow/COVERS/Sony - PlayStation/"

local covers_N64 = "ux0:/data/RetroFlow/COVERS/Nintendo - Nintendo 64/"
local covers_SNES = "ux0:/data/RetroFlow/COVERS/Nintendo - Super Nintendo Entertainment System/"
local covers_NES = "ux0:/data/RetroFlow/COVERS/Nintendo - Nintendo Entertainment System/"
local covers_GBA = "ux0:/data/RetroFlow/COVERS/Nintendo - Game Boy Advance/"
local covers_GBC = "ux0:/data/RetroFlow/COVERS/Nintendo - Game Boy Color/"
local covers_GB = "ux0:/data/RetroFlow/COVERS/Nintendo - Game Boy/"
local covers_MD = "ux0:/data/RetroFlow/COVERS/Sega - Mega Drive - Genesis/"
local covers_SMS = "ux0:/data/RetroFlow/COVERS/Sega - Master System - Mark III/"
local covers_GG = "ux0:/data/RetroFlow/COVERS/Sega - Game Gear/"
local covers_MAME = "ux0:/data/RetroFlow/COVERS/MAME/"
local covers_AMIGA = "ux0:/data/RetroFlow/COVERS/Commodore - Amiga/"
local covers_TG16 = "ux0:/data/RetroFlow/COVERS/NEC - TurboGrafx 16/"
local covers_PCE = "ux0:/data/RetroFlow/COVERS/NEC - PC Engine/"


-- Tidy up legacy COVER folder structure to a more standard naming convention
if System.doesDirExist(cur_dir .. "COVERS/PSVITA")  then System.rename(cur_dir .. "COVERS/PSVITA",  cur_dir .. "COVERS/Sony - PlayStation Vita") end
if System.doesDirExist(cur_dir .. "COVERS/PSP")     then System.rename(cur_dir .. "COVERS/PSP",     cur_dir .. "COVERS/Sony - PlayStation Portable") end
if System.doesDirExist(cur_dir .. "COVERS/PSX")     then System.rename(cur_dir .. "COVERS/PSX",     cur_dir .. "COVERS/Sony - PlayStation") end
if System.doesDirExist(cur_dir .. "COVERS/N64")     then System.rename(cur_dir .. "COVERS/N64",     cur_dir .. "COVERS/Nintendo - Nintendo 64") end
if System.doesDirExist(cur_dir .. "COVERS/SNES")    then System.rename(cur_dir .. "COVERS/SNES",    cur_dir .. "COVERS/Nintendo - Super Nintendo Entertainment System") end
if System.doesDirExist(cur_dir .. "COVERS/NES")     then System.rename(cur_dir .. "COVERS/NES",     cur_dir .. "COVERS/Nintendo - Nintendo Entertainment System") end
if System.doesDirExist(cur_dir .. "COVERS/GBA")     then System.rename(cur_dir .. "COVERS/GBA",     cur_dir .. "COVERS/Nintendo - Game Boy Advance") end
if System.doesDirExist(cur_dir .. "COVERS/GBC")     then System.rename(cur_dir .. "COVERS/GBC",     cur_dir .. "COVERS/Nintendo - Game Boy Color") end
if System.doesDirExist(cur_dir .. "COVERS/GB")      then System.rename(cur_dir .. "COVERS/GB",      cur_dir .. "COVERS/Nintendo - Game Boy") end
if System.doesDirExist(cur_dir .. "COVERS/MD")      then System.rename(cur_dir .. "COVERS/MD",      cur_dir .. "COVERS/Sega - Mega Drive - Genesis") end
if System.doesDirExist(cur_dir .. "COVERS/SMS")     then System.rename(cur_dir .. "COVERS/SMS",     cur_dir .. "COVERS/Sega - Master System - Mark III") end
if System.doesDirExist(cur_dir .. "COVERS/GG")      then System.rename(cur_dir .. "COVERS/GG",      cur_dir .. "COVERS/Sega - Game Gear") end


-- Create directories - Covers
System.createDirectory("ux0:/data/RetroFlow/")
System.createDirectory("ux0:/data/RetroFlow/COVERS/")
System.createDirectory(covers_psv)
System.createDirectory(covers_psp)
System.createDirectory(covers_psx)

System.createDirectory(covers_N64)
System.createDirectory(covers_SNES)
System.createDirectory(covers_NES)
System.createDirectory(covers_GBA)
System.createDirectory(covers_GBC)
System.createDirectory(covers_GB)
System.createDirectory(covers_MD)
System.createDirectory(covers_SMS)
System.createDirectory(covers_GG)
System.createDirectory(covers_MAME)
System.createDirectory(covers_AMIGA)
System.createDirectory(covers_TG16)
System.createDirectory(covers_PCE)

-- ROM Folders
local romFolder = "ux0:/data/RetroFlow/ROMS/"
local romFolder_N64 = romFolder .. "Nintendo - Nintendo 64"
local romFolder_SNES = romFolder .. "Nintendo - Super Nintendo Entertainment System"
local romFolder_NES = romFolder .. "Nintendo - Nintendo Entertainment System"
local romFolder_GBA = romFolder .. "Nintendo - Game Boy Advance"
local romFolder_GBC = romFolder .. "Nintendo - Game Boy Color"
local romFolder_GB = romFolder .. "Nintendo - Game Boy"
local romFolder_MD = romFolder .. "Sega - Mega Drive - Genesis"
local romFolder_SMS = romFolder .. "Sega - Master System - Mark III"
local romFolder_GG = romFolder .. "Sega - Game Gear"
local romFolder_PSP_GAME = "ux0:/pspemu/PSP/GAME"
local romFolder_PSP_ISO = "ux0:/pspemu/ISO"
local romFolder_MAME_2000 = romFolder .. "MAME 2000"
local romFolder_AMIGA = romFolder .. "Commodore - Amiga"
local romFolder_TG16 = romFolder .. "NEC - TurboGrafx 16"
local romFolder_PCE = romFolder .. "NEC - PC Engine"


-- Tidy up legacy ROM folder structure to a more standard naming convention
if System.doesDirExist(romFolder .. "N64")  then System.rename(romFolder .. "N64",   romFolder .. "Nintendo - Nintendo 64") end
if System.doesDirExist(romFolder .. "SNES") then System.rename(romFolder .. "SNES",  romFolder .. "Nintendo - Super Nintendo Entertainment System") end
if System.doesDirExist(romFolder .. "NES")  then System.rename(romFolder .. "NES",   romFolder .. "Nintendo - Nintendo Entertainment System") end
if System.doesDirExist(romFolder .. "GBA")  then System.rename(romFolder .. "GBA",   romFolder .. "Nintendo - Game Boy Advance") end
if System.doesDirExist(romFolder .. "GBC")  then System.rename(romFolder .. "GBC",   romFolder .. "Nintendo - Game Boy Color") end
if System.doesDirExist(romFolder .. "GB")   then System.rename(romFolder .. "GB",    romFolder .. "Nintendo - Game Boy") end
if System.doesDirExist(romFolder .. "MD")   then System.rename(romFolder .. "MD",    romFolder .. "Sega - Mega Drive - Genesis") end
if System.doesDirExist(romFolder .. "SMS")  then System.rename(romFolder .. "SMS",   romFolder .. "Sega - Master System - Mark III") end
if System.doesDirExist(romFolder .. "GG")   then System.rename(romFolder .. "GG",    romFolder .. "Sega - Game Gear") end

-- Create directories - Rom Folders
System.createDirectory(romFolder)
System.createDirectory(romFolder_N64)
System.createDirectory(romFolder_SNES)
System.createDirectory(romFolder_NES)
System.createDirectory(romFolder_GBA)
System.createDirectory(romFolder_GBC)
System.createDirectory(romFolder_GB)
System.createDirectory(romFolder_MD)
System.createDirectory(romFolder_SMS)
System.createDirectory(romFolder_GG)
System.createDirectory(romFolder_MAME_2000)
System.createDirectory(romFolder_AMIGA)
System.createDirectory(romFolder_TG16)
System.createDirectory(romFolder_PCE)

-- Create directories - User Database
local user_DB_Folder = "ux0:/data/RetroFlow/TITLES/"
System.createDirectory(user_DB_Folder)

-- Create directories - Database Cache
local db_Cache_Folder = "ux0:/data/RetroFlow/CACHE/"
System.createDirectory(db_Cache_Folder)

-- Retroarch Cores
local core_SNES = "app0:/snes9x2005_libretro.self"
local core_NES = "app0:/quicknes_libretro.self"
local core_GBA = "app0:/gpsp_libretro.self"
local core_GBC = "app0:/gambatte_libretro.self"
local core_GB = "app0:/gambatte_libretro.self"
local core_MD = "app0:/genesis_plus_gx_libretro.self"
local core_SMS = "app0:/smsplus_libretro.self"
local core_GG = "app0:/smsplus_libretro.self"
local core_MAME = "app0:/mame2000_libretro.self"
local core_AMIGA = "app0:/puae_libretro.self"
local core_PCE = "app0:/mednafen_pce_fast_libretro.self"
local core_TG16 = "app0:/mednafen_pce_fast_libretro.self"

-- Launcher App Directory
local launch_dir = "ux0:/rePatch/RETROFLOW/"
local launch_dir_adr = "ux0:/app/RETROLNCR/"
local launch_app_adr = "RETROLNCR"

-- Create Overrides file
if not System.doesFileExist(cur_dir .. "/overrides.dat") then
    local file_over = System.openFile(cur_dir .. "/overrides.dat", FCREATE)
    System.writeFile(file_over, " ", 1)
    System.closeFile(file_over)
end

-- load textures
local imgBox = Graphics.loadImage("app0:/DATA/vita_cover.png")
local imgBoxPSP = Graphics.loadImage("app0:/DATA/psp_cover.png")
local imgBoxPSX = Graphics.loadImage("app0:/DATA/psx_cover.png")
local imgBoxBLANK = Graphics.loadImage("app0:/DATA/blank_cover.png")

-- Load models
local modBox = Render.loadObject("app0:/DATA/box.obj", imgBox)
local modCover = Render.loadObject("app0:/DATA/cover.obj", imgCoverTmp)
local modBoxNoref = Render.loadObject("app0:/DATA/box_noreflx.obj", imgBox)
local modCoverNoref = Render.loadObject("app0:/DATA/cover_noreflx.obj", imgCoverTmp)

local modBoxPSP = Render.loadObject("app0:/DATA/boxpsp.obj", imgBoxPSP)
local modCoverPSP = Render.loadObject("app0:/DATA/coverpsp.obj", imgCoverTmp)
local modBoxPSPNoref = Render.loadObject("app0:/DATA/boxpsp_noreflx.obj", imgBoxPSP)
local modCoverPSPNoref = Render.loadObject("app0:/DATA/coverpsp_noreflx.obj", imgCoverTmp)

local modBoxPSX = Render.loadObject("app0:/DATA/boxpsx.obj", imgBoxPSX)
local modCoverPSX = Render.loadObject("app0:/DATA/coverpsx.obj", imgCoverTmp)
local modBoxPSXNoref = Render.loadObject("app0:/DATA/boxpsx_noreflx.obj", imgBoxPSX)
local modCoverPSXNoref = Render.loadObject("app0:/DATA/coverpsx_noreflx.obj", imgCoverTmp)

local modBoxN64 = Render.loadObject("app0:/DATA/boxn64.obj", imgBoxBLANK)
local modCoverN64 = Render.loadObject("app0:/DATA/covern64.obj", imgCoverTmp)
local modBoxN64Noref = Render.loadObject("app0:/DATA/boxn64_noreflx.obj", imgBoxBLANK)
local modCoverN64Noref = Render.loadObject("app0:/DATA/covern64_noreflx.obj", imgCoverTmp)

local modBoxNES = Render.loadObject("app0:/DATA/boxnes.obj", imgBoxBLANK)
local modCoverNES = Render.loadObject("app0:/DATA/covernes.obj", imgCoverTmp)
local modBoxNESNoref = Render.loadObject("app0:/DATA/boxnes_noreflx.obj", imgBoxBLANK)
local modCoverNESNoref = Render.loadObject("app0:/DATA/covernes_noreflx.obj", imgCoverTmp)

local modBoxGB = Render.loadObject("app0:/DATA/boxgb.obj", imgBoxBLANK)
local modCoverGB = Render.loadObject("app0:/DATA/covergb.obj", imgCoverTmp)
local modBoxGBNoref = Render.loadObject("app0:/DATA/boxgb_noreflx.obj", imgBoxBLANK)
local modCoverGBNoref = Render.loadObject("app0:/DATA/covergb_noreflx.obj", imgCoverTmp)

local modBoxMD = Render.loadObject("app0:/DATA/boxmd.obj", imgBoxBLANK)
local modCoverMD = Render.loadObject("app0:/DATA/covermd.obj", imgCoverTmp)
local modBoxMDNoref = Render.loadObject("app0:/DATA/boxmd_noreflx.obj", imgBoxBLANK)
local modCoverMDNoref = Render.loadObject("app0:/DATA/covermd_noreflx.obj", imgCoverTmp)

local modCoverHbr = Render.loadObject("app0:/DATA/cover_square.obj", imgCoverTmp)
local modCoverHbrNoref = Render.loadObject("app0:/DATA/cover_square_noreflx.obj", imgCoverTmp)

local modBackground = Render.loadObject("app0:/DATA/planebg.obj", imgBack)
local modDefaultBackground = Render.loadObject("app0:/DATA/planebg.obj", imgBack)
local modFloor = Render.loadObject("app0:/DATA/planefloor.obj", imgFloor)

local img_path = ""

local fnt = Font.load("app0:/DATA/font.ttf")
local fnt20 = Font.load("app0:/DATA/font.ttf")
local fnt22 = Font.load("app0:/DATA/font.ttf")
local fnt25 = Font.load("app0:/DATA/font.ttf")
local fnt35 = Font.load("app0:/DATA/font.ttf")

Font.setPixelSizes(fnt20, 20)
Font.setPixelSizes(fnt22, 22)
Font.setPixelSizes(fnt25, 25)
Font.setPixelSizes(fnt35, 35)


local menuX = 0
local menuY = 0
local showMenu = 0
local showCat = 1 -- Category: 0 = all, 1 = games, 2 = homebrews, 3 = psp, 4 = psx, 5 = N64, 6 = SNES, 7 = NES, 8 = GBA, 9 = GBC, 10 = GB, 11 = MD, 12 = SMS, 13 = GG, 14 = MAME, 15 = AMIGA, 16 = TG16, 17 = PCE
local showView = 0

local info = System.extractSfo("app0:/sce_sys/param.sfo")
local app_version = info.version
local app_title = info.title
local app_category = info.category
local app_titleid = info.titleid
local app_size = 0

local master_index = 1
local p = 1
local oldpad = 0
local delayTouch = 8.0
local delayButton = 8.0
local hideBoxes = 1.0
local prvRotY = 0

local gettingCovers = false
local scanComplete = false

-- Init Colors
local black = Color.new(0, 0, 0)
local grey = Color.new(45, 45, 45)
local darkalpha = Color.new(40, 40, 40, 180)
local lightgrey = Color.new(58, 58, 58)
local white = Color.new(255, 255, 255)
local red = Color.new(190, 0, 0)
local blue = Color.new(2, 72, 158)
local yellow = Color.new(225, 184, 0)
local green = Color.new(79, 152, 37)
local purple = Color.new(151, 0, 185)
local orange = Color.new(220, 120, 0)
local bg = Color.new(153, 217, 234)
local themeCol = Color.new(2, 72, 158)

local targetX = 0
local xstart = 0
local ystart = 0
local space = 1
local touchdown = 0
local startCovers = false
local inPreview = false
local apptype = 0
local appdir = ""
local getCovers = 0--0 PSV, 1 PSP, 2 PS1, 3 N64, 4 SNES, 5 NES, 6 GBA, 7 GBC, 8 GB, 9 MD, 10 SMS, 11 GG, 12 MAME, 13 AMIGA, 14 TG16, 17 PCE, 18 All
local tmpappcat = 0
local tmpappcat_adrenaline = 0

local prevX = 0
local prevZ = 0
local prevRot = 0

local total_all = 0
local total_games = 0
local total_homebrews = 0
local curTotal = 1

-- Settings
local startCategory = 1
local setReflections = 1
local setSounds = 1
local themeColor = 0 -- 0 blue, 1 red, 2 yellow, 3 green, 4 grey, 5 black, 6 purple, 7 orange
local menuItems = 3
local setBackground = 1
local setLanguage = 0
local showHomebrews = 1 -- On
local startupScan = 1 -- 0 Off, 1 On


-- Delete legacy config file
if  System.doesFileExist(cur_dir .. "/config.dat") then
    System.deleteFile(cur_dir .. "/config.dat")
end


if System.doesFileExist(cur_dir .. "/settings.dat") then
    local file_config = System.openFile(cur_dir .. "/settings.dat", FREAD)
    local filesize = System.sizeFile(file_config)
    local str = System.readFile(file_config, filesize)
    System.closeFile(file_config)
        
    local getReflections = tonumber(string.sub(str, 1, 1)); if getReflections ~= nil then setReflections = getReflections end
    local getSounds = tonumber(string.sub(str, 2, 2)); if getSounds ~= nil then setSounds = getSounds end
    local getthemeColor = tonumber(string.sub(str, 3, 3)); if getthemeColor ~= nil then themeColor = getthemeColor end
    local getBackground = tonumber(string.sub(str, 4, 4)); if getBackground ~= nil then setBackground = getBackground end
    local getLanguage = tonumber(string.sub(str, 5, 5)); if getLanguage ~= nil then setLanguage = getLanguage end
    local getView = tonumber(string.sub(str, 6, 6)); if getView ~= nil then showView = getView end
    local getHomebrews = tonumber(string.sub(str, 7, 7)); if getHomebrews ~= nil then showHomebrews = getHomebrews end
    local getStartupScan = tonumber(string.sub(str, 8, 8)); if getStartupScan ~= nil then startupScan = getStartupScan end
    local getCategory = tonumber(string.sub(str, 9, 10)); if getCategory ~= nil then startCategory = getCategory end
else
    local file_config = System.openFile(cur_dir .. "/settings.dat", FCREATE)
    System.writeFile(file_config, setReflections .. setSounds .. themeColor .. setBackground .. setLanguage .. showView .. showHomebrews .. startupScan .. startCategory, 10)
    System.closeFile(file_config)
end
showCat = startCategory

-- Custom Background
local imgCustomBack = imgBack
if System.doesFileExist("ux0:/data/RetroFlow/Background.png") then
    imgCustomBack = Graphics.loadImage("ux0:/data/RetroFlow/Background.png")
    Graphics.setImageFilters(imgCustomBack, FILTER_LINEAR, FILTER_LINEAR)
    Render.useTexture(modBackground, imgCustomBack)
elseif System.doesFileExist("ux0:/data/RetroFlow/Background.jpg") then
    imgCustomBack = Graphics.loadImage("ux0:/data/RetroFlow/Background.jpg")
    Graphics.setImageFilters(imgCustomBack, FILTER_LINEAR, FILTER_LINEAR)
    Render.useTexture(modBackground, imgCustomBack)
end

-- Custom Music
if System.doesFileExist(cur_dir .. "/Music.mp3") then
    sndMusic = Sound.open(cur_dir .. "/Music.mp3")
    if setSounds == 1 then
        Sound.play(sndMusic, LOOP)
    end
end

function SetThemeColor()
    if themeColor == 1 then
        themeCol = red
    elseif themeColor == 2 then
        themeCol = yellow
    elseif themeColor == 3 then
        themeCol = green
    elseif themeColor == 4 then
        themeCol = lightgrey
    elseif themeColor == 5 then
        themeCol = black
    elseif themeColor == 6 then
        themeCol = purple
    elseif themeColor == 7 then
        themeCol = orange
    else
        themeCol = blue -- default blue
    end
end
SetThemeColor()

function OneshotPrint(my_func)
    my_func()
    Screen.flip()
    my_func()
    Screen.flip()
    my_func()
end

local lang_lines = {}
local lang_default = "PS Vita\nHomebrews\nPSP\nPlayStation\nAll\nSettings\nLaunch\nDetails\nCategory\nView\nClose\nVersion\nAbout\nStartup Category\nReflection Effect\nSounds\nTheme Color\nCustom Background\nDownload Covers\nReload Covers Database\nLanguage\nOn\nOff\nRed\nYellow\nGreen\nGrey\nBlack\nPurple\nOrange\nBlue\nSelect\nNintendo 64\nSuper Nintendo\nNintendo Entertainment System\nGame Boy Advance\nGame Boy Color\nGame Boy\nSega Mega Drive\nSega Master System\nSega Game Gear\nMAME\nAmiga\nTurboGrafx-16\nPC Engine\nHomebrews Category\nStartup scan"
function ChangeLanguage()
if #lang_lines>0 then
    for k in pairs (lang_lines) do
        lang_lines [k] = nil
    end
end

local lang = "EN.ini"
 -- 0 EN, 1 EN USA, 2 DE, 3 FR, 4 IT, 5 SP, 6 PT, 7 SW, 8 RU, 9 JA
    if setLanguage == 1 then
        lang = "EN_USA.ini"
    elseif setLanguage == 2 then
        lang = "DE.ini"
    elseif setLanguage == 3 then
        lang = "FR.ini"
    elseif setLanguage == 4 then
        lang = "IT.ini"
    elseif setLanguage == 5 then
        lang = "SP.ini"
    elseif setLanguage == 6 then
        lang = "PT.ini"
    elseif setLanguage == 7 then
        lang = "SW.ini"
    elseif setLanguage == 8 then
        lang = "RU.ini"
    elseif setLanguage == 9 then
        lang = "JA.ini"
    else
        lang = "EN.ini"
    end
    
    if System.doesFileExist("app0:/translations/" .. lang) then
        langfile = "app0:/translations/" .. lang
    else
        --create default EN.ini if language is missing
        handle = System.openFile("ux0:/data/RetroFlow/EN.ini", FCREATE)
        System.writeFile(handle, "" .. lang_default, string.len(lang_default))
        System.closeFile(handle)
        langfile = "ux0:/data/RetroFlow/EN.ini"
        setLanguage=0
    end

    for line in io.lines(langfile) do
        lang_lines[#lang_lines+1] = line
    end
end
ChangeLanguage()

function PrintCentered(font, x, y, text, color, size)
    text = text:gsub("\n","")
    local width = Font.getTextWidth(font,text)
    Font.print(font, x - width / 2, y, text, color)
end

function TableConcat(t1, t2)
    for i = 1, #t2 do
        t1[#t1 + 1] = t2[i]
    end
    return t1
end

function FreeMemory()
    if System.doesFileExist(cur_dir .. "/Music.mp3") then
        Sound.close(sndMusic)
    end
    Graphics.freeImage(imgCoverTmp)
    Graphics.freeImage(btnX)
    Graphics.freeImage(btnT)
    Graphics.freeImage(btnS)
    Graphics.freeImage(btnO)
    Graphics.freeImage(imgWifi)
    Graphics.freeImage(imgBattery)
    Graphics.freeImage(imgBack)
    Graphics.freeImage(imgBox)
end


-- Manipulate Rom Name - remove region code and url encode spaces for image download
function cleanRomNames()
    -- file.name = {}
    -- romname_withExtension = file.name
    romname_noExtension = {}
    romname_noExtension[1] = romname_withExtension:match("(.+)%..+$")

    -- remove space before parenthesis " (" then letters and numbers "(.*)"
    romname_noRegion_noExtension = {}
    romname_noRegion_noExtension[1] = romname_noExtension[1]:gsub(" %(", "%("):gsub('%b()', '')

    romname_url_encoded = {}
    romname_url_encoded[1] = romname_noExtension[1]:gsub("%s+", '%%%%20')

    -- Check if name contains parenthesis, if yes strip out to show as version
    if string.find(romname_noExtension[1], "%(") then
        -- Remove all text except for within "()"
        romname_region_initial = {}
        romname_region_initial[1] = romname_noExtension[1]:match("%((.+)%)")

        -- Tidy up remainder when more than one set of parenthesis used, replace  ") (" with ", "
        romname_region = {}
        romname_region[1] = romname_region_initial[1]:gsub("%) %(", ', ')
    -- If no parenthesis, then add blank to prevent nil error
    else
        romname_region[1] = " "
    end
end


-- Manipulate Rom Name - remove region code and url encode spaces for image download
function cleanRomNamesPSP()
    -- file.name = {}
    -- romname_withExtension = file.name
    romname_noExtension = {}
    romname_noExtension[1] = romname_withExtension:match("(.+)%..+$")

    -- remove space before parenthesis " (" then letters and numbers "(.*)"
    romname_noRegion_noExtension = {}
    romname_noRegion_noExtension[1] = romname_noExtension[1]:gsub(" %(", "%("):gsub('%b()', '')

    romname_noRegion_noExtension_noTitleID = {}
    romname_noRegion_noExtension_noTitleID[1] = romname_noRegion_noExtension[1]:gsub(" %[", "%["):gsub('%b[]', '') -- game without [ULUS-0000]

    titleID_withHyphen = {}
    titleID_withHyphen[1] = romname_noExtension[1]:match("%[(.+)%]") -- game id without brackets, with hypen ULUS-0000

    titleID_noHyphen = {}
    titleID_noHyphen[1] = tostring(titleID_withHyphen[1]):gsub("%-", '') -- game id without brackets, with hypen ULUS-0000

    romname_url_encoded = {}
    romname_url_encoded[1] = tostring(titleID_noHyphen[1])

    -- Check if name contains parenthesis, if yes strip out to show as version
    if string.find(romname_noExtension[1], "%(") then
        -- Remove all text except for within "()"
        romname_region_initial = {}
        romname_region_initial[1] = romname_noExtension[1]:match("%((.+)%)")

        -- Tidy up remainder when more than one set of parenthesis used, replace  ") (" with ", "
        romname_region = {}
        romname_region[1] = romname_region_initial[1]:gsub("%) %(", ', ')
    -- If no parenthesis, then add blank to prevent nil error
    else
        romname_region[1] = " "
    end

end


function launch_Adrenaline()

    -- Unmount and remount for read write access to App folder
    System.unmountPartition(0x800)
    System.mountPartition(0x800, READ_WRITE)

    -- Delete the old Adrenaline inf file
    if  System.doesFileExist(launch_dir_adr .. "data/boot.inf") then
        System.deleteFile(launch_dir_adr .. "data/boot.inf")
    end

    -- Delete the old Adrenaline bin file
    if  System.doesFileExist(launch_dir_adr .. "data/boot.bin") then
        System.deleteFile(launch_dir_adr .. "data/boot.bin")
    end

    -- CREATE ROM FILE

    -- Create a new file
    if not System.doesFileExist(launch_dir_adr .. "data/boot.inf") then
        local file_over = System.openFile(launch_dir_adr .. "data/boot.inf", FCREATE)
        System.writeFile(file_over, " ", 1)
        System.closeFile(file_over)
    end
    -- Open the file to add the game name
    rom_txt_file = System.openFile(launch_dir_adr .. "data/boot.inf", FCREATE)
    -- Get the game name
    
    rom_location_charcount = string.len(rom_location)
    -- Count the characters and write to the file
    System.writeFile(rom_txt_file, rom_location, rom_location_charcount)

    System.launchApp(launch_app_adr)

end

function clean_launch_dir()
plug_repatch_ex = System.loadKernelPlugin("ux0:/app/RETROFLOW/modules/repatch_ex.skprx")


    -- Delete the old rom file
    if  System.doesFileExist(launch_dir .. "rom.txt") then
        System.deleteFile(launch_dir .. "rom.txt")
    end

    -- Delete the old core file
    if  System.doesFileExist(launch_dir .. "core.txt") then
        System.deleteFile(launch_dir .. "core.txt")
    end

    -- Delete the old N64 args file
    if  System.doesFileExist(launch_dir .. "args.txt") then
        System.deleteFile(launch_dir .. "args.txt")
    end
end


function launch_retroarch()

    -- Create rePatch directory if doesn't exist
    if not System.doesDirExist("ux0:/rePatch") then
        System.createDirectory("ux0:/rePatch")
    end

    -- Create launch directory if doesn't exist
    if not System.doesDirExist(launch_dir) then
        System.createDirectory(launch_dir)
    end

    -- CREATE ROM FILE

    -- Delete the old rom file
    if  System.doesFileExist(launch_dir .. "rom.txt") then
        System.deleteFile(launch_dir .. "rom.txt")
    end
    -- Create a new file
    if not System.doesFileExist(launch_dir .. "rom.txt") then
        local file_over = System.openFile(launch_dir .. "rom.txt", FCREATE)
        System.writeFile(file_over, " ", 1)
        System.closeFile(file_over)
    end
    -- Open the file to add the game name
    rom_txt_file = System.openFile(launch_dir .. "rom.txt", FCREATE)
    -- Get the game name
    
    rom_location_charcount = string.len(rom_location)
    -- Count the characters and write to the file
    System.writeFile(rom_txt_file, rom_location, rom_location_charcount)


    -- CREATE CORE FILE

    -- Delete the old N64 args file
    if  System.doesFileExist(launch_dir .. "args.txt") then
        System.deleteFile(launch_dir .. "args.txt")
    end

    -- Delete the old core file
    if  System.doesFileExist(launch_dir .. "core.txt") then
        System.deleteFile(launch_dir .. "core.txt")
    end
    -- Create a new file
    if not System.doesFileExist(launch_dir .. "core.txt") then
        local file_over = System.openFile(launch_dir .. "core.txt", FCREATE)
        System.writeFile(file_over, " ", 1)
        System.closeFile(file_over)
    end
    -- Open the file to add the game name
    core_txt_file = System.openFile(launch_dir .. "core.txt", FCREATE)
    -- Get the game name
    core_name_charcount = string.len(core_name)
    System.writeFile(core_txt_file, core_name, core_name_charcount)

    System.launchEboot("app0:/launch_retroarch.bin")
end



function launch_DaedalusX64()

    -- Create rePatch directory if doesn't exist
    if not System.doesDirExist("ux0:/rePatch") then
        System.createDirectory("ux0:/rePatch")
    end

    -- Create launch directory if doesn't exist
    if not System.doesDirExist(launch_dir) then
        System.createDirectory(launch_dir)
    end

    -- CREATE ROM FILE

    -- Create a new file
    if not System.doesFileExist(launch_dir .. "args.txt") then
        local file_over = System.openFile(launch_dir .. "args.txt", FCREATE)
        System.writeFile(file_over, " ", 1)
        System.closeFile(file_over)
    end
    -- Open the file to add the game name
    rom_txt_file = System.openFile(launch_dir .. "args.txt", FCREATE)
    -- Get the game name
    
    rom_location_charcount = string.len(rom_location)
    -- Count the characters and write to the file
    System.writeFile(rom_txt_file, rom_location, rom_location_charcount)

    System.launchEboot("app0:/launch_n64.bin")
end


function CreateUserTitleTable_PSP()

    local UserGameDB = "psp.lua"
    local TableToScan = psp_table

    table.sort(TableToScan, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)

    local file_over = System.openFile(user_DB_Folder .. UserGameDB, FCREATE)
    System.closeFile(file_over)

    file = io.open(user_DB_Folder .. UserGameDB, "w")
    file:write('return {' .. "\n")
    for k, v in pairs(TableToScan) do

        if v.directory == true then
            file:write('["' .. v.name .. '"] = {name = "' .. v.name_title_search .. '"},' .. "\n")
        else
        end
    end
    file:write('}')
    file:close()

end


function CreateUserTitleTable_PSX()

    local UserGameDB = "psx.lua"
    local TableToScan = psx_table

    table.sort(TableToScan, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)

    local file_over = System.openFile(user_DB_Folder .. UserGameDB, FCREATE)
    System.closeFile(file_over)

    file = io.open(user_DB_Folder .. UserGameDB, "w")
    file:write('return {' .. "\n")
    for k, v in pairs(TableToScan) do
        file:write('["' .. v.name .. '"] = {name = "' .. v.name_title_search .. '"},' .. "\n")
    end
    file:write('}')
    file:close()
    
end

function CreateUserTitleTable_MAME()

    local UserGameDB = "mame.lua"
    local TableToScan = mame_table

    table.sort(TableToScan, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)

    local file_over = System.openFile(user_DB_Folder .. UserGameDB, FCREATE)
    System.closeFile(file_over)

    file = io.open(user_DB_Folder .. UserGameDB, "w")
    file:write('return {' .. "\n")
    for k, v in pairs(TableToScan) do
        file:write('["' .. v.name_minus_ext .. '"] = {name = "' .. v.name_title_search .. '"},' .. "\n")
    end
    file:write('}')
    file:close()

end


-- PRINT TABLE FUNCTIONS

function cache_all_tables()
    dofile("app0:addons/printTable.lua")
    print_tables()
end

function update_cached_table_files()
    dofile("app0:addons/printTable.lua")
    print_table_files()
end

function update_cached_table_folders()
    dofile("app0:addons/printTable.lua")
    print_table_folders()
end

function update_cached_table_games()
    dofile("app0:addons/printTable.lua")
    print_table_games()
end

function update_cached_table_homebrews()
    dofile("app0:addons/printTable.lua")
    print_table_homebrews()
end

function update_cached_table_psp()
    dofile("app0:addons/printTable.lua")
    print_table_psp()
end

function update_cached_table_psx()
    dofile("app0:addons/printTable.lua")
    print_table_psx()
end

function update_cached_table_n64()
    dofile("app0:addons/printTable.lua")
    print_table_n64()
end

function update_cached_table_snes()
    dofile("app0:addons/printTable.lua")
    print_table_snes()
end

function update_cached_table_nes()
    dofile("app0:addons/printTable.lua")
    print_table_nes()
end

function update_cached_table_gba()
    dofile("app0:addons/printTable.lua")
    print_table_gba()
end

function update_cached_table_gbc()
    dofile("app0:addons/printTable.lua")
    print_table_gbc()
end

function update_cached_table_gb()
    dofile("app0:addons/printTable.lua")
    print_table_gb()
end

function update_cached_table_md()
    dofile("app0:addons/printTable.lua")
    print_table_md()
end

function update_cached_table_sms()
    dofile("app0:addons/printTable.lua")
    print_table_sms()
end

function update_cached_table_gg()
    dofile("app0:addons/printTable.lua")
    print_table_gg()
end

function update_cached_table_mame()
    dofile("app0:addons/printTable.lua")
    print_table_mame()
end

function update_cached_table_amiga()
    dofile("app0:addons/printTable.lua")
    print_table_amiga()
end

function update_cached_table_tg16()
    dofile("app0:addons/printTable.lua")
    print_table_tg16()
end

function update_cached_table_pce()
    dofile("app0:addons/printTable.lua")
    print_table_pce()
end

function update_cached_table_all_games()
    dofile("app0:addons/printTable.lua")
    print_table_all_games()
end



function listDirectory(dir)
    dir = System.listDirectory(dir)
    folders_table = {}
    files_table = {}
    games_table = {}
    psp_table = {}
    psx_table = {}
    n64_table = {}
    snes_table = {}
    nes_table = {}
    gba_table = {}
    gbc_table = {}
    gb_table = {}
    md_table = {}
    sms_table = {}
    gg_table = {}
    mame_table = {}
    amiga_table = {}
    tg16_table = {}
    pce_table = {}
    homebrews_table = {}
    all_games_table = {}
    -- app_type = 0 -- 0 homebrew, 1 psvita, 2 psp, 3 psx, 5 n64, 6 snes, 7 nes, 8 gba, 9 gbc, 10 gb, 11 md, 12 sms, 13 gg, 14 mame, 15 amiga, 16 tg16, 17 pce
    local customCategory = 0
    
    local file_over = System.openFile(cur_dir .. "/overrides.dat", FREAD)
    local filesize = System.sizeFile(file_over)
    local str = System.readFile(file_over, filesize)
    System.closeFile(file_over)

    for i, file in pairs(dir) do
    local custom_path, custom_path_id, app_type = nil, nil, nil
        if file.directory
            and not string.match(file.name, "RETROFLOW") -- Don't index Retroflow
            and not string.match(file.name, "RETROLNCR") -- Don't index Retroflow Adrenaline Launcher
            and not string.match(file.name, "ADRLANCHR") -- Don't index Adrenaline Launcher
            and not System.doesFileExist(working_dir .. "/" .. file.name .. "/data/boot.bin") -- Don't scan PSP and PSX Bubbles
            then
            -- get app name to match with custom cover file name
            if System.doesFileExist(working_dir .. "/" .. file.name .. "/sce_sys/param.sfo") then
                info = System.extractSfo(working_dir .. "/" .. file.name .. "/sce_sys/param.sfo")
                app_title = info.title
            end

            file.game_path = (working_dir .. "/" .. file.name)
            file.cover_path_online = onlineCovers
            file.name_minus_ext = file.name

            if string.match(file.name, "PCS") and not string.match(file.name, "PCSI") then

                -- Scan PSVita Games
                table.insert(folders_table, file)
                --table.insert(games_table, file)
                custom_path = covers_psv .. app_title .. ".png"
                custom_path_id = covers_psv .. file.name .. ".png"
                file.app_type=1

                -- all games table
                table.insert(all_games_table, 1, file)
                file.app_type=1
                file.name_minus_ext = file.name
                file.name_rom_url_encoded = file.name
                file.cover_path_online = onlineCovers
                file.cover_path_local = covers_psv
                
                --CHECK FOR OVERRIDDEN CATEGORY of VITA game
                if System.doesFileExist(cur_dir .. "/overrides.dat") then
                    --0 default, 1 vita, 2 psp, 3 psx, 4 homebrew
                    if string.match(str, file.name .. "=1") then
                        table.insert(games_table, file)
                        custom_path = covers_psv .. app_title .. ".png"
                        custom_path_id = covers_psv .. file.name .. ".png"
                        file.app_type=1
                    elseif string.match(str, file.name .. "=4") then
                        table.insert(homebrews_table, file)
                        custom_path = covers_psv .. app_title .. ".png"
                        custom_path_id = covers_psv .. file.name .. ".png"
                        file.app_type=0
                    else
                        table.insert(games_table, file)--default
                    end
                else
                    table.insert(games_table, file)
                end
                --END OVERRIDDEN CATEGORY of Vita game

            else

                -- -- Scan Homebrews
                -- table.insert(folders_table, file)
                -- --table.insert(homebrews_table, file)
                -- custom_path = covers_psv .. app_title .. ".png"
                -- custom_path_id = covers_psv .. file.name .. ".png"
                -- file.app_type=0

                -- Scan Homebrews 
                    -- Hide homebrews from All Category
                    if showHomebrews == 1 then -- If show Homebrews is true then scan
                        table.insert(folders_table, file)
                        --table.insert(homebrews_table, file)
                        custom_path = covers_psv .. app_title .. ".png"
                        custom_path_id = covers_psv .. file.name .. ".png"
                        file.name_rom_url_encoded = file.name
                        file.app_type=0
                    else -- If show Homebrews is false
                        --Check for Vita override and include those games
                        if System.doesFileExist(cur_dir .. "/overrides.dat") then
                            --0 default, 1 vita, 2 psp, 3 psx, 4 homebrew
                            if string.match(str, file.name .. "=1") then
                                table.insert(folders_table, file)
                                custom_path = covers_psv .. app_title .. ".png"
                                custom_path_id = covers_psv .. file.name .. ".png"
                                file.name_rom_url_encoded = file.name
                                file.app_type=0
                            end
                        end
                    end
                
                
            --CHECK FOR OVERRIDDEN CATEGORY of HOMEBREW game
                if System.doesFileExist(cur_dir .. "/overrides.dat") then
                    --0 default, 1 vita, 2 psp, 3 psx, 4 homebrew
                    if string.match(str, file.name .. "=1") then
                        table.insert(games_table, file)
                        custom_path = covers_psv .. app_title .. ".png"
                        custom_path_id = covers_psv .. file.name .. ".png"
                        file.name_rom_url_encoded = file.name
                        file.app_type=1

                         -- all games table
                        table.insert(all_games_table, 1, file)
                        file.app_type=1
                        file.name_minus_ext = file.name
                        file.cover_path_online = onlineCovers
                        file.cover_path_local = covers_psv

                    elseif string.match(str, file.name .. "=4") then
                        table.insert(homebrews_table, file)
                        custom_path = covers_psv .. app_title .. ".png"
                        custom_path_id = covers_psv .. file.name .. ".png"
                        file.name_rom_url_encoded = file.name
                        file.app_type=0

                         -- all games table
                        table.insert(all_games_table, 1, file)
                        file.app_type=0
                        file.name_minus_ext = file.name
                        file.cover_path_online = onlineCovers
                        file.cover_path_local = covers_psv

                    else
                        table.insert(homebrews_table, file)--default
                    end
                else
                    table.insert(homebrews_table, file)

                     -- all games table
                    table.insert(all_games_table, 1, file)
                    file.app_type=0
                    file.name_minus_ext = file.name
                    file.cover_path_online = onlineCovers
                    file.cover_path_local = covers_psv

                end
                --END OVERRIDDEN CATEGORY of homebrew
            end

        end
        
        if custom_path and System.doesFileExist(custom_path) then
            img_path = custom_path --custom cover by app name
        elseif custom_path_id and System.doesFileExist(custom_path_id) then
            img_path = custom_path_id --custom cover by app id
        else
            if System.doesFileExist("ur0:/appmeta/" .. file.name .. "/icon0.png") then
                img_path = "ur0:/appmeta/" .. file.name .. "/icon0.png"  --app icon
            else
                img_path = "app0:/DATA/noimg.png" --blank grey
            end
        end
        
        table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
        
        --add blank icon to all
        file.icon = imgCoverTmp
        file.icon_path = img_path
        
        table.insert(files_table, 17, file.icon) -- Increased for Retro (All systems + 1 for all view)
        
        file.apptitle = app_title
        table.insert(files_table, 17, file.apptitle) -- Increased for Retro (All systems + 1 for all view)
        
    end


    -- SCAN ROMS


    -- SCAN PSP - ISO FOLDER
    if  System.doesDirExist(romFolder_PSP_ISO) then
        
        files_PSP = System.listDirectory(romFolder_PSP_ISO)
        for i, file in pairs(files_PSP) do

        local custom_path, custom_path_id, app_type, name_minus_ext, name_rom_minus_region_ext, name_rom_url_encoded, name_rom_region, name_title_search = nil, nil, nil, nil, nil, nil, nil, nil
            -- Scan files only, ignore temporary files, Windows = "Thumbs.db", Mac = "DS_Store", and "._name" 
            if not file.directory and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

                file.launch_argument = ("PATH=ms0:/ISO/" .. file.name)
                file.game_path = (romFolder_PSP_ISO .. "/" .. file.name)
                romname_withExtension = file.name

                cleanRomNamesPSP()
                info = romname_noRegion_noExtension[1]
                app_title = titleID_noHyphen[1]
                -- app_titleid = titleID_noHyphen[1]
                file.name = titleID_noHyphen[1]


                file.name_minus_ext = titleID_noHyphen[1]
                file.name_rom_minus_region_ext = romname_noRegion_noExtension_noTitleID[1] -- DISPLAY NAME
                file.name_rom_url_encoded = titleID_noHyphen[1]
                file.name_rom_region = romname_region[1]
                file.name_title_search = romname_noExtension[1]


                --CHECK FOR OVERRIDDEN CATEGORY of PSP game
                    if System.doesFileExist(cur_dir .. "/overrides.dat") then

                        -- P1 = PS1, P2 = PSP
                        if string.match(str, file.name .. "=P1") then
                            
                            -- PSX
                            table.insert(folders_table, file)
                            --table.insert(games_table, file)
                            custom_path = covers_psx .. romname_noExtension[1] .. ".png"
                            custom_path_id = covers_psx .. romname_noExtension[1] .. ".png"
                            file.app_type=3

                            table.insert(psx_table, file)

                            if custom_path and System.doesFileExist(custom_path) then
                                img_path = covers_psx .. file.name .. ".png" --custom cover by app name
                            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                img_path = covers_psx .. file.name .. ".png" --custom cover by app id
                            else
                                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psx.png") then
                                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psx.png"  --app icon
                                else
                                    img_path = "app0:/DATA/noimg.png" --blank grey
                                end
                            end

                            table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
                            table.insert(files_table, 17, file.name_minus_ext)
                            table.insert(files_table, 17, file.name_rom_minus_region_ext)
                            table.insert(files_table, 17, file.name_rom_url_encoded)
                            table.insert(files_table, 17, file.name_rom_region)
                            table.insert(files_table, 17, file.name_title_search)

                            -- all games table
                            table.insert(all_games_table, 3, file)
                            file.app_type=3
                            file.name_minus_ext = romname_noExtension[1]
                            file.cover_path_online = onlineCoversPSX
                            file.cover_path_local = covers_psx

                        else
                            --DEFAULT
                            table.insert(folders_table, file)
                            --table.insert(games_table, file)
                            custom_path = covers_psp .. titleID_noHyphen[1] .. ".png"
                            custom_path_id = covers_psp .. titleID_noHyphen[1] .. ".png"
                            file.app_type=2

                            table.insert(psp_table, file)

                            if custom_path and System.doesFileExist(custom_path) then
                                img_path = covers_psp .. titleID_noHyphen[1] .. ".png" --custom cover by app name
                            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                img_path = covers_psp .. titleID_noHyphen[1] .. ".png" --custom cover by app id
                            else
                                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                                else
                                    img_path = "app0:/DATA/noimg.png" --blank grey
                                end
                            end

                            table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
                            table.insert(files_table, 17, file.name_minus_ext)
                            table.insert(files_table, 17, file.name_rom_minus_region_ext)
                            table.insert(files_table, 17, file.name_rom_url_encoded)
                            table.insert(files_table, 17, file.name_rom_region)
                            table.insert(files_table, 17, file.name_title_search)

                            -- all games table
                            table.insert(all_games_table, 2, file)
                            file.app_type=2
                            file.cover_path_online = onlineCoversPSP
                            file.cover_path_local = covers_psp
                        end

                    else
                        -- OVERRIDE NOT FOUND
                        table.insert(folders_table, file)
                        --table.insert(games_table, file)
                        custom_path = covers_psp .. titleID_noHyphen[1] .. ".png"
                        custom_path_id = covers_psp .. titleID_noHyphen[1] .. ".png"
                        file.app_type=2

                        table.insert(psp_table, file)

                        if custom_path and System.doesFileExist(custom_path) then
                            img_path = covers_psp .. titleID_noHyphen[1] .. ".png" --custom cover by app name
                        elseif custom_path_id and System.doesFileExist(custom_path_id) then
                            img_path = covers_psp .. titleID_noHyphen[1] .. ".png" --custom cover by app id
                        else
                            if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                            else
                                img_path = "app0:/DATA/noimg.png" --blank grey
                            end
                        end

                        table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
                        table.insert(files_table, 17, file.name_minus_ext)
                        table.insert(files_table, 17, file.name_rom_minus_region_ext)
                        table.insert(files_table, 17, file.name_rom_url_encoded)
                        table.insert(files_table, 17, file.name_rom_region)
                        table.insert(files_table, 17, file.name_title_search)

                        -- all games table
                        table.insert(all_games_table, 2, file)
                        file.app_type=2
                        file.cover_path_online = onlineCoversPSP
                        file.cover_path_local = covers_psp
                    end

                --add blank icon to all
                file.icon = imgCoverTmp
                file.icon_path = img_path
                
                table.insert(files_table, 17, file.icon) -- Increased for Retro (All systems + 1 for all view)
                
                file.apptitle = romname_noRegion_noExtension_noTitleID[1]
                table.insert(files_table, 17, file.apptitle) -- Increased for Retro (All systems + 1 for all view)

            end
        end
    end

    
    -- SCAN PSP - GAME FOLDER
    if  System.doesDirExist(romFolder_PSP_GAME) then

        files_PSP = System.listDirectory(romFolder_PSP_GAME)

        -- LOOKUP TITLE ID: Load saved table of previously macthes titleID's for faster name lookup

        if System.doesFileExist(user_DB_Folder .. "psp.lua") then
            database_rename_PSP = user_DB_Folder .. "psp.lua"
        else
            database_rename_PSP = "app0:addons/psp.lua"
        end

        for i, file in pairs(files_PSP) do
        local custom_path, custom_path_id, app_type, name_minus_ext, name_rom_minus_region_ext, name_rom_url_encoded, name_rom_region, name_title_search = nil, nil, nil, nil, nil, nil, nil, nil
            if file.directory and System.doesFileExist(romFolder_PSP_GAME .. "/" .. file.name .. "/EBOOT.PBP") then

                if string.match(file.name, "NPEG")
                or string.match(file.name, "NPEH")
                or string.match(file.name, "UCES")
                or string.match(file.name, "ULES")
                or string.match(file.name, "NPUG")
                or string.match(file.name, "NPUH")
                or string.match(file.name, "UCUS")
                or string.match(file.name, "ULUS")
                or string.match(file.name, "NPJG")
                or string.match(file.name, "NPJH")
                or string.match(file.name, "NPHG")
                or string.match(file.name, "NPHH")
                or string.match(file.name, "UCAS") then

                    file.launch_argument = ("PATH=ms0:/PSP/GAME/" .. file.name .. "/EBOOT.PBP")
                    file.game_path = (romFolder_PSP_GAME .. "/" .. file.name)

                    romname_withExtension = file.name
                    romname_noExtension = {}
                    romname_noExtension[1] = file.name

                        -- LOOKUP TITLE ID: Get game name based on titleID, search saved table of data, or full table of data if titleID not found

                        -- Load previous matches
                        pspdb = dofile(database_rename_PSP)

                        -- Check if scanned titleID is a saved match
                        psp_search = pspdb[romname_noExtension[1]]

                        -- If no
                        if psp_search == nil then

                            -- Load the full database to find the new titleID
                            pspdbfull = dofile("app0:addons/psp.lua")
                            psp_search_full = pspdbfull[romname_noExtension[1]]

                            -- If not found; use the folder name without adding a game name
                            if psp_search_full == nil then
                                title_full = romname_noExtension[1]

                            -- If found; use the game name from the full database 
                            else
                                title_full = pspdbfull[romname_noExtension[1]].name
                            end

                        -- If found; use the game name from the saved match
                        else
                            title_full = pspdb[romname_noExtension[1]].name
                        end

                    romname_noRegion_noExtension = {}
                    romname_noRegion_noExtension[1] = title_full:gsub(" %(", "%("):gsub('%b()', '')

                    -- Check if name contains parenthesis, if yes strip out to show as version
                    if string.find(title_full, "%(") then
                        -- Remove all text except for within "()"
                        romname_region_initial = {}
                        romname_region_initial[1] = title_full:match("%((.+)%)")

                        -- Tidy up remainder when more than one set of parenthesis used, replace  ") (" with ", "
                        romname_region = {}
                        romname_region[1] = romname_region_initial[1]:gsub("%) %(", ', ')
                    -- If no parenthesis, then add blank to prevent nil error
                    else
                        romname_region[1] = " "
                    end

                    --end of function

                    info = romname_noRegion_noExtension[1]
                    app_title = romname_noRegion_noExtension[1]
                    
                    table.insert(folders_table, file)
                    --table.insert(games_table, file)
                    custom_path = covers_psp .. romname_noExtension[1] .. ".png"
                    custom_path_id = covers_psp .. romname_noExtension[1] .. ".png"
                    file.app_type=3

                    file.name_minus_ext = romname_noExtension[1]
                    file.name_rom_minus_region_ext = romname_noRegion_noExtension[1]
                    file.name_rom_url_encoded = tostring(file.name)
                    file.name_rom_region = romname_region[1]
                    file.name_title_search = title_full
                    

                    table.insert(psp_table, file)

                    if custom_path and System.doesFileExist(custom_path) then
                        img_path = covers_psp .. file.name .. ".png" --custom cover by app name
                    elseif custom_path_id and System.doesFileExist(custom_path_id) then
                        img_path = covers_psp .. file.name .. ".png" --custom cover by app id
                    else
                        if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                            img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                        else
                            img_path = "app0:/DATA/noimg.png" --blank grey
                        end
                    end

                    table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
                    table.insert(files_table, 17, file.name_minus_ext)
                    table.insert(files_table, 17, file.name_rom_minus_region_ext)
                    table.insert(files_table, 17, file.name_rom_url_encoded)
                    table.insert(files_table, 17, file.name_rom_region)
                    table.insert(files_table, 17, file.name_title_search)

                    -- all games table
                    table.insert(all_games_table, 2, file)
                    file.app_type=2
                    file.name_minus_ext = romname_noExtension[1]
                    file.cover_path_online = onlineCoversPSP
                    file.cover_path_local = covers_psp

                    --add blank icon to all
                    file.icon = imgCoverTmp
                    file.icon_path = img_path
                    
                    table.insert(files_table, 17, file.icon) -- Increased for Retro (All systems + 1 for all view)
                    
                    file.apptitle = romname_noRegion_noExtension[1]
                    table.insert(files_table, 17, file.apptitle) -- Increased for Retro (All systems + 1 for all view)
                else
                end
                
            end
        end

        -- LOOKUP TITLE ID: Delete old file and save new list of matches
        if not System.doesFileExist(user_DB_Folder .. "psp.lua") then
            CreateUserTitleTable_PSP()
        else
            System.deleteFile(user_DB_Folder .. "psp.lua")
            CreateUserTitleTable_PSP()
        end

    end



    -- SCAN PS1 - GAME FOLDER
    if  System.doesDirExist(romFolder_PSP_GAME) then

        files_PSX = System.listDirectory(romFolder_PSP_GAME)

        -- LOOKUP TITLE ID: Load saved table of previously macthes titleID's for faster name lookup

        if System.doesFileExist(user_DB_Folder .. "psx.lua") then
            database_rename_PSX = user_DB_Folder .. "psx.lua"
        else
            database_rename_PSX = "app0:addons/psx.lua"
        end

        for i, file in pairs(files_PSX) do
        local custom_path, custom_path_id, app_type, name_minus_ext, name_rom_minus_region_ext, name_rom_url_encoded, name_rom_region, name_title_search = nil, nil, nil, nil, nil, nil, nil, nil
            if file.directory and System.doesFileExist(romFolder_PSP_GAME .. "/" .. file.name .. "/EBOOT.PBP") then

                if not string.match(file.name, "NPEG")
                and not string.match(file.name, "NPEH")
                and not string.match(file.name, "UCES")
                and not string.match(file.name, "ULES")
                and not string.match(file.name, "NPUG")
                and not string.match(file.name, "NPUH")
                and not string.match(file.name, "UCUS")
                and not string.match(file.name, "ULUS")
                and not string.match(file.name, "NPJG")
                and not string.match(file.name, "NPJH")
                and not string.match(file.name, "NPHG")
                and not string.match(file.name, "NPHH")
                and not string.match(file.name, "UCAS") then

                    file.launch_argument = ("PATH=ms0:/PSP/GAME/" .. file.name .. "/EBOOT.PBP")
                    file.game_path = (romFolder_PSP_GAME .. "/" .. file.name)

                    romname_withExtension = file.name
                    romname_noExtension = {}
                    romname_noExtension[1] = file.name

                        -- LOOKUP TITLE ID: Get game name based on titleID, search saved table of data, or full table of data if titleID not found

                        -- Load previous matches
                        psxdb = dofile(database_rename_PSX)

                        -- Check if scanned titleID is a saved match
                        psx_search = psxdb[romname_noExtension[1]]

                        -- If no
                        if psx_search == nil then

                            -- Load the full database to find the new titleID
                            psxdbfull = dofile("app0:addons/psx.lua")
                            psx_search_full = psxdbfull[romname_noExtension[1]]

                            -- If not found; use the folder name without adding a game name
                            if psx_search_full == nil then
                                title_full = romname_noExtension[1]

                            -- If found; use the game name from the full database 
                            else
                                title_full = psxdbfull[romname_noExtension[1]].name
                            end

                        -- If found; use the game name from the saved match
                        else
                            title_full = psxdb[romname_noExtension[1]].name
                        end

                    romname_noRegion_noExtension = {}
                    romname_noRegion_noExtension[1] = title_full:gsub(" %(", "%("):gsub('%b()', '')

                    -- Check if name contains parenthesis, if yes strip out to show as version
                    if string.find(title_full, "%(") then
                        -- Remove all text except for within "()"
                        romname_region_initial = {}
                        romname_region_initial[1] = title_full:match("%((.+)%)")

                        -- Tidy up remainder when more than one set of parenthesis used, replace  ") (" with ", "
                        romname_region = {}
                        romname_region[1] = romname_region_initial[1]:gsub("%) %(", ', ')
                    -- If no parenthesis, then add blank to prevent nil error
                    else
                        romname_region[1] = " "
                    end

                    --end of function

                    info = romname_noRegion_noExtension[1]
                    app_title = romname_noRegion_noExtension[1]

                    file.name_minus_ext = romname_noExtension[1]
                    file.name_rom_minus_region_ext = romname_noRegion_noExtension[1]
                    file.name_rom_url_encoded = tostring(file.name)
                    file.name_rom_region = romname_region[1]
                    file.name_title_search = title_full
                    

                    --CHECK FOR OVERRIDDEN CATEGORY of PS1 game
                    if System.doesFileExist(cur_dir .. "/overrides.dat") then

                        -- P1 = PS1, P2 = PSP
                        if string.match(str, file.name .. "=P2") then
                            
                            -- PSP
                            table.insert(folders_table, file)
                            --table.insert(games_table, file)
                            custom_path = covers_psp .. romname_noExtension[1] .. ".png"
                            custom_path_id = covers_psp .. romname_noExtension[1] .. ".png"
                            file.app_type=2

                            table.insert(psp_table, file)

                            if custom_path and System.doesFileExist(custom_path) then
                                img_path = covers_psp .. romname_noExtension[1] .. ".png" --custom cover by app name
                            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                img_path = covers_psp .. romname_noExtension[1] .. ".png" --custom cover by app id
                            else
                                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psp.png") then
                                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psp.png"  --app icon
                                else
                                    img_path = "app0:/DATA/noimg.png" --blank grey
                                end
                            end

                            table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
                            table.insert(files_table, 17, file.name_minus_ext)
                            table.insert(files_table, 17, file.name_rom_minus_region_ext)
                            table.insert(files_table, 17, file.name_rom_url_encoded)
                            table.insert(files_table, 17, file.name_rom_region)
                            table.insert(files_table, 17, file.name_title_search)

                            -- all games table
                            table.insert(all_games_table, 2, file)
                            file.app_type=2
                            file.cover_path_online = onlineCoversPSP
                            file.cover_path_local = covers_psp

                        else
                            --DEFAULT
                            table.insert(folders_table, file)
                            --table.insert(games_table, file)
                            custom_path = covers_psx .. romname_noExtension[1] .. ".png"
                            custom_path_id = covers_psx .. romname_noExtension[1] .. ".png"
                            file.app_type=3

                            table.insert(psx_table, file)

                            if custom_path and System.doesFileExist(custom_path) then
                                img_path = covers_psx .. file.name .. ".png" --custom cover by app name
                            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                                img_path = covers_psx .. file.name .. ".png" --custom cover by app id
                            else
                                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psx.png") then
                                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psx.png"  --app icon
                                else
                                    img_path = "app0:/DATA/noimg.png" --blank grey
                                end
                            end

                            table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
                            table.insert(files_table, 17, file.name_minus_ext)
                            table.insert(files_table, 17, file.name_rom_minus_region_ext)
                            table.insert(files_table, 17, file.name_rom_url_encoded)
                            table.insert(files_table, 17, file.name_rom_region)
                            table.insert(files_table, 17, file.name_title_search)

                            -- all games table
                            table.insert(all_games_table, 3, file)
                            file.app_type=3
                            file.name_minus_ext = romname_noExtension[1]
                            file.cover_path_online = onlineCoversPSX
                            file.cover_path_local = covers_psx
                        end

                    else
                        -- OVERRIDE NOT FOUND
                        table.insert(folders_table, file)
                        --table.insert(games_table, file)
                        custom_path = covers_psx .. romname_noExtension[1] .. ".png"
                        custom_path_id = covers_psx .. romname_noExtension[1] .. ".png"
                        file.app_type=3

                        table.insert(psx_table, file)

                        if custom_path and System.doesFileExist(custom_path) then
                            img_path = covers_psx .. file.name .. ".png" --custom cover by app name
                        elseif custom_path_id and System.doesFileExist(custom_path_id) then
                            img_path = covers_psx .. file.name .. ".png" --custom cover by app id
                        else
                            if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_psx.png") then
                                img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_psx.png"  --app icon
                            else
                                img_path = "app0:/DATA/noimg.png" --blank grey
                            end
                        end

                        table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
                        table.insert(files_table, 17, file.name_minus_ext)
                        table.insert(files_table, 17, file.name_rom_minus_region_ext)
                        table.insert(files_table, 17, file.name_rom_url_encoded)
                        table.insert(files_table, 17, file.name_rom_region)
                        table.insert(files_table, 17, file.name_title_search)

                        -- all games table
                        table.insert(all_games_table, 3, file)
                        file.app_type=3
                        file.name_minus_ext = romname_noExtension[1]
                        file.cover_path_online = onlineCoversPSX
                        file.cover_path_local = covers_psx
                    end

                    --add blank icon to all
                    file.icon = imgCoverTmp
                    file.icon_path = img_path
                    
                    table.insert(files_table, 17, file.icon) -- Increased for Retro (All systems + 1 for all view)
                    
                    file.apptitle = romname_noRegion_noExtension[1]
                    table.insert(files_table, 17, file.apptitle) -- Increased for Retro (All systems + 1 for all view)
                else
                end

                
            end
        end

        -- LOOKUP TITLE ID: Delete old file and save new list of matches
        if not System.doesFileExist(user_DB_Folder .. "psx.lua") then
            CreateUserTitleTable_PSX()
        else
            System.deleteFile(user_DB_Folder .. "psx.lua")
            CreateUserTitleTable_PSX()
        end

    end


    -- SCAN N64
    files_N64 = System.listDirectory(romFolder_N64)
    for i, file in pairs(files_N64) do
    local custom_path, custom_path_id, app_type, name_minus_ext, name_rom_minus_region_ext, name_rom_url_encoded, name_rom_region = nil, nil, nil, nil, nil, nil, nil
        -- Scan files only, ignore temporary files, Windows = "Thumbs.db", Mac = "DS_Store", and "._name" 
        if not file.directory and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

            file.game_path = (romFolder_N64 .. "/" .. file.name)

            romname_withExtension = file.name
            cleanRomNames()
            info = romname_noRegion_noExtension[1]
            app_title = romname_noExtension[1]
            
            table.insert(folders_table, file)
            --table.insert(games_table, file)
            custom_path = covers_N64 .. romname_noExtension[1] .. ".png"
            custom_path_id = covers_N64 .. romname_noExtension[1] .. ".png"
            file.app_type=5

            file.name_minus_ext = romname_noExtension[1]
            file.name_rom_minus_region_ext = romname_noRegion_noExtension[1]
            file.name_rom_url_encoded = romname_url_encoded[1]
            file.name_rom_region = romname_region[1]

            table.insert(n64_table, file)

            if custom_path and System.doesFileExist(custom_path) then
                img_path = covers_N64 .. romname_noExtension[1] .. ".png" --custom cover by app name
            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                img_path = covers_N64 .. romname_noExtension[1] .. ".png" --custom cover by app id
            else
                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_n64.png") then
                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_n64.png"  --app icon
                else
                    img_path = "app0:/DATA/noimg.png" --blank grey
                end
            end

            table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
            table.insert(files_table, 17, file.name_minus_ext)
            table.insert(files_table, 17, file.name_rom_minus_region_ext)
            table.insert(files_table, 17, file.name_rom_url_encoded)
            table.insert(files_table, 17, file.name_rom_region)

            -- all games table
            table.insert(all_games_table, 4, file)
            file.app_type=5
            file.cover_path_online = onlineCoversN64
            file.cover_path_local = covers_N64

            --add blank icon to all
            file.icon = imgCoverTmp
            file.icon_path = img_path
            
            table.insert(files_table, 17, file.icon) -- Increased for Retro (All systems + 1 for all view)
            
            file.apptitle = romname_noExtension[1]
            table.insert(files_table, 17, file.apptitle) -- Increased for Retro (All systems + 1 for all view)

        end
    end



    -- SCAN SNES
    files_SNES = System.listDirectory(romFolder_SNES)
    for i, file in pairs(files_SNES) do
    local custom_path, custom_path_id, app_type, name_minus_ext, name_rom_minus_region_ext, name_rom_url_encoded, name_rom_region = nil, nil, nil, nil, nil, nil, nil
        -- Scan files only, ignore temporary files, Windows = "Thumbs.db", Mac = "DS_Store", and "._name" 
        if not file.directory and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

            file.game_path = (romFolder_SNES .. "/" .. file.name)

            romname_withExtension = file.name
            cleanRomNames()
            info = romname_noRegion_noExtension[1]
            app_title = romname_noExtension[1]
            
            table.insert(folders_table, file)
            --table.insert(games_table, file)
            custom_path = covers_SNES .. romname_noExtension[1] .. ".png"
            custom_path_id = covers_SNES .. romname_noExtension[1] .. ".png"
            file.app_type=6

            file.name_minus_ext = romname_noExtension[1]
            file.name_rom_minus_region_ext = romname_noRegion_noExtension[1]
            file.name_rom_url_encoded = romname_url_encoded[1]
            file.name_rom_region = romname_region[1]

            table.insert(snes_table, file)

            if custom_path and System.doesFileExist(custom_path) then
                img_path = covers_SNES .. romname_noExtension[1] .. ".png" --custom cover by app name
            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                img_path = covers_SNES .. romname_noExtension[1] .. ".png" --custom cover by app id
            else
                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_snes.png") then
                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_snes.png"  --app icon
                else
                    img_path = "app0:/DATA/noimg.png" --blank grey
                end
            end

            table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
            table.insert(files_table, 17, file.name_minus_ext)
            table.insert(files_table, 17, file.name_rom_minus_region_ext)
            table.insert(files_table, 17, file.name_rom_url_encoded)
            table.insert(files_table, 17, file.name_rom_region)

            -- all games table
            table.insert(all_games_table, 5, file)
            file.app_type=6
            file.cover_path_online = onlineCoversSNES
            file.cover_path_local = covers_SNES

            --add blank icon to all
            file.icon = imgCoverTmp
            file.icon_path = img_path
            
            table.insert(files_table, 17, file.icon) -- Increased for Retro (All systems + 1 for all view)
            
            file.apptitle = romname_noExtension[1]
            table.insert(files_table, 17, file.apptitle) -- Increased for Retro (All systems + 1 for all view)

        end
    end


    -- SCAN NES
    files_NES = System.listDirectory(romFolder_NES)
    for i, file in pairs(files_NES) do
    local custom_path, custom_path_id, app_type, name_minus_ext, name_rom_minus_region_ext, name_rom_url_encoded, name_rom_region = nil, nil, nil, nil, nil, nil, nil
        -- Scan files only, ignore temporary files, Windows = "Thumbs.db", Mac = "DS_Store", and "._name" 
        if not file.directory and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

            file.game_path = (romFolder_NES .. "/" .. file.name)

            romname_withExtension = file.name
            cleanRomNames()
            info = romname_noRegion_noExtension[1]
            app_title = romname_noExtension[1]
            
            table.insert(folders_table, file)
            --table.insert(games_table, file)
            custom_path = covers_NES .. romname_noExtension[1] .. ".png"
            custom_path_id = covers_NES .. romname_noExtension[1] .. ".png"
            file.app_type=7

            file.name_minus_ext = romname_noExtension[1]
            file.name_rom_minus_region_ext = romname_noRegion_noExtension[1]
            file.name_rom_url_encoded = romname_url_encoded[1]
            file.name_rom_region = romname_region[1]

            table.insert(nes_table, file)

            if custom_path and System.doesFileExist(custom_path) then
                img_path = covers_NES .. romname_noExtension[1] .. ".png" --custom cover by app name
            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                img_path = covers_NES .. romname_noExtension[1] .. ".png" --custom cover by app id
            else
                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_nes.png") then
                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_nes.png"  --app icon
                else
                    img_path = "app0:/DATA/noimg.png" --blank grey
                end
            end

            table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
            table.insert(files_table, 17, file.name_minus_ext)
            table.insert(files_table, 17, file.name_rom_minus_region_ext)
            table.insert(files_table, 17, file.name_rom_url_encoded)
            table.insert(files_table, 17, file.name_rom_region)

            -- all games table
            table.insert(all_games_table, 6, file)
            file.app_type=7
            file.cover_path_online = onlineCoversNES
            file.cover_path_local = covers_NES

            --add blank icon to all
            file.icon = imgCoverTmp
            file.icon_path = img_path
            
            table.insert(files_table, 17, file.icon) -- Increased for Retro (All systems + 1 for all view)
            
            file.apptitle = romname_noExtension[1]
            table.insert(files_table, 17, file.apptitle) -- Increased for Retro (All systems + 1 for all view)

        end
    end


    -- SCAN GBA
    files_GBA = System.listDirectory(romFolder_GBA)
    for i, file in pairs(files_GBA) do
    local custom_path, custom_path_id, app_type, name_minus_ext, name_rom_minus_region_ext, name_rom_url_encoded, name_rom_region = nil, nil, nil, nil, nil, nil, nil
        -- Scan files only, ignore temporary files, Windows = "Thumbs.db", Mac = "DS_Store", and "._name" 
        if not file.directory and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

            file.game_path = (romFolder_GBA .. "/" .. file.name)

            romname_withExtension = file.name
            cleanRomNames()
            info = romname_noRegion_noExtension[1]
            app_title = romname_noExtension[1]
            
            table.insert(folders_table, file)
            --table.insert(games_table, file)
            custom_path = covers_GBA .. romname_noExtension[1] .. ".png"
            custom_path_id = covers_GBA .. romname_noExtension[1] .. ".png"
            file.app_type=8

            file.name_minus_ext = romname_noExtension[1]
            file.name_rom_minus_region_ext = romname_noRegion_noExtension[1]
            file.name_rom_url_encoded = romname_url_encoded[1]
            file.name_rom_region = romname_region[1]

            table.insert(gba_table, file)

            if custom_path and System.doesFileExist(custom_path) then
                img_path = covers_GBA .. romname_noExtension[1] .. ".png" --custom cover by app name
            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                img_path = covers_GBA .. romname_noExtension[1] .. ".png" --custom cover by app id
            else
                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_gba.png") then
                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_gba.png"  --app icon
                else
                    img_path = "app0:/DATA/noimg.png" --blank grey
                end
            end

            table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
            table.insert(files_table, 17, file.name_minus_ext)
            table.insert(files_table, 17, file.name_rom_minus_region_ext)
            table.insert(files_table, 17, file.name_rom_url_encoded)
            table.insert(files_table, 17, file.name_rom_region)

            -- all games table
            table.insert(all_games_table, 7, file)
            file.app_type=8
            file.cover_path_online = onlineCoversGBA
            file.cover_path_local = covers_GBA

            --add blank icon to all
            file.icon = imgCoverTmp
            file.icon_path = img_path
            
            table.insert(files_table, 17, file.icon) -- Increased for Retro (All systems + 1 for all view)
            
            file.apptitle = romname_noExtension[1]
            table.insert(files_table, 17, file.apptitle) -- Increased for Retro (All systems + 1 for all view)

        end
    end


    -- SCAN GBC
    files_GBC = System.listDirectory(romFolder_GBC)
    for i, file in pairs(files_GBC) do
    local custom_path, custom_path_id, app_type, name_minus_ext, name_rom_minus_region_ext, name_rom_url_encoded, name_rom_region = nil, nil, nil, nil, nil, nil, nil
        -- Scan files only, ignore temporary files, Windows = "Thumbs.db", Mac = "DS_Store", and "._name" 
        if not file.directory and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

            file.game_path = (romFolder_GBC .. "/" .. file.name)

            romname_withExtension = file.name
            cleanRomNames()
            info = romname_noRegion_noExtension[1]
            app_title = romname_noExtension[1]
            
            table.insert(folders_table, file)
            --table.insert(games_table, file)
            custom_path = covers_GBC .. romname_noExtension[1] .. ".png"
            custom_path_id = covers_GBC .. romname_noExtension[1] .. ".png"
            file.app_type=9

            file.name_minus_ext = romname_noExtension[1]
            file.name_rom_minus_region_ext = romname_noRegion_noExtension[1]
            file.name_rom_url_encoded = romname_url_encoded[1]
            file.name_rom_region = romname_region[1]

            table.insert(gbc_table, file)

            if custom_path and System.doesFileExist(custom_path) then
                img_path = covers_GBC .. romname_noExtension[1] .. ".png" --custom cover by app name
            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                img_path = covers_GBC .. romname_noExtension[1] .. ".png" --custom cover by app id
            else
                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_gbc.png") then
                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_gbc.png"  --app icon
                else
                    img_path = "app0:/DATA/noimg.png" --blank grey
                end
            end

            table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
            table.insert(files_table, 17, file.name_minus_ext)
            table.insert(files_table, 17, file.name_rom_minus_region_ext)
            table.insert(files_table, 17, file.name_rom_url_encoded)
            table.insert(files_table, 17, file.name_rom_region)

            -- all games table
            table.insert(all_games_table, 8, file)
            file.app_type=9
            file.cover_path_online = onlineCoversGBC
            file.cover_path_local = covers_GBC

            --add blank icon to all
            file.icon = imgCoverTmp
            file.icon_path = img_path
            
            table.insert(files_table, 17, file.icon) -- Increased for Retro (All systems + 1 for all view)
            
            file.apptitle = romname_noExtension[1]
            table.insert(files_table, 17, file.apptitle) -- Increased for Retro (All systems + 1 for all view)

        end
    end


    -- SCAN GB
    files_GB = System.listDirectory(romFolder_GB)
    for i, file in pairs(files_GB) do
    local custom_path, custom_path_id, app_type, name_minus_ext, name_rom_minus_region_ext, name_rom_url_encoded, name_rom_region = nil, nil, nil, nil, nil, nil, nil
        -- Scan files only, ignore temporary files, Windows = "Thumbs.db", Mac = "DS_Store", and "._name" 
        if not file.directory and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

            file.game_path = (romFolder_GB .. "/" .. file.name)

            romname_withExtension = file.name
            cleanRomNames()
            info = romname_noRegion_noExtension[1]
            app_title = romname_noExtension[1]
            
            table.insert(folders_table, file)
            --table.insert(games_table, file)
            custom_path = covers_GB .. romname_noExtension[1] .. ".png"
            custom_path_id = covers_GB .. romname_noExtension[1] .. ".png"
            file.app_type=10

            file.name_minus_ext = romname_noExtension[1]
            file.name_rom_minus_region_ext = romname_noRegion_noExtension[1]
            file.name_rom_url_encoded = romname_url_encoded[1]
            file.name_rom_region = romname_region[1]

            table.insert(gb_table, file)

            if custom_path and System.doesFileExist(custom_path) then
                img_path = covers_GB .. romname_noExtension[1] .. ".png" --custom cover by app name
            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                img_path = covers_GB .. romname_noExtension[1] .. ".png" --custom cover by app id
            else
                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_gb.png") then
                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_gb.png"  --app icon
                else
                    img_path = "app0:/DATA/noimg.png" --blank grey
                end
            end

            table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
            table.insert(files_table, 17, file.name_minus_ext)
            table.insert(files_table, 17, file.name_rom_minus_region_ext)
            table.insert(files_table, 17, file.name_rom_url_encoded)
            table.insert(files_table, 17, file.name_rom_region)

            -- all games table
            table.insert(all_games_table, 9, file)
            file.app_type=10
            file.cover_path_online = onlineCoversGB
            file.cover_path_local = covers_GB

            --add blank icon to all
            file.icon = imgCoverTmp
            file.icon_path = img_path
            
            table.insert(files_table, 17, file.icon) -- Increased for Retro (All systems + 1 for all view)
            
            file.apptitle = romname_noExtension[1]
            table.insert(files_table, 17, file.apptitle) -- Increased for Retro (All systems + 1 for all view)

        end
    end


    -- SCAN MD
    files_MD = System.listDirectory(romFolder_MD)
    for i, file in pairs(files_MD) do
    local custom_path, custom_path_id, app_type, name_minus_ext, name_rom_minus_region_ext, name_rom_url_encoded, name_rom_region = nil, nil, nil, nil, nil, nil, nil
        -- Scan files only, ignore temporary files, Windows = "Thumbs.db", Mac = "DS_Store", and "._name" 
        if not file.directory and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

            file.game_path = (romFolder_MD .. "/" .. file.name)

            romname_withExtension = file.name
            cleanRomNames()
            info = romname_noRegion_noExtension[1]
            app_title = romname_noExtension[1]
            
            table.insert(folders_table, file)
            --table.insert(games_table, file)
            custom_path = covers_MD .. romname_noExtension[1] .. ".png"
            custom_path_id = covers_MD .. romname_noExtension[1] .. ".png"
            file.app_type=11

            file.name_minus_ext = romname_noExtension[1]
            file.name_rom_minus_region_ext = romname_noRegion_noExtension[1]
            file.name_rom_url_encoded = romname_url_encoded[1]
            file.name_rom_region = romname_region[1]

            table.insert(md_table, file)

            if custom_path and System.doesFileExist(custom_path) then
                img_path = covers_MD .. romname_noExtension[1] .. ".png" --custom cover by app name
            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                img_path = covers_MD .. romname_noExtension[1] .. ".png" --custom cover by app id
            else
                if setLanguage == 1 then
                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_md_usa.png") then
                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_md_usa.png"  --app icon
                    else
                        img_path = "app0:/DATA/noimg.png" --blank grey
                    end
                else
                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_md.png") then
                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_md.png"  --app icon
                    else
                        img_path = "app0:/DATA/noimg.png" --blank grey
                    end
                end
            end

            table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
            table.insert(files_table, 17, file.name_minus_ext)
            table.insert(files_table, 17, file.name_rom_minus_region_ext)
            table.insert(files_table, 17, file.name_rom_url_encoded)
            table.insert(files_table, 17, file.name_rom_region)

            -- all games table
            table.insert(all_games_table, file)
            file.app_type=11
            file.cover_path_online = onlineCoversMD
            file.cover_path_local = covers_MD

            --add blank icon to all
            file.icon = imgCoverTmp
            file.icon_path = img_path
            
            table.insert(files_table, 17, file.icon) -- Increased for Retro (All systems + 1 for all view)
            
            file.apptitle = romname_noExtension[1]
            table.insert(files_table, 17, file.apptitle) -- Increased for Retro (All systems + 1 for all view)

        end
    end


    -- SCAN SMS
    files_SMS = System.listDirectory(romFolder_SMS)
    for i, file in pairs(files_SMS) do
    local custom_path, custom_path_id, app_type, name_minus_ext, name_rom_minus_region_ext, name_rom_url_encoded, name_rom_region = nil, nil, nil, nil, nil, nil, nil
        -- Scan files only, ignore temporary files, Windows = "Thumbs.db", Mac = "DS_Store", and "._name" 
        if not file.directory and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

            file.game_path = (romFolder_SMS .. "/" .. file.name)

            romname_withExtension = file.name
            cleanRomNames()
            info = romname_noRegion_noExtension[1]
            app_title = romname_noExtension[1]
            
            table.insert(folders_table, file)
            --table.insert(games_table, file)
            custom_path = covers_SMS .. romname_noExtension[1] .. ".png"
            custom_path_id = covers_SMS .. romname_noExtension[1] .. ".png"
            file.app_type=12

            file.name_minus_ext = romname_noExtension[1]
            file.name_rom_minus_region_ext = romname_noRegion_noExtension[1]
            file.name_rom_url_encoded = romname_url_encoded[1]
            file.name_rom_region = romname_region[1]

            table.insert(sms_table, file)

            if custom_path and System.doesFileExist(custom_path) then
                img_path = covers_SMS .. romname_noExtension[1] .. ".png" --custom cover by app name
            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                img_path = covers_SMS .. romname_noExtension[1] .. ".png" --custom cover by app id
            else
                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_sms.png") then
                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_sms.png"  --app icon
                else
                    img_path = "app0:/DATA/noimg.png" --blank grey
                end
            end

            table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
            table.insert(files_table, 17, file.name_minus_ext)
            table.insert(files_table, 17, file.name_rom_minus_region_ext)
            table.insert(files_table, 17, file.name_rom_url_encoded)
            table.insert(files_table, 17, file.name_rom_region)

            -- all games table
            table.insert(all_games_table, 11, file)
            file.app_type=12
            file.cover_path_online = onlineCoversSMS
            file.cover_path_local = covers_SMS

            --add blank icon to all
            file.icon = imgCoverTmp
            file.icon_path = img_path
            
            table.insert(files_table, 17, file.icon) -- Increased for Retro (All systems + 1 for all view)
            
            file.apptitle = romname_noExtension[1]
            table.insert(files_table, 17, file.apptitle) -- Increased for Retro (All systems + 1 for all view)

        end
    end


    -- SCAN GG
    files_GG = System.listDirectory(romFolder_GG)
    for i, file in pairs(files_GG) do
    local custom_path, custom_path_id, app_type, name_minus_ext, name_rom_minus_region_ext, name_rom_url_encoded, name_rom_region = nil, nil, nil, nil, nil, nil, nil
        -- Scan files only, ignore temporary files, Windows = "Thumbs.db", Mac = "DS_Store", and "._name" 
        if not file.directory and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

            file.game_path = (romFolder_GG .. "/" .. file.name)

            romname_withExtension = file.name
            cleanRomNames()
            info = romname_noRegion_noExtension[1]
            app_title = romname_noExtension[1]
            
            table.insert(folders_table, file)
            --table.insert(games_table, file)
            custom_path = covers_GG .. romname_noExtension[1] .. ".png"
            custom_path_id = covers_GG .. romname_noExtension[1] .. ".png"
            file.app_type=13

            file.name_minus_ext = romname_noExtension[1]
            file.name_rom_minus_region_ext = romname_noRegion_noExtension[1]
            file.name_rom_url_encoded = romname_url_encoded[1]
            file.name_rom_region = romname_region[1]

            table.insert(gg_table, file)

            if custom_path and System.doesFileExist(custom_path) then
                img_path = covers_GG .. romname_noExtension[1] .. ".png" --custom cover by app name
            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                img_path = covers_GG .. romname_noExtension[1] .. ".png" --custom cover by app id
            else
                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_gg.png") then
                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_gg.png"  --app icon
                else
                    img_path = "app0:/DATA/noimg.png" --blank grey
                end
            end

            table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
            table.insert(files_table, 17, file.name_minus_ext)
            table.insert(files_table, 17, file.name_rom_minus_region_ext)
            table.insert(files_table, 17, file.name_rom_url_encoded)
            table.insert(files_table, 17, file.name_rom_region)

            -- all games table
            table.insert(all_games_table, 12, file)
            file.app_type=13
            file.cover_path_online = onlineCoversGG
            file.cover_path_local = covers_GG

            --add blank icon to all
            file.icon = imgCoverTmp
            file.icon_path = img_path
            
            table.insert(files_table, 17, file.icon) -- Increased for Retro (All systems + 1 for all view)
            
            file.apptitle = romname_noExtension[1]
            table.insert(files_table, 17, file.apptitle) -- Increased for Retro (All systems + 1 for all view)

        end
    end

    -- SCAN MAME
    if  System.doesDirExist(romFolder_MAME_2000) then

        files_MAME = System.listDirectory(romFolder_MAME_2000)

        -- LOOKUP TITLE ID: Load saved table of previously macthes titleID's for faster name lookup

        if System.doesFileExist(user_DB_Folder .. "mame.lua") then
            database_rename_MAME = user_DB_Folder .. "mame.lua"
        else
            database_rename_MAME = "app0:addons/mame.lua"
        end

        for i, file in pairs(files_MAME) do
        local custom_path, custom_path_id, app_type, name_minus_ext, name_rom_minus_region_ext, name_rom_url_encoded, name_rom_region, name_title_search = nil, nil, nil, nil, nil, nil, nil, nil
            -- Scan files only, ignore temporary files, Windows = "Thumbs.db", Mac = "DS_Store", and "._name" 
        if not file.directory and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

                file.game_path = (romFolder_MAME_2000 .. "/" .. file.name)

                romname_withExtension = file.name
                romname_noExtension = {}
                romname_noExtension[1] = romname_withExtension:match("(.+)%..+$")

                    -- LOOKUP TITLE ID: Get game name based on titleID, search saved table of data, or full table of data if titleID not found

                    -- Load previous matches
                    mamedb = dofile(database_rename_MAME)

                    -- Check if scanned titleID is a saved match
                    mame_search = mamedb[romname_noExtension[1]]

                    -- If no
                    if mame_search == nil then

                        -- Load the full database to find the new titleID
                        mamedbfull = dofile("app0:addons/mame.lua")
                        mame_search_full = mamedbfull[romname_noExtension[1]]

                        -- If not found; use the folder name without adding a game name
                        if mame_search_full == nil then
                            title_full = romname_noExtension[1]

                        -- If found; use the game name from the full database 
                        else
                            title_full = mamedbfull[romname_noExtension[1]].name
                        end

                    -- If found; use the game name from the saved match
                    else
                        title_full = mamedb[romname_noExtension[1]].name
                    end

                romname_noRegion_noExtension = {}
                romname_noRegion_noExtension[1] = title_full:gsub('%b()', '')

                -- Check if name contains parenthesis, if yes strip out to show as version
                if string.find(title_full, "%(") then
                    -- Remove all text except for within "()"
                    romname_region_initial = {}
                    romname_region_initial[1] = title_full:match("%((.+)%)")

                    -- Tidy up remainder when more than one set of parenthesis used, replace  ") (" with ", "
                    romname_region = {}
                    romname_region[1] = romname_region_initial[1]:gsub("%) %(", ', ')
                -- If no parenthesis, then add blank to prevent nil error
                else
                    romname_region[1] = " "
                end

                --end of function

                info = romname_noRegion_noExtension[1]
                app_title = romname_noRegion_noExtension[1]
                
                table.insert(folders_table, file)
                --table.insert(games_table, file)
                custom_path = covers_MAME .. romname_noExtension[1] .. ".png"
                custom_path_id = covers_MAME .. romname_noExtension[1] .. ".png"
                file.app_type=14

                file.name_minus_ext = romname_noExtension[1]
                file.name_rom_minus_region_ext = romname_noRegion_noExtension[1]
                file.name_rom_url_encoded = romname_noExtension[1]
                file.name_rom_region = romname_region[1]
                file.name_title_search = title_full
                

                table.insert(mame_table, file)

                if custom_path and System.doesFileExist(custom_path) then
                    img_path = covers_MAME .. romname_noExtension[1] .. ".png" --custom cover by app name
                elseif custom_path_id and System.doesFileExist(custom_path_id) then
                    img_path = covers_MAME .. romname_noExtension[1] .. ".png" --custom cover by app id
                else
                    if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_mame.png") then
                        img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_mame.png"  --app icon
                    else
                        img_path = "app0:/DATA/noimg.png" --blank grey
                    end
                end

                table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
                table.insert(files_table, 17, file.name_minus_ext)
                table.insert(files_table, 17, file.name_rom_minus_region_ext)
                table.insert(files_table, 17, file.name_rom_url_encoded)
                table.insert(files_table, 17, file.name_rom_region)
                table.insert(files_table, 17, file.name_title_search)

                -- all games table
                table.insert(all_games_table, 13, file)
                file.app_type=14
                file.name_minus_ext = romname_noExtension[1]
                file.cover_path_online = onlineCoversMAME
                file.cover_path_local = covers_MAME

                --add blank icon to all
                file.icon = imgCoverTmp
                file.icon_path = img_path
                
                table.insert(files_table, 17, file.icon) -- Increased for Retro (All systems + 1 for all view)
                
                file.apptitle = romname_noRegion_noExtension[1]
                table.insert(files_table, 17, file.apptitle) -- Increased for Retro (All systems + 1 for all view)

                
            end
        end

        -- LOOKUP TITLE ID: Delete old file and save new list of matches
        if not System.doesFileExist(user_DB_Folder .. "mame.lua") then
            CreateUserTitleTable_MAME()
        else
            System.deleteFile(user_DB_Folder .. "mame.lua")
            CreateUserTitleTable_MAME()
        end

    end


    -- SCAN AMIGA
    files_AMIGA = System.listDirectory(romFolder_AMIGA)
    for i, file in pairs(files_AMIGA) do
    local custom_path, custom_path_id, app_type, name_minus_ext, name_rom_minus_region_ext, name_rom_url_encoded, name_rom_region = nil, nil, nil, nil, nil, nil, nil
        -- Scan files only, ignore temporary files, Windows = "Thumbs.db", Mac = "DS_Store", and "._name" 
        if not file.directory and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

            file.game_path = (romFolder_AMIGA .. "/" .. file.name)

            romname_withExtension = file.name
            cleanRomNames()
            info = romname_noRegion_noExtension[1]
            app_title = romname_noExtension[1]
            
            table.insert(folders_table, file)
            --table.insert(games_table, file)
            custom_path = covers_AMIGA .. romname_noExtension[1] .. ".png"
            custom_path_id = covers_AMIGA .. romname_noExtension[1] .. ".png"
            file.app_type=15

            file.name_minus_ext = romname_noExtension[1]
            file.name_rom_minus_region_ext = romname_noRegion_noExtension[1]
            file.name_rom_url_encoded = romname_url_encoded[1]
            file.name_rom_region = romname_region[1]

            table.insert(amiga_table, file)

            if custom_path and System.doesFileExist(custom_path) then
                img_path = covers_AMIGA .. romname_noExtension[1] .. ".png" --custom cover by app name
            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                img_path = covers_AMIGA .. romname_noExtension[1] .. ".png" --custom cover by app id
            else
                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_amiga.png") then
                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_amiga.png"  --app icon
                else
                    img_path = "app0:/DATA/noimg.png" --blank grey
                end
            end

            table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
            table.insert(files_table, 17, file.name_minus_ext)
            table.insert(files_table, 17, file.name_rom_minus_region_ext)
            table.insert(files_table, 17, file.name_rom_url_encoded)
            table.insert(files_table, 17, file.name_rom_region)

            -- all games table
            table.insert(all_games_table, 14, file)
            file.app_type=15
            file.cover_path_online = onlineCoversAMIGA
            file.cover_path_local = covers_AMIGA

            --add blank icon to all
            file.icon = imgCoverTmp
            file.icon_path = img_path
            
            table.insert(files_table, 17, file.icon) -- Increased for Retro (All systems + 1 for all view)
            
            file.apptitle = romname_noExtension[1]
            table.insert(files_table, 17, file.apptitle) -- Increased for Retro (All systems + 1 for all view)

        end
    end

    -- SCAN TG16
    files_TG16 = System.listDirectory(romFolder_TG16)
    for i, file in pairs(files_TG16) do
    local custom_path, custom_path_id, app_type, name_minus_ext, name_rom_minus_region_ext, name_rom_url_encoded, name_rom_region = nil, nil, nil, nil, nil, nil, nil
        -- Scan files only, ignore temporary files, Windows = "Thumbs.db", Mac = "DS_Store", and "._name" 
        if not file.directory and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

            file.game_path = (romFolder_TG16 .. "/" .. file.name)

            romname_withExtension = file.name
            cleanRomNames()
            info = romname_noRegion_noExtension[1]
            app_title = romname_noExtension[1]
            
            table.insert(folders_table, file)
            --table.insert(games_table, file)
            custom_path = covers_TG16 .. romname_noExtension[1] .. ".png"
            custom_path_id = covers_TG16 .. romname_noExtension[1] .. ".png"
            file.app_type=16

            file.name_minus_ext = romname_noExtension[1]
            file.name_rom_minus_region_ext = romname_noRegion_noExtension[1]
            file.name_rom_url_encoded = romname_url_encoded[1]
            file.name_rom_region = romname_region[1]

            table.insert(tg16_table, file)

            if custom_path and System.doesFileExist(custom_path) then
                img_path = covers_TG16 .. romname_noExtension[1] .. ".png" --custom cover by app name
            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                img_path = covers_TG16 .. romname_noExtension[1] .. ".png" --custom cover by app id
            else
                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_tg16.png") then
                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_tg16.png"  --app icon
                else
                    img_path = "app0:/DATA/noimg.png" --blank grey
                end
            end

            table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
            table.insert(files_table, 17, file.name_minus_ext)
            table.insert(files_table, 17, file.name_rom_minus_region_ext)
            table.insert(files_table, 17, file.name_rom_url_encoded)
            table.insert(files_table, 17, file.name_rom_region)

            -- all games table
            table.insert(all_games_table, 15, file)
            file.app_type=16
            file.cover_path_online = onlineCoversTG16
            file.cover_path_local = covers_TG16

            --add blank icon to all
            file.icon = imgCoverTmp
            file.icon_path = img_path
            
            table.insert(files_table, 17, file.icon) -- Increased for Retro (All systems + 1 for all view)
            
            file.apptitle = romname_noExtension[1]
            table.insert(files_table, 17, file.apptitle) -- Increased for Retro (All systems + 1 for all view)

        end
    end

    -- SCAN PCE
    files_PCE = System.listDirectory(romFolder_PCE)
    for i, file in pairs(files_PCE) do
    local custom_path, custom_path_id, app_type, name_minus_ext, name_rom_minus_region_ext, name_rom_url_encoded, name_rom_region = nil, nil, nil, nil, nil, nil, nil
        -- Scan files only, ignore temporary files, Windows = "Thumbs.db", Mac = "DS_Store", and "._name" 
        if not file.directory and not string.match(file.name, "Thumbs%.db") and not string.match(file.name, "DS_Store") and not string.match(file.name, "%._") then

            file.game_path = (romFolder_PCE .. "/" .. file.name)

            romname_withExtension = file.name
            cleanRomNames()
            info = romname_noRegion_noExtension[1]
            app_title = romname_noExtension[1]
            
            table.insert(folders_table, file)
            --table.insert(games_table, file)
            custom_path = covers_PCE .. romname_noExtension[1] .. ".png"
            custom_path_id = covers_PCE .. romname_noExtension[1] .. ".png"
            file.app_type=17

            file.name_minus_ext = romname_noExtension[1]
            file.name_rom_minus_region_ext = romname_noRegion_noExtension[1]
            file.name_rom_url_encoded = romname_url_encoded[1]
            file.name_rom_region = romname_region[1]

            table.insert(pce_table, file)

            if custom_path and System.doesFileExist(custom_path) then
                img_path = covers_PCE .. romname_noExtension[1] .. ".png" --custom cover by app name
            elseif custom_path_id and System.doesFileExist(custom_path_id) then
                img_path = covers_PCE .. romname_noExtension[1] .. ".png" --custom cover by app id
            else
                if System.doesFileExist("ux0:/app/RETROFLOW/DATA/missing_cover_pce.png") then
                    img_path = "ux0:/app/RETROFLOW/DATA/missing_cover_pce.png"  --app icon
                else
                    img_path = "app0:/DATA/noimg.png" --blank grey
                end
            end

            table.insert(files_table, 17, file.app_type) -- Increased for Retro (All systems + 1 for all view)
            table.insert(files_table, 17, file.name_minus_ext)
            table.insert(files_table, 17, file.name_rom_minus_region_ext)
            table.insert(files_table, 17, file.name_rom_url_encoded)
            table.insert(files_table, 17, file.name_rom_region)

            -- all games table
            table.insert(all_games_table, 16, file)
            file.app_type=17
            file.cover_path_online = onlineCoversPCE
            file.cover_path_local = covers_PCE

            --add blank icon to all
            file.icon = imgCoverTmp
            file.icon_path = img_path
            
            table.insert(files_table, 17, file.icon) -- Increased for Retro (All systems + 1 for all view)
            
            file.apptitle = romname_noExtension[1]
            table.insert(files_table, 17, file.apptitle) -- Increased for Retro (All systems + 1 for all view)

        end
    end



    table.sort(files_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(folders_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    
    table.sort(games_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(homebrews_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(psp_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(psx_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)

    table.sort(n64_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(snes_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(nes_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(gba_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(gbc_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(gb_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(md_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(sms_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(gg_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(mame_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(amiga_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(tg16_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(pce_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    
    return_table = TableConcat(folders_table, files_table)
    
    total_all = #files_table
    total_games = #games_table
    total_homebrews = #homebrews_table
    
    -- CACHE ALL TABLES - PRINT AND SAVE

    -- If startup scan is off
    if startupScan == 0 then
        cache_all_tables()
    else
    end

    return return_table
end

function import_cached_DB(dir)
    dir = System.listDirectory(dir)
    folders_table = {}
    files_table = {}
    games_table = {}
    psp_table = {}
    psx_table = {}
    n64_table = {}
    snes_table = {}
    nes_table = {}
    gba_table = {}
    gbc_table = {}
    gb_table = {}
    md_table = {}
    sms_table = {}
    gg_table = {}
    mame_table = {}
    amiga_table = {}
    tg16_table = {}
    pce_table = {}
    homebrews_table = {}
    all_games_table = {}
    
    -- Import cached DB: games
    if System.doesFileExist(db_Cache_Folder .. "db_games.lua") then
        db_Cache_games = db_Cache_Folder .. "db_games.lua"

        local db_games = {}
        db_games = dofile(db_Cache_games)

        for k, v in ipairs(db_games) do
            table.insert(folders_table, v)
            table.insert(games_table, v)
            table.insert(all_games_table, v)

            --add blank icon to all
            v.icon = imgCoverTmp
            v.icon_path = v.icon_path

            v.apptitle = v.apptitle
            table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
        end
    end

    --     -- Import cached DB: folders
    -- if System.doesFileExist(db_Cache_Folder .. "db_folders.lua") then
    --     db_Cache_folders = db_Cache_Folder .. "db_folders.lua"

    --     local db_folders = {}
    --     db_folders = dofile(db_Cache_folders)

    --     for k, v in ipairs(db_folders) do
    --         table.insert(folders_table, v)
    --         table.insert(folders_table, v)

    --         --add blank icon to all
    --         v.icon = imgCoverTmp
    --         v.icon_path = v.icon_path

    --         v.apptitle = v.apptitle
    --         table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
    --     end
    -- end


    -- Import cached DB: homebrew
    if showHomebrews == 1 then
        if System.doesFileExist(db_Cache_Folder .. "db_homebrews.lua") then
            db_Cache_homebrews = db_Cache_Folder .. "db_homebrews.lua"

            db_homebrews = dofile(db_Cache_homebrews)

            for k, v in ipairs(db_homebrews) do
                table.insert(folders_table, v)
                table.insert(homebrews_table, v)
                table.insert(all_games_table, v)

                --add blank icon to all
                v.icon = imgCoverTmp
                v.icon_path = v.icon_path

                v.apptitle = v.apptitle
                table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
            end
        end
    else
    end

    -- Import cached DB: psp
    if System.doesFileExist(db_Cache_Folder .. "db_psp.lua") then
        db_Cache_psp = db_Cache_Folder .. "db_psp.lua"

        db_psp = dofile(db_Cache_psp)

        for k, v in ipairs(db_psp) do
            table.insert(folders_table, v)
            table.insert(psp_table, v)
            table.insert(all_games_table, v)

            --add blank icon to all
            v.icon = imgCoverTmp
            v.icon_path = v.icon_path
                        
            v.apptitle = v.apptitle
            table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
        end
    end

    -- Import cached DB: psx
    if System.doesFileExist(db_Cache_Folder .. "db_psx.lua") then
        db_Cache_psx = db_Cache_Folder .. "db_psx.lua"

        db_psx = dofile(db_Cache_psx)

        for k, v in ipairs(db_psx) do
            table.insert(folders_table, v)
            table.insert(psx_table, v)
            table.insert(all_games_table, v)

            --add blank icon to all
            v.icon = imgCoverTmp
            v.icon_path = v.icon_path
                        
            v.apptitle = v.apptitle
            table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
        end
    end

    -- Import cached DB: N64
    if System.doesFileExist(db_Cache_Folder .. "db_n64.lua") then
        db_Cache_n64 = db_Cache_Folder .. "db_n64.lua"
        
        db_n64 = dofile(db_Cache_n64)

        for k, v in ipairs(db_n64) do
            table.insert(folders_table, v)
            table.insert(n64_table, v)
            table.insert(all_games_table, v)

            --add blank icon to all
            v.icon = imgCoverTmp
            v.icon_path = v.icon_path
                        
            v.apptitle = v.apptitle
            table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
        end
    end

    -- Import cached DB: snes
    if System.doesFileExist(db_Cache_Folder .. "db_snes.lua") then
        db_Cache_snes = db_Cache_Folder .. "db_snes.lua"

        db_snes = dofile(db_Cache_snes)

        for k, v in ipairs(db_snes) do
            table.insert(folders_table, v)
            table.insert(snes_table, v)
            table.insert(all_games_table, v)

            --add blank icon to all
            v.icon = imgCoverTmp
            v.icon_path = v.icon_path
                        
            v.apptitle = v.apptitle
            table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
        end
    end

    -- Import cached DB: nes
    if System.doesFileExist(db_Cache_Folder .. "db_nes.lua") then
        db_Cache_nes = db_Cache_Folder .. "db_nes.lua"

        db_nes = dofile(db_Cache_nes)

        for k, v in ipairs(db_nes) do
            table.insert(folders_table, v)
            table.insert(nes_table, v)
            table.insert(all_games_table, v)

            --add blank icon to all
            v.icon = imgCoverTmp
            v.icon_path = v.icon_path
                        
            v.apptitle = v.apptitle
            table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
        end
    end

    -- Import cached DB: gba
    if System.doesFileExist(db_Cache_Folder .. "db_gba.lua") then
        db_Cache_gba = db_Cache_Folder .. "db_gba.lua"

        db_gba = dofile(db_Cache_gba)

        for k, v in ipairs(db_gba) do
            table.insert(folders_table, v)
            table.insert(gba_table, v)
            table.insert(all_games_table, v)

            --add blank icon to all
            v.icon = imgCoverTmp
            v.icon_path = v.icon_path
                        
            v.apptitle = v.apptitle
            table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
        end
    end

    -- Import cached DB: gbc
    if System.doesFileExist(db_Cache_Folder .. "db_gbc.lua") then
        db_Cache_gbc = db_Cache_Folder .. "db_gbc.lua"

        db_gbc = dofile(db_Cache_gbc)

        for k, v in ipairs(db_gbc) do
            table.insert(folders_table, v)
            table.insert(gbc_table, v)
            table.insert(all_games_table, v)

            --add blank icon to all
            v.icon = imgCoverTmp
            v.icon_path = v.icon_path
                        
            v.apptitle = v.apptitle
            table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
        end
    end

    -- Import cached DB: gb
    if System.doesFileExist(db_Cache_Folder .. "db_gb.lua") then
        db_Cache_gb = db_Cache_Folder .. "db_gb.lua"

        db_gb = dofile(db_Cache_gb)

        for k, v in ipairs(db_gb) do
            table.insert(folders_table, v)
            table.insert(gb_table, v)
            table.insert(all_games_table, v)

            --add blank icon to all
            v.icon = imgCoverTmp
            v.icon_path = v.icon_path
                        
            v.apptitle = v.apptitle
            table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
        end
    end

    -- Import cached DB: md
    if System.doesFileExist(db_Cache_Folder .. "db_md.lua") then
        db_Cache_md = db_Cache_Folder .. "db_md.lua"

        db_md = dofile(db_Cache_md)

        for k, v in ipairs(db_md) do
            table.insert(folders_table, v)
            table.insert(md_table, v)
            table.insert(all_games_table, v)

            --add blank icon to all
            v.icon = imgCoverTmp
            v.icon_path = v.icon_path
                        
            v.apptitle = v.apptitle
            table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
        end
    end

    -- Import cached DB: sms
    if System.doesFileExist(db_Cache_Folder .. "db_sms.lua") then
        db_Cache_sms = db_Cache_Folder .. "db_sms.lua"

        db_sms = dofile(db_Cache_sms)

        for k, v in ipairs(db_sms) do
            table.insert(folders_table, v)
            table.insert(sms_table, v)
            table.insert(all_games_table, v)

            --add blank icon to all
            v.icon = imgCoverTmp
            v.icon_path = v.icon_path
                        
            v.apptitle = v.apptitle
            table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
        end
    end

    -- Import cached DB: gg
    if System.doesFileExist(db_Cache_Folder .. "db_gg.lua") then
        db_Cache_gg = db_Cache_Folder .. "db_gg.lua"

        db_gg = dofile(db_Cache_gg)

        for k, v in ipairs(db_gg) do
            table.insert(folders_table, v)
            table.insert(gg_table, v)
            table.insert(all_games_table, v)

            --add blank icon to all
            v.icon = imgCoverTmp
            v.icon_path = v.icon_path
                        
            v.apptitle = v.apptitle
            table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
        end
    end

    -- Import cached DB: mame
    if System.doesFileExist(db_Cache_Folder .. "db_mame.lua") then
        db_Cache_mame = db_Cache_Folder .. "db_mame.lua"

        db_mame = dofile(db_Cache_mame)

        for k, v in ipairs(db_mame) do
            table.insert(folders_table, v)
            table.insert(mame_table, v)
            table.insert(all_games_table, v)

            --add blank icon to all
            v.icon = imgCoverTmp
            v.icon_path = v.icon_path
                        
            v.apptitle = v.apptitle
            table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
        end
    end

    -- Import cached DB: amiga
    if System.doesFileExist(db_Cache_Folder .. "db_amiga.lua") then
        db_Cache_amiga = db_Cache_Folder .. "db_amiga.lua"

        db_amiga = dofile(db_Cache_amiga)

        for k, v in ipairs(db_amiga) do
            table.insert(folders_table, v)
            table.insert(amiga_table, v)
            table.insert(all_games_table, v)

            --add blank icon to all
            v.icon = imgCoverTmp
            v.icon_path = v.icon_path
                        
            v.apptitle = v.apptitle
            table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
        end
    end

    -- Import cached DB: tg16
    if System.doesFileExist(db_Cache_Folder .. "db_tg16.lua") then
        db_Cache_tg16 = db_Cache_Folder .. "db_tg16.lua"

        db_tg16 = dofile(db_Cache_tg16)

        for k, v in ipairs(db_tg16) do
            table.insert(folders_table, v)
            table.insert(tg16_table, v)
            table.insert(all_games_table, v)

            --add blank icon to all
            v.icon = imgCoverTmp
            v.icon_path = v.icon_path
                        
            v.apptitle = v.apptitle
            table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
        end
    end

    -- Import cached DB: pce
    if System.doesFileExist(db_Cache_Folder .. "db_pce.lua") then
        db_Cache_pce = db_Cache_Folder .. "db_pce.lua"

        db_pce = dofile(db_Cache_pce)

        for k, v in ipairs(db_pce) do
            table.insert(folders_table, v)
            table.insert(pce_table, v)
            table.insert(all_games_table, v)

            --add blank icon to all
            v.icon = imgCoverTmp
            v.icon_path = v.icon_path
                        
            v.apptitle = v.apptitle
            table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
        end
    end

    -- -- Import cached DB: all_games
    -- if System.doesFileExist(db_Cache_Folder .. "db_all_games.lua") then
    --     db_Cache_all_games = db_Cache_Folder .. "db_all_games.lua"

    --     local db_all_games = {}
    --     db_all_games = dofile(db_Cache_all_games)

    --     for k, v in ipairs(db_all_games) do
    --         table.insert(all_games_table, v)

    --         --add blank icon to all
    --         v.icon = imgCoverTmp
    --         v.icon_path = v.icon_path

    --         v.apptitle = v.apptitle
    --         table.insert(files_table, 17, v.apptitle) -- Increased for Retro (All systems + 1 for all view)
    --     end
    -- end

    table.sort(files_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(folders_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    
    table.sort(games_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(homebrews_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(psp_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(psx_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)

    table.sort(n64_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(snes_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(nes_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(gba_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(gbc_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(gb_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(md_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(sms_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(gg_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(mame_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(amiga_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(tg16_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)
    table.sort(pce_table, function(a, b) return (a.apptitle:lower() < b.apptitle:lower()) end)

    return_table = TableConcat(folders_table, files_table)
    
    total_all = #files_table
    total_games = #games_table
    total_homebrews = #homebrews_table
    
    return return_table
end


function loadImage(img_path)
    imgTmp = Graphics.loadImage(img_path)
end



-- CHECK IF STARTUP SCAN IS ON

if startupScan == 1 then
    -- Startup scan is OFF

    -- Scan folders and games
    files_table = listDirectory(System.currentDirectory())
else
    -- Startup scan is ON

    -- Check cache files before importing, does the folder exist?
    if  System.doesDirExist(db_Cache_Folder) then

        -- Folder exists - Count files
        cache_file_count = System.listDirectory(db_Cache_Folder)
        if #cache_file_count < 20 then -- 20 tables expected
            -- Files missing - rescan
            files_table = listDirectory(System.currentDirectory())
        else
            -- Files all pesent - Import Cached Database
            files_table = import_cached_DB(System.currentDirectory())
        end
    else
        -- Folder missing - rescan
        files_table = listDirectory(System.currentDirectory())
    end
end



function getAppSize(dir)
    local size = 0
    local function get_size(dir)
        local d = System.listDirectory(dir) or {}
        for _, v in ipairs(d) do
            if v.directory then
                get_size(dir .. "/" .. v.name)
            else
                size = size + v.size
            end
        end
    end
    get_size(dir)
    return size
end


-- Get rom size in mb and kb for info screen
function getRomSize()
    local size = 0
    tmpfile = System.openFile(appdir, FREAD)
    size = System.sizeFile(tmpfile)
    System.closeFile(tmpfile)

    if size < 900000 then -- Guessed at number, seems fine
        app_size = size/1024
        game_size = string.format("%02d", app_size) .. "Kb"
    else
        app_size = size/1024/1024
        game_size = string.format("%02d", app_size) .. "Mb"
    end
end


function GetInfoSelected()
    if showCat == 1 then
        if #games_table > 0 then
            if System.doesFileExist(working_dir .. "/" .. games_table[p].name .. "/sce_sys/param.sfo") then
                info = System.extractSfo(working_dir .. "/" .. games_table[p].name .. "/sce_sys/param.sfo")
                icon_path = "ur0:/appmeta/" .. games_table[p].name .. "/icon0.png"
                pic_path = "ur0:/appmeta/" .. games_table[p].name .. "/pic0.png"
                app_title = tostring(info.title)
                apptype = games_table[p].app_type
                appdir = games_table[p].game_path
                folder = games_table[p].directory

                app_titleid = tostring(info.titleid)
                app_version = tostring(info.version)
            end
        else
            app_title = "-"
        end
    elseif showCat == 2 then
        if #homebrews_table > 0 then
            if System.doesFileExist(working_dir .. "/" .. homebrews_table[p].name .. "/sce_sys/param.sfo") then
                info = System.extractSfo(working_dir .. "/" .. homebrews_table[p].name .. "/sce_sys/param.sfo")
                icon_path = "ur0:/appmeta/" .. homebrews_table[p].name .. "/icon0.png"
                pic_path = "ur0:/appmeta/" .. homebrews_table[p].name .. "/pic0.png"
                app_title = tostring(info.title)
                apptype = homebrews_table[p].app_type
                appdir = homebrews_table[p].game_path
                folder = homebrews_table[p].directory

                app_titleid = tostring(info.titleid)
                app_version = tostring(info.version)

            end
        else
            app_title = "-"
        end
    elseif showCat == 3 then
        if #psp_table > 0 then
            info = psp_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_psp.png"
            pic_path = "-"
            app_title = tostring(psp_table[p].name_rom_minus_region_ext)
            apptype = psp_table[p].app_type
            appdir = psp_table[p].game_path
            folder = psp_table[p].directory

            app_titleid = tostring(psp_table[p].name)
            app_version = tostring(psp_table[p].name_rom_region)
        else
            app_title = "-"
        end
    elseif showCat == 4 then
        if #psx_table > 0 then
            info = psx_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_psx.png"
            pic_path = "-"
            app_title = tostring(psx_table[p].name_rom_minus_region_ext)
            apptype = psx_table[p].app_type
            appdir = psx_table[p].game_path
            folder = psx_table[p].directory

            app_titleid = tostring(psx_table[p].name_minus_ext)
            app_version = tostring(psx_table[p].name_rom_region)
        else
            app_title = "-"
        end
    elseif showCat == 5 then
        if #n64_table > 0 then
            info = n64_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_n64.png"
            pic_path = "-"
            app_title = tostring(n64_table[p].name_rom_minus_region_ext)
            apptype = n64_table[p].app_type
            appdir = n64_table[p].game_path
            folder = n64_table[p].directory

            app_titleid = tostring(n64_table[p].name_minus_ext)
            app_version = tostring(n64_table[p].name_rom_region)
        else
            app_title = "-"
        end
    elseif showCat == 6 then
        if #snes_table > 0 then
            info = snes_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_snes.png"
            pic_path = "-"
            app_title = tostring(snes_table[p].name_rom_minus_region_ext)
            apptype = snes_table[p].app_type
            appdir = snes_table[p].game_path
            folder = snes_table[p].directory

            app_titleid = tostring(snes_table[p].name_minus_ext)
            app_version = tostring(snes_table[p].name_rom_region)
        else
            app_title = "-"
        end
    elseif showCat == 7 then
        if #nes_table > 0 then
            info = nes_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_nes.png"
            pic_path = "-"
            app_title = tostring(nes_table[p].name_rom_minus_region_ext)
            apptype = nes_table[p].app_type
            appdir = nes_table[p].game_path
            folder = nes_table[p].directory

            app_titleid = tostring(nes_table[p].name_minus_ext)
            app_version = tostring(nes_table[p].name_rom_region)
        else
            app_title = "-"
        end
    elseif showCat == 8 then
        if #gba_table > 0 then
            info = gba_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_gba.png"
            pic_path = "-"
            app_title = tostring(gba_table[p].name_rom_minus_region_ext)
            apptype = gba_table[p].app_type
            appdir = gba_table[p].game_path
            folder = gba_table[p].directory

            app_titleid = tostring(gba_table[p].name_minus_ext)
            app_version = tostring(gba_table[p].name_rom_region)
        else
            app_title = "-"
        end
    elseif showCat == 9 then
        if #gbc_table > 0 then
            info = gbc_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_gbc.png"
            pic_path = "-"
            app_title = tostring(gbc_table[p].name_rom_minus_region_ext)
            apptype = gbc_table[p].app_type
            appdir = gbc_table[p].game_path
            folder = gbc_table[p].directory

            app_titleid = tostring(gbc_table[p].name_minus_ext)
            app_version = tostring(gbc_table[p].name_rom_region)
        else
            app_title = "-"
        end
    elseif showCat == 10 then
        if #gb_table > 0 then
            info = gb_table[p].name            
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_gb.png"
            pic_path = "-"
            app_title = tostring(gb_table[p].name_rom_minus_region_ext)
            apptype = gb_table[p].app_type
            appdir = gb_table[p].game_path
            folder = gb_table[p].directory

            app_titleid = tostring(gb_table[p].name_minus_ext)
            app_version = tostring(gb_table[p].name_rom_region)
        else
            app_title = "-"
        end
    elseif showCat == 11 then
        if #md_table > 0 then
            info = md_table[p].name
            if setLanguage == 1 then
                icon_path = "ux0:/app/RETROFLOW/DATA/icon_md_usa.png"
            else
                icon_path = "ux0:/app/RETROFLOW/DATA/icon_md.png"
            end
            pic_path = "-"
            app_title = tostring(md_table[p].name_rom_minus_region_ext)
            apptype = md_table[p].app_type
            appdir = md_table[p].game_path
            folder = md_table[p].directory

            app_titleid = tostring(md_table[p].name_minus_ext)
            app_version = tostring(md_table[p].name_rom_region)
        else
            app_title = "-"
        end
    elseif showCat == 12 then
        if #sms_table > 0 then
            info = sms_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_sms.png"
            pic_path = "-"
            app_title = tostring(sms_table[p].name_rom_minus_region_ext)
            apptype = sms_table[p].app_type
            appdir = sms_table[p].game_path
            folder = sms_table[p].directory

            app_titleid = tostring(sms_table[p].name_minus_ext)
            app_version = tostring(sms_table[p].name_rom_region)
        else
            app_title = "-"
        end
    elseif showCat == 13 then
        if #gg_table > 0 then
            info = gg_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_gg.png"
            pic_path = "-"
            app_title = tostring(gg_table[p].name_rom_minus_region_ext)
            apptype = gg_table[p].app_type
            appdir = gg_table[p].game_path
            folder = gg_table[p].directory

            app_titleid = tostring(gg_table[p].name_minus_ext)
            app_version = tostring(gg_table[p].name_rom_region)
        else
            app_title = "-"
        end
    elseif showCat == 14 then
        if #mame_table > 0 then
            info = mame_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_mame.png"
            pic_path = "-"
            app_title = tostring(mame_table[p].name_rom_minus_region_ext)
            apptype = mame_table[p].app_type
            appdir = mame_table[p].game_path
            folder = mame_table[p].directory

            app_titleid = tostring(mame_table[p].name_minus_ext)
            app_version = tostring(mame_table[p].name_rom_region)
        else
            app_title = "-"
        end
    elseif showCat == 15 then
        if #amiga_table > 0 then
            info = amiga_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_amiga.png"
            pic_path = "-"
            app_title = tostring(amiga_table[p].name_rom_minus_region_ext)
            apptype = amiga_table[p].app_type
            appdir = amiga_table[p].game_path
            folder = amiga_table[p].directory

            app_titleid = tostring(amiga_table[p].name_minus_ext)
            app_version = tostring(amiga_table[p].name_rom_region)
        else
            app_title = "-"
        end
    elseif showCat == 16 then
        if #tg16_table > 0 then
            info = tg16_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_tg16.png"
            pic_path = "-"
            app_title = tostring(tg16_table[p].name_rom_minus_region_ext)
            apptype = tg16_table[p].app_type
            appdir = tg16_table[p].game_path
            folder = tg16_table[p].directory

            app_titleid = tostring(tg16_table[p].name_minus_ext)
            app_version = tostring(tg16_table[p].name_rom_region)
        else
            app_title = "-"
        end
    elseif showCat == 17 then
        if #pce_table > 0 then
            info = pce_table[p].name
            icon_path = "ux0:/app/RETROFLOW/DATA/icon_pce.png"
            pic_path = "-"
            app_title = tostring(pce_table[p].name_rom_minus_region_ext)
            apptype = pce_table[p].app_type
            appdir = pce_table[p].game_path
            folder = pce_table[p].directory

            app_titleid = tostring(pce_table[p].name_minus_ext)
            app_version = tostring(pce_table[p].name_rom_region)
        else
            app_title = "-"
        end
    else
        if #files_table > 0 then
            if System.doesFileExist(working_dir .. "/" .. files_table[p].name .. "/sce_sys/param.sfo") then
                info = System.extractSfo(working_dir .. "/" .. files_table[p].name .. "/sce_sys/param.sfo")
                icon_path = "ur0:/appmeta/" .. files_table[p].name .. "/icon0.png"
                pic_path = "ur0:/appmeta/" .. files_table[p].name .. "/pic0.png"
                app_title = tostring(info.title)
                apptype = files_table[p].app_type
                folder = files_table[p].directory

                app_titleid = tostring(info.titleid)
                app_version = tostring(info.version)

                appdir = files_table[p].game_path

                --appdir=working_dir .. "/" .. files_table[p].name
                if apptype==1 then

                elseif apptype==2 then
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_psp.png"
                    pic_path = "-" -- Set to nothing incase bubble with image installed
                elseif apptype==3 then
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_psx.png"
                    pic_path = "-" -- Set to nothing incase bubble with image installed
                elseif apptype==5 then -- N64
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_n64.png"
                elseif apptype==6 then -- SNES
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_snes.png"
                elseif apptype==7 then -- NES
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_nes.png"
                elseif apptype==8 then -- GBA
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gba.png"
                elseif apptype==9 then -- GBC
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gbc.png"
                elseif apptype==10 then -- GB
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gb.png"
                elseif apptype==11 then -- MD
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_md.png"
                elseif apptype==12 then -- SMS
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_sms.png"
                elseif apptype==13 then -- GG
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gg.png"
                elseif apptype==14 then -- MAME
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_mame.png"
                elseif apptype==15 then -- AMIGA
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_amiga.png"
                elseif apptype==16 then -- TG16
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_tg16.png"
                elseif apptype==17 then -- PCE
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_pce.png"
                else
                end

            -- ROM files    
            else
                info = tostring(files_table[p].name_minus_ext)
                icon_path = "-"
                pic_path = "-"
                app_title = tostring(files_table[p].name_rom_minus_region_ext)
                app_titleid = tostring(files_table[p].name_minus_ext)
                apptype = files_table[p].app_type
                folder = files_table[p].directory

                app_version = tostring(files_table[p].name_rom_region)

                appdir = files_table[p].game_path

                --appdir=working_dir .. "/" .. files_table[p].name
                if apptype==1 then
                elseif apptype==2 then
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_psp.png"
                    app_titleid = files_table[p].name
                elseif apptype==3 then
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_psx.png"
                elseif apptype==5 then -- N64
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_n64.png"
                elseif apptype==6 then -- SNES
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_snes.png"
                elseif apptype==7 then -- NES
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_nes.png"
                elseif apptype==8 then -- GBA
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gba.png"
                elseif apptype==9 then -- GBC
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gbc.png"
                elseif apptype==10 then -- GB
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gb.png"
                elseif apptype==11 then -- MD
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_md.png"
                elseif apptype==12 then -- SMS
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_sms.png"
                elseif apptype==13 then -- GG
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_gg.png"
                elseif apptype==14 then -- MAME
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_mame.png"
                elseif apptype==15 then -- AMIGA
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_amiga.png"
                elseif apptype==16 then -- TG16
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_tg16.png"
                elseif apptype==17 then -- PCE
                    icon_path = "ux0:/app/RETROFLOW/DATA/icon_pce.png"
                else
                end

            end
        else
            app_title = "-"
        end
    end
end

function OverrideCategory()
    if System.doesFileExist(cur_dir .. "/overrides.dat") then
        local inf = assert(io.open(cur_dir .. "/overrides.dat", "rw"), "Failed to open overrides.dat")
        local lines = ""
        while(true) do
            local line = inf:read("*line")
            if not line then break end
            
            if not string.find(line, app_titleid .. "", 1) then
                lines = lines .. line .. "\n"
            end
        end
        if tmpappcat>0 then
            lines = lines .. app_titleid .. "=" .. tmpappcat .. "\n"
        end
        inf:close()
        file = io.open(cur_dir .. "/overrides.dat", "w")
        file:write(lines)
        file:close()
        
        if startupScan == 0 then
            -- Startup scan is ON
            -- Scan folders and games
            files_table = listDirectory(System.currentDirectory())
            -- Import Cached Database
            files_table = import_cached_DB(System.currentDirectory())
        else
        end

        --Reload
        FreeIcons()
        FreeMemory()
        Network.term()
        dofile("app0:index.lua")
    end
end


function OverrideCategory_adrenaline()
    if System.doesFileExist(cur_dir .. "/overrides.dat") then
        local inf = assert(io.open(cur_dir .. "/overrides.dat", "rw"), "Failed to open overrides.dat")
        local lines = ""
        while(true) do
            local line = inf:read("*line")
            if not line then break end
            
            if not string.find(line, app_titleid .. "", 1) then
                lines = lines .. line .. "\n"
            end
        end
        if tmpappcat_adrenaline>0 then
            lines = lines .. app_titleid .. "=P" .. tmpappcat_adrenaline .. "\n"
        end
        inf:close()
        file = io.open(cur_dir .. "/overrides.dat", "w")
        file:write(lines)
        file:close()

        if startupScan == 0 then
            -- Startup scan is ON
            -- Scan folders and games
            files_table = listDirectory(System.currentDirectory())
            -- Import Cached Database
            files_table = import_cached_DB(System.currentDirectory())
        else
        end

        --Reload
        FreeIcons()
        FreeMemory()
        Network.term()
        dofile("app0:index.lua")
    end
end


function DownloadCovers()
    local txt = "Downloading covers..."
    local old_txt = txt
    local percent = 0
    local old_percent = 0
    local cvrfound = 0
    
    local app_idx = 1
    local running = false
    status = System.getMessageState()
    
    if Network.isWifiEnabled() then

        -- getCovers - 0 All, 1 PSV, 2 PSP, 3 PS1, 4 N64, 5 SNES, 6 NES, 7 GBA, 8 GBC, 9 GB, 10 MD, 11 SMS, 12 GG, 13 MAME, 14 AMIGA, 15 TG16, 16 PCE
        
        -- scan ALL
        if  getCovers==0 and #all_games_table > 0 then -- Check getcover number against sytem

        local app_idx = p

            if status ~= RUNNING then
                if scanComplete == false then
                    System.setMessage("Downloading covers...", true)
                    System.setMessageProgMsg(txt)
                    
                    while app_idx <= #all_games_table do

                        if System.getAsyncState() ~= 0 then
                            Network.downloadFileAsync(all_games_table[app_idx].cover_path_online .. all_games_table[app_idx].name_rom_url_encoded .. ".png", "ux0:/data/RetroFlow/" .. all_games_table[app_idx].name_minus_ext .. ".png")
                            running = true
                        end
                        if System.getAsyncState() == 1 then
                            Graphics.initBlend()
                            Graphics.termBlend()
                            Screen.flip()
                            running = false
                        end
                        if running == false then
                            if System.doesFileExist("ux0:/data/RetroFlow/" .. all_games_table[app_idx].name_minus_ext .. ".png") then
                                tmpfile = System.openFile("ux0:/data/RetroFlow/" .. all_games_table[app_idx].name_minus_ext .. ".png", FREAD)
                                size = System.sizeFile(tmpfile)
                                if size < 1024 then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. all_games_table[app_idx].name_minus_ext .. ".png")

                                -- delete if already exists
                                elseif System.doesFileExist(all_games_table[app_idx].cover_path_local .. all_games_table[app_idx].name_minus_ext .. ".png") then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. all_games_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1

                                else
                                    System.rename("ux0:/data/RetroFlow/" .. all_games_table[app_idx].name_minus_ext .. ".png", all_games_table[app_idx].cover_path_local .. all_games_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1
                                    
                                end
                                System.closeFile(tmpfile)
                                
                                percent = (app_idx / #all_games_table) * 100
                                txt = "Downloading all covers...\nCover " .. all_games_table[app_idx].name_minus_ext .. "\nFound " .. cvrfound .. " of " .. #all_games_table
                                
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                app_idx = app_idx + 1
                            end
                        end
                        
                        if txt ~= old_txt then
                            System.setMessageProgMsg(txt)
                            old_txt = txt
                        end
                        if percent ~= old_percent then
                            System.setMessageProgress(percent)
                            old_percent = percent
                        end
                    end
                    if app_idx >= #all_games_table then
                        System.closeMessage()
                        scanComplete = true
                    end
                else
                    FreeIcons()
                    FreeMemory()
                    Network.term()
                    dofile("app0:index.lua")
                end
            end
        end

        -- scan PSVITA
        if getCovers==1 and #games_table > 0 then
            if status ~= RUNNING then
                if scanComplete == false then
                    System.setMessage("Downloading covers...", true)
                    System.setMessageProgMsg(txt)
                    
                    while app_idx <= #games_table do
                        if System.getAsyncState() ~= 0 then
                            Network.downloadFileAsync(onlineCovers .. games_table[app_idx].name .. ".png", "ux0:/data/RetroFlow/" .. games_table[app_idx].name .. ".png")
                            running = true
                        end
                        if System.getAsyncState() == 1 then
                            Graphics.initBlend()
                            Graphics.termBlend()
                            Screen.flip()
                            running = false
                        end
                        if running == false then
                            if System.doesFileExist("ux0:/data/RetroFlow/" .. games_table[app_idx].name .. ".png") then
                                tmpfile = System.openFile("ux0:/data/RetroFlow/" .. games_table[app_idx].name .. ".png", FREAD)
                                size = System.sizeFile(tmpfile)
                                if size < 1024 then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. games_table[app_idx].name .. ".png")

                                -- delete if already exists
                                elseif System.doesFileExist(covers_psv .. games_table[app_idx].name .. ".png") then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. games_table[app_idx].name .. ".png")
                                    cvrfound = cvrfound + 1

                                else
                                    System.rename("ux0:/data/RetroFlow/" .. games_table[app_idx].name .. ".png", covers_psv .. games_table[app_idx].name .. ".png")
                                    cvrfound = cvrfound + 1

                                end
                                System.closeFile(tmpfile)
                                
                                percent = (app_idx / #games_table) * 100
                                txt = "Downloading PS Vita covers...\nCover " .. games_table[app_idx].name .. "\nFound " .. cvrfound .. " of " .. #games_table
                                
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                app_idx = app_idx + 1
                            end
                        end
                        
                        if txt ~= old_txt then
                            System.setMessageProgMsg(txt)
                            old_txt = txt
                        end
                        if percent ~= old_percent then
                            System.setMessageProgress(percent)
                            old_percent = percent
                        end
                    end
                    if app_idx >= #games_table then
                        System.closeMessage()
                        scanComplete = true
                    end
                else
                    FreeIcons()
                    FreeMemory()
                    Network.term()
                    dofile("app0:index.lua")
                end
            end
        end

        -- scan PSP
        if  getCovers==2 and #psp_table > 0 then
            if status ~= RUNNING then
                if scanComplete == false then
                    System.setMessage("Downloading covers...", true)
                    System.setMessageProgMsg(txt)
                    
                    while app_idx <= #psp_table do
                        if System.getAsyncState() ~= 0 then
                            Network.downloadFileAsync(onlineCoversPSP .. psp_table[app_idx].name .. ".png", "ux0:/data/RetroFlow/" .. psp_table[app_idx].name .. ".png")
                            running = true
                        end
                        if System.getAsyncState() == 1 then
                            Graphics.initBlend()
                            Graphics.termBlend()
                            Screen.flip()
                            running = false
                        end
                        if running == false then
                            if System.doesFileExist("ux0:/data/RetroFlow/" .. psp_table[app_idx].name .. ".png") then
                                tmpfile = System.openFile("ux0:/data/RetroFlow/" .. psp_table[app_idx].name .. ".png", FREAD)
                                size = System.sizeFile(tmpfile)
                                if size < 1024 then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. psp_table[app_idx].name .. ".png")

                                -- delete if already exists
                                elseif System.doesFileExist(covers_psp .. psp_table[app_idx].name .. ".png") then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. psp_table[app_idx].name .. ".png")
                                    cvrfound = cvrfound + 1

                                else
                                    System.rename("ux0:/data/RetroFlow/" .. psp_table[app_idx].name .. ".png", covers_psp .. psp_table[app_idx].name .. ".png")
                                    cvrfound = cvrfound + 1

                                end
                                System.closeFile(tmpfile)
                                
                                percent = (app_idx / #psp_table) * 100
                                txt = "Downloading PSP covers...\nCover " .. psp_table[app_idx].name .. "\nFound " .. cvrfound .. " of " .. #psp_table
                                
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                app_idx = app_idx + 1
                            end
                        end
                        
                        if txt ~= old_txt then
                            System.setMessageProgMsg(txt)
                            old_txt = txt
                        end
                        if percent ~= old_percent then
                            System.setMessageProgress(percent)
                            old_percent = percent
                        end
                    end
                    if app_idx >= #psp_table then
                        System.closeMessage()
                        scanComplete = true
                    end
                else
                    FreeIcons()
                    FreeMemory()
                    Network.term()
                    dofile("app0:index.lua")
                end
            end
        end
        
        -- scan PS1
        if  getCovers==3 and #psx_table > 0 then
            if status ~= RUNNING then
                if scanComplete == false then
                    System.setMessage("Downloading covers...", true)
                    System.setMessageProgMsg(txt)
                    
                    while app_idx <= #psx_table do
                        if System.getAsyncState() ~= 0 then
                            Network.downloadFileAsync(onlineCoversPSX .. psx_table[app_idx].name .. ".png", "ux0:/data/RetroFlow/" .. psx_table[app_idx].name .. ".png")
                            running = true
                        end
                        if System.getAsyncState() == 1 then
                            Graphics.initBlend()
                            Graphics.termBlend()
                            Screen.flip()
                            running = false
                        end
                        if running == false then
                            if System.doesFileExist("ux0:/data/RetroFlow/" .. psx_table[app_idx].name .. ".png") then
                                tmpfile = System.openFile("ux0:/data/RetroFlow/" .. psx_table[app_idx].name .. ".png", FREAD)
                                size = System.sizeFile(tmpfile)
                                if size < 1024 then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. psx_table[app_idx].name .. ".png")

                                -- delete if already exists
                                elseif System.doesFileExist(covers_psx .. psx_table[app_idx].name .. ".png") then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. psx_table[app_idx].name .. ".png")
                                    cvrfound = cvrfound + 1

                                else
                                    System.rename("ux0:/data/RetroFlow/" .. psx_table[app_idx].name .. ".png", covers_psx .. psx_table[app_idx].name .. ".png")
                                    cvrfound = cvrfound + 1
                                end
                                System.closeFile(tmpfile)
                                
                                percent = (app_idx / #psx_table) * 100
                                txt = "Downloading PS1 covers...\nCover " .. psx_table[app_idx].name .. "\nFound " .. cvrfound .. " of " .. #psx_table
                                
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                app_idx = app_idx + 1
                            end
                        end
                        
                        if txt ~= old_txt then
                            System.setMessageProgMsg(txt)
                            old_txt = txt
                        end
                        if percent ~= old_percent then
                            System.setMessageProgress(percent)
                            old_percent = percent
                        end
                    end
                    if app_idx >= #psx_table then
                        System.closeMessage()
                        scanComplete = true
                    end
                else
                    FreeIcons()
                    FreeMemory()
                    Network.term()
                    dofile("app0:index.lua")
                end
            end
        end

        --START N64
        -- scan N64
        if  getCovers==4 and #n64_table > 0 then -- Check getcover number against sytem
            if status ~= RUNNING then
                if scanComplete == false then
                    System.setMessage("Downloading covers...", true)
                    System.setMessageProgMsg(txt)
                    
                    while app_idx <= #n64_table do

                        if System.getAsyncState() ~= 0 then
                            Network.downloadFileAsync(onlineCoversN64 .. n64_table[app_idx].name_rom_url_encoded .. ".png", "ux0:/data/RetroFlow/" .. n64_table[app_idx].name_minus_ext .. ".png")
                            running = true
                        end
                        if System.getAsyncState() == 1 then
                            Graphics.initBlend()
                            Graphics.termBlend()
                            Screen.flip()
                            running = false
                        end
                        if running == false then
                            if System.doesFileExist("ux0:/data/RetroFlow/" .. n64_table[app_idx].name_minus_ext .. ".png") then
                                tmpfile = System.openFile("ux0:/data/RetroFlow/" .. n64_table[app_idx].name_minus_ext .. ".png", FREAD)
                                size = System.sizeFile(tmpfile)
                                if size < 1024 then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. n64_table[app_idx].name_minus_ext .. ".png")

                                -- delete if already exists
                                elseif System.doesFileExist(covers_N64 .. n64_table[app_idx].name_minus_ext .. ".png") then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. n64_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1

                                else
                                    System.rename("ux0:/data/RetroFlow/" .. n64_table[app_idx].name_minus_ext .. ".png", covers_N64 .. n64_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1
                                    
                                end
                                System.closeFile(tmpfile)
                                
                                percent = (app_idx / #n64_table) * 100
                                txt = "Downloading N64 covers...\nCover " .. n64_table[app_idx].name_minus_ext .. "\nFound " .. cvrfound .. " of " .. #n64_table
                                
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                app_idx = app_idx + 1
                            end
                        end
                        
                        if txt ~= old_txt then
                            System.setMessageProgMsg(txt)
                            old_txt = txt
                        end
                        if percent ~= old_percent then
                            System.setMessageProgress(percent)
                            old_percent = percent
                        end
                    end
                    if app_idx >= #n64_table then
                        System.closeMessage()
                        scanComplete = true
                    end
                else
                    FreeIcons()
                    FreeMemory()
                    Network.term()
                    dofile("app0:index.lua")
                end
            end
        end
        -- END N64


        --START SNES
        -- scan SNES
        if  getCovers==5 and #snes_table > 0 then -- Check getcover number against sytem
            if status ~= RUNNING then
                if scanComplete == false then
                    System.setMessage("Downloading covers...", true)
                    System.setMessageProgMsg(txt)
                    
                    while app_idx <= #snes_table do

                        if System.getAsyncState() ~= 0 then
                            Network.downloadFileAsync(onlineCoversSNES .. snes_table[app_idx].name_rom_url_encoded .. ".png", "ux0:/data/RetroFlow/" .. snes_table[app_idx].name_minus_ext .. ".png")
                            running = true
                        end
                        if System.getAsyncState() == 1 then
                            Graphics.initBlend()
                            Graphics.termBlend()
                            Screen.flip()
                            running = false
                        end
                        if running == false then
                            if System.doesFileExist("ux0:/data/RetroFlow/" .. snes_table[app_idx].name_minus_ext .. ".png") then
                                tmpfile = System.openFile("ux0:/data/RetroFlow/" .. snes_table[app_idx].name_minus_ext .. ".png", FREAD)
                                size = System.sizeFile(tmpfile)
                                if size < 1024 then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. snes_table[app_idx].name_minus_ext .. ".png")

                                -- delete if already exists
                                elseif System.doesFileExist(covers_SNES .. snes_table[app_idx].name_minus_ext .. ".png") then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. snes_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1

                                else
                                    System.rename("ux0:/data/RetroFlow/" .. snes_table[app_idx].name_minus_ext .. ".png", covers_SNES .. snes_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1
                                end
                                System.closeFile(tmpfile)
                                
                                percent = (app_idx / #snes_table) * 100
                                txt = "Downloading SNES covers...\nCover " .. snes_table[app_idx].name_minus_ext .. "\nFound " .. cvrfound .. " of " .. #snes_table
                                
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                app_idx = app_idx + 1
                            end
                        end
                        
                        if txt ~= old_txt then
                            System.setMessageProgMsg(txt)
                            old_txt = txt
                        end
                        if percent ~= old_percent then
                            System.setMessageProgress(percent)
                            old_percent = percent
                        end
                    end
                    if app_idx >= #snes_table then
                        System.closeMessage()
                        scanComplete = true
                    end
                else
                    FreeIcons()
                    FreeMemory()
                    Network.term()
                    dofile("app0:index.lua")
                end
            end
        end
        -- END SNES


        --START NES
        -- scan NES
        if  getCovers==6 and #nes_table > 0 then -- Check getcover number against sytem
            if status ~= RUNNING then
                if scanComplete == false then
                    System.setMessage("Downloading covers...", true)
                    System.setMessageProgMsg(txt)
                    
                    while app_idx <= #nes_table do

                        if System.getAsyncState() ~= 0 then
                            Network.downloadFileAsync(onlineCoversNES .. nes_table[app_idx].name_rom_url_encoded .. ".png", "ux0:/data/RetroFlow/" .. nes_table[app_idx].name_minus_ext .. ".png")
                            running = true
                        end
                        if System.getAsyncState() == 1 then
                            Graphics.initBlend()
                            Graphics.termBlend()
                            Screen.flip()
                            running = false
                        end
                        if running == false then
                            if System.doesFileExist("ux0:/data/RetroFlow/" .. nes_table[app_idx].name_minus_ext .. ".png") then
                                tmpfile = System.openFile("ux0:/data/RetroFlow/" .. nes_table[app_idx].name_minus_ext .. ".png", FREAD)
                                size = System.sizeFile(tmpfile)
                                if size < 1024 then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. nes_table[app_idx].name_minus_ext .. ".png")

                                -- delete if already exists
                                elseif System.doesFileExist(covers_NES .. nes_table[app_idx].name_minus_ext .. ".png") then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. nes_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1

                                else
                                    System.rename("ux0:/data/RetroFlow/" .. nes_table[app_idx].name_minus_ext .. ".png", covers_NES .. nes_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1
                                end
                                System.closeFile(tmpfile)
                                
                                percent = (app_idx / #nes_table) * 100
                                txt = "Downloading NES covers...\nCover " .. nes_table[app_idx].name_minus_ext .. "\nFound " .. cvrfound .. " of " .. #nes_table
                                
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                app_idx = app_idx + 1
                            end
                        end
                        
                        if txt ~= old_txt then
                            System.setMessageProgMsg(txt)
                            old_txt = txt
                        end
                        if percent ~= old_percent then
                            System.setMessageProgress(percent)
                            old_percent = percent
                        end
                    end
                    if app_idx >= #nes_table then
                        System.closeMessage()
                        scanComplete = true
                    end
                else
                    FreeIcons()
                    FreeMemory()
                    Network.term()
                    dofile("app0:index.lua")
                end
            end
        end
        -- END NES


        --START GBA
        -- scan GBA
        if  getCovers==7 and #gba_table > 0 then -- Check getcover number against sytem
        
            if status ~= RUNNING then
                if scanComplete == false then
                    System.setMessage("Downloading covers...", true)
                    System.setMessageProgMsg(txt)
            
                    while app_idx <= #gba_table do

                        if System.getAsyncState() ~= 0 then
                            Network.downloadFileAsync(onlineCoversGBA .. gba_table[app_idx].name_rom_url_encoded .. ".png", "ux0:/data/RetroFlow/" .. gba_table[app_idx].name_minus_ext .. ".png")
                            running = true
                        end
                        if System.getAsyncState() == 1 then
                            Graphics.initBlend()
                            Graphics.termBlend()
                            Screen.flip()
                            running = false
                        end
                        if running == false then
                            if System.doesFileExist("ux0:/data/RetroFlow/" .. gba_table[app_idx].name_minus_ext .. ".png") then
                                tmpfile = System.openFile("ux0:/data/RetroFlow/" .. gba_table[app_idx].name_minus_ext .. ".png", FREAD)
                                size = System.sizeFile(tmpfile)
                                if size < 1024 then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. gba_table[app_idx].name_minus_ext .. ".png")

                                -- delete if already exists
                                elseif System.doesFileExist(covers_GBA .. gba_table[app_idx].name_minus_ext .. ".png") then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. gba_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1

                                else
                                    System.rename("ux0:/data/RetroFlow/" .. gba_table[app_idx].name_minus_ext .. ".png", covers_GBA .. gba_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1
                                end
                                System.closeFile(tmpfile)
                                
                                percent = (app_idx / #gba_table) * 100
                                txt = "Downloading GBA covers...\nCover " .. gba_table[app_idx].name_minus_ext .. "\nFound " .. cvrfound .. " of " .. #gba_table
                                
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                app_idx = app_idx + 1
                            end
                        end
                        
                        if txt ~= old_txt then
                            System.setMessageProgMsg(txt)
                            old_txt = txt
                        end
                        if percent ~= old_percent then
                            System.setMessageProgress(percent)
                            old_percent = percent
                        end
                    end
                    if app_idx >= #gba_table then
                        System.closeMessage()
                        scanComplete = true
                    end
                else
                    FreeIcons()
                    FreeMemory()
                    Network.term()
                    dofile("app0:index.lua")
                end
            end
        end
        -- END GBA


        --START GBC
        -- scan GBC
        if  getCovers==8 and #gbc_table > 0 then -- Check getcover number against sytem

            if status ~= RUNNING then
                if scanComplete == false then
                    System.setMessage("Downloading covers...", true)
                    System.setMessageProgMsg(txt)

                    while app_idx <= #gbc_table do

                        if System.getAsyncState() ~= 0 then
                            Network.downloadFileAsync(onlineCoversGBC .. gbc_table[app_idx].name_rom_url_encoded .. ".png", "ux0:/data/RetroFlow/" .. gbc_table[app_idx].name_minus_ext .. ".png")
                            running = true
                        end
                        if System.getAsyncState() == 1 then
                            Graphics.initBlend()
                            Graphics.termBlend()
                            Screen.flip()
                            running = false
                        end
                        if running == false then
                            if System.doesFileExist("ux0:/data/RetroFlow/" .. gbc_table[app_idx].name_minus_ext .. ".png") then
                                tmpfile = System.openFile("ux0:/data/RetroFlow/" .. gbc_table[app_idx].name_minus_ext .. ".png", FREAD)
                                size = System.sizeFile(tmpfile)
                                if size < 1024 then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. gbc_table[app_idx].name_minus_ext .. ".png")

                                -- delete if already exists
                                elseif System.doesFileExist(covers_GBC .. gbc_table[app_idx].name_minus_ext .. ".png") then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. gbc_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1

                                else
                                    System.rename("ux0:/data/RetroFlow/" .. gbc_table[app_idx].name_minus_ext .. ".png", covers_GBC .. gbc_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1
                                end
                                System.closeFile(tmpfile)
                                
                                percent = (app_idx / #gbc_table) * 100
                                txt = "Downloading GBC covers...\nCover " .. gbc_table[app_idx].name_minus_ext .. "\nFound " .. cvrfound .. " of " .. #gbc_table
                                
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                app_idx = app_idx + 1
                            end
                        end
                        
                        if txt ~= old_txt then
                            System.setMessageProgMsg(txt)
                            old_txt = txt
                        end
                        if percent ~= old_percent then
                            System.setMessageProgress(percent)
                            old_percent = percent
                        end
                    end
                    if app_idx >= #gbc_table then
                        System.closeMessage()
                        scanComplete = true
                    end
                else
                    FreeIcons()
                    FreeMemory()
                    Network.term()
                    dofile("app0:index.lua")
                end
            end
        end
        -- END GBC


        --START GB
        -- scan GB
        if  getCovers==9 and #gb_table > 0 then -- Check getcover number against sytem

            if status ~= RUNNING then
                if scanComplete == false then
                    System.setMessage("Downloading covers...", true)
                    System.setMessageProgMsg(txt)

                    while app_idx <= #gb_table do

                        if System.getAsyncState() ~= 0 then
                            Network.downloadFileAsync(onlineCoversGB .. gb_table[app_idx].name_rom_url_encoded .. ".png", "ux0:/data/RetroFlow/" .. gb_table[app_idx].name_minus_ext .. ".png")
                            running = true
                        end
                        if System.getAsyncState() == 1 then
                            Graphics.initBlend()
                            Graphics.termBlend()
                            Screen.flip()
                            running = false
                        end
                        if running == false then
                            if System.doesFileExist("ux0:/data/RetroFlow/" .. gb_table[app_idx].name_minus_ext .. ".png") then
                                tmpfile = System.openFile("ux0:/data/RetroFlow/" .. gb_table[app_idx].name_minus_ext .. ".png", FREAD)
                                size = System.sizeFile(tmpfile)
                                if size < 1024 then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. gb_table[app_idx].name_minus_ext .. ".png")

                                -- delete if already exists
                                elseif System.doesFileExist(covers_GB .. gb_table[app_idx].name_minus_ext .. ".png") then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. gb_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1

                                else
                                    System.rename("ux0:/data/RetroFlow/" .. gb_table[app_idx].name_minus_ext .. ".png", covers_GB .. gb_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1
                                end
                                System.closeFile(tmpfile)
                                
                                percent = (app_idx / #gb_table) * 100
                                txt = "Downloading GB covers...\nCover " .. gb_table[app_idx].name_minus_ext .. "\nFound " .. cvrfound .. " of " .. #gb_table
                                
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                app_idx = app_idx + 1
                            end
                        end
                        
                        if txt ~= old_txt then
                            System.setMessageProgMsg(txt)
                            old_txt = txt
                        end
                        if percent ~= old_percent then
                            System.setMessageProgress(percent)
                            old_percent = percent
                        end
                    end
                    if app_idx >= #gb_table then
                        System.closeMessage()
                        scanComplete = true
                    end
                else
                    FreeIcons()
                    FreeMemory()
                    Network.term()
                    dofile("app0:index.lua")
                end
            end
        end
        -- END GB


        --START MD
        -- scan MD
        if  getCovers==10 and #md_table > 0 then -- Check getcover number against sytem
            if status ~= RUNNING then
                if scanComplete == false then
                    System.setMessage("Downloading covers...", true)
                    System.setMessageProgMsg(txt)
                    
                    while app_idx <= #md_table do

                        if System.getAsyncState() ~= 0 then
                            Network.downloadFileAsync(onlineCoversMD .. md_table[app_idx].name_rom_url_encoded .. ".png", "ux0:/data/RetroFlow/" .. md_table[app_idx].name_minus_ext .. ".png")
                            running = true
                        end
                        if System.getAsyncState() == 1 then
                            Graphics.initBlend()
                            Graphics.termBlend()
                            Screen.flip()
                            running = false
                        end
                        if running == false then
                            if System.doesFileExist("ux0:/data/RetroFlow/" .. md_table[app_idx].name_minus_ext .. ".png") then
                                tmpfile = System.openFile("ux0:/data/RetroFlow/" .. md_table[app_idx].name_minus_ext .. ".png", FREAD)
                                size = System.sizeFile(tmpfile)
                                if size < 1024 then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. md_table[app_idx].name_minus_ext .. ".png")

                                -- delete if already exists
                                elseif System.doesFileExist(covers_MD .. md_table[app_idx].name_minus_ext .. ".png") then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. md_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1

                                else
                                    System.rename("ux0:/data/RetroFlow/" .. md_table[app_idx].name_minus_ext .. ".png", covers_MD .. md_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1
                                end
                                System.closeFile(tmpfile)
                                
                                percent = (app_idx / #md_table) * 100
                                txt = "Downloading MD covers...\nCover " .. md_table[app_idx].name_minus_ext .. "\nFound " .. cvrfound .. " of " .. #md_table
                                
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                app_idx = app_idx + 1
                            end
                        end
                        
                        if txt ~= old_txt then
                            System.setMessageProgMsg(txt)
                            old_txt = txt
                        end
                        if percent ~= old_percent then
                            System.setMessageProgress(percent)
                            old_percent = percent
                        end
                    end
                    if app_idx >= #md_table then
                        System.closeMessage()
                        scanComplete = true
                    end
                else
                    FreeIcons()
                    FreeMemory()
                    Network.term()
                    dofile("app0:index.lua")
                end
            end
        end
        -- END MD


        --START SMS
        -- scan SMS
        if  getCovers==11 and #sms_table > 0 then -- Check getcover number against sytem
            if status ~= RUNNING then
                if scanComplete == false then
                    System.setMessage("Downloading covers...", true)
                    System.setMessageProgMsg(txt)
                    
                    while app_idx <= #sms_table do

                        if System.getAsyncState() ~= 0 then
                            Network.downloadFileAsync(onlineCoversSMS .. sms_table[app_idx].name_rom_url_encoded .. ".png", "ux0:/data/RetroFlow/" .. sms_table[app_idx].name_minus_ext .. ".png")
                            running = true
                        end
                        if System.getAsyncState() == 1 then
                            Graphics.initBlend()
                            Graphics.termBlend()
                            Screen.flip()
                            running = false
                        end
                        if running == false then
                            if System.doesFileExist("ux0:/data/RetroFlow/" .. sms_table[app_idx].name_minus_ext .. ".png") then
                                tmpfile = System.openFile("ux0:/data/RetroFlow/" .. sms_table[app_idx].name_minus_ext .. ".png", FREAD)
                                size = System.sizeFile(tmpfile)
                                if size < 1024 then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. sms_table[app_idx].name_minus_ext .. ".png")

                                -- delete if already exists
                                elseif System.doesFileExist(covers_SMS .. sms_table[app_idx].name_minus_ext .. ".png") then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. sms_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1

                                else
                                    System.rename("ux0:/data/RetroFlow/" .. sms_table[app_idx].name_minus_ext .. ".png", covers_SMS .. sms_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1
                                end
                                System.closeFile(tmpfile)
                                
                                percent = (app_idx / #sms_table) * 100
                                txt = "Downloading SMS covers...\nCover " .. sms_table[app_idx].name_minus_ext .. "\nFound " .. cvrfound .. " of " .. #sms_table
                                
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                app_idx = app_idx + 1
                            end
                        end
                        
                        if txt ~= old_txt then
                            System.setMessageProgMsg(txt)
                            old_txt = txt
                        end
                        if percent ~= old_percent then
                            System.setMessageProgress(percent)
                            old_percent = percent
                        end
                    end
                    if app_idx >= #sms_table then
                        System.closeMessage()
                        scanComplete = true
                    end
                else
                    FreeIcons()
                    FreeMemory()
                    Network.term()
                    dofile("app0:index.lua")
                end
            end
        end
        -- END SMS


        --START GG
        -- scan GG
        if  getCovers==12 and #gg_table > 0 then -- Check getcover number against sytem
            if status ~= RUNNING then
                if scanComplete == false then
                    System.setMessage("Downloading covers...", true)
                    System.setMessageProgMsg(txt)
                    
                    while app_idx <= #gg_table do

                        if System.getAsyncState() ~= 0 then
                            Network.downloadFileAsync(onlineCoversGG .. gg_table[app_idx].name_rom_url_encoded .. ".png", "ux0:/data/RetroFlow/" .. gg_table[app_idx].name_minus_ext .. ".png")
                            running = true
                        end
                        if System.getAsyncState() == 1 then
                            Graphics.initBlend()
                            Graphics.termBlend()
                            Screen.flip()
                            running = false
                        end
                        if running == false then
                            if System.doesFileExist("ux0:/data/RetroFlow/" .. gg_table[app_idx].name_minus_ext .. ".png") then
                                tmpfile = System.openFile("ux0:/data/RetroFlow/" .. gg_table[app_idx].name_minus_ext .. ".png", FREAD)
                                size = System.sizeFile(tmpfile)
                                if size < 1024 then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. gg_table[app_idx].name_minus_ext .. ".png")

                                -- delete if already exists
                                elseif System.doesFileExist(covers_GG .. gg_table[app_idx].name_minus_ext .. ".png") then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. gg_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1

                                else
                                    System.rename("ux0:/data/RetroFlow/" .. gg_table[app_idx].name_minus_ext .. ".png", covers_GG .. gg_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1
                                end
                                System.closeFile(tmpfile)
                                
                                percent = (app_idx / #gg_table) * 100
                                txt = "Downloading GG covers...\nCover " .. gg_table[app_idx].name_minus_ext .. "\nFound " .. cvrfound .. " of " .. #gg_table
                                
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                app_idx = app_idx + 1
                            end
                        end
                        
                        if txt ~= old_txt then
                            System.setMessageProgMsg(txt)
                            old_txt = txt
                        end
                        if percent ~= old_percent then
                            System.setMessageProgress(percent)
                            old_percent = percent
                        end
                    end
                    if app_idx >= #gg_table then
                        System.closeMessage()
                        scanComplete = true
                    end
                else
                    FreeIcons()
                    FreeMemory()
                    Network.term()
                    dofile("app0:index.lua")
                end
            end
        end
        -- END GG

        --START MAME
        -- scan MAME
        if  getCovers==13 and #mame_table > 0 then -- Check getcover number against sytem
            if status ~= RUNNING then
                if scanComplete == false then
                    System.setMessage("Downloading covers...", true)
                    System.setMessageProgMsg(txt)
                    
                    while app_idx <= #mame_table do

                        if System.getAsyncState() ~= 0 then
                            Network.downloadFileAsync(onlineCoversMAME .. mame_table[app_idx].name_rom_url_encoded .. ".png", "ux0:/data/RetroFlow/" .. mame_table[app_idx].name_minus_ext .. ".png")
                            running = true
                        end
                        if System.getAsyncState() == 1 then
                            Graphics.initBlend()
                            Graphics.termBlend()
                            Screen.flip()
                            running = false
                        end
                        if running == false then
                            if System.doesFileExist("ux0:/data/RetroFlow/" .. mame_table[app_idx].name_minus_ext .. ".png") then
                                tmpfile = System.openFile("ux0:/data/RetroFlow/" .. mame_table[app_idx].name_minus_ext .. ".png", FREAD)
                                size = System.sizeFile(tmpfile)
                                if size < 1024 then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. mame_table[app_idx].name_minus_ext .. ".png")

                                -- delete if already exists
                                elseif System.doesFileExist(covers_MAME .. mame_table[app_idx].name_minus_ext .. ".png") then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. mame_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1

                                else
                                    System.rename("ux0:/data/RetroFlow/" .. mame_table[app_idx].name_minus_ext .. ".png", covers_MAME .. mame_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1
                                end
                                System.closeFile(tmpfile)
                                
                                percent = (app_idx / #mame_table) * 100
                                txt = "Downloading MAME covers...\nCover " .. mame_table[app_idx].name_minus_ext .. "\nFound " .. cvrfound .. " of " .. #mame_table
                                
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                app_idx = app_idx + 1
                            end
                        end
                        
                        if txt ~= old_txt then
                            System.setMessageProgMsg(txt)
                            old_txt = txt
                        end
                        if percent ~= old_percent then
                            System.setMessageProgress(percent)
                            old_percent = percent
                        end
                    end
                    if app_idx >= #mame_table then
                        System.closeMessage()
                        scanComplete = true
                    end
                else
                    FreeIcons()
                    FreeMemory()
                    Network.term()
                    dofile("app0:index.lua")
                end
            end
        end
        -- END MAME

        --START AMIGA
        -- scan AMIGA
        if  getCovers==14 and #amiga_table > 0 then -- Check getcover number against sytem
            if status ~= RUNNING then
                if scanComplete == false then
                    System.setMessage("Downloading covers...", true)
                    System.setMessageProgMsg(txt)
                    
                    while app_idx <= #amiga_table do

                        if System.getAsyncState() ~= 0 then
                            Network.downloadFileAsync(onlineCoversAMIGA .. amiga_table[app_idx].name_rom_url_encoded .. ".png", "ux0:/data/RetroFlow/" .. amiga_table[app_idx].name_minus_ext .. ".png")
                            running = true
                        end
                        if System.getAsyncState() == 1 then
                            Graphics.initBlend()
                            Graphics.termBlend()
                            Screen.flip()
                            running = false
                        end
                        if running == false then
                            if System.doesFileExist("ux0:/data/RetroFlow/" .. amiga_table[app_idx].name_minus_ext .. ".png") then
                                tmpfile = System.openFile("ux0:/data/RetroFlow/" .. amiga_table[app_idx].name_minus_ext .. ".png", FREAD)
                                size = System.sizeFile(tmpfile)
                                if size < 1024 then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. amiga_table[app_idx].name_minus_ext .. ".png")

                                -- delete if already exists
                                elseif System.doesFileExist(covers_AMIGA .. amiga_table[app_idx].name_minus_ext .. ".png") then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. amiga_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1

                                else
                                    System.rename("ux0:/data/RetroFlow/" .. amiga_table[app_idx].name_minus_ext .. ".png", covers_AMIGA .. amiga_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1
                                end
                                System.closeFile(tmpfile)
                                
                                percent = (app_idx / #amiga_table) * 100
                                txt = "Downloading AMIGA covers...\nCover " .. amiga_table[app_idx].name_minus_ext .. "\nFound " .. cvrfound .. " of " .. #amiga_table
                                
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                app_idx = app_idx + 1
                            end
                        end
                        
                        if txt ~= old_txt then
                            System.setMessageProgMsg(txt)
                            old_txt = txt
                        end
                        if percent ~= old_percent then
                            System.setMessageProgress(percent)
                            old_percent = percent
                        end
                    end
                    if app_idx >= #amiga_table then
                        System.closeMessage()
                        scanComplete = true
                    end
                else
                    FreeIcons()
                    FreeMemory()
                    Network.term()
                    dofile("app0:index.lua")
                end
            end
        end
        -- END AMIGA

        --START TG16
        -- scan TG16
        if  getCovers==15 and #tg16_table > 0 then -- Check getcover number against sytem
            if status ~= RUNNING then
                if scanComplete == false then
                    System.setMessage("Downloading covers...", true)
                    System.setMessageProgMsg(txt)
                    
                    while app_idx <= #tg16_table do

                        if System.getAsyncState() ~= 0 then
                            Network.downloadFileAsync(onlineCoversTG16 .. tg16_table[app_idx].name_rom_url_encoded .. ".png", "ux0:/data/RetroFlow/" .. tg16_table[app_idx].name_minus_ext .. ".png")
                            running = true
                        end
                        if System.getAsyncState() == 1 then
                            Graphics.initBlend()
                            Graphics.termBlend()
                            Screen.flip()
                            running = false
                        end
                        if running == false then
                            if System.doesFileExist("ux0:/data/RetroFlow/" .. tg16_table[app_idx].name_minus_ext .. ".png") then
                                tmpfile = System.openFile("ux0:/data/RetroFlow/" .. tg16_table[app_idx].name_minus_ext .. ".png", FREAD)
                                size = System.sizeFile(tmpfile)
                                if size < 1024 then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. tg16_table[app_idx].name_minus_ext .. ".png")

                                -- delete if already exists
                                elseif System.doesFileExist(covers_TG16 .. tg16_table[app_idx].name_minus_ext .. ".png") then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. tg16_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1

                                else
                                    System.rename("ux0:/data/RetroFlow/" .. tg16_table[app_idx].name_minus_ext .. ".png", covers_TG16 .. tg16_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1
                                end
                                System.closeFile(tmpfile)
                                
                                percent = (app_idx / #tg16_table) * 100
                                txt = "Downloading TG16 covers...\nCover " .. tg16_table[app_idx].name_minus_ext .. "\nFound " .. cvrfound .. " of " .. #tg16_table
                                
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                app_idx = app_idx + 1
                            end
                        end
                        
                        if txt ~= old_txt then
                            System.setMessageProgMsg(txt)
                            old_txt = txt
                        end
                        if percent ~= old_percent then
                            System.setMessageProgress(percent)
                            old_percent = percent
                        end
                    end
                    if app_idx >= #tg16_table then
                        System.closeMessage()
                        scanComplete = true
                    end
                else
                    FreeIcons()
                    FreeMemory()
                    Network.term()
                    dofile("app0:index.lua")
                end
            end
        end
        -- END TG16

        --START PCE
        -- scan PCE
        if  getCovers==16 and #pce_table > 0 then -- Check getcover number against sytem
            if status ~= RUNNING then
                if scanComplete == false then
                    System.setMessage("Downloading covers...", true)
                    System.setMessageProgMsg(txt)
                    
                    while app_idx <= #pce_table do

                        if System.getAsyncState() ~= 0 then
                            Network.downloadFileAsync(onlineCoversPCE .. pce_table[app_idx].name_rom_url_encoded .. ".png", "ux0:/data/RetroFlow/" .. pce_table[app_idx].name_minus_ext .. ".png")
                            running = true
                        end
                        if System.getAsyncState() == 1 then
                            Graphics.initBlend()
                            Graphics.termBlend()
                            Screen.flip()
                            running = false
                        end
                        if running == false then
                            if System.doesFileExist("ux0:/data/RetroFlow/" .. pce_table[app_idx].name_minus_ext .. ".png") then
                                tmpfile = System.openFile("ux0:/data/RetroFlow/" .. pce_table[app_idx].name_minus_ext .. ".png", FREAD)
                                size = System.sizeFile(tmpfile)
                                if size < 1024 then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. pce_table[app_idx].name_minus_ext .. ".png")

                                -- delete if already exists
                                elseif System.doesFileExist(covers_PCE .. pce_table[app_idx].name_minus_ext .. ".png") then
                                    System.deleteFile("ux0:/data/RetroFlow/" .. pce_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1

                                else
                                    System.rename("ux0:/data/RetroFlow/" .. pce_table[app_idx].name_minus_ext .. ".png", covers_PCE .. pce_table[app_idx].name_minus_ext .. ".png")
                                    cvrfound = cvrfound + 1
                                end
                                System.closeFile(tmpfile)
                                
                                percent = (app_idx / #pce_table) * 100
                                txt = "Downloading PCE covers...\nCover " .. pce_table[app_idx].name_minus_ext .. "\nFound " .. cvrfound .. " of " .. #pce_table
                                
                                Graphics.initBlend()
                                Graphics.termBlend()
                                Screen.flip()
                                app_idx = app_idx + 1
                            end
                        end
                        
                        if txt ~= old_txt then
                            System.setMessageProgMsg(txt)
                            old_txt = txt
                        end
                        if percent ~= old_percent then
                            System.setMessageProgress(percent)
                            old_percent = percent
                        end
                    end
                    if app_idx >= #pce_table then
                        System.closeMessage()
                        scanComplete = true
                    end
                else
                    FreeIcons()
                    FreeMemory()
                    Network.term()
                    dofile("app0:index.lua")
                end
            end
        end
        -- END PCE

    else
        if status ~= RUNNING then
            System.setMessage("Internet Connection Required", false, BUTTON_OK)
        end
        
    end
    gettingCovers = false

    -- RESCAN ALL AND UPDATE CACHE

    -- Scan folders and games
    files_table = listDirectory(System.currentDirectory())
    -- Import Cached Database
    files_table = import_cached_DB(System.currentDirectory())

end

local function DrawCover(x, y, text, icon, sel, apptype)
    rot = 0
    extraz = 0
    extrax = 0
    extray = 0
    zoom = 0
    camX = 0
    Graphics.setImageFilters(icon, FILTER_LINEAR, FILTER_LINEAR)
    if showView == 1 then
        -- flat zoom out view
        space = 1.6
        zoom = 0
        if x > 0.5 then
            extraz = 6
            extrax = 1
        elseif x < -0.5 then
            extraz = 6
            extrax = -1
        end
    elseif showView == 2 then
        -- zoomin view
        space = 1.6
        zoom = -1
        extray = -0.6
        if x > 0.5 then
            rot = -1
            extraz = 0
            extrax = 1
        elseif x < -0.5 then
            rot = 1
            extraz = 0
            extrax = -1
        end
    elseif showView == 3 then
        -- left side view
        space = 1.5
        zoom = -0.6
        extray = -0.3
        camX = 1
        if x > 0.5 then
            rot = -0.5
            extraz = 2 + (x / 2)
            extrax = 0.6
        elseif x < -0.5 then
            rot = 0.5
            extraz = 2
            extrax = -10
        end
    elseif showView == 4 then
        -- scroll around
        space = 1
        zoom = 0
        if x > 0.5 then
            extraz = 2 + (x / 1.5)
            extrax = 1
        elseif x < -0.5 then
            extraz = 2 - (x / 1.5)
            extrax = -1
        end
    else
        -- default view
        space = 1
        zoom = 0
        if x > 0.5 then
            rot = -1
            extraz = 3
            extrax = 1
        elseif x < -0.5 then
            rot = 1
            extraz = 3
            extrax = -1
        end
    end
    
    Render.setCamera(camX, 0, 0, 0.0, 0.0, 0.0)
    
    if hideBoxes <= 0 then
        if apptype==1 then
            -- PSVita Boxes
            if setReflections == 1 then
                Render.useTexture(modCover, icon)
                Render.drawModel(modCover, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBox, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverNoref, icon)
                Render.drawModel(modCoverNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        elseif apptype==2 then
            -- PSP Boxes
            if setReflections == 1 then
                Render.useTexture(modCoverPSP, icon)
                Render.drawModel(modCoverPSP, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxPSP, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverPSPNoref, icon)
                Render.drawModel(modCoverPSPNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxPSPNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        elseif apptype==3 then
            -- PSX Boxes
            if setReflections == 1 then
                Render.useTexture(modCoverPSX, icon)
                Render.drawModel(modCoverPSX, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxPSX, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverPSXNoref, icon)
                Render.drawModel(modCoverPSXNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxPSXNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        elseif apptype==5 or apptype==6 then
            -- 5 N64 Boxes -- 6 SNES Boxes
            if setReflections == 1 then
                Render.useTexture(modCoverN64, icon)
                Render.drawModel(modCoverN64, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxN64, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverN64Noref, icon)
                Render.drawModel(modCoverN64Noref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxN64Noref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        elseif apptype==7 or apptype==14 or apptype==15 or apptype==16 or apptype==17 then
            -- 7 NES Boxes -- 14 MAME Boxes -- 15 AMIGA Boxes -- 16 TG16 Boxes -- 17 PCE Boxes
            if setReflections == 1 then
                Render.useTexture(modCoverNES, icon)
                Render.drawModel(modCoverNES, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxNES, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverNESNoref, icon)
                Render.drawModel(modCoverNESNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxNESNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        elseif apptype==8 or apptype==9 or apptype==10 then
            -- 8 GBA Boxes -- 9 GBC Boxes -- 10 GB Boxes
            if setReflections == 1 then
                Render.useTexture(modCoverGB, icon)
                Render.drawModel(modCoverGB, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxGB, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverGBNoref, icon)
                Render.drawModel(modCoverGBNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxGBNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        elseif apptype==11 or apptype==12 or apptype==13 then
            -- 11 MD Boxes -- 12 SMS Boxes -- 13 GG Boxes
            if setReflections == 1 then
                Render.useTexture(modCoverMD, icon)
                Render.drawModel(modCoverMD, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxMD, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverMDNoref, icon)
                Render.drawModel(modCoverMDNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
                Render.drawModel(modBoxMDNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        else
            -- Homebrew Icon
            if setReflections == 1 then
                Render.useTexture(modCoverHbr, icon)
                Render.drawModel(modCoverHbr, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            else
                Render.useTexture(modCoverHbrNoref, icon)
                Render.drawModel(modCoverHbrNoref, x + extrax, y + extray, -5 - extraz - zoom, 0, math.deg(rot), 0)
            end
        end
    else
        hideBoxes = hideBoxes - 0.1
    end
end

local FileLoad = {}

function FreeIcons()
    for k, v in pairs(files_table) do
        FileLoad[v] = nil
        Threads.remove(v)
        if v.ricon then
            Graphics.freeImage(v.ricon)
            v.ricon = nil
        end
    end
    for k, v in pairs(games_table) do
        FileLoad[v] = nil
        Threads.remove(v)
        if v.ricon then
            Graphics.freeImage(v.ricon)
            v.ricon = nil
        end
    end
    for k, v in pairs(psp_table) do
        FileLoad[v] = nil
        Threads.remove(v)
        if v.ricon then
            Graphics.freeImage(v.ricon)
            v.ricon = nil
        end
    end
    for k, v in pairs(psx_table) do
        FileLoad[v] = nil
        Threads.remove(v)
        if v.ricon then
            Graphics.freeImage(v.ricon)
            v.ricon = nil
        end
    end
    -- N64
    for k, v in pairs(n64_table) do
        FileLoad[v] = nil
        Threads.remove(v)
        if v.ricon then
            Graphics.freeImage(v.ricon)
            v.ricon = nil
        end
    end
    -- SNES
    for k, v in pairs(snes_table) do
        FileLoad[v] = nil
        Threads.remove(v)
        if v.ricon then
            Graphics.freeImage(v.ricon)
            v.ricon = nil
        end
    end
    -- NES
    for k, v in pairs(nes_table) do
        FileLoad[v] = nil
        Threads.remove(v)
        if v.ricon then
            Graphics.freeImage(v.ricon)
            v.ricon = nil
        end
    end
    -- GBA
    for k, v in pairs(gba_table) do
        FileLoad[v] = nil
        Threads.remove(v)
        if v.ricon then
            Graphics.freeImage(v.ricon)
            v.ricon = nil
        end
    end
    -- GBC
    for k, v in pairs(gbc_table) do
        FileLoad[v] = nil
        Threads.remove(v)
        if v.ricon then
            Graphics.freeImage(v.ricon)
            v.ricon = nil
        end
    end
    -- GB
    for k, v in pairs(gb_table) do
        FileLoad[v] = nil
        Threads.remove(v)
        if v.ricon then
            Graphics.freeImage(v.ricon)
            v.ricon = nil
        end
    end 
    -- MD
    for k, v in pairs(md_table) do
        FileLoad[v] = nil
        Threads.remove(v)
        if v.ricon then
            Graphics.freeImage(v.ricon)
            v.ricon = nil
        end
    end
    -- SMS
    for k, v in pairs(sms_table) do
        FileLoad[v] = nil
        Threads.remove(v)
        if v.ricon then
            Graphics.freeImage(v.ricon)
            v.ricon = nil
        end
    end
    -- GG
    for k, v in pairs(gg_table) do
        FileLoad[v] = nil
        Threads.remove(v)
        if v.ricon then
            Graphics.freeImage(v.ricon)
            v.ricon = nil
        end
    end
    -- MAME
    for k, v in pairs(mame_table) do
        FileLoad[v] = nil
        Threads.remove(v)
        if v.ricon then
            Graphics.freeImage(v.ricon)
            v.ricon = nil
        end
    end
    -- AMIGA
    for k, v in pairs(amiga_table) do
        FileLoad[v] = nil
        Threads.remove(v)
        if v.ricon then
            Graphics.freeImage(v.ricon)
            v.ricon = nil
        end
    end
    -- TG16
    for k, v in pairs(tg16_table) do
        FileLoad[v] = nil
        Threads.remove(v)
        if v.ricon then
            Graphics.freeImage(v.ricon)
            v.ricon = nil
        end
    end
    -- PCE
    for k, v in pairs(pce_table) do
        FileLoad[v] = nil
        Threads.remove(v)
        if v.ricon then
            Graphics.freeImage(v.ricon)
            v.ricon = nil
        end
    end
    -- Homebrew
    for k, v in pairs(homebrews_table) do
        FileLoad[v] = nil
        Threads.remove(v)
        if v.ricon then
            Graphics.freeImage(v.ricon)
            v.ricon = nil
        end
    end
end

function DownloadSingleCover()
    cvrfound = 0
    app_idx = p
    running = false
    status = System.getMessageState()
    
    local coverspath = ""
    local onlineCoverspath = ""
    
    if Network.isWifiEnabled() then
        if apptype == 1 then
            coverspath = covers_psv
            onlineCoverspath = onlineCovers
        elseif apptype == 2 then
            coverspath = covers_psp
            onlineCoverspath = onlineCoversPSP
        elseif apptype == 3 then
            coverspath = covers_psx
            onlineCoverspath = onlineCoversPSX
        --N64
        elseif apptype == 5 then
            coverspath = covers_N64
            onlineCoverspath = onlineCoversN64
        --SNES
        elseif apptype == 6 then
            coverspath = covers_SNES
            onlineCoverspath = onlineCoversSNES
        --NES
        elseif apptype == 7 then
            coverspath = covers_NES
            onlineCoverspath = onlineCoversNES
        --GBA
        elseif apptype == 8 then
            coverspath = covers_GBA
            onlineCoverspath = onlineCoversGBA
        --GBC
        elseif apptype == 9 then
            coverspath = covers_GBC
            onlineCoverspath = onlineCoversGBC
        --GB
        elseif apptype == 10 then
            coverspath = covers_GB
            onlineCoverspath = onlineCoversGB
        --MD
        elseif apptype == 11 then
            coverspath = covers_MD
            onlineCoverspath = onlineCoversMD
        --SMS
        elseif apptype == 12 then
            coverspath = covers_SMS
            onlineCoverspath = onlineCoversSMS
        --GG
        elseif apptype == 13 then
            coverspath = covers_GG
            onlineCoverspath = onlineCoversGG
        --MAME
        elseif apptype == 14 then
            coverspath = covers_MAME
            onlineCoverspath = onlineCoversMAME
        --AMIGA
        elseif apptype == 15 then
            coverspath = covers_AMIGA
            onlineCoverspath = onlineCoversAMIGA
        --TG16
        elseif apptype == 16 then
            coverspath = covers_TG16
            onlineCoverspath = onlineCoversTG16
        --PCE
        elseif apptype == 17 then
            coverspath = covers_PCE
            onlineCoverspath = onlineCoversPCE
        else
            coverspath = covers_psv
            onlineCoverspath = onlineCovers
        end


        Network.downloadFile(onlineCoverspath .. app_titleid:gsub("%s+", '%%20') .. ".png", "ux0:/data/RetroFlow/" .. app_titleid .. ".png")
        
        if System.doesFileExist("ux0:/data/RetroFlow/" .. app_titleid .. ".png") then
            tmpfile = System.openFile("ux0:/data/RetroFlow/" .. app_titleid .. ".png", FREAD)
            size = System.sizeFile(tmpfile)
            if size < 1024 then
                System.deleteFile("ux0:/data/RetroFlow/" .. app_titleid .. ".png")
            else
                System.rename("ux0:/data/RetroFlow/" .. app_titleid .. ".png", coverspath .. app_titleid .. ".png")
                cvrfound = 1
            end
            System.closeFile(tmpfile)
        end

        if cvrfound==1 then
            if showCat == 1 then
                --"games_table"
                games_table[app_idx].icon_path=coverspath .. app_titleid .. ".png"
                if FileLoad[games_table[app_idx]] == true then
                    FileLoad[games_table[app_idx]] = nil
                    Threads.remove(games_table[app_idx])
                    update_cached_table_games()
                end
                if games_table[app_idx].ricon then
                    games_table[app_idx].ricon = nil
                end
            elseif showCat == 2 then
                --"homebrews_table"
                    
            elseif showCat == 3 then
                --"psp_table"
                psp_table[app_idx].icon_path=coverspath .. app_titleid .. ".png"
                if FileLoad[psp_table[app_idx]] == true then
                    FileLoad[psp_table[app_idx]] = nil
                    Threads.remove(psp_table[app_idx])
                    update_cached_table_psp()
                end
                if psp_table[app_idx].ricon then
                    psp_table[app_idx].ricon = nil
                end
            elseif showCat == 4 then
                --"psx_table"
                psx_table[app_idx].icon_path=coverspath .. app_titleid .. ".png"
                if FileLoad[psx_table[app_idx]] == true then
                    FileLoad[psx_table[app_idx]] = nil
                    Threads.remove(psx_table[app_idx])
                    update_cached_table_psx()
                end
                if psx_table[app_idx].ricon then
                    psx_table[app_idx].ricon = nil
                end
            -- N64  
            elseif showCat == 5 then
                --"n64_table"
                n64_table[app_idx].icon_path=coverspath .. app_titleid .. ".png"
                if FileLoad[n64_table[app_idx]] == true then
                    FileLoad[n64_table[app_idx]] = nil
                    Threads.remove(n64_table[app_idx])
                    update_cached_table_n64()
                end
                if n64_table[app_idx].ricon then
                    n64_table[app_idx].ricon = nil
                end
            -- SNES 
            elseif showCat == 6 then
                --"snes_table"
                snes_table[app_idx].icon_path=coverspath .. app_titleid .. ".png"
                if FileLoad[snes_table[app_idx]] == true then
                    FileLoad[snes_table[app_idx]] = nil
                    Threads.remove(snes_table[app_idx])
                    update_cached_table_snes()
                end
                if snes_table[app_idx].ricon then
                    snes_table[app_idx].ricon = nil
                end
            -- NES 
            elseif showCat == 7 then
                --"nes_table"
                nes_table[app_idx].icon_path=coverspath .. app_titleid .. ".png"
                if FileLoad[nes_table[app_idx]] == true then
                    FileLoad[nes_table[app_idx]] = nil
                    Threads.remove(nes_table[app_idx])
                    update_cached_table_nes()
                end
                if nes_table[app_idx].ricon then
                    nes_table[app_idx].ricon = nil
                end
            -- GBA   
            elseif showCat == 8 then
                --"gba_table"
                gba_table[app_idx].icon_path=coverspath .. app_titleid .. ".png"
                if FileLoad[gba_table[app_idx]] == true then
                    FileLoad[gba_table[app_idx]] = nil
                    Threads.remove(gba_table[app_idx])
                    update_cached_table_gba()
                end
                if gba_table[app_idx].ricon then
                    gba_table[app_idx].ricon = nil
                end
            -- GBC   
            elseif showCat == 9 then
                --"gbc_table"
                gbc_table[app_idx].icon_path=coverspath .. app_titleid .. ".png"
                if FileLoad[gbc_table[app_idx]] == true then
                    FileLoad[gbc_table[app_idx]] = nil
                    Threads.remove(gbc_table[app_idx])
                    update_cached_table_gbc()
                end
                if gbc_table[app_idx].ricon then
                    gbc_table[app_idx].ricon = nil
                end
            -- GB   
            elseif showCat == 10 then
                --"gb_table"
                gb_table[app_idx].icon_path=coverspath .. app_titleid .. ".png"
                if FileLoad[gb_table[app_idx]] == true then
                    FileLoad[gb_table[app_idx]] = nil
                    Threads.remove(gb_table[app_idx])
                    update_cached_table_gb()
                end
                if gb_table[app_idx].ricon then
                    gb_table[app_idx].ricon = nil
                end
            -- MD 
            elseif showCat == 11 then
                --"md_table"
                md_table[app_idx].icon_path=coverspath .. app_titleid .. ".png"
                if FileLoad[md_table[app_idx]] == true then
                    FileLoad[md_table[app_idx]] = nil
                    Threads.remove(md_table[app_idx])
                    update_cached_table_md()
                end
                if md_table[app_idx].ricon then
                    md_table[app_idx].ricon = nil
                end
            -- SMS 
            elseif showCat == 12 then
                --"sms_table"
                sms_table[app_idx].icon_path=coverspath .. app_titleid .. ".png"
                if FileLoad[sms_table[app_idx]] == true then
                    FileLoad[sms_table[app_idx]] = nil
                    Threads.remove(sms_table[app_idx])
                    update_cached_table_sms()
                end
                if sms_table[app_idx].ricon then
                    sms_table[app_idx].ricon = nil
                end
            -- GG 
            elseif showCat == 13 then
                --"gg_table"
                gg_table[app_idx].icon_path=coverspath .. app_titleid .. ".png"
                if FileLoad[gg_table[app_idx]] == true then
                    FileLoad[gg_table[app_idx]] = nil
                    Threads.remove(gg_table[app_idx])
                    update_cached_table_gg()
                end
                if gg_table[app_idx].ricon then
                    gg_table[app_idx].ricon = nil
                end
            -- MAME
            elseif showCat == 14 then
                --"mame_table"
                mame_table[app_idx].icon_path=coverspath .. app_titleid .. ".png"
                if FileLoad[mame_table[app_idx]] == true then
                    FileLoad[mame_table[app_idx]] = nil
                    Threads.remove(mame_table[app_idx])
                    update_cached_table_mame()
                end
                if mame_table[app_idx].ricon then
                    mame_table[app_idx].ricon = nil
                end
            -- AMIGA
            elseif showCat == 15 then
                --"amiga_table"
                amiga_table[app_idx].icon_path=coverspath .. app_titleid .. ".png"
                if FileLoad[amiga_table[app_idx]] == true then
                    FileLoad[amiga_table[app_idx]] = nil
                    Threads.remove(amiga_table[app_idx])
                    update_cached_table_amiga()
                end
                if amiga_table[app_idx].ricon then
                    amiga_table[app_idx].ricon = nil
                end
            -- TG16
            elseif showCat == 16 then
                --"tg16_table"
                tg16_table[app_idx].icon_path=coverspath .. app_titleid .. ".png"
                if FileLoad[tg16_table[app_idx]] == true then
                    FileLoad[tg16_table[app_idx]] = nil
                    Threads.remove(tg16_table[app_idx])
                    update_cached_table_tg16()
                end
                if tg16_table[app_idx].ricon then
                    tg16_table[app_idx].ricon = nil
                end
            -- PCE
            elseif showCat == 17 then
                --"pce_table"
                pce_table[app_idx].icon_path=coverspath .. app_titleid .. ".png"
                if FileLoad[pce_table[app_idx]] == true then
                    FileLoad[pce_table[app_idx]] = nil
                    Threads.remove(pce_table[app_idx])
                    update_cached_table_pce()
                end
                if pce_table[app_idx].ricon then
                    pce_table[app_idx].ricon = nil
                end

            else
                --"files_table"
                files_table[app_idx].icon_path=coverspath .. app_titleid .. ".png"
                if FileLoad[files_table[app_idx]] == true then
                    FileLoad[files_table[app_idx]] = nil
                    Threads.remove(files_table[app_idx])
                    update_cached_table_files()
                end
                if files_table[app_idx].ricon then
                    files_table[app_idx].ricon = nil
                end
            end
            if status ~= RUNNING then
                System.setMessage("Cover " .. app_titleid .. " found!", false, BUTTON_OK)
            end
        else
            if status ~= RUNNING then
                System.setMessage("Cover not found", false, BUTTON_OK)
            end
        end
        
    else
        if status ~= RUNNING then
            System.setMessage("Internet Connection Required", false, BUTTON_OK)
        end
    end
    
    gettingCovers = false
end

-- Main loop
while true do
    
    -- Threads update
    Threads.update()
    
    -- Reading input
    pad = Controls.read()
    
    mx, my = Controls.readLeftAnalog()
    
    -- touch input
    x1, y1 = Controls.readTouch()
    
    -- Initializing rendering
    Graphics.initBlend()
    Screen.clear(black)
    
    if delayButton > 0 then
        delayButton = delayButton - 0.1
    else
        delayButton = 0
    end
    
    -- Graphics
    if setBackground == 1 then
        Render.drawModel(modBackground, 0, 0, -5, 0, 0, 0)-- Draw Background as model
    else
        Render.drawModel(modDefaultBackground, 0, 0, -5, 0, 0, 0)-- Draw Background as model
    end
    
    Graphics.fillRect(0, 960, 496, 544, themeCol)-- footer bottom
    
    if showMenu == 0 then
        -- MAIN VIEW
        -- Header
        h, m, s = System.getTime()
        Font.print(fnt20, 726, 34, string.format("%02d:%02d", h, m), white)-- Draw time
        life = System.getBatteryPercentage()
        Font.print(fnt20, 830, 34, life .. "%", white)-- Draw battery
        Graphics.drawImage(888, 41, imgBattery)
        Graphics.fillRect(891, 891 + (life / 5.2), 45, 53, white)
        -- Footer buttons and icons
        if setLanguage==8 then
        --Russian language fix positions
            Graphics.drawImage(824, 510, btnX)
            Font.print(fnt20, 824+28, 508, lang_lines[7], white)--Launch
            Graphics.drawImage(710, 510, btnT)
            Font.print(fnt20, 710+28, 508, lang_lines[8], white)--Details
            Graphics.drawImage(570, 510, btnS)
            Font.print(fnt20, 570+28, 508, lang_lines[9], white)--Category
            Graphics.drawImage(480, 510, btnO)
            Font.print(fnt20, 480+28, 508, lang_lines[10], white)--View
        else
            Graphics.drawImage(904-(string.len(lang_lines[7])*10), 510, btnX)
            Font.print(fnt20, 904+28-(string.len(lang_lines[7])*10), 508, lang_lines[7], white)--Launch
            Graphics.drawImage(790-(string.len(lang_lines[8])*10), 510, btnT)
            Font.print(fnt20, 790+28-(string.len(lang_lines[8])*10), 508, lang_lines[8], white)--Details
            Graphics.drawImage(670-(string.len(lang_lines[9])*10), 510, btnS)
            Font.print(fnt20, 670+28-(string.len(lang_lines[9])*10), 508, lang_lines[9], white)--Category
            Graphics.drawImage(520-(string.len(lang_lines[10])*10), 510, btnO)
            Font.print(fnt20, 520+28-(string.len(lang_lines[10])*10), 508, lang_lines[10], white)--View
        end
        
        if showCat == 1 then
            Font.print(fnt22, 32, 34, lang_lines[1], white)--GAMES
        elseif showCat == 2 then
            Font.print(fnt22, 32, 34, lang_lines[2], white)--HOMEBREWS
        elseif showCat == 3 then
            Font.print(fnt22, 32, 34, lang_lines[3], white)--PSP
        elseif showCat == 4 then
            Font.print(fnt22, 32, 34, lang_lines[4], white)--PSX
        elseif showCat == 5 then
            Font.print(fnt22, 32, 34, lang_lines[33], white)--N64
        elseif showCat == 6 then
            Font.print(fnt22, 32, 34, lang_lines[34], white)--SNES
        elseif showCat == 7 then
            Font.print(fnt22, 32, 34, lang_lines[35], white)--NES
        elseif showCat == 8 then
            Font.print(fnt22, 32, 34, lang_lines[36], white)--GBA
        elseif showCat == 9 then
            Font.print(fnt22, 32, 34, lang_lines[37], white)--GBC
        elseif showCat == 10 then
            Font.print(fnt22, 32, 34, lang_lines[38], white)--GB
        elseif showCat == 11 then
            Font.print(fnt22, 32, 34, lang_lines[39], white)--MD
        elseif showCat == 12 then
            Font.print(fnt22, 32, 34, lang_lines[40], white)--SMS
        elseif showCat == 13 then
            Font.print(fnt22, 32, 34, lang_lines[41], white)--GG
        elseif showCat == 14 then
            Font.print(fnt22, 32, 34, lang_lines[42], white)--MAME
        elseif showCat == 15 then
            Font.print(fnt22, 32, 34, lang_lines[43], white)--AMIGA
        elseif showCat == 16 then
            Font.print(fnt22, 32, 34, lang_lines[44], white)--TG16
        elseif showCat == 17 then
            Font.print(fnt22, 32, 34, lang_lines[45], white)--PCE
        else
            Font.print(fnt22, 32, 34, lang_lines[5], white)--ALL
        end
        if Network.isWifiEnabled() then
            Graphics.drawImage(800, 38, imgWifi)-- wifi icon
        end
        
        if showView ~= 2 then
            Graphics.fillRect(0, 960, 424, 496, black)-- black footer bottom
            PrintCentered(fnt25, 480, 430, app_title, white, 25)-- Draw title
        else
            Font.print(fnt22, 24, 508, app_title, white)
        end
        
        -- Draw Covers
        base_x = 0
        
        --GAMES
        if showCat == 1 then
            for l, file in pairs(games_table) do
                if (l >= master_index) then
                    base_x = base_x + space
                end
                if l > p-8 and base_x < 10 then
                    if FileLoad[file] == nil then --add a new check here
                        FileLoad[file] = true
                        Threads.addTask(file, {
                            Type = "ImageLoad",
                            Path = file.icon_path,
                            Table = file,
                            Index = "ricon"
                        })
                    end
                    if file.ricon ~= nil then
                        DrawCover((targetX + l * space) - (#games_table * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
                    else
                        DrawCover((targetX + l * space) - (#games_table * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
                    end
                else
                    if FileLoad[file] == true then
                        FileLoad[file] = nil
                        Threads.remove(file)
                    end
                    if file.ricon then
                        Graphics.freeImage(file.ricon)
                        file.ricon = nil
                    end
                end
            end
            if showView ~= 2 then
                PrintCentered(fnt20, 480, 462, p .. " of " .. #games_table, white, 20)-- Draw total items
            end

        --HOMEBREWS
        elseif showCat == 2 then
            for l, file in pairs(homebrews_table) do
                if (l >= master_index) then
                    base_x = base_x + space
                end
                if l > p-8 and base_x < 10 then
                    if FileLoad[file] == nil then
                        FileLoad[file] = true
                        Threads.addTask(file, {
                            Type = "ImageLoad",
                            Path = file.icon_path,
                            Table = file,
                            Index = "ricon"
                        })
                    end
                    if file.ricon ~= nil then
                        DrawCover((targetX + l * space) - (#homebrews_table * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
                    else
                        DrawCover((targetX + l * space) - (#homebrews_table * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
                    end
                else
                    if FileLoad[file] == true then
                        FileLoad[file] = nil
                        Threads.remove(file)
                    end
                    if file.ricon then
                        Graphics.freeImage(file.ricon)
                        file.ricon = nil
                    end
                end
            end
            if showView ~= 2 then
                PrintCentered(fnt20, 480, 462, p .. " of " .. #homebrews_table, white, 20)-- Draw total items
            end

        --PSP
        elseif showCat == 3 then
            for l, file in pairs(psp_table) do
                if (l >= master_index) then
                    base_x = base_x + space
                end
                if l > p-8 and base_x < 10 then
                    if FileLoad[file] == nil then
                        FileLoad[file] = true
                        Threads.addTask(file, {
                            Type = "ImageLoad",
                            Path = file.icon_path,
                            Table = file,
                            Index = "ricon"
                        })
                    end
                    if file.ricon ~= nil then
                        DrawCover((targetX + l * space) - (#psp_table * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
                    else
                        DrawCover((targetX + l * space) - (#psp_table * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
                    end
                else
                    if FileLoad[file] == true then
                        FileLoad[file] = nil
                        Threads.remove(file)
                    end
                    if file.ricon then
                        Graphics.freeImage(file.ricon)
                        file.ricon = nil
                    end
                end
            end
            if showView ~= 2 then
                PrintCentered(fnt20, 480, 462, p .. " of " .. #psp_table, white, 20)-- Draw total items
            end

        --PSX
        elseif showCat == 4 then
            for l, file in pairs(psx_table) do
                if (l >= master_index) then
                    base_x = base_x + space
                end
                if l > p-8 and base_x < 10 then
                    if FileLoad[file] == nil then
                        FileLoad[file] = true
                        Threads.addTask(file, {
                            Type = "ImageLoad",
                            Path = file.icon_path,
                            Table = file,
                            Index = "ricon"
                        })
                    end
                    if file.ricon ~= nil then
                        DrawCover((targetX + l * space) - (#psx_table * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
                    else
                        DrawCover((targetX + l * space) - (#psx_table * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
                    end
                else
                    if FileLoad[file] == true then
                        FileLoad[file] = nil
                        Threads.remove(file)
                    end
                    if file.ricon then
                        Graphics.freeImage(file.ricon)
                        file.ricon = nil
                    end
                end
            end
            if showView ~= 2 then
                PrintCentered(fnt20, 480, 462, p .. " of " .. #psx_table, white, 20)-- Draw total items
            end
        -- else

        --N64
        elseif showCat == 5 then

            for l, file in pairs(n64_table) do
                if (l >= master_index) then
                    base_x = base_x + space
                end
                if l > p-8 and base_x < 10 then
                    if FileLoad[file] == nil then
                        FileLoad[file] = true
                        Threads.addTask(file, {
                            Type = "ImageLoad",
                            Path = file.icon_path,
                            Table = file,
                            Index = "ricon"
                        })
                    end
                    if file.ricon ~= nil then
                        DrawCover((targetX + l * space) - (#n64_table * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
                    else
                        DrawCover((targetX + l * space) - (#n64_table * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
                    end
                else
                    if FileLoad[file] == true then
                        FileLoad[file] = nil
                        Threads.remove(file)
                    end
                    if file.ricon then
                        Graphics.freeImage(file.ricon)
                        file.ricon = nil
                    end
                end
            end
            if showView ~= 2 then
                PrintCentered(fnt20, 480, 462, p .. " of " .. #n64_table, white, 20)-- Draw total items
            end

        --SNES
        elseif showCat == 6 then
            for l, file in pairs(snes_table) do
                if (l >= master_index) then
                    base_x = base_x + space
                end
                if l > p-8 and base_x < 10 then
                    if FileLoad[file] == nil then
                        FileLoad[file] = true
                        Threads.addTask(file, {
                            Type = "ImageLoad",
                            Path = file.icon_path,
                            Table = file,
                            Index = "ricon"
                        })
                    end
                    if file.ricon ~= nil then
                        DrawCover((targetX + l * space) - (#snes_table * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
                    else
                        DrawCover((targetX + l * space) - (#snes_table * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
                    end
                else
                    if FileLoad[file] == true then
                        FileLoad[file] = nil
                        Threads.remove(file)
                    end
                    if file.ricon then
                        Graphics.freeImage(file.ricon)
                        file.ricon = nil
                    end
                end
            end
            if showView ~= 2 then
                PrintCentered(fnt20, 480, 462, p .. " of " .. #snes_table, white, 20)-- Draw total items
            end

        --NES
        elseif showCat == 7 then
            for l, file in pairs(nes_table) do
                if (l >= master_index) then
                    base_x = base_x + space
                end
                if l > p-8 and base_x < 10 then
                    if FileLoad[file] == nil then
                        FileLoad[file] = true
                        Threads.addTask(file, {
                            Type = "ImageLoad",
                            Path = file.icon_path,
                            Table = file,
                            Index = "ricon"
                        })
                    end
                    if file.ricon ~= nil then
                        DrawCover((targetX + l * space) - (#nes_table * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
                    else
                        DrawCover((targetX + l * space) - (#nes_table * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
                    end
                else
                    if FileLoad[file] == true then
                        FileLoad[file] = nil
                        Threads.remove(file)
                    end
                    if file.ricon then
                        Graphics.freeImage(file.ricon)
                        file.ricon = nil
                    end
                end
            end
            if showView ~= 2 then
                PrintCentered(fnt20, 480, 462, p .. " of " .. #nes_table, white, 20)-- Draw total items
            end

        --GBA
        elseif showCat == 8 then
            for l, file in pairs(gba_table) do
                if (l >= master_index) then
                    base_x = base_x + space
                end
                if l > p-8 and base_x < 10 then
                    if FileLoad[file] == nil then
                        FileLoad[file] = true
                        Threads.addTask(file, {
                            Type = "ImageLoad",
                            Path = file.icon_path,
                            Table = file,
                            Index = "ricon"
                        })
                    end
                    if file.ricon ~= nil then
                        DrawCover((targetX + l * space) - (#gba_table * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
                    else
                        DrawCover((targetX + l * space) - (#gba_table * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
                    end
                else
                    if FileLoad[file] == true then
                        FileLoad[file] = nil
                        Threads.remove(file)
                    end
                    if file.ricon then
                        Graphics.freeImage(file.ricon)
                        file.ricon = nil
                    end
                end
            end
            if showView ~= 2 then
                PrintCentered(fnt20, 480, 462, p .. " of " .. #gba_table, white, 20)-- Draw total items
            end

        --GBC
        elseif showCat == 9 then
            for l, file in pairs(gbc_table) do
                if (l >= master_index) then
                    base_x = base_x + space
                end
                if l > p-8 and base_x < 10 then
                    if FileLoad[file] == nil then
                        FileLoad[file] = true
                        Threads.addTask(file, {
                            Type = "ImageLoad",
                            Path = file.icon_path,
                            Table = file,
                            Index = "ricon"
                        })
                    end
                    if file.ricon ~= nil then
                        DrawCover((targetX + l * space) - (#gbc_table * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
                    else
                        DrawCover((targetX + l * space) - (#gbc_table * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
                    end
                else
                    if FileLoad[file] == true then
                        FileLoad[file] = nil
                        Threads.remove(file)
                    end
                    if file.ricon then
                        Graphics.freeImage(file.ricon)
                        file.ricon = nil
                    end
                end
            end
            if showView ~= 2 then
                PrintCentered(fnt20, 480, 462, p .. " of " .. #gbc_table, white, 20)-- Draw total items
            end

        --GB
        elseif showCat == 10 then
            for l, file in pairs(gb_table) do
                if (l >= master_index) then
                    base_x = base_x + space
                end
                if l > p-8 and base_x < 10 then
                    if FileLoad[file] == nil then
                        FileLoad[file] = true
                        Threads.addTask(file, {
                            Type = "ImageLoad",
                            Path = file.icon_path,
                            Table = file,
                            Index = "ricon"
                        })
                    end
                    if file.ricon ~= nil then
                        DrawCover((targetX + l * space) - (#gb_table * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
                    else
                        DrawCover((targetX + l * space) - (#gb_table * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
                    end
                else
                    if FileLoad[file] == true then
                        FileLoad[file] = nil
                        Threads.remove(file)
                    end
                    if file.ricon then
                        Graphics.freeImage(file.ricon)
                        file.ricon = nil
                    end
                end
            end
            if showView ~= 2 then
                PrintCentered(fnt20, 480, 462, p .. " of " .. #gb_table, white, 20)-- Draw total items
            end

        --MD
        elseif showCat == 11 then
            for l, file in pairs(md_table) do
                if (l >= master_index) then
                    base_x = base_x + space
                end
                if l > p-8 and base_x < 10 then
                    if FileLoad[file] == nil then
                        FileLoad[file] = true
                        Threads.addTask(file, {
                            Type = "ImageLoad",
                            Path = file.icon_path,
                            Table = file,
                            Index = "ricon"
                        })
                    end
                    if file.ricon ~= nil then
                        DrawCover((targetX + l * space) - (#md_table * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
                    else
                        DrawCover((targetX + l * space) - (#md_table * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
                    end
                else
                    if FileLoad[file] == true then
                        FileLoad[file] = nil
                        Threads.remove(file)
                    end
                    if file.ricon then
                        Graphics.freeImage(file.ricon)
                        file.ricon = nil
                    end
                end
            end
            if showView ~= 2 then
                PrintCentered(fnt20, 480, 462, p .. " of " .. #md_table, white, 20)-- Draw total items
            end

        --SMS
        elseif showCat == 12 then
            for l, file in pairs(sms_table) do
                if (l >= master_index) then
                    base_x = base_x + space
                end
                if l > p-8 and base_x < 10 then
                    if FileLoad[file] == nil then
                        FileLoad[file] = true
                        Threads.addTask(file, {
                            Type = "ImageLoad",
                            Path = file.icon_path,
                            Table = file,
                            Index = "ricon"
                        })
                    end
                    if file.ricon ~= nil then
                        DrawCover((targetX + l * space) - (#sms_table * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
                    else
                        DrawCover((targetX + l * space) - (#sms_table * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
                    end
                else
                    if FileLoad[file] == true then
                        FileLoad[file] = nil
                        Threads.remove(file)
                    end
                    if file.ricon then
                        Graphics.freeImage(file.ricon)
                        file.ricon = nil
                    end
                end
            end
            if showView ~= 2 then
                PrintCentered(fnt20, 480, 462, p .. " of " .. #sms_table, white, 20)-- Draw total items
            end

        --GG
        elseif showCat == 13 then
            for l, file in pairs(gg_table) do
                if (l >= master_index) then
                    base_x = base_x + space
                end
                if l > p-8 and base_x < 10 then
                    if FileLoad[file] == nil then
                        FileLoad[file] = true
                        Threads.addTask(file, {
                            Type = "ImageLoad",
                            Path = file.icon_path,
                            Table = file,
                            Index = "ricon"
                        })
                    end
                    if file.ricon ~= nil then
                        DrawCover((targetX + l * space) - (#gg_table * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
                    else
                        DrawCover((targetX + l * space) - (#gg_table * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
                    end
                else
                    if FileLoad[file] == true then
                        FileLoad[file] = nil
                        Threads.remove(file)
                    end
                    if file.ricon then
                        Graphics.freeImage(file.ricon)
                        file.ricon = nil
                    end
                end
            end
            if showView ~= 2 then
                PrintCentered(fnt20, 480, 462, p .. " of " .. #gg_table, white, 20)-- Draw total items
            end

        --MAME
        elseif showCat == 14 then
            for l, file in pairs(mame_table) do
                if (l >= master_index) then
                    base_x = base_x + space
                end
                if l > p-8 and base_x < 10 then
                    if FileLoad[file] == nil then
                        FileLoad[file] = true
                        Threads.addTask(file, {
                            Type = "ImageLoad",
                            Path = file.icon_path,
                            Table = file,
                            Index = "ricon"
                        })
                    end
                    if file.ricon ~= nil then
                        DrawCover((targetX + l * space) - (#mame_table * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
                    else
                        DrawCover((targetX + l * space) - (#mame_table * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
                    end
                else
                    if FileLoad[file] == true then
                        FileLoad[file] = nil
                        Threads.remove(file)
                    end
                    if file.ricon then
                        Graphics.freeImage(file.ricon)
                        file.ricon = nil
                    end
                end
            end
            if showView ~= 2 then
                PrintCentered(fnt20, 480, 462, p .. " of " .. #mame_table, white, 20)-- Draw total items
            end

        --AMIGA
        elseif showCat == 15 then
            for l, file in pairs(amiga_table) do
                if (l >= master_index) then
                    base_x = base_x + space
                end
                if l > p-8 and base_x < 10 then
                    if FileLoad[file] == nil then
                        FileLoad[file] = true
                        Threads.addTask(file, {
                            Type = "ImageLoad",
                            Path = file.icon_path,
                            Table = file,
                            Index = "ricon"
                        })
                    end
                    if file.ricon ~= nil then
                        DrawCover((targetX + l * space) - (#amiga_table * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
                    else
                        DrawCover((targetX + l * space) - (#amiga_table * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
                    end
                else
                    if FileLoad[file] == true then
                        FileLoad[file] = nil
                        Threads.remove(file)
                    end
                    if file.ricon then
                        Graphics.freeImage(file.ricon)
                        file.ricon = nil
                    end
                end
            end
            if showView ~= 2 then
                PrintCentered(fnt20, 480, 462, p .. " of " .. #amiga_table, white, 20)-- Draw total items
            end

        --TG16
        elseif showCat == 16 then
            for l, file in pairs(tg16_table) do
                if (l >= master_index) then
                    base_x = base_x + space
                end
                if l > p-8 and base_x < 10 then
                    if FileLoad[file] == nil then
                        FileLoad[file] = true
                        Threads.addTask(file, {
                            Type = "ImageLoad",
                            Path = file.icon_path,
                            Table = file,
                            Index = "ricon"
                        })
                    end
                    if file.ricon ~= nil then
                        DrawCover((targetX + l * space) - (#tg16_table * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
                    else
                        DrawCover((targetX + l * space) - (#tg16_table * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
                    end
                else
                    if FileLoad[file] == true then
                        FileLoad[file] = nil
                        Threads.remove(file)
                    end
                    if file.ricon then
                        Graphics.freeImage(file.ricon)
                        file.ricon = nil
                    end
                end
            end
            if showView ~= 2 then
                PrintCentered(fnt20, 480, 462, p .. " of " .. #tg16_table, white, 20)-- Draw total items
            end

        --PCE
        elseif showCat == 17 then
            for l, file in pairs(pce_table) do
                if (l >= master_index) then
                    base_x = base_x + space
                end
                if l > p-8 and base_x < 10 then
                    if FileLoad[file] == nil then
                        FileLoad[file] = true
                        Threads.addTask(file, {
                            Type = "ImageLoad",
                            Path = file.icon_path,
                            Table = file,
                            Index = "ricon"
                        })
                    end
                    if file.ricon ~= nil then
                        DrawCover((targetX + l * space) - (#pce_table * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
                    else
                        DrawCover((targetX + l * space) - (#pce_table * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
                    end
                else
                    if FileLoad[file] == true then
                        FileLoad[file] = nil
                        Threads.remove(file)
                    end
                    if file.ricon then
                        Graphics.freeImage(file.ricon)
                        file.ricon = nil
                    end
                end
            end
            if showView ~= 2 then
                PrintCentered(fnt20, 480, 462, p .. " of " .. #pce_table, white, 20)-- Draw total items
            end


        else

            --ALL
            for l, file in pairs(files_table) do
                if (l >= master_index) then
                    base_x = base_x + space
                end
                if l > p-8 and base_x < 10 then
                    if FileLoad[file] == nil then
                        FileLoad[file] = true
                        Threads.addTask(file, {
                            Type = "ImageLoad",
                            Path = file.icon_path,
                            Table = file,
                            Index = "ricon"
                        })
                    end
                    if file.ricon ~= nil then
                        DrawCover((targetX + l * space) - (#files_table * space + space), -0.6, file.name, file.ricon, base_x, file.app_type)--draw visible covers only
                    else
                        DrawCover((targetX + l * space) - (#files_table * space + space), -0.6, file.name, file.icon, base_x, file.app_type)--draw visible covers only
                    end
                else
                    if FileLoad[file] == true then
                        FileLoad[file] = nil
                        Threads.remove(file)
                    end
                    if file.ricon then
                        Graphics.freeImage(file.ricon)
                        file.ricon = nil
                    end
                end
            end
            if showView ~= 2 then
                PrintCentered(fnt20, 480, 462, p .. " of " .. #files_table, white, 20)-- Draw total items
            end
        end
        
        
        -- Smooth move items horizontally
        if targetX < base_x then
            targetX = targetX + (-(targetX - base_x) * 0.1)
        elseif targetX > base_x then
            targetX = targetX - ((targetX - base_x) * 0.1)
        else
            targetX = base_x
        end
        
        -- Instantly move to selection
        if startCovers == false then
            targetX = base_x
            startCovers = true
            GetInfoSelected()
        end
        
        if setReflections==1 then
            floorY = 0
            if showView == 2 then
                floorY = -0.6
            elseif showView == 3 then
                floorY = -0.3
            end
            --Draw half transparent floor for reflection effect
            Render.drawModel(modFloor, 0, -0.6+floorY, 0, 0, 0, 0)
        end
        
        prevX = 0
        prevZ = 0
        prevRot = 0
        inPreview = false
    elseif showMenu == 1 then
        
        -- PREVIEW
        -- Footer buttons and icons
        Graphics.drawImage(900-(string.len(lang_lines[11])*10), 510, btnO)
        Font.print(fnt20, 900+28-(string.len(lang_lines[11])*10), 508, lang_lines[11], white)--Close
        Graphics.drawImage(750-(string.len(lang_lines[32])*10), 510, btnX)
        Font.print(fnt20, 750+28-(string.len(lang_lines[32])*10), 508, lang_lines[32], white)--Select
        
        Graphics.fillRect(24, 470, 24, 470, darkalpha)
        Render.setCamera(0, 0, 0, 0.0, 0.0, 0.0)
        if inPreview == false then
            if not pcall(loadImage, icon_path) then
                iconTmp = imgCoverTmp
            else
                iconTmp = Graphics.loadImage(icon_path)
            end
            -- set pic0 as background
            if System.doesFileExist(pic_path) and setBackground == 1 then
                Graphics.freeImage(backTmp)
                backTmp = Graphics.loadImage(pic_path)
                Graphics.setImageFilters(backTmp, FILTER_LINEAR, FILTER_LINEAR)
                Render.useTexture(modBackground, backTmp)
            else
                Render.useTexture(modBackground, imgCustomBack)
            end
            
            
            if folder == true then
                app_size = getAppSize(appdir)/1024/1024
                game_size = string.format("%02d", app_size) .. "Mb"
            else
                getRomSize()
            end


            
            menuY=0
            tmpappcat=0
            inPreview = true
        end
        
        -- animate cover zoom in
        if prevX < 1.4 then
            prevX = prevX + 0.1
        end
        if prevZ < 1 then
            prevZ = prevZ + 0.06
        end
        if prevRot > -0.6 then
            prevRot = prevRot - 0.04
        end
        
        Graphics.drawImage(50, 50, iconTmp)-- icon
        
        txtname = string.sub(app_title, 1, 32) .. "\n" .. string.sub(app_title, 33)
        
        -- Set cover image
        if showCat == 1 then
            --Graphics.setImageFilters(games_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if games_table[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, games_table[p].ricon)
                Render.useTexture(modCoverHbrNoref, games_table[p].ricon)
                Render.useTexture(modCoverPSPNoref, games_table[p].ricon)
                Render.useTexture(modCoverPSXNoref, games_table[p].ricon)
                Render.useTexture(modCoverN64Noref, games_table[p].ricon)
                Render.useTexture(modCoverN64Noref, games_table[p].ricon)
                Render.useTexture(modCoverNESNoref, games_table[p].ricon)
                Render.useTexture(modCoverGBNoref, games_table[p].ricon)
                Render.useTexture(modCoverGBNoref, games_table[p].ricon)
                Render.useTexture(modCoverGBNoref, games_table[p].ricon)
                Render.useTexture(modCoverMDNoref, games_table[p].ricon)
                Render.useTexture(modCoverMDNoref, games_table[p].ricon)
                Render.useTexture(modCoverMDNoref, games_table[p].ricon)
                Render.useTexture(modCoverMDNoref, games_table[p].ricon)
                Render.useTexture(modCoverMDNoref, games_table[p].ricon)
                Render.useTexture(modCoverMDNoref, games_table[p].ricon)
                Render.useTexture(modCoverMDNoref, games_table[p].ricon)
            else 
                Render.useTexture(modCoverNoref, games_table[p].icon)
                Render.useTexture(modCoverHbrNoref, games_table[p].icon)
                Render.useTexture(modCoverPSPNoref, games_table[p].icon)
                Render.useTexture(modCoverPSXNoref, games_table[p].icon)
                Render.useTexture(modCoverN64Noref, games_table[p].icon)
                Render.useTexture(modCoverN64Noref, games_table[p].icon)
                Render.useTexture(modCoverNESNoref, games_table[p].icon)
                Render.useTexture(modCoverGBNoref, games_table[p].icon)
                Render.useTexture(modCoverGBNoref, games_table[p].icon)
                Render.useTexture(modCoverGBNoref, games_table[p].icon)
                Render.useTexture(modCoverMDNoref, games_table[p].icon)
                Render.useTexture(modCoverMDNoref, games_table[p].icon)
                Render.useTexture(modCoverMDNoref, games_table[p].icon)
                Render.useTexture(modCoverMDNoref, games_table[p].icon)
                Render.useTexture(modCoverMDNoref, games_table[p].icon)
                Render.useTexture(modCoverMDNoref, games_table[p].icon)
                Render.useTexture(modCoverMDNoref, games_table[p].icon)
            end
        elseif showCat == 2 then
            --Graphics.setImageFilters(homebrews_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if homebrews_table[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, homebrews_table[p].ricon)
                Render.useTexture(modCoverHbrNoref, homebrews_table[p].ricon)
                Render.useTexture(modCoverPSPNoref, homebrews_table[p].ricon)
                Render.useTexture(modCoverPSXNoref, homebrews_table[p].ricon)
                Render.useTexture(modCoverN64Noref, homebrews_table[p].ricon)
                Render.useTexture(modCoverN64Noref, homebrews_table[p].ricon)
                Render.useTexture(modCoverNESNoref, homebrews_table[p].ricon)
                Render.useTexture(modCoverGBNoref, homebrews_table[p].ricon)
                Render.useTexture(modCoverGBNoref, homebrews_table[p].ricon)
                Render.useTexture(modCoverGBNoref, homebrews_table[p].ricon)
                Render.useTexture(modCoverMDNoref, homebrews_table[p].ricon)
                Render.useTexture(modCoverMDNoref, homebrews_table[p].ricon)
                Render.useTexture(modCoverMDNoref, homebrews_table[p].ricon)
                Render.useTexture(modCoverMDNoref, homebrews_table[p].ricon)
                Render.useTexture(modCoverMDNoref, homebrews_table[p].ricon)
                Render.useTexture(modCoverMDNoref, homebrews_table[p].ricon)
                Render.useTexture(modCoverMDNoref, homebrews_table[p].ricon)
            else 
                Render.useTexture(modCoverNoref, homebrews_table[p].icon)
                Render.useTexture(modCoverHbrNoref, homebrews_table[p].icon)
                Render.useTexture(modCoverPSPNoref, homebrews_table[p].icon)
                Render.useTexture(modCoverPSXNoref, homebrews_table[p].icon)
                Render.useTexture(modCoverN64Noref, homebrews_table[p].icon)
                Render.useTexture(modCoverN64Noref, homebrews_table[p].icon)
                Render.useTexture(modCoverNESNoref, homebrews_table[p].icon)
                Render.useTexture(modCoverGBNoref, homebrews_table[p].icon)
                Render.useTexture(modCoverGBNoref, homebrews_table[p].icon)
                Render.useTexture(modCoverGBNoref, homebrews_table[p].icon)
                Render.useTexture(modCoverMDNoref, homebrews_table[p].icon)
                Render.useTexture(modCoverMDNoref, homebrews_table[p].icon)
                Render.useTexture(modCoverMDNoref, homebrews_table[p].icon)
                Render.useTexture(modCoverMDNoref, homebrews_table[p].icon)
                Render.useTexture(modCoverMDNoref, homebrews_table[p].icon)
                Render.useTexture(modCoverMDNoref, homebrews_table[p].icon)
                Render.useTexture(modCoverMDNoref, homebrews_table[p].icon)
            end
        elseif showCat == 3 then
            --Graphics.setImageFilters(psp_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if psp_table[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, psp_table[p].ricon)
                Render.useTexture(modCoverHbrNoref, psp_table[p].ricon)
                Render.useTexture(modCoverPSPNoref, psp_table[p].ricon)
                Render.useTexture(modCoverPSXNoref, psp_table[p].ricon)
                Render.useTexture(modCoverN64Noref, psp_table[p].ricon)
                Render.useTexture(modCoverN64Noref, psp_table[p].ricon)
                Render.useTexture(modCoverNESNoref, psp_table[p].ricon)
                Render.useTexture(modCoverGBNoref, psp_table[p].ricon)
                Render.useTexture(modCoverGBNoref, psp_table[p].ricon)
                Render.useTexture(modCoverGBNoref, psp_table[p].ricon)
                Render.useTexture(modCoverMDNoref, psp_table[p].ricon)
                Render.useTexture(modCoverMDNoref, psp_table[p].ricon)
                Render.useTexture(modCoverMDNoref, psp_table[p].ricon)
                Render.useTexture(modCoverMDNoref, psp_table[p].ricon)
                Render.useTexture(modCoverMDNoref, psp_table[p].ricon)
                Render.useTexture(modCoverMDNoref, psp_table[p].ricon)
                Render.useTexture(modCoverMDNoref, psp_table[p].ricon)
            else 
                Render.useTexture(modCoverNoref, psp_table[p].icon)
                Render.useTexture(modCoverHbrNoref, psp_table[p].icon)
                Render.useTexture(modCoverPSPNoref, psp_table[p].icon)
                Render.useTexture(modCoverPSXNoref, psp_table[p].icon)
                Render.useTexture(modCoverN64Noref, psp_table[p].icon)
                Render.useTexture(modCoverN64Noref, psp_table[p].icon)
                Render.useTexture(modCoverNESNoref, psp_table[p].icon)
                Render.useTexture(modCoverGBNoref, psp_table[p].icon)
                Render.useTexture(modCoverGBNoref, psp_table[p].icon)
                Render.useTexture(modCoverGBNoref, psp_table[p].icon)
                Render.useTexture(modCoverMDNoref, psp_table[p].icon)
                Render.useTexture(modCoverMDNoref, psp_table[p].icon)
                Render.useTexture(modCoverMDNoref, psp_table[p].icon)
                Render.useTexture(modCoverMDNoref, psp_table[p].icon)
                Render.useTexture(modCoverMDNoref, psp_table[p].icon)
                Render.useTexture(modCoverMDNoref, psp_table[p].icon)
                Render.useTexture(modCoverMDNoref, psp_table[p].icon)
            end
        elseif showCat == 4 then
            --Graphics.setImageFilters(psx_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if psx_table[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, psx_table[p].ricon)
                Render.useTexture(modCoverHbrNoref, psx_table[p].ricon)
                Render.useTexture(modCoverPSPNoref, psx_table[p].ricon)
                Render.useTexture(modCoverPSXNoref, psx_table[p].ricon)
                Render.useTexture(modCoverN64Noref, psx_table[p].ricon)
                Render.useTexture(modCoverN64Noref, psx_table[p].ricon)
                Render.useTexture(modCoverNESNoref, psx_table[p].ricon)
                Render.useTexture(modCoverGBNoref, psx_table[p].ricon)
                Render.useTexture(modCoverGBNoref, psx_table[p].ricon)
                Render.useTexture(modCoverGBNoref, psx_table[p].ricon)
                Render.useTexture(modCoverMDNoref, psx_table[p].ricon)
                Render.useTexture(modCoverMDNoref, psx_table[p].ricon)
                Render.useTexture(modCoverMDNoref, psx_table[p].ricon)
                Render.useTexture(modCoverMDNoref, psx_table[p].ricon)
                Render.useTexture(modCoverMDNoref, psx_table[p].ricon)
                Render.useTexture(modCoverMDNoref, psx_table[p].ricon)
                Render.useTexture(modCoverMDNoref, psx_table[p].ricon)
            else 
                Render.useTexture(modCoverNoref, psx_table[p].icon)
                Render.useTexture(modCoverHbrNoref, psx_table[p].icon)
                Render.useTexture(modCoverPSPNoref, psx_table[p].icon)
                Render.useTexture(modCoverPSXNoref, psx_table[p].icon)
                Render.useTexture(modCoverN64Noref, psx_table[p].icon)
                Render.useTexture(modCoverN64Noref, psx_table[p].icon)
                Render.useTexture(modCoverNESNoref, psx_table[p].icon)
                Render.useTexture(modCoverGBNoref, psx_table[p].icon)
                Render.useTexture(modCoverGBNoref, psx_table[p].icon)
                Render.useTexture(modCoverGBNoref, psx_table[p].icon)
                Render.useTexture(modCoverMDNoref, psx_table[p].icon)
                Render.useTexture(modCoverMDNoref, psx_table[p].icon)
                Render.useTexture(modCoverMDNoref, psx_table[p].icon)
                Render.useTexture(modCoverMDNoref, psx_table[p].icon)
                Render.useTexture(modCoverMDNoref, psx_table[p].icon)
                Render.useTexture(modCoverMDNoref, psx_table[p].icon)
                Render.useTexture(modCoverMDNoref, psx_table[p].icon)
            end
        --N64
        elseif showCat == 5 then
            --Graphics.setImageFilters(n64_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if n64_table[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, n64_table[p].ricon)
                Render.useTexture(modCoverHbrNoref, n64_table[p].ricon)
                Render.useTexture(modCoverPSPNoref, n64_table[p].ricon)
                Render.useTexture(modCoverPSXNoref, n64_table[p].ricon)
                Render.useTexture(modCoverN64Noref, n64_table[p].ricon)
                Render.useTexture(modCoverN64Noref, n64_table[p].ricon)
                Render.useTexture(modCoverNESNoref, n64_table[p].ricon)
                Render.useTexture(modCoverGBNoref, n64_table[p].ricon)
                Render.useTexture(modCoverGBNoref, n64_table[p].ricon)
                Render.useTexture(modCoverGBNoref, n64_table[p].ricon)
                Render.useTexture(modCoverMDNoref, n64_table[p].ricon)
                Render.useTexture(modCoverMDNoref, n64_table[p].ricon)
                Render.useTexture(modCoverMDNoref, n64_table[p].ricon)
                Render.useTexture(modCoverMDNoref, n64_table[p].ricon)
                Render.useTexture(modCoverMDNoref, n64_table[p].ricon)
                Render.useTexture(modCoverMDNoref, n64_table[p].ricon)
                Render.useTexture(modCoverMDNoref, n64_table[p].ricon)
            else 
                Render.useTexture(modCoverNoref, n64_table[p].icon)
                Render.useTexture(modCoverHbrNoref, n64_table[p].icon)
                Render.useTexture(modCoverPSPNoref, n64_table[p].icon)
                Render.useTexture(modCoverPSXNoref, n64_table[p].icon)
                Render.useTexture(modCoverN64Noref, n64_table[p].icon)
                Render.useTexture(modCoverN64Noref, n64_table[p].icon)
                Render.useTexture(modCoverNESNoref, n64_table[p].icon)
                Render.useTexture(modCoverGBNoref, n64_table[p].icon)
                Render.useTexture(modCoverGBNoref, n64_table[p].icon)
                Render.useTexture(modCoverGBNoref, n64_table[p].icon)
                Render.useTexture(modCoverMDNoref, n64_table[p].icon)
                Render.useTexture(modCoverMDNoref, n64_table[p].icon)
                Render.useTexture(modCoverMDNoref, n64_table[p].icon)
                Render.useTexture(modCoverMDNoref, n64_table[p].icon)
                Render.useTexture(modCoverMDNoref, n64_table[p].icon)
                Render.useTexture(modCoverMDNoref, n64_table[p].icon)
                Render.useTexture(modCoverMDNoref, n64_table[p].icon)
            end
        --SNES
        elseif showCat == 6 then
            --Graphics.setImageFilters(snes_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if snes_table[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, snes_table[p].ricon)
                Render.useTexture(modCoverHbrNoref, snes_table[p].ricon)
                Render.useTexture(modCoverPSPNoref, snes_table[p].ricon)
                Render.useTexture(modCoverPSXNoref, snes_table[p].ricon)
                Render.useTexture(modCoverN64Noref, snes_table[p].ricon)
                Render.useTexture(modCoverN64Noref, snes_table[p].ricon)
                Render.useTexture(modCoverNESNoref, snes_table[p].ricon)
                Render.useTexture(modCoverGBNoref, snes_table[p].ricon)
                Render.useTexture(modCoverGBNoref, snes_table[p].ricon)
                Render.useTexture(modCoverGBNoref, snes_table[p].ricon)
                Render.useTexture(modCoverMDNoref, snes_table[p].ricon)
                Render.useTexture(modCoverMDNoref, snes_table[p].ricon)
                Render.useTexture(modCoverMDNoref, snes_table[p].ricon)
                Render.useTexture(modCoverMDNoref, snes_table[p].ricon)
                Render.useTexture(modCoverMDNoref, snes_table[p].ricon)
                Render.useTexture(modCoverMDNoref, snes_table[p].ricon)
                Render.useTexture(modCoverMDNoref, snes_table[p].ricon)
            else 
                Render.useTexture(modCoverNoref, snes_table[p].icon)
                Render.useTexture(modCoverHbrNoref, snes_table[p].icon)
                Render.useTexture(modCoverPSPNoref, snes_table[p].icon)
                Render.useTexture(modCoverPSXNoref, snes_table[p].icon)
                Render.useTexture(modCoverN64Noref, snes_table[p].icon)
                Render.useTexture(modCoverN64Noref, snes_table[p].icon)
                Render.useTexture(modCoverNESNoref, snes_table[p].icon)
                Render.useTexture(modCoverGBNoref, snes_table[p].icon)
                Render.useTexture(modCoverGBNoref, snes_table[p].icon)
                Render.useTexture(modCoverGBNoref, snes_table[p].icon)
                Render.useTexture(modCoverMDNoref, snes_table[p].icon)
                Render.useTexture(modCoverMDNoref, snes_table[p].icon)
                Render.useTexture(modCoverMDNoref, snes_table[p].icon)
                Render.useTexture(modCoverMDNoref, snes_table[p].icon)
                Render.useTexture(modCoverMDNoref, snes_table[p].icon)
                Render.useTexture(modCoverMDNoref, snes_table[p].icon)
                Render.useTexture(modCoverMDNoref, snes_table[p].icon)
            end
        --NES
        elseif showCat == 7 then
            --Graphics.setImageFilters(nes_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if nes_table[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, nes_table[p].ricon)
                Render.useTexture(modCoverHbrNoref, nes_table[p].ricon)
                Render.useTexture(modCoverPSPNoref, nes_table[p].ricon)
                Render.useTexture(modCoverPSXNoref, nes_table[p].ricon)
                Render.useTexture(modCoverN64Noref, nes_table[p].ricon)
                Render.useTexture(modCoverN64Noref, nes_table[p].ricon)
                Render.useTexture(modCoverNESNoref, nes_table[p].ricon)
                Render.useTexture(modCoverGBNoref, nes_table[p].ricon)
                Render.useTexture(modCoverGBNoref, nes_table[p].ricon)
                Render.useTexture(modCoverGBNoref, nes_table[p].ricon)
                Render.useTexture(modCoverMDNoref, nes_table[p].ricon)
                Render.useTexture(modCoverMDNoref, nes_table[p].ricon)
                Render.useTexture(modCoverMDNoref, nes_table[p].ricon)
                Render.useTexture(modCoverMDNoref, nes_table[p].ricon)
                Render.useTexture(modCoverMDNoref, nes_table[p].ricon)
                Render.useTexture(modCoverMDNoref, nes_table[p].ricon)
                Render.useTexture(modCoverMDNoref, nes_table[p].ricon)
            else 
                Render.useTexture(modCoverNoref, nes_table[p].icon)
                Render.useTexture(modCoverHbrNoref, nes_table[p].icon)
                Render.useTexture(modCoverPSPNoref, nes_table[p].icon)
                Render.useTexture(modCoverPSXNoref, nes_table[p].icon)
                Render.useTexture(modCoverN64Noref, nes_table[p].icon)
                Render.useTexture(modCoverN64Noref, nes_table[p].icon)
                Render.useTexture(modCoverNESNoref, nes_table[p].icon)
                Render.useTexture(modCoverGBNoref, nes_table[p].icon)
                Render.useTexture(modCoverGBNoref, nes_table[p].icon)
                Render.useTexture(modCoverGBNoref, nes_table[p].icon)
                Render.useTexture(modCoverMDNoref, nes_table[p].icon)
                Render.useTexture(modCoverMDNoref, nes_table[p].icon)
                Render.useTexture(modCoverMDNoref, nes_table[p].icon)
                Render.useTexture(modCoverMDNoref, nes_table[p].icon)
                Render.useTexture(modCoverMDNoref, nes_table[p].icon)
                Render.useTexture(modCoverMDNoref, nes_table[p].icon)
                Render.useTexture(modCoverMDNoref, nes_table[p].icon)
            end
        --GBA
        elseif showCat == 8 then
            --Graphics.setImageFilters(gba_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if gba_table[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, gba_table[p].ricon)
                Render.useTexture(modCoverHbrNoref, gba_table[p].ricon)
                Render.useTexture(modCoverPSPNoref, gba_table[p].ricon)
                Render.useTexture(modCoverPSXNoref, gba_table[p].ricon)
                Render.useTexture(modCoverN64Noref, gba_table[p].ricon)
                Render.useTexture(modCoverN64Noref, gba_table[p].ricon)
                Render.useTexture(modCoverNESNoref, gba_table[p].ricon)
                Render.useTexture(modCoverGBNoref, gba_table[p].ricon)
                Render.useTexture(modCoverGBNoref, gba_table[p].ricon)
                Render.useTexture(modCoverGBNoref, gba_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gba_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gba_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gba_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gba_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gba_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gba_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gba_table[p].ricon)
            else 
                Render.useTexture(modCoverNoref, gba_table[p].icon)
                Render.useTexture(modCoverHbrNoref, gba_table[p].icon)
                Render.useTexture(modCoverPSPNoref, gba_table[p].icon)
                Render.useTexture(modCoverPSXNoref, gba_table[p].icon)
                Render.useTexture(modCoverN64Noref, gba_table[p].icon)
                Render.useTexture(modCoverN64Noref, gba_table[p].icon)
                Render.useTexture(modCoverNESNoref, gba_table[p].icon)
                Render.useTexture(modCoverGBNoref, gba_table[p].icon)
                Render.useTexture(modCoverGBNoref, gba_table[p].icon)
                Render.useTexture(modCoverGBNoref, gba_table[p].icon)
                Render.useTexture(modCoverMDNoref, gba_table[p].icon)
                Render.useTexture(modCoverMDNoref, gba_table[p].icon)
                Render.useTexture(modCoverMDNoref, gba_table[p].icon)
                Render.useTexture(modCoverMDNoref, gba_table[p].icon)
                Render.useTexture(modCoverMDNoref, gba_table[p].icon)
                Render.useTexture(modCoverMDNoref, gba_table[p].icon)
                Render.useTexture(modCoverMDNoref, gba_table[p].icon)
            end
        --GBC
        elseif showCat == 9 then
            --Graphics.setImageFilters(gbc_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if gbc_table[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, gbc_table[p].ricon)
                Render.useTexture(modCoverHbrNoref, gbc_table[p].ricon)
                Render.useTexture(modCoverPSPNoref, gbc_table[p].ricon)
                Render.useTexture(modCoverPSXNoref, gbc_table[p].ricon)
                Render.useTexture(modCoverN64Noref, gbc_table[p].ricon)
                Render.useTexture(modCoverN64Noref, gbc_table[p].ricon)
                Render.useTexture(modCoverNESNoref, gbc_table[p].ricon)
                Render.useTexture(modCoverGBNoref, gbc_table[p].ricon)
                Render.useTexture(modCoverGBNoref, gbc_table[p].ricon)
                Render.useTexture(modCoverGBNoref, gbc_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gbc_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gbc_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gbc_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gbc_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gbc_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gbc_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gbc_table[p].ricon)
            else 
                Render.useTexture(modCoverNoref, gbc_table[p].icon)
                Render.useTexture(modCoverHbrNoref, gbc_table[p].icon)
                Render.useTexture(modCoverPSPNoref, gbc_table[p].icon)
                Render.useTexture(modCoverPSXNoref, gbc_table[p].icon)
                Render.useTexture(modCoverN64Noref, gbc_table[p].icon)
                Render.useTexture(modCoverN64Noref, gbc_table[p].icon)
                Render.useTexture(modCoverNESNoref, gbc_table[p].icon)
                Render.useTexture(modCoverGBNoref, gbc_table[p].icon)
                Render.useTexture(modCoverGBNoref, gbc_table[p].icon)
                Render.useTexture(modCoverGBNoref, gbc_table[p].icon)
                Render.useTexture(modCoverMDNoref, gbc_table[p].icon)
                Render.useTexture(modCoverMDNoref, gbc_table[p].icon)
                Render.useTexture(modCoverMDNoref, gbc_table[p].icon)
                Render.useTexture(modCoverMDNoref, gbc_table[p].icon)
                Render.useTexture(modCoverMDNoref, gbc_table[p].icon)
                Render.useTexture(modCoverMDNoref, gbc_table[p].icon)
                Render.useTexture(modCoverMDNoref, gbc_table[p].icon)
            end
        --GB
        elseif showCat == 10 then
            --Graphics.setImageFilters(gb_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if gb_table[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, gb_table[p].ricon)
                Render.useTexture(modCoverHbrNoref, gb_table[p].ricon)
                Render.useTexture(modCoverPSPNoref, gb_table[p].ricon)
                Render.useTexture(modCoverPSXNoref, gb_table[p].ricon)
                Render.useTexture(modCoverN64Noref, gb_table[p].ricon)
                Render.useTexture(modCoverN64Noref, gb_table[p].ricon)
                Render.useTexture(modCoverNESNoref, gb_table[p].ricon)
                Render.useTexture(modCoverGBNoref, gb_table[p].ricon)
                Render.useTexture(modCoverGBNoref, gb_table[p].ricon)
                Render.useTexture(modCoverGBNoref, gb_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gb_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gb_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gb_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gb_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gb_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gb_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gb_table[p].ricon)
            else 
                Render.useTexture(modCoverNoref, gb_table[p].icon)
                Render.useTexture(modCoverHbrNoref, gb_table[p].icon)
                Render.useTexture(modCoverPSPNoref, gb_table[p].icon)
                Render.useTexture(modCoverPSXNoref, gb_table[p].icon)
                Render.useTexture(modCoverN64Noref, gb_table[p].icon)
                Render.useTexture(modCoverN64Noref, gb_table[p].icon)
                Render.useTexture(modCoverNESNoref, gb_table[p].icon)
                Render.useTexture(modCoverGBNoref, gb_table[p].icon)
                Render.useTexture(modCoverGBNoref, gb_table[p].icon)
                Render.useTexture(modCoverGBNoref, gb_table[p].icon)
                Render.useTexture(modCoverMDNoref, gb_table[p].icon)
                Render.useTexture(modCoverMDNoref, gb_table[p].icon)
                Render.useTexture(modCoverMDNoref, gb_table[p].icon)
                Render.useTexture(modCoverMDNoref, gb_table[p].icon)
                Render.useTexture(modCoverMDNoref, gb_table[p].icon)
                Render.useTexture(modCoverMDNoref, gb_table[p].icon)
                Render.useTexture(modCoverMDNoref, gb_table[p].icon)
            end
        --MD
        elseif showCat == 11 then
            --Graphics.setImageFilters(md_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if md_table[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, md_table[p].ricon)
                Render.useTexture(modCoverHbrNoref, md_table[p].ricon)
                Render.useTexture(modCoverPSPNoref, md_table[p].ricon)
                Render.useTexture(modCoverPSXNoref, md_table[p].ricon)
                Render.useTexture(modCoverN64Noref, md_table[p].ricon)
                Render.useTexture(modCoverN64Noref, md_table[p].ricon)
                Render.useTexture(modCoverNESNoref, md_table[p].ricon)
                Render.useTexture(modCoverGBNoref, md_table[p].ricon)
                Render.useTexture(modCoverGBNoref, md_table[p].ricon)
                Render.useTexture(modCoverGBNoref, md_table[p].ricon)
                Render.useTexture(modCoverMDNoref, md_table[p].ricon)
                Render.useTexture(modCoverMDNoref, md_table[p].ricon)
                Render.useTexture(modCoverMDNoref, md_table[p].ricon)
                Render.useTexture(modCoverMDNoref, md_table[p].ricon)
                Render.useTexture(modCoverMDNoref, md_table[p].ricon)
                Render.useTexture(modCoverMDNoref, md_table[p].ricon)
                Render.useTexture(modCoverMDNoref, md_table[p].ricon)
            else 
                Render.useTexture(modCoverNoref, md_table[p].icon)
                Render.useTexture(modCoverHbrNoref, md_table[p].icon)
                Render.useTexture(modCoverPSPNoref, md_table[p].icon)
                Render.useTexture(modCoverPSXNoref, md_table[p].icon)
                Render.useTexture(modCoverN64Noref, md_table[p].icon)
                Render.useTexture(modCoverN64Noref, md_table[p].icon)
                Render.useTexture(modCoverNESNoref, md_table[p].icon)
                Render.useTexture(modCoverGBNoref, md_table[p].icon)
                Render.useTexture(modCoverGBNoref, md_table[p].icon)
                Render.useTexture(modCoverGBNoref, md_table[p].icon)
                Render.useTexture(modCoverMDNoref, md_table[p].icon)
                Render.useTexture(modCoverMDNoref, md_table[p].icon)
                Render.useTexture(modCoverMDNoref, md_table[p].icon)
                Render.useTexture(modCoverMDNoref, md_table[p].icon)
                Render.useTexture(modCoverMDNoref, md_table[p].icon)
                Render.useTexture(modCoverMDNoref, md_table[p].icon)
                Render.useTexture(modCoverMDNoref, md_table[p].icon)
            end
        --SMS
        elseif showCat == 12 then
            --Graphics.setImageFilters(sms_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if sms_table[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, sms_table[p].ricon)
                Render.useTexture(modCoverHbrNoref, sms_table[p].ricon)
                Render.useTexture(modCoverPSPNoref, sms_table[p].ricon)
                Render.useTexture(modCoverPSXNoref, sms_table[p].ricon)
                Render.useTexture(modCoverN64Noref, sms_table[p].ricon)
                Render.useTexture(modCoverN64Noref, sms_table[p].ricon)
                Render.useTexture(modCoverNESNoref, sms_table[p].ricon)
                Render.useTexture(modCoverGBNoref, sms_table[p].ricon)
                Render.useTexture(modCoverGBNoref, sms_table[p].ricon)
                Render.useTexture(modCoverGBNoref, sms_table[p].ricon)
                Render.useTexture(modCoverMDNoref, sms_table[p].ricon)
                Render.useTexture(modCoverMDNoref, sms_table[p].ricon)
                Render.useTexture(modCoverMDNoref, sms_table[p].ricon)
                Render.useTexture(modCoverMDNoref, sms_table[p].ricon)
                Render.useTexture(modCoverMDNoref, sms_table[p].ricon)
                Render.useTexture(modCoverMDNoref, sms_table[p].ricon)
                Render.useTexture(modCoverMDNoref, sms_table[p].ricon)
            else 
                Render.useTexture(modCoverNoref, sms_table[p].icon)
                Render.useTexture(modCoverHbrNoref, sms_table[p].icon)
                Render.useTexture(modCoverPSPNoref, sms_table[p].icon)
                Render.useTexture(modCoverPSXNoref, sms_table[p].icon)
                Render.useTexture(modCoverN64Noref, sms_table[p].icon)
                Render.useTexture(modCoverN64Noref, sms_table[p].icon)
                Render.useTexture(modCoverNESNoref, sms_table[p].icon)
                Render.useTexture(modCoverGBNoref, sms_table[p].icon)
                Render.useTexture(modCoverGBNoref, sms_table[p].icon)
                Render.useTexture(modCoverGBNoref, sms_table[p].icon)
                Render.useTexture(modCoverMDNoref, sms_table[p].icon)
                Render.useTexture(modCoverMDNoref, sms_table[p].icon)
                Render.useTexture(modCoverMDNoref, sms_table[p].icon)
                Render.useTexture(modCoverMDNoref, sms_table[p].icon)
                Render.useTexture(modCoverMDNoref, sms_table[p].icon)
                Render.useTexture(modCoverMDNoref, sms_table[p].icon)
                Render.useTexture(modCoverMDNoref, sms_table[p].icon)
            end
        --GG
        elseif showCat == 13 then
            --Graphics.setImageFilters(gg_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if gg_table[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, gg_table[p].ricon)
                Render.useTexture(modCoverHbrNoref, gg_table[p].ricon)
                Render.useTexture(modCoverPSPNoref, gg_table[p].ricon)
                Render.useTexture(modCoverPSXNoref, gg_table[p].ricon)
                Render.useTexture(modCoverN64Noref, gg_table[p].ricon)
                Render.useTexture(modCoverN64Noref, gg_table[p].ricon)
                Render.useTexture(modCoverNESNoref, gg_table[p].ricon)
                Render.useTexture(modCoverGBNoref, gg_table[p].ricon)
                Render.useTexture(modCoverGBNoref, gg_table[p].ricon)
                Render.useTexture(modCoverGBNoref, gg_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gg_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gg_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gg_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gg_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gg_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gg_table[p].ricon)
                Render.useTexture(modCoverMDNoref, gg_table[p].ricon)
            else 
                Render.useTexture(modCoverNoref, gg_table[p].icon)
                Render.useTexture(modCoverHbrNoref, gg_table[p].icon)
                Render.useTexture(modCoverPSPNoref, gg_table[p].icon)
                Render.useTexture(modCoverPSXNoref, gg_table[p].icon)
                Render.useTexture(modCoverN64Noref, gg_table[p].icon)
                Render.useTexture(modCoverN64Noref, gg_table[p].icon)
                Render.useTexture(modCoverNESNoref, gg_table[p].icon)
                Render.useTexture(modCoverGBNoref, gg_table[p].icon)
                Render.useTexture(modCoverGBNoref, gg_table[p].icon)
                Render.useTexture(modCoverGBNoref, gg_table[p].icon)
                Render.useTexture(modCoverMDNoref, gg_table[p].icon)
                Render.useTexture(modCoverMDNoref, gg_table[p].icon)
                Render.useTexture(modCoverMDNoref, gg_table[p].icon)
                Render.useTexture(modCoverMDNoref, gg_table[p].icon)
                Render.useTexture(modCoverMDNoref, gg_table[p].icon)
                Render.useTexture(modCoverMDNoref, gg_table[p].icon)
                Render.useTexture(modCoverMDNoref, gg_table[p].icon)
            end
        --MAME
        elseif showCat == 14 then
            --Graphics.setImageFilters(mame_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if mame_table[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, mame_table[p].ricon)
                Render.useTexture(modCoverHbrNoref, mame_table[p].ricon)
                Render.useTexture(modCoverPSPNoref, mame_table[p].ricon)
                Render.useTexture(modCoverPSXNoref, mame_table[p].ricon)
                Render.useTexture(modCoverN64Noref, mame_table[p].ricon)
                Render.useTexture(modCoverN64Noref, mame_table[p].ricon)
                Render.useTexture(modCoverNESNoref, mame_table[p].ricon)
                Render.useTexture(modCoverGBNoref, mame_table[p].ricon)
                Render.useTexture(modCoverGBNoref, mame_table[p].ricon)
                Render.useTexture(modCoverGBNoref, mame_table[p].ricon)
                Render.useTexture(modCoverMDNoref, mame_table[p].ricon)
                Render.useTexture(modCoverMDNoref, mame_table[p].ricon)
                Render.useTexture(modCoverMDNoref, mame_table[p].ricon)
                Render.useTexture(modCoverMDNoref, mame_table[p].ricon)
                Render.useTexture(modCoverMDNoref, mame_table[p].ricon)
                Render.useTexture(modCoverMDNoref, mame_table[p].ricon)
                Render.useTexture(modCoverMDNoref, mame_table[p].ricon)
            else 
                Render.useTexture(modCoverNoref, mame_table[p].icon)
                Render.useTexture(modCoverHbrNoref, mame_table[p].icon)
                Render.useTexture(modCoverPSPNoref, mame_table[p].icon)
                Render.useTexture(modCoverPSXNoref, mame_table[p].icon)
                Render.useTexture(modCoverN64Noref, mame_table[p].icon)
                Render.useTexture(modCoverN64Noref, mame_table[p].icon)
                Render.useTexture(modCoverNESNoref, mame_table[p].icon)
                Render.useTexture(modCoverGBNoref, mame_table[p].icon)
                Render.useTexture(modCoverGBNoref, mame_table[p].icon)
                Render.useTexture(modCoverGBNoref, mame_table[p].icon)
                Render.useTexture(modCoverMDNoref, mame_table[p].icon)
                Render.useTexture(modCoverMDNoref, mame_table[p].icon)
                Render.useTexture(modCoverMDNoref, mame_table[p].icon)
                Render.useTexture(modCoverMDNoref, mame_table[p].icon)
                Render.useTexture(modCoverMDNoref, mame_table[p].icon)
                Render.useTexture(modCoverMDNoref, mame_table[p].icon)
                Render.useTexture(modCoverMDNoref, mame_table[p].icon)
            end
        --AMIGA
        elseif showCat == 15 then
            --Graphics.setImageFilters(amiga_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if amiga_table[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, amiga_table[p].ricon)
                Render.useTexture(modCoverHbrNoref, amiga_table[p].ricon)
                Render.useTexture(modCoverPSPNoref, amiga_table[p].ricon)
                Render.useTexture(modCoverPSXNoref, amiga_table[p].ricon)
                Render.useTexture(modCoverN64Noref, amiga_table[p].ricon)
                Render.useTexture(modCoverN64Noref, amiga_table[p].ricon)
                Render.useTexture(modCoverNESNoref, amiga_table[p].ricon)
                Render.useTexture(modCoverGBNoref, amiga_table[p].ricon)
                Render.useTexture(modCoverGBNoref, amiga_table[p].ricon)
                Render.useTexture(modCoverGBNoref, amiga_table[p].ricon)
                Render.useTexture(modCoverMDNoref, amiga_table[p].ricon)
                Render.useTexture(modCoverMDNoref, amiga_table[p].ricon)
                Render.useTexture(modCoverMDNoref, amiga_table[p].ricon)
                Render.useTexture(modCoverMDNoref, amiga_table[p].ricon)
                Render.useTexture(modCoverMDNoref, amiga_table[p].ricon)
                Render.useTexture(modCoverMDNoref, amiga_table[p].ricon)
                Render.useTexture(modCoverMDNoref, amiga_table[p].ricon)
            else 
                Render.useTexture(modCoverNoref, amiga_table[p].icon)
                Render.useTexture(modCoverHbrNoref, amiga_table[p].icon)
                Render.useTexture(modCoverPSPNoref, amiga_table[p].icon)
                Render.useTexture(modCoverPSXNoref, amiga_table[p].icon)
                Render.useTexture(modCoverN64Noref, amiga_table[p].icon)
                Render.useTexture(modCoverN64Noref, amiga_table[p].icon)
                Render.useTexture(modCoverNESNoref, amiga_table[p].icon)
                Render.useTexture(modCoverGBNoref, amiga_table[p].icon)
                Render.useTexture(modCoverGBNoref, amiga_table[p].icon)
                Render.useTexture(modCoverGBNoref, amiga_table[p].icon)
                Render.useTexture(modCoverMDNoref, amiga_table[p].icon)
                Render.useTexture(modCoverMDNoref, amiga_table[p].icon)
                Render.useTexture(modCoverMDNoref, amiga_table[p].icon)
                Render.useTexture(modCoverMDNoref, amiga_table[p].icon)
                Render.useTexture(modCoverMDNoref, amiga_table[p].icon)
                Render.useTexture(modCoverMDNoref, amiga_table[p].icon)
                Render.useTexture(modCoverMDNoref, amiga_table[p].icon)
            end
        --TG16
        elseif showCat == 16 then
            --Graphics.setImageFilters(tg16_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if tg16_table[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, tg16_table[p].ricon)
                Render.useTexture(modCoverHbrNoref, tg16_table[p].ricon)
                Render.useTexture(modCoverPSPNoref, tg16_table[p].ricon)
                Render.useTexture(modCoverPSXNoref, tg16_table[p].ricon)
                Render.useTexture(modCoverN64Noref, tg16_table[p].ricon)
                Render.useTexture(modCoverN64Noref, tg16_table[p].ricon)
                Render.useTexture(modCoverNESNoref, tg16_table[p].ricon)
                Render.useTexture(modCoverGBNoref, tg16_table[p].ricon)
                Render.useTexture(modCoverGBNoref, tg16_table[p].ricon)
                Render.useTexture(modCoverGBNoref, tg16_table[p].ricon)
                Render.useTexture(modCoverMDNoref, tg16_table[p].ricon)
                Render.useTexture(modCoverMDNoref, tg16_table[p].ricon)
                Render.useTexture(modCoverMDNoref, tg16_table[p].ricon)
                Render.useTexture(modCoverMDNoref, tg16_table[p].ricon)
                Render.useTexture(modCoverMDNoref, tg16_table[p].ricon)
                Render.useTexture(modCoverMDNoref, tg16_table[p].ricon)
                Render.useTexture(modCoverMDNoref, tg16_table[p].ricon)
            else 
                Render.useTexture(modCoverNoref, tg16_table[p].icon)
                Render.useTexture(modCoverHbrNoref, tg16_table[p].icon)
                Render.useTexture(modCoverPSPNoref, tg16_table[p].icon)
                Render.useTexture(modCoverPSXNoref, tg16_table[p].icon)
                Render.useTexture(modCoverN64Noref, tg16_table[p].icon)
                Render.useTexture(modCoverN64Noref, tg16_table[p].icon)
                Render.useTexture(modCoverNESNoref, tg16_table[p].icon)
                Render.useTexture(modCoverGBNoref, tg16_table[p].icon)
                Render.useTexture(modCoverGBNoref, tg16_table[p].icon)
                Render.useTexture(modCoverGBNoref, tg16_table[p].icon)
                Render.useTexture(modCoverMDNoref, tg16_table[p].icon)
                Render.useTexture(modCoverMDNoref, tg16_table[p].icon)
                Render.useTexture(modCoverMDNoref, tg16_table[p].icon)
                Render.useTexture(modCoverMDNoref, tg16_table[p].icon)
                Render.useTexture(modCoverMDNoref, tg16_table[p].icon)
                Render.useTexture(modCoverMDNoref, tg16_table[p].icon)
                Render.useTexture(modCoverMDNoref, tg16_table[p].icon)
            end
        --PCE
        elseif showCat == 17 then
            --Graphics.setImageFilters(pce_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if pce_table[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, pce_table[p].ricon)
                Render.useTexture(modCoverHbrNoref, pce_table[p].ricon)
                Render.useTexture(modCoverPSPNoref, pce_table[p].ricon)
                Render.useTexture(modCoverPSXNoref, pce_table[p].ricon)
                Render.useTexture(modCoverN64Noref, pce_table[p].ricon)
                Render.useTexture(modCoverN64Noref, pce_table[p].ricon)
                Render.useTexture(modCoverNESNoref, pce_table[p].ricon)
                Render.useTexture(modCoverGBNoref, pce_table[p].ricon)
                Render.useTexture(modCoverGBNoref, pce_table[p].ricon)
                Render.useTexture(modCoverGBNoref, pce_table[p].ricon)
                Render.useTexture(modCoverMDNoref, pce_table[p].ricon)
                Render.useTexture(modCoverMDNoref, pce_table[p].ricon)
                Render.useTexture(modCoverMDNoref, pce_table[p].ricon)
                Render.useTexture(modCoverMDNoref, pce_table[p].ricon)
                Render.useTexture(modCoverMDNoref, pce_table[p].ricon)
                Render.useTexture(modCoverMDNoref, pce_table[p].ricon)
                Render.useTexture(modCoverMDNoref, pce_table[p].ricon)
            else 
                Render.useTexture(modCoverNoref, pce_table[p].icon)
                Render.useTexture(modCoverHbrNoref, pce_table[p].icon)
                Render.useTexture(modCoverPSPNoref, pce_table[p].icon)
                Render.useTexture(modCoverPSXNoref, pce_table[p].icon)
                Render.useTexture(modCoverN64Noref, pce_table[p].icon)
                Render.useTexture(modCoverN64Noref, pce_table[p].icon)
                Render.useTexture(modCoverNESNoref, pce_table[p].icon)
                Render.useTexture(modCoverGBNoref, pce_table[p].icon)
                Render.useTexture(modCoverGBNoref, pce_table[p].icon)
                Render.useTexture(modCoverGBNoref, pce_table[p].icon)
                Render.useTexture(modCoverMDNoref, pce_table[p].icon)
                Render.useTexture(modCoverMDNoref, pce_table[p].icon)
                Render.useTexture(modCoverMDNoref, pce_table[p].icon)
                Render.useTexture(modCoverMDNoref, pce_table[p].icon)
                Render.useTexture(modCoverMDNoref, pce_table[p].icon)
                Render.useTexture(modCoverMDNoref, pce_table[p].icon)
                Render.useTexture(modCoverMDNoref, pce_table[p].icon)
            end

        else
            --Graphics.setImageFilters(files_table[p].icon, FILTER_LINEAR, FILTER_LINEAR)
            if files_table[p].ricon ~= nil then
                Render.useTexture(modCoverNoref, files_table[p].ricon)
                Render.useTexture(modCoverHbrNoref, files_table[p].ricon)
                Render.useTexture(modCoverPSPNoref, files_table[p].ricon)
                Render.useTexture(modCoverPSXNoref, files_table[p].ricon)
                Render.useTexture(modCoverN64Noref, files_table[p].ricon)
                Render.useTexture(modCoverN64Noref, files_table[p].ricon)
                Render.useTexture(modCoverNESNoref, files_table[p].ricon)
                Render.useTexture(modCoverGBNoref, files_table[p].ricon)
                Render.useTexture(modCoverGBNoref, files_table[p].ricon)
                Render.useTexture(modCoverGBNoref, files_table[p].ricon)
                Render.useTexture(modCoverMDNoref, files_table[p].ricon)
                Render.useTexture(modCoverMDNoref, files_table[p].ricon)
                Render.useTexture(modCoverMDNoref, files_table[p].ricon)
                Render.useTexture(modCoverMDNoref, files_table[p].ricon)
                Render.useTexture(modCoverMDNoref, files_table[p].ricon)
                Render.useTexture(modCoverMDNoref, files_table[p].ricon)
                Render.useTexture(modCoverMDNoref, files_table[p].ricon)
            else 
                Render.useTexture(modCoverNoref, files_table[p].icon)
                Render.useTexture(modCoverHbrNoref, files_table[p].icon)
                Render.useTexture(modCoverPSPNoref, files_table[p].icon)
                Render.useTexture(modCoverPSXNoref, files_table[p].icon)
                Render.useTexture(modCoverN64Noref, files_table[p].icon)
                Render.useTexture(modCoverN64Noref, files_table[p].icon)
                Render.useTexture(modCoverNESNoref, files_table[p].icon)
                Render.useTexture(modCoverGBNoref, files_table[p].icon)
                Render.useTexture(modCoverGBNoref, files_table[p].icon)
                Render.useTexture(modCoverGBNoref, files_table[p].icon)
                Render.useTexture(modCoverMDNoref, files_table[p].icon)
                Render.useTexture(modCoverMDNoref, files_table[p].icon)
                Render.useTexture(modCoverMDNoref, files_table[p].icon)
                Render.useTexture(modCoverMDNoref, files_table[p].icon)
                Render.useTexture(modCoverMDNoref, files_table[p].icon)
                Render.useTexture(modCoverMDNoref, files_table[p].icon)
                Render.useTexture(modCoverMDNoref, files_table[p].icon)
            end
        end
        
        local tmpapptype=""
        local tmpcatText=""
        -- Draw box
        if apptype==1 then
            Render.drawModel(modCoverNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = "PS Vita Game"
        elseif apptype==2 then
            Render.drawModel(modCoverPSPNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxPSPNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = "PSP Game"
        elseif apptype==3 then
            Render.drawModel(modCoverPSXNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxPSXNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = "PS1 Game"
        elseif apptype==5 then
            Render.drawModel(modCoverN64Noref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxN64Noref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = "N64 Game"
        elseif apptype==6 then
            Render.drawModel(modCoverN64Noref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxN64Noref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = "SNES Game"
        elseif apptype==7 then
            Render.drawModel(modCoverNESNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxNESNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = "NES Game"
        elseif apptype==8 then
            Render.drawModel(modCoverGBNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxGBNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = "GBA Game"
        elseif apptype==9 then
            Render.drawModel(modCoverGBNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxGBNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = "GBC Game"
        elseif apptype==10 then
            Render.drawModel(modCoverGBNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxGBNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = "GB Game"
        elseif apptype==11 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = "MD Game"
        elseif apptype==12 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = "SMS Game"
        elseif apptype==13 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = "GG Game"
        elseif apptype==14 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = "MAME Game"
        elseif apptype==15 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = "Amiga Game"
        elseif apptype==16 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = "TurboGrafx-16 Game"
        elseif apptype==17 then
            Render.drawModel(modCoverMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            Render.drawModel(modBoxMDNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = "PC Engine Game"
        else
            Render.drawModel(modCoverHbrNoref, prevX, -1.0, -5 + prevZ, 0, math.deg(prevRot+prvRotY), 0)
            tmpapptype = "Homebrew"
        end
    
        Font.print(fnt22, 50, 190, txtname, white)-- app name


        -- 0 Homebrew, 1 vita, 2 psp, 3 psx, 5+ Retro

        if apptype == 0 or apptype == 1 or apptype == 2 or apptype == 3 then
            Font.print(fnt22, 50, 240, tmpapptype .. "\nApp ID: " .. app_titleid .. "\nVersion: " .. app_version .. "\nSize: " .. game_size, white)-- Draw info
        else
            Font.print(fnt22, 50, 240, tmpapptype .. "\nVersion: " .. app_version .. "\nSize: " .. game_size, white)-- Draw info
        end


        if tmpappcat==1 then
            tmpcatText = "PS Vita"
        elseif tmpappcat==2 then
            tmpcatText = "Homebrew"           
        else
            tmpcatText = "Default"
        end


        if tmpappcat_adrenaline==1 then
            tmpcatText_adrenaline = "PS1"
        elseif tmpappcat_adrenaline==2 then
            tmpcatText_adrenaline = "PSP"            
        else
            tmpcatText_adrenaline = "Default"
        end

        menuItems = 1


        -- 0 Homebrew, 1 Vita, 2 PSP, 3 PSX, 5+ Retro

        -- Vita and Homebrew
        if apptype == 0 or apptype == 1 then -- start Disable category override for retro
            if menuY==1 then
                Graphics.fillRect(24, 470, 350 + (menuY * 40), 430 + (menuY * 40), themeCol)-- selection two lines
            else
                Graphics.fillRect(24, 470, 350 + (menuY * 40), 390 + (menuY * 40), themeCol)-- selection
            end
            Font.print(fnt22, 50, 352, "Download Cover", white)
            Font.print(fnt22, 50, 352+40, "Override Category: < " .. tmpcatText .. " >\n(Press X to apply Category)", white)

        -- PSP or PS1 
        elseif apptype == 2 or apptype == 3 then -- start Disable category override for retro
       
            -- Only allow folders to be moved
            if folder == true then
                if menuY==1 then
                    Graphics.fillRect(24, 470, 350 + (menuY * 40), 430 + (menuY * 40), themeCol)-- selection two lines
                else
                    Graphics.fillRect(24, 470, 350 + (menuY * 40), 390 + (menuY * 40), themeCol)-- selection
                end
                Font.print(fnt22, 50, 352, "Download Cover", white)
                Font.print(fnt22, 50, 352+40, "Override Category: < " .. tmpcatText_adrenaline .. " >\n(Press X to apply Category)", white)
            else
                if menuY==1 then                
            else
                Graphics.fillRect(24, 470, 350 + (menuY * 40), 390 + (menuY * 40), themeCol)-- selection
                end
                Font.print(fnt22, 50, 352, "Download Cover", white)
            end

        -- All other systems
        else
            if menuY==1 then                
            else
                Graphics.fillRect(24, 470, 350 + (menuY * 40), 390 + (menuY * 40), themeCol)-- selection
            end
            Font.print(fnt22, 50, 352, "Download Cover", white)
        end
        

        status = System.getMessageState()
        if status ~= RUNNING then
            
            if (Controls.check(pad, SCE_CTRL_CROSS) and not Controls.check(oldpad, SCE_CTRL_CROSS)) then
                if menuY == 0 then
                    if gettingCovers == false then
                        gettingCovers = true
                        DownloadSingleCover()
                    end
                elseif menuY == 1 then
                    if apptype == 2 or apptype == 3 then
                        OverrideCategory_adrenaline()
                    else
                        OverrideCategory()
                    end
                end

            elseif (Controls.check(pad, SCE_CTRL_UP)) and not (Controls.check(oldpad, SCE_CTRL_UP)) then
                if menuY > 0 then
                    menuY = menuY - 1
                    else
                    menuY=menuItems
                end
            elseif (Controls.check(pad, SCE_CTRL_DOWN)) and not (Controls.check(oldpad, SCE_CTRL_DOWN)) then
                if menuY < menuItems then
                    menuY = menuY + 1
                    else
                    menuY=0
                end
            elseif (Controls.check(pad, SCE_CTRL_LEFT)) and not (Controls.check(oldpad, SCE_CTRL_LEFT)) then
                if menuY==1 then

                    -- PSP and PS1 override
                    if apptype == 2 or apptype == 3 then
                        if tmpappcat_adrenaline > 0 then
                            tmpappcat_adrenaline = tmpappcat_adrenaline - 1
                        else
                            tmpappcat_adrenaline=2 -- Limited to 4 to prevent retro showing in override options
                        end

                    -- Vita and Homebrew override
                    else
                        if tmpappcat > 0 then
                            tmpappcat = tmpappcat - 1
                        else
                            tmpappcat=2 -- Limited to 4 to prevent retro showing in override options
                        end
                    end

                end
            elseif (Controls.check(pad, SCE_CTRL_RIGHT)) and not (Controls.check(oldpad, SCE_CTRL_RIGHT)) then
                if menuY==1 then

                    -- PSP and PS1 override
                    if apptype == 2 or apptype == 3 then
                        if tmpappcat_adrenaline < 2 then  -- Limited to 2
                            tmpappcat_adrenaline = tmpappcat_adrenaline + 1
                        else
                            tmpappcat_adrenaline=0
                        end

                    -- Vita and Homebrew override
                    else 
                        if tmpappcat < 2 then  -- Limited to 2
                            tmpappcat = tmpappcat + 1
                        else
                            tmpappcat=0
                        end
                    end
                end
            end
        end


            
        elseif showMenu == 2 then
        
        -- SETTINGS
        -- Footer buttons and icons
        Graphics.drawImage(900-(string.len(lang_lines[11])*10), 510, btnO)
        Font.print(fnt20, 900+28-(string.len(lang_lines[11])*10), 508, lang_lines[11], white)--Close
        Graphics.drawImage(750-(string.len(lang_lines[32])*10), 510, btnX)
        Font.print(fnt20, 750+28-(string.len(lang_lines[32])*10), 508, lang_lines[32], white)--Select
        Graphics.fillRect(60, 900, 24, 468, darkalpha)

        Font.print(fnt22, 84, 32, lang_lines[6], white)--SETTINGS
        Graphics.drawLine(60, 900, 66, 66, white)

        Graphics.fillRect(60, 900, 66 + (menuY * 40), 106 + (menuY * 40), themeCol)-- selection

        menuItems = 9
        
        Font.print(fnt22, 84, 72, lang_lines[14] .. ": ", white)--Startup Category
        if startCategory == 0 then
            Font.print(fnt22, 125 + 260, 72, lang_lines[5], white)--ALL
        elseif startCategory == 1 then
            Font.print(fnt22, 125 + 260, 72, lang_lines[1], white)--GAMES
        elseif startCategory == 2 then
            Font.print(fnt22, 125 + 260, 72, lang_lines[2], white)--HOMEBREWS
        elseif startCategory == 3 then
            Font.print(fnt22, 125 + 260, 72, lang_lines[3], white)--PSP
        elseif startCategory == 4 then
            Font.print(fnt22, 125 + 260, 72, lang_lines[4], white)--PSX
        elseif startCategory == 5 then
            Font.print(fnt22, 125 + 260, 72, lang_lines[33], white)--N64
        elseif startCategory == 6 then
            Font.print(fnt22, 125 + 260, 72, lang_lines[34], white)--SNES
        elseif startCategory == 7 then
            Font.print(fnt22, 125 + 260, 72, lang_lines[35], white)--NES
        elseif startCategory == 8 then
            Font.print(fnt22, 125 + 260, 72, lang_lines[36], white)--GBA
        elseif startCategory == 9 then
            Font.print(fnt22, 125 + 260, 72, lang_lines[37], white)--GBC
        elseif startCategory == 10 then
            Font.print(fnt22, 125 + 260, 72, lang_lines[38], white)--GB
        elseif startCategory == 11 then
            Font.print(fnt22, 125 + 260, 72, lang_lines[39], white)--MD
        elseif startCategory == 12 then
            Font.print(fnt22, 125 + 260, 72, lang_lines[40], white)--SMS
        elseif startCategory == 13 then
            Font.print(fnt22, 125 + 260, 72, lang_lines[41], white)--GG
        elseif startCategory == 14 then
            Font.print(fnt22, 125 + 260, 72, lang_lines[42], white)--MAME
        elseif startCategory == 15 then
            Font.print(fnt22, 125 + 260, 72, lang_lines[43], white)--AMIGA
        elseif startCategory == 16 then
            Font.print(fnt22, 125 + 260, 72, lang_lines[44], white)--TG16
        elseif startCategory == 17 then
            Font.print(fnt22, 125 + 260, 72, lang_lines[45], white)--PCE
        end
        
        Font.print(fnt22, 84, 72 + 40, lang_lines[15] .. ": ", white) -- REFLECTION
        if setReflections == 1 then
            Font.print(fnt22, 125 + 260, 72 + 40, lang_lines[22], white)--ON
        else
            Font.print(fnt22, 125 + 260, 72 + 40, lang_lines[23], white)--OFF
        end
        
        Font.print(fnt22, 84, 72 + 80, lang_lines[16] .. ": ", white)--SOUNDS
        if setSounds == 1 then
            Font.print(fnt22, 125 + 260, 72 + 80, lang_lines[22], white)--ON
        else
            Font.print(fnt22, 125 + 260, 72 + 80, lang_lines[23], white)--OFF
        end
        
        Font.print(fnt22, 84, 72 + 120,  lang_lines[17] .. ": ", white)
        if themeColor == 1 then
            Font.print(fnt22, 125 + 260, 72 + 120, lang_lines[24], white)--Red
        elseif themeColor == 2 then
            Font.print(fnt22, 125 + 260, 72 + 120, lang_lines[25], white)--Yellow
        elseif themeColor == 3 then
            Font.print(fnt22, 125 + 260, 72 + 120, lang_lines[26], white)--Green
        elseif themeColor == 4 then
            Font.print(fnt22, 125 + 260, 72 + 120, lang_lines[27], white)--Grey
        elseif themeColor == 5 then
            Font.print(fnt22, 125 + 260, 72 + 120, lang_lines[28], white)--Black
        elseif themeColor == 6 then
            Font.print(fnt22, 125 + 260, 72 + 120, lang_lines[29], white)--Purple
        elseif themeColor == 7 then
            Font.print(fnt22, 125 + 260, 72 + 120, lang_lines[30], white)--Orange
        else
            Font.print(fnt22, 125 + 260, 72 + 120, lang_lines[31], white)--Blue
        end
        
        Font.print(fnt22, 84, 72 + 160,  lang_lines[18] .. ": ", white)
        if setBackground == 1 then
            Font.print(fnt22, 125 + 260, 72 + 160, lang_lines[22], white)--ON
        else
            Font.print(fnt22, 120 + 260, 72 + 160, lang_lines[23], white)--OFF
        end
        
        if scanComplete == false then
            if getCovers == 1 then
            Font.print(fnt22, 84, 72 + 200, lang_lines[19] .. ":   <  " .. lang_lines[1] .. "  >", white)--Download Covers PS VITA
            elseif getCovers == 2 then
                Font.print(fnt22, 84, 72 + 200, lang_lines[19] .. ":   <  " .. lang_lines[3] .. "  >", white)--Download Covers PSP
            elseif getCovers == 3 then
                Font.print(fnt22, 84, 72 + 200, lang_lines[19] .. ":   <  " .. lang_lines[4] .."  >", white)--Download Covers PSX
            elseif getCovers == 4 then
                Font.print(fnt22, 84, 72 + 200, lang_lines[19] .. ":   <  " .. lang_lines[33] .. "  >", white)--Download Covers N64
            elseif getCovers == 5 then
                Font.print(fnt22, 84, 72 + 200, lang_lines[19] .. ":   <  " .. lang_lines[34] .. "  >", white)--Download Covers SNES
            elseif getCovers == 6 then
                Font.print(fnt22, 84, 72 + 200, lang_lines[19] .. ":   <  " .. lang_lines[35] .. "  >", white)--Download Covers NES
            elseif getCovers == 7 then
                Font.print(fnt22, 84, 72 + 200, lang_lines[19] .. ":   <  " .. lang_lines[36] .. "  >", white)--Download Covers GBA
            elseif getCovers == 8 then
                Font.print(fnt22, 84, 72 + 200, lang_lines[19] .. ":   <  " .. lang_lines[37] .. "  >", white)--Download Covers GBC
            elseif getCovers == 9 then
                Font.print(fnt22, 84, 72 + 200, lang_lines[19] .. ":   <  " .. lang_lines[38] .. "  >", white)--Download Covers GB
            elseif getCovers == 10 then
                Font.print(fnt22, 84, 72 + 200, lang_lines[19] .. ":   <  " .. lang_lines[39] .. "  >", white)--Download Covers MD
            elseif getCovers == 11 then
                Font.print(fnt22, 84, 72 + 200, lang_lines[19] .. ":   <  " .. lang_lines[40] .. "  >", white)--Download Covers SMS
            elseif getCovers == 12 then
                Font.print(fnt22, 84, 72 + 200, lang_lines[19] .. ":   <  " .. lang_lines[41] .. "  >", white)--Download Covers GG
            elseif getCovers == 13 then
                Font.print(fnt22, 84, 72 + 200, lang_lines[19] .. ":   <  " .. lang_lines[42] .. "  >", white)--Download Covers MAME
            elseif getCovers == 14 then
                Font.print(fnt22, 84, 72 + 200, lang_lines[19] .. ":   <  " .. lang_lines[43] .. "  >", white)--Download Covers AMIGA
            elseif getCovers == 15 then
                Font.print(fnt22, 84, 72 + 200, lang_lines[19] .. ":   <  " .. lang_lines[44] .. "  >", white)--Download Covers TG16
            elseif getCovers == 16 then
                Font.print(fnt22, 84, 72 + 200, lang_lines[19] .. ":   <  " .. lang_lines[45] .. "  >", white)--Download Covers PCE       
            else
                Font.print(fnt22, 84, 72 + 200, lang_lines[19] .. ":   <  " .. lang_lines[5] .. "  >", white)--Download Covers All
            end
        else
            Font.print(fnt22, 84, 72 + 200,  lang_lines[20], white)--Reload Covers Database
        end
        
        Font.print(fnt22, 84, 72 + 240, lang_lines[21] .. ": ", white)--Language
        if setLanguage == 1 then
            Font.print(fnt22, 125 + 260, 72 + 240, "English - American", white)
        elseif setLanguage == 2 then
            Font.print(fnt22, 125 + 260, 72 + 240, "German", white)
        elseif setLanguage == 3 then
            Font.print(fnt22, 125 + 260, 72 + 240, "French", white)
        elseif setLanguage == 4 then
            Font.print(fnt22, 125 + 260, 72 + 240, "Italian", white)
        elseif setLanguage == 5 then
            Font.print(fnt22, 125 + 260, 72 + 240, "Spanish", white)
        elseif setLanguage == 6 then
            Font.print(fnt22, 125 + 260, 72 + 240, "Portuguese", white)
        elseif setLanguage == 7 then
            Font.print(fnt22, 125 + 260, 72 + 240, "Swedish", white)
        elseif setLanguage == 8 then
            Font.print(fnt22, 125 + 260, 72 + 240, "Russian", white)
        elseif setLanguage == 9 then
            Font.print(fnt22, 125 + 260, 72 + 240, "Japanese", white)
        else
            Font.print(fnt22, 125 + 260, 72 + 240, "English", white)
        end
        
        Font.print(fnt22, 84, 72 + 280, lang_lines[46] .. ": ", white)--Show Homebrews
        if showHomebrews == 1 then
            Font.print(fnt22, 125 + 260, 72 + 280, lang_lines[22], white)--ON
        else
            Font.print(fnt22, 125 + 260, 72 + 280, lang_lines[23], white)--OFF
        end
        
        Font.print(fnt22, 84, 72 + 320, lang_lines[47] .. ": ", white)--Scan on startup
        if startupScan == 1 then
            Font.print(fnt22, 125 + 260, 72 + 320, lang_lines[22], white)--ON
        else
            Font.print(fnt22, 125 + 260, 72 + 320, lang_lines[23], white)--OFF
        end

        Font.print(fnt22, 84, 72 + 360, lang_lines[13], white)--About
        
        status = System.getMessageState()
        if status ~= RUNNING then
            
            if (Controls.check(pad, SCE_CTRL_CROSS) and not Controls.check(oldpad, SCE_CTRL_CROSS)) then
                if menuY == 0 then
                    if startCategory < 17 then -- Increase to total count of systems
                        startCategory = startCategory + 1
                    else
                        startCategory = 0
                    end
                elseif menuY == 1 then
                    if setReflections == 1 then
                        setReflections = 0
                    else
                        setReflections = 1
                    end
                elseif menuY == 2 then
                    if setSounds == 1 then
                        setSounds = 0
                        if System.doesFileExist(cur_dir .. "/Music.mp3") then
                            if Sound.isPlaying(sndMusic) then
                                Sound.pause(sndMusic)
                            end
                        end
                    else
                        setSounds = 1
                        if System.doesFileExist(cur_dir .. "/Music.mp3") then
                            if not Sound.isPlaying(sndMusic) then
                                Sound.play(sndMusic, LOOP)
                            end
                        end
                    end
                elseif menuY == 3 then
                    if themeColor < 7 then
                        themeColor = themeColor + 1
                    else
                        themeColor = 0
                    end
                    SetThemeColor()
                elseif menuY == 4 then
                    if setBackground == 1 then
                        setBackground = 0
                    else
                        setBackground = 1
                    end
                elseif menuY == 5 then
                    if gettingCovers == false then
                        gettingCovers = true
                        DownloadCovers()
                    end
                elseif menuY == 6 then
                    if setLanguage < 9 then
                        setLanguage = setLanguage + 1
                    else
                        setLanguage = 0
                    end
                    ChangeLanguage()
                elseif menuY == 7 then
                    if showHomebrews == 1 then
                        showHomebrews = 0
                        -- Import cache to update All games category
                        files_table = import_cached_DB(System.currentDirectory())

                        -- If currently on homebrew category view, move to Vita category to hide empty homebrew category
                        if showCat == 2 then
                            showCat = 1
                        end

                    else
                        showHomebrews = 1
                        -- Import cache to update All games category
                        files_table = import_cached_DB(System.currentDirectory())

                    end
                elseif menuY == 8 then
                    if startupScan == 1 then
                        startupScan = 0

                        -- find me
                        cache_all_tables()
                    else
                        startupScan = 1
                    end
                elseif menuY == 9 then
                    showMenu = 3
                    menuY = 0
                end
                
                
                --Save settings
                local file_config = System.openFile(cur_dir .. "/settings.dat", FCREATE)
                System.writeFile(file_config, setReflections .. setSounds .. themeColor .. setBackground .. setLanguage .. showView .. showHomebrews .. startupScan .. startCategory, 10)
                System.closeFile(file_config)
            elseif (Controls.check(pad, SCE_CTRL_UP)) and not (Controls.check(oldpad, SCE_CTRL_UP)) then
                if menuY > 0 then
                    menuY = menuY - 1
                    else
                    menuY=menuItems
                end
            elseif (Controls.check(pad, SCE_CTRL_DOWN)) and not (Controls.check(oldpad, SCE_CTRL_DOWN)) then
                if menuY < menuItems then
                    menuY = menuY + 1
                    else
                    menuY=0
                end
            elseif (Controls.check(pad, SCE_CTRL_LEFT)) and not (Controls.check(oldpad, SCE_CTRL_LEFT)) then
                --covers download selection
                if menuY==5 then
                    if getCovers > 0 then
                        getCovers = getCovers - 1
                    else
                        getCovers=16 -- Check getcover number against sytem
                    end
                end
            elseif (Controls.check(pad, SCE_CTRL_RIGHT)) and not (Controls.check(oldpad, SCE_CTRL_RIGHT)) then
                --covers download selection
                if menuY==5 then
                    if getCovers < 16 then -- Check getcover number against sytem
                        getCovers = getCovers + 1
                    else
                        getCovers=0
                    end
                end
            end
        end
    elseif showMenu == 3 then
        
        -- ABOUT
        -- Footer buttons and icons
        Graphics.drawImage(900-(string.len(lang_lines[11])*10), 510, btnO)
        Font.print(fnt20, 900+28-(string.len(lang_lines[11])*10), 508, lang_lines[11], white)--Close
        
        Graphics.fillRect(30, 930, 24, 496, darkalpha)-- bg
        
        Font.print(fnt20, 54, 42, "RetroFlow Launcher - ver." .. appversion 
            .. "\n"
            .. "\nRetroFlow (Hexflow mod) by jimbob4000. Original HexFlow app by VitaHex."
            .. "\nSupport his projects on patreon.com/vitahex", white)-- Draw info

        Font.print(fnt20, 54, 132, "Adding Retro Games:"
            .. "\nPlace your game roms in the pre-made folders here 'ux0:/data/RetroFlow/ROMS'"
            .. "\n"
            .. "\nAdding PSP Games:"
            .. "\nPlease rename ISO files using Leecherman's 'PSP ISO Renamer tool'."
            .. "\nTool Parameters: %NAME% (%REGION%) [%ID%]."
            .. "\nSample: Cars 2 (US) [UCUS-98766].iso"
            .. "\n"
            .. "\nFor updates & more info visit: https://github.com/jimbob4000/RetroFlow-Launcher"
            .. "\n"
            .. "\nCREDITS"
            .. "\n"
            .. "\nOriginal app by VitHex. Programming/UI by Sakis RG. Developed with Lua Player"
            .. "\nPlus by Rinnegatamante. Special Thanks: VitaHex, Creckeryop, Rinnegatamante,"
            .. "\nAndreas Stürmer, Roc6d, Badmanwazzy37, Leecherman. Translations: TheheroGAC,"
            .. "\nchronoss,stuermerandreas, kodyna91, _novff, Spoxnus86, nighto, iGlitch.", white)-- Draw info"

    end
    
    -- Terminating rendering phase
    Graphics.termBlend()
    if showMenu == 1 then
        --Left Analog rotate preview box
        if mx < 64 then
            if prvRotY>-0.5 then
                prvRotY=prvRotY-0.02
            end
        elseif mx > 180 then
            if prvRotY<0.6 then
                prvRotY=prvRotY+0.02
            end
        end
    end
    --Controls Start
    if showMenu == 0 then
        --Navigation Left Analog
        if mx < 64 then
            if delayButton < 0.5 then
                delayButton = 1
                if setSounds == 1 then
                    Sound.play(click, NO_LOOP)
                end
                p = p - 1
                
                if p > 0 then
                    GetInfoSelected()
                end
                
                if (p <= master_index) then
                    master_index = p
                end
            end
        elseif mx > 180 then
            if delayButton < 0.5 then
                delayButton = 1
                if setSounds == 1 then
                    Sound.play(click, NO_LOOP)
                end
                p = p + 1
                
                if p <= curTotal then
                    GetInfoSelected()
                end
                
                if (p >= master_index) then
                    master_index = p
                end
            end
        end
        
        -- Navigation Buttons
        if (Controls.check(pad, SCE_CTRL_CROSS) and not Controls.check(oldpad, SCE_CTRL_CROSS)) then
            if gettingCovers == false and app_title~="-" then
                FreeMemory()
                if showCat == 1 then
                    System.launchApp(games_table[p].name)
                elseif showCat == 2 then
                    System.launchApp(homebrews_table[p].name)

                elseif showCat == 3 then
                    rom_location = (psp_table[p].launch_argument)
                    launch_Adrenaline()

                elseif showCat == 4 then
                    rom_location = (psx_table[p].launch_argument)
                    launch_Adrenaline()

                -- Start Retro    
                elseif showCat == 5 then
                    rom_location = (n64_table[p].game_path)
                    clean_launch_dir()
                    launch_DaedalusX64()
                elseif showCat == 6 then
                    rom_location = (snes_table[p].game_path)
                    core_name = core_SNES
                    clean_launch_dir()
                    launch_retroarch()
                elseif showCat == 7 then
                    rom_location = (nes_table[p].game_path)
                    core_name = core_NES
                    clean_launch_dir()
                    launch_retroarch()
                elseif showCat == 8 then
                    rom_location = (gba_table[p].game_path)
                    core_name = core_GBA
                    clean_launch_dir()
                    launch_retroarch()
                elseif showCat == 9 then
                    rom_location = (gbc_table[p].game_path)
                    core_name = core_GBC
                    clean_launch_dir()
                    launch_retroarch()
                elseif showCat == 10 then
                    rom_location = (gb_table[p].game_path)
                    core_name = core_GB
                    clean_launch_dir()
                    launch_retroarch()    
                elseif showCat == 11 then
                    rom_location = (md_table[p].game_path)
                    core_name = core_MD
                    clean_launch_dir()
                    launch_retroarch()
                elseif showCat == 12 then
                    rom_location = (sms_table[p].game_path)
                    core_name = core_SMS
                    clean_launch_dir()
                    launch_retroarch()
                elseif showCat == 13 then
                    rom_location = (gg_table[p].game_path)
                    core_name = core_GG
                    clean_launch_dir()
                    launch_retroarch()
                elseif showCat == 14 then
                    rom_location = (mame_table[p].game_path)
                    core_name = core_MAME
                    clean_launch_dir()
                    launch_retroarch()
                elseif showCat == 15 then
                    rom_location = (amiga_table[p].game_path)
                    core_name = core_AMIGA
                    clean_launch_dir()
                    launch_retroarch()
                elseif showCat == 16 then
                    rom_location = (tg16_table[p].game_path)
                    core_name = core_TG16
                    clean_launch_dir()
                    launch_retroarch()
                elseif showCat == 17 then
                    rom_location = (pce_table[p].game_path)
                    core_name = core_PCE
                    clean_launch_dir()
                    launch_retroarch()

                -- End Retro 
                else

                    if apptype == 1 then
                        System.launchApp(files_table[p].name)

                    elseif apptype == 2 then
                        rom_location = (psp_table[p].launch_argument)
                        launch_Adrenaline()

                    elseif apptype == 3 then
                        rom_location = (psx_table[p].launch_argument)
                        launch_Adrenaline()

                    elseif apptype == 4 then
                        System.launchApp(files_table[p].name)

                    -- Start Retro    
                    elseif apptype == 5 then
                        rom_location = (files_table[p].game_path)
                        clean_launch_dir()
                        launch_DaedalusX64()

                    elseif apptype == 6 then
                        rom_location = (files_table[p].game_path)
                        core_name = core_SNES
                        clean_launch_dir()
                        launch_retroarch()

                    elseif apptype == 7 then
                        rom_location = (files_table[p].game_path)
                        core_name = core_NES
                        clean_launch_dir()
                        launch_retroarch()

                    elseif apptype == 8 then
                        rom_location = (files_table[p].game_path)
                        core_name = core_GBA
                        clean_launch_dir()
                        launch_retroarch()

                    elseif apptype == 9 then
                        rom_location = (files_table[p].game_path)
                        core_name = core_GBC
                        clean_launch_dir()
                        launch_retroarch()

                    elseif apptype == 10 then
                        rom_location = (files_table[p].game_path)
                        core_name = core_GB
                        clean_launch_dir()
                        launch_retroarch()
                        
                    elseif apptype == 11 then
                        rom_location = (files_table[p].game_path)
                        core_name = core_MD
                        clean_launch_dir()
                        launch_retroarch()

                    elseif apptype == 12 then
                        rom_location = (files_table[p].game_path)
                        core_name = core_SMS
                        clean_launch_dir()
                        launch_retroarch()

                    elseif apptype == 13 then
                        rom_location = (files_table[p].game_path)
                        core_name = core_GG
                        clean_launch_dir()
                        launch_retroarch()

                    elseif apptype == 14 then
                        rom_location = (files_table[p].game_path)
                        core_name = core_MAME
                        clean_launch_dir()
                        launch_retroarch()

                    elseif apptype == 15 then
                        rom_location = (files_table[p].game_path)
                        core_name = core_AMIGA
                        clean_launch_dir()
                        launch_retroarch()

                    elseif apptype == 16 then
                        rom_location = (files_table[p].game_path)
                        core_name = core_TG16
                        clean_launch_dir()
                        launch_retroarch()

                    elseif apptype == 17 then
                        rom_location = (files_table[p].game_path)
                        core_name = core_PCE
                        clean_launch_dir()
                        launch_retroarch()

                    -- End Retro 

                    else
                        appdir=working_dir .. "/" .. files_table[p].name
                    end
                end
                System.exit()
            end
        elseif (Controls.check(pad, SCE_CTRL_TRIANGLE) and not Controls.check(oldpad, SCE_CTRL_TRIANGLE)) then
            if showMenu == 0 and app_title~="-" then
                prvRotY = 0
                showMenu = 1
            end
        elseif (Controls.check(pad, SCE_CTRL_START) and not Controls.check(oldpad, SCE_CTRL_START)) then
            if showMenu == 0 then
                showMenu = 2
            end
        elseif (Controls.check(pad, SCE_CTRL_SQUARE) and not Controls.check(oldpad, SCE_CTRL_SQUARE)) then
            -- CATEGORY
            if showCat < 17 then -- Increase to match category count
                if showCat==1 and showHomebrews==0 then
                    showCat = 3
                else
                    showCat = showCat + 1
                end
            else
                showCat = 0
            end

            -- Start skip empty categories
            if showCat == 3 then
                curTotal = #psp_table
                if #psp_table == 0 then
                    showCat = 4
                end
            end
            if showCat == 4 then
                curTotal = #psx_table
                if #psx_table == 0 then
                    showCat = 5
                end
            end
            if showCat == 5 then
                curTotal = #n64_table
                if #n64_table == 0 then
                    showCat = 6
                end
            end
            if showCat == 6 then
                curTotal = #snes_table
                if #snes_table == 0 then
                    showCat = 7
                end
            end
            if showCat == 7 then
                curTotal = #nes_table
                if #nes_table == 0 then
                    showCat = 8
                end
            end
            if showCat == 8 then
                curTotal = #gba_table
                if #gba_table == 0 then
                    showCat = 9
                end
            end
            if showCat == 9 then
                curTotal = #gbc_table
                if #gbc_table == 0 then
                    showCat = 10
                end
            end
            if showCat == 10 then
                curTotal = #gb_table
                if #gb_table == 0 then
                    showCat = 11
                end
            end
            if showCat == 11 then
                curTotal = #md_table
                if #md_table == 0 then
                    showCat = 12
                end
            end
            if showCat == 12 then
                curTotal = #sms_table
                if #sms_table == 0 then
                    showCat = 13
                end
            end
            if showCat == 13 then
                curTotal = #gg_table
                if #gg_table == 0 then
                    showCat = 14
                end
            end
            if showCat == 14 then
                curTotal = #mame_table
                if #mame_table == 0 then
                    showCat = 15
                end
            end
            if showCat == 15 then
                curTotal = #amiga_table
                if #amiga_table == 0 then
                    showCat = 16
                end
            end
            if showCat == 16 then
                curTotal = #tg16_table
                if #tg16_table == 0 then
                    showCat = 17
                end
            end
            if showCat == 17 then
                curTotal = #pce_table
                if #pce_table == 0 then
                    showCat = 0
                end
            end

            hideBoxes = 8
            p = 1
            master_index = p
            startCovers = false
            GetInfoSelected()
            FreeIcons()
        elseif (Controls.check(pad, SCE_CTRL_CIRCLE) and not Controls.check(oldpad, SCE_CTRL_CIRCLE)) then
            -- VIEW
            if showView < 4 then
                showView = showView + 1
            else
                showView = 0
            end
            menuY = 0
            startCovers = false
            local file_config = System.openFile(cur_dir .. "/settings.dat", FCREATE)
            System.writeFile(file_config, setReflections .. setSounds .. themeColor .. setBackground .. setLanguage .. showView .. showHomebrews .. startCategory, 9)
            -- System.writeFile(file_config, setReflections .. setSounds .. themeColor .. setBackground .. setLanguage .. showView .. showHomebrews, 8)
            System.closeFile(file_config)
        elseif (Controls.check(pad, SCE_CTRL_LEFT)) and not (Controls.check(oldpad, SCE_CTRL_LEFT)) then
            if setSounds == 1 then
                Sound.play(click, NO_LOOP)
            end
            p = p - 1
            
            if p > 0 then
                GetInfoSelected()
            end
            
            if (p <= master_index) then
                master_index = p
            end
        elseif (Controls.check(pad, SCE_CTRL_RIGHT)) and not (Controls.check(oldpad, SCE_CTRL_RIGHT)) then
            if setSounds == 1 then
                Sound.play(click, NO_LOOP)
            end
            p = p + 1
            
            if p <= curTotal then
                GetInfoSelected()
            end
            
            if (p >= master_index) then
                master_index = p
            end
        elseif (Controls.check(pad, SCE_CTRL_LTRIGGER)) and not (Controls.check(oldpad, SCE_CTRL_LTRIGGER)) then
            if setSounds == 1 then
                Sound.play(click, NO_LOOP)
            end
            p = p - 5 -- Increased to 6 for GB -- IGNORE COMMENT??
            
            if p > 0 then
                GetInfoSelected()
            end
            
            if (p <= master_index) then
                master_index = p
            end
        elseif (Controls.check(pad, SCE_CTRL_RTRIGGER)) and not (Controls.check(oldpad, SCE_CTRL_RTRIGGER)) then
            if setSounds == 1 then
                Sound.play(click, NO_LOOP)
            end
            p = p + 5 -- Increased to 6 for GB -- IGNORE COMMENT??
            
            if p <= curTotal then
                GetInfoSelected()
            end
            
            if (p >= master_index) then
                master_index = p
            end
        
        end
        
        -- Touch Input
        if x1 ~= nil then
            if touchdown == 0 and delayTouch < 0.5 then
                touchdown = 1
                xstart = x1
                delayTouch = 5
            end
            if touchdown > 0 and delayTouch > 0.5 then
                if x1 > xstart + 60 then
                    touchdown = 2
                    xstart = x1
                    p = p - 1
                    if p > 0 then
                        GetInfoSelected()
                    end
                    if (p <= master_index) then
                        master_index = p
                    end
                elseif x1 < xstart - 60 then
                    touchdown = 2
                    xstart = x1
                    p = p + 1
                    if p <= curTotal then
                        GetInfoSelected()
                    end
                    if (p >= master_index) then
                        master_index = p
                    end
                
                end
            end
        end
    elseif showMenu > 0 then
        if (Controls.check(pad, SCE_CTRL_CIRCLE) and not Controls.check(oldpad, SCE_CTRL_CIRCLE)) then
            status = System.getMessageState()
            if status ~= RUNNING then
                showMenu = 0
                prvRotY = 0
                if setBackground == 1 then
                    Render.useTexture(modBackground, imgCustomBack)
                end
            end
        end
    end
    
    if delayTouch > 0 then
        delayTouch = delayTouch - 0.1
    else
        delayTouch = 0
        touchdown = 0
    end
    -- End Touch
    -- End Controls
    if showCat == 1 then
        curTotal = #games_table
        if #games_table == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 2 then
        curTotal = #homebrews_table
        if #homebrews_table == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 3 then
        curTotal = #psp_table
        if #psp_table == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 4 then
        curTotal = #psx_table
        if #psx_table == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 5 then
        curTotal = #n64_table
        if #n64_table == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 6 then
        curTotal = #snes_table
        if #snes_table == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 7 then
        curTotal = #nes_table
        if #nes_table == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 8 then
        curTotal = #gba_table
        if #gba_table == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 9 then
        curTotal = #gbc_table
        if #gbc_table == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 10 then
        curTotal = #gb_table
        if #gb_table == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 11 then
        curTotal = #md_table
        if #md_table == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 12 then
        curTotal = #sms_table
        if #sms_table == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 13 then
        curTotal = #gg_table
        if #gg_table == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 14 then
        curTotal = #mame_table
        if #mame_table == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 15 then
        curTotal = #amiga_table
        if #amiga_table == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 16 then
        curTotal = #tg16_table
        if #tg16_table == 0 then
            p = 0
            master_index = p
        end
    elseif showCat == 17 then
        curTotal = #pce_table
        if #pce_table == 0 then
            p = 0
            master_index = p
        end
    else
        curTotal = #files_table
        if #files_table == 0 then
            p = 0
            master_index = p
        end
    end
    
    -- Check for out of bounds in menu
    if p < 1 then
        p = curTotal
        if p >= 1 then
            master_index = p -- 0
        end
        startCovers = false
        GetInfoSelected()
    elseif p > curTotal then
        p = 1
        master_index = p
        startCovers = false
        GetInfoSelected()
    end
    
    -- Refreshing screen and oldpad
    Screen.waitVblankStart()
    Screen.flip()
    oldpad = pad
end
