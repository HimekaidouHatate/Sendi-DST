local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH
local Recipe = GLOBAL.Recipe

local SENDITAB = AddRecipeTab(GLOBAL.STRINGS.SENDITABNAME, 777, "images/inventoryimages/senditab.xml", "senditab.tex", "sendicraft") 
-- ���� ���������� �߰�.

AddRecipe("sendipack", 
{Ingredient("gears", 2), Ingredient("bedroll_furry", 2)}, 
SENDITAB, TECH.NONE, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendipack.xml", "sendipack.tex")
-- "sendicraft"�� �����±� ���Ѵ�. YUKARI : ������x, �����±�(�� �±װ� �ִ»���� ���۰���)
-- �̸�, ���, ��, ��� ����, ��ġ��, min_spacing, nounlock, ���� �� �ִ� ����, [ ���� builder_tag, atlas, image, testfn, product]
-----------------------------------���� ����
AddRecipe("sendisedmask", 
{Ingredient("cutstone", 4), Ingredient("marble", 4)}, 
SENDITAB, TECH.NONE, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendisedmask.xml", "sendisedmask.tex")	
-- RECIPETABS.SURVIVAL[������], RECIPETABS.DRESS[�巹����], RECIPETABS.LIGHT[������], SENDITAB[���� ������]
---------------------------------- ���� ����ũ
AddRecipe("sendi_rapier_wood", 
{Ingredient("spear", 1), Ingredient("log", 8), Ingredient("rope", 2)}, 
SENDITAB, TECH.NONE, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendi_rapier_wood.xml", "sendi_rapier_wood.tex")
---------------------------------- ���� �����Ǿ� 
local sendirapierwood = Ingredient( "sendi_rapier_wood", 1) 
sendirapierwood.atlas = "images/inventoryimages/sendi_rapier_wood.xml"

AddRecipe("sendi_rapier", 
{sendirapierwood, Ingredient("tentaclespike", 1), Ingredient("hambat", 1)}, 
SENDITAB, TECH.NONE, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendi_rapier.xml", "sendi_rapier.tex")
----------------------------------  �����Ǿ� 
local sendiarmor = Ingredient( "sendi_armor_01", 1) 
sendiarmor.atlas ="images/inventoryimages/sendi_armor_01.xml"

AddRecipe("sendi_armor_01", 
{Ingredient("silk", 6), Ingredient("rabbit", 1), Ingredient("heatrock", 1)}, 
SENDITAB, TECH.NONE, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendi_armor_01.xml", "sendi_armor_01.tex")
---------------------------------- ���÷� �Ƹ�
AddRecipe("sendi_armor_02", 
{sendiarmor, Ingredient("bluegem", 8), Ingredient("heatrock", 2)}, 
SENDITAB, TECH.NONE, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendi_armor_02.xml", "sendi_armor_02.tex")
---------------------------------- �������Ƹ� 
local sendirapier = Ingredient( "sendi_rapier", 1) -- YUKARI : � ���������� ���� ���� �Ұ�� �̷��� �߰��ؾ���.
sendirapier.atlas = "images/inventoryimages/sendi_rapier.xml"

AddRecipe("sendi_rapier_ignia", 
{sendirapier, Ingredient("nightsword", 1), Ingredient("redgem", 12)}, 
SENDITAB, TECH.NONE, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendi_rapier_ignia.xml", "sendi_rapier_ignia.tex")

---------------------------------- �̱״Ͼ� �����Ǿ�
AddRecipe("sendi_oven", 
{Ingredient("boards", 10), Ingredient("cutstone", 10), Ingredient("purplegem", 1) }, 
SENDITAB, TECH.SCIENCE_TWO, "sendi_oven_placer", nil, nil, nil, "sendicraft", "images/inventoryimages/sendi_oven.xml", "sendi_oven.tex" ) 
---------------------------------- ���� ����