PrefabFiles = {
	"sendi",
	"sendi_none",
	"sendipack", 
	"sendisedmask",
	"sendi_armor_01", --센디의 니트 갑옷
	"sendi_rapier", 
	"sendi_rapier_wood", 
	"sendi_armor_02", --센디의 여름용 갑옷


	--nanacap
}

--캐릭터 아이템의 이름을 지정합니다. 
                  --[    아래  ]  이자리엔 지정할 이름이 들어갑니다.
GLOBAL.STRINGS.NAMES.SENDIPACK = "센디의 책가방"
GLOBAL.STRINGS.NAMES.SENDISEDMASK = "센디의 눈물 마스크"
GLOBAL.STRINGS.NAMES.SENDI_ARMOR_01 = "센디의 니트갑옷"
GLOBAL.STRINGS.NAMES.SENDI_RAPIER = "센디의 레이피어"
GLOBAL.STRINGS.NAMES.SENDI_RAPIER_WOOD = "연습용 목재 레이피어"
GLOBAL.STRINGS.NAMES.SENDI_ARMOR_02 = "센디의 여름용 갑옷"
--캐릭터 아이템의 이름을 지정합니다. 끝 


local start_inv = {
-- 맞춤시작 인벤토리 시작 
"sendipack"
}


Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/sendi.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/sendi.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/sendi.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/sendi.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/sendi_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/sendi_silho.xml" ),

    Asset( "IMAGE", "bigportraits/sendi.tex" ),
    Asset( "ATLAS", "bigportraits/sendi.xml" ),
	
	Asset( "IMAGE", "images/map_icons/sendi.tex" ),
	Asset( "ATLAS", "images/map_icons/sendi.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_sendi.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_sendi.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_sendi.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_sendi.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_sendi.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_sendi.xml" ),
	
	Asset( "IMAGE", "images/names_sendi.tex" ),
    Asset( "ATLAS", "images/names_sendi.xml" ),
	
	Asset( "IMAGE", "images/names_gold_sendi.tex" ),
    Asset( "ATLAS", "images/names_gold_sendi.xml" ),
	
    Asset( "IMAGE", "bigportraits/sendi_none.tex" ),
    Asset( "ATLAS", "bigportraits/sendi_none.xml" ),
	
	
	-----------아이템을 추가 합니다. 
	Asset( "IMAGE", "images/inventoryimages/sendipack.tex"),
	Asset( "ATLAS", "images/inventoryimages/sendipack.xml"),
	------- 센디의 책가방

	Asset( "IMAGE", "images/inventoryimages/sendisedmask.tex"),
	Asset( "ATLAS", "images/inventoryimages/sendisedmask.xml"),
	------- 센디의 눈물 마스크 
	
	Asset( "IMAGE", "images/inventoryimages/sendi_armor_01.tex"),
	Asset( "ATLAS", "images/inventoryimages/sendi_armor_01.xml"),
	-------센디의 니트갑옷 [임의 지정]
	
	Asset( "IMAGE", "images/inventoryimages/sendi_rapier.tex"),
	Asset( "ATLAS", "images/inventoryimages/sendi_rapier.xml"),
	--------센디의 레이피어
	
	Asset( "IMAGE", "images/inventoryimages/sendi_rapier_wood.tex"),
	Asset( "ATLAS", "images/inventoryimages/sendi_rapier_wood.xml"),
	--------연습용 목재 레이피어
	Asset( "IMAGE", "images/inventoryimages/sendi_armor_02.tex"),
	Asset( "ATLAS", "images/inventoryimages/sendi_armor_02.xml"),
	

}

AddMinimapAtlas("images/map_icons/sendi.xml")

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

local containers = GLOBAL.require("containers")
local oldwidgetsetup = containers.widgetsetup
containers.widgetsetup = function(container, prefab)
    if not prefab and container.inst.prefab == "sendipack" then
        prefab = "backpack"
		-- 센디의 가방 크기 : backpack[일반 가방], krampus_sack[크람푸스 가방]
    end
    oldwidgetsetup(container, prefab)
end

-- The character select screen lines
-- 센디가 만들수있는 레시피를 뜻하는듯합니다. 

STRINGS.CHARACTER_TITLES.sendi = "The Sample Character"
STRINGS.CHARACTER_NAMES.sendi = "Esc"
STRINGS.CHARACTER_DESCRIPTIONS.sendi = "*Perk 1\n*Perk 2\n*Perk 3"
STRINGS.CHARACTER_QUOTES.sendi = "\"Quote\""

