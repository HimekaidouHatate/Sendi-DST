local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH
local Recipe = GLOBAL.Recipe

local SENDITAB = AddRecipeTab(GLOBAL.STRINGS.SENDITABNAME, 777, "images/inventoryimages/senditab.xml", "senditab.tex", "sendicraft") 
-- ���� ���������� �߰�.

AddRecipe("sendipack", 
{Ingredient("gears", 2), Ingredient("bedroll_furry", 2)}, 
SENDITAB, TECH.SCIENCE_TWO, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendipack.xml", "sendipack.tex")
-- "sendicraft"�� �����±� ���Ѵ�. YUKARI : ������x, �����±�(�� �±װ� �ִ»���� ���۰���)
-- �̸�, ���, ��, ��� ����, ��ġ��, min_spacing, nounlock, ���� �� �ִ� ����, [ ���� builder_tag, atlas, image, testfn, product]
-----------------------------------���� ����
AddRecipe("sendisedmask", 
{Ingredient("cutstone", 4), Ingredient("marble", 4)}, 
SENDITAB, TECH.SCIENCE_ONE, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendisedmask.xml", "sendisedmask.tex")	

local sendisedmask = Ingredient( "sendisedmask", 1) 
sendisedmask.atlas ="images/inventoryimages/sendisedmask.xml"
---------------------------------- ���� ����ũ
AddRecipe("hat_crown", 
{Ingredient("goldnugget", 80), Ingredient("dragon_scales", 1)}, Ingredient("goose_feather", 20)}, 
SENDITAB, TECH.SCIENCE_ONE, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/hat_crown.xml", "hat_crown.tex")	

local Monarch Crown = Ingredient( "hat_crown", 1) 
Monarch Crown.atlas ="images/inventoryimages/hat_crown.xml"
---------------------------------- ������ ũ���
AddRecipe("sendi_armor_01", 
{Ingredient("silk", 6), Ingredient("rabbit", 1), Ingredient("heatrock", 1)}, 
SENDITAB, TECH.SCIENCE_ONE, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendi_armor_01.xml", "sendi_armor_01.tex")

local sendiarmor = Ingredient( "sendi_armor_01", 1) 
sendiarmor.atlas ="images/inventoryimages/sendi_armor_01.xml"
---------------------------------- ���÷� �Ƹ�
AddRecipe("sendi_armor_02", 
{sendiarmor, Ingredient("bluegem", 5), Ingredient("goldnugget", 40)}, 
SENDITAB, TECH.SCIENCE_TWO, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendi_armor_02.xml", "sendi_armor_02.tex")

local lifearmor = Ingredient( "sendi_armor_02", 1) 
lifearmor.atlas ="images/inventoryimages/sendi_armor_02.xml"
---------------------------------- �������Ƹ�
AddRecipe("sendi_rapier_wood", 
{Ingredient("spear", 1), Ingredient("log", 20), Ingredient("rope", 2)}, 
SENDITAB, TECH.NONE, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendi_rapier_wood.xml", "sendi_rapier_wood.tex")

local sendirapierwood = Ingredient( "sendi_rapier_wood", 1)  
sendirapierwood.atlas = "images/inventoryimages/sendi_rapier_wood.xml"
---------------------------------- ���� �����Ǿ� 
AddRecipe("sendi_rapier", 
{sendirapierwood, Ingredient("tentaclespike", 1), Ingredient("goldnugget", 20)}, 
SENDITAB, TECH.SCIENCE_TWO, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendi_rapier.xml", "sendi_rapier.tex")

local sendirapier = Ingredient( "sendi_rapier", 1) -- YUKARI : � ���������� ���� ���� �Ұ�� �̷��� �߰��ؾ���.
sendirapier.atlas = "images/inventoryimages/sendi_rapier.xml"
----------------------------------  �������Ǿ� 
AddRecipe("sendi_rapier_ignia", 
{sendirapier, Ingredient("redgem", 5), Ingredient("goldnugget", 60)}, 
SENDITAB, TECH.SCIENCE_TWO, nil, nil, nil, nil, "sendicraft", "images/inventoryimages/sendi_rapier_ignia.xml", "sendi_rapier_ignia.tex")

local igniarapier = Ingredient( "sendi_rapier_ignia", 1) -- YUKARI : � ���������� ���� ���� �Ұ�� �̷��� �߰��ؾ���.
igniarapier.atlas = "images/inventoryimages/sendi_rapier_ignia.xml"
---------------------------------- �̱״Ͼ� �����Ǿ�

AddRecipe("sendi_oven", 
{Ingredient("boards", 10), Ingredient("cutstone", 10), Ingredient("purplegem", 1) }, 
SENDITAB, TECH.SCIENCE_TWO, "sendi_oven_placer", nil, nil, nil, "sendicraft", "images/inventoryimages/sendi_oven.xml", "sendi_oven.tex" ) 
---------------------------------- ���� ����