---센디의 커스텀을 만듭니다 시작 
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH
local resolvefilepath = GLOBAL.resolvefilepath
local Recipe = GLOBAL.Recipe

	GLOBAL.STRINGS.NAMES.SENDISEDMASK = "센디의 눈물 마스크"
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SENDISEDMASK = "이 마스크엔 많은 사연이 있어."
	-- 센디 마스크
	GLOBAL.STRINGS.NAMES.SENDI_ARMOR_01 = "센디의 니트갑옷" -- STRINGS.NAMES : 지정할 이름 
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SENDI_ARMOR_01 = "이 머플러, 사실은 내 옷이야!" --DESCRIBE : 말하게 하는 명령어
	-- 센디 아머 [임의 추가] 
	GLOBAL.STRINGS.NAMES.SENDI_RAPIER = "센디의 레이피어" -- STRINGS.NAMES : 지정할 이름 
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SENDI_RAPIER = "내가 애용하던것과 닮은 레이피어야! 수제지만 예쁘지?" --DESCRIBE : 말하게 하는 명령어
	--센디 레이피어
	GLOBAL.STRINGS.NAMES.SENDI_RAPIER_WOOD = "연습용 목재 레이피어" -- STRINGS.NAMES : 지정할 이름 
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SENDI_RAPIER_WOOD = "연습할때 쓰던걸 본따 만들었어. 그래도 쓸만 하다구!" --DESCRIBE : 말하게 하는 명령어	
	--센디 연습용 목재 레이피어
	GLOBAL.STRINGS.NAMES.SENDIPACK = "센디의 책가방" -- STRINGS.NAMES : 지정할 이름 
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SENDIPACK = "귀여운 가방이야. 냉장고 기능도 있어! 과학은 정말 대단해!" --DESCRIBE : 말하게 하는 명령어	
	--센디팩
	GLOBAL.STRINGS.NAMES.SENDI_ARMOR_02 = "센디의 여름용 갑옷" -- STRINGS.NAMES : 지정할 이름 
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SENDI_ARMOR_02 = "기존의 옷은 니트라 더우니까, 시원하게 만들어봤어!" --DESCRIBE : 말하게 하는 명령어
	-- 센디 아머 [임의 추가] 
	
local sendipack = GLOBAL.Recipe("sendipack", {Ingredient("gears", 2), Ingredient("piggyback", 1)}, 
RECIPETABS.SURVIVAL, TECH.NONE, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendipack.xml", "sendipack.tex")
STRINGS.RECIPE_DESC.SENDIPACK = "센디의 하얀 가방 입니다. [냉장고]"
				-- nil, nil, nil, nil, "sendicraft" 여기서 "sendicraft"는 센디의 전용탭을 뜻한다.


local sendisedmask = GLOBAL.Recipe("sendisedmask", 
{ Ingredient("cutstone", 4), Ingredient("marble", 4)}, 
					--이름, 재료, 탭, 기술 수준, 설치자, min_spacing, nounlock, 제작 시 주는 갯수, [ 재료란 builder_tag, atlas, image, testfn, product]
RECIPETABS.SURVIVAL, TECH.NONE, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendisedmask.xml", "sendisedmask.tex")	
		STRINGS.RECIPE_DESC.SENDISEDMASK = "슬픈 사연이 담긴 마스크.[방수 25%]"
-- SURVIVAL[생존] DRESS[ 드레스 ]

-- AddRecipe 
AddRecipe("sendi_armor_01", 
{Ingredient("silk", 6), Ingredient("rabbit", 4), Ingredient("heatrock", 2)}, 
RECIPETABS.SURVIVAL, TECH.NONE, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendi_armor_01.xml", "sendi_armor_01.tex")
		STRINGS.RECIPE_DESC.SENDI_ARMOR_01 = "센디의 갑옷 입니다.[보온+이속]" 

AddRecipe("sendi_rapier", 
{Ingredient("sendi_rapier_wood", 1), Ingredient("tentaclespike", 1), Ingredient("flint", 12)}, 
RECIPETABS.SURVIVAL, TECH.NONE, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendi_rapier.xml", "sendi_rapier.tex")
		STRINGS.RECIPE_DESC.SENDI_RAPIER = "센디의 레이피어 입니다."
		
AddRecipe("sendi_rapier_wood", 
{Ingredient("twigs", 2), Ingredient("log", 8), Ingredient("rope", 2)}, 
RECIPETABS.SURVIVAL, TECH.NONE, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendi_rapier_wood.xml", "sendi_rapier_wood.tex")
		STRINGS.RECIPE_DESC.SENDI_RAPIER_WOOD = "센디의 연습용 레이피어 입니다."

AddRecipe("sendi_armor_02", 
{Ingredient("silk", 6), Ingredient("icehat", 2), Ingredient("heatrock", 2)}, 
RECIPETABS.SURVIVAL, TECH.NONE, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendi_armor_02.xml", "sendi_armor_02.tex")
		STRINGS.RECIPE_DESC.SENDI_ARMOR_02 = "센디의 여름갑옷 입니다.[시원함+이속]" 
		
		
---센디 아이템 명령 탬플릿

-- AddRecipe("이름", 
--{Ingredient("재료1", 재료1갯수), Ingredient("재료2", 재료2갯수)}, 
--RECIPETABS.SURVIVAL, TECH.NONE, nil, nil, nil, nil, "sendicraft", "이미지 xml 경로", "이미지 tex 경로")

---센디의 커스텀을 만듭니다 끝


-- Custom speech strings
STRINGS.CHARACTERS.SENDI = require "speech_sendi" -- 캐릭터의 대사집을 지정합니다

-- The character's name as appears in-game 
STRINGS.NAMES.SENDI = "sendi"

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("sendi", "FEMALE")

