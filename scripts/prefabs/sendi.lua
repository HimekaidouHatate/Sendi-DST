local CONST = TUNING.SENDI
local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
	Asset("ANIM", "anim/sendi_skin_longtail.zip"),
	--------센디스킨
	Asset("ANIM", "anim/sendi_skin_christmas.zip"), -- 크리스마스 사이드테일
	Asset("ANIM", "anim/sendi_skin_christmas_b.zip"),  --크리스마스 롱테일 
	Asset("ANIM", "anim/sendi_skin_ignia.zip"), --ver.이그니아 
	Asset("ANIM", "anim/sendi_skin_ignias.zip"), --ver.이그니아 금발
	
	--스킨파일이 추가됐을때마다 전부 추가해주세요
	
	}

local prefabs = {

}

local start_inv = {
-- 맞춤시작 인벤토리 시작 
	"sendipack",
	"sendi_rapier_wood",
	"aos_seed","aos_seed","aos_seed","aos_seed","aos_seed","aos_seed","aos_seed","aos_seed","aos_seed","aos_seed",
	"aos_seed","aos_seed","aos_seed","aos_seed","aos_seed","aos_seed","aos_seed","aos_seed","aos_seed","aos_seed",
	"aos_seed","aos_seed","aos_seed","aos_seed","aos_seed"
	
}

local function SendiOnSetOwner(inst)
	if TheWorld.ismastersim then
        inst.sendi_classified.Network:SetClassifiedTarget(inst)
    end
end

local function AttachClassified(inst, classified)
	inst.sendi_classified = classified
    inst.ondetachsendiclassified = function() inst:DetachSendiClassified() end
    inst:ListenForEvent("onremove", inst.ondetachsendiclassified, classified)
end

local function DetachClassified(inst)
	inst.sendi_classified = nil
    inst.ondetachsendiclassified = nil
end

local function OverrideOnRemoveEntity(inst)
	inst.OnRemoveSendi = inst.OnRemoveEntity
	function inst.OnRemoveEntity(inst)
		if inst.jointask ~= nil then
			inst.jointask:Cancel()
		end

		if inst.sendi_classified ~= nil then
			if TheWorld.ismastersim then
				inst.sendi_classified:Remove()
				inst.sendi_classified = nil
			else
				inst:RemoveEventCallback("onremove", inst.ondetachsendiclassified, inst.sendi_classified)
				inst:DetachSendiClassified()
			end
		end
		return inst:OnRemoveSendi()
	end
end



local function onbecamehuman(inst)
-- 인물이 인간에게서 부활 할때
   inst.components.locomotor:SetExternalSpeedMultiplier(inst, "sendi_speed_mod", 1.1)
   -- 유령이 아닌경우 속도 설정.
end

local function onbecameghost(inst)
   inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "sendi_speed_mod", 2.0)
   -- 귀신이 될때 속도 수정자 제거
end

local function onload(inst)
-- 캐릭터를 로드 하거나, 스폰 하는 경우 
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end

--MH 모드옵션 불러오기
--local modoption = GetModConfigData("modoption")
--MH 모드옵션 불러오기

------------------------------/아래/-미쉘의  허기불꽃 시스템-/아래/--------------------------------
local function sendi_light(inst, data) --YUKARI : 주석의 의미에 맞게 코드를 좀더 명확하게 재작성
	if not inst:HasTag("playerghost") then 	--MH 모드 옵션 불러와서 세팅(할 예정)
		local Light = inst.Light or inst.entity:AddLight()  -- YUKARI : inst에 이미 Light가 있으면 불필요하게 추가하지 않게 하기위해서 이렇게 작성
															 -- AddLight는 한번만 사용해도 됩니다.
		if (TheWorld.state.isnight or TheWorld:HasTag("cave")) and not TheWorld.state.isfullmoon then
			if inst.components.hunger.current > 50 then --허기수치가 n 초과일때
				inst.Light:SetRadius(1.1)
				inst.Light:SetFalloff(1.2)
				inst.Light:SetIntensity(.5)
				inst.Light:SetColour(255, 255, 20/255, 25, 255)
				inst.Light:Enable(true) -- YUKARI : Light를 끄거나 키는데에 사용.
				inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 3)
			else
				Light:Enable(false)
				
				inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)
			end
			--inst.components.health.regen.amount = 0
		else
			Light:Enable(false)
			--inst.components.health.regen.amount = 0.2
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)
		end
	end
end
----------------------------/ 위 /미쉘의  허기불꽃 시스템 / 위 /---------------------------------



local skins = { -- "sendi_skin_" [스킨] 뒤에 나오는 이름
	"DEFAULT", "longtail", "christmas", "christmas_b", "ignia", "ignias"
}

local function SetSkinBuild(inst) -- YUKARI 센디 스킨옵션 관련 
	local index = inst.skinindex

	if index == 1 then
		inst.AnimState:SetBuild("sendi")
	else
		local OverrideSkin =_G.SendiForceOverrideSkin
		inst.AnimState:SetBuild("sendi_skin_"..skins[index])

		if OverrideSkin == 2 then
			inst.AnimState:ClearOverrideSymbol("swap_body")
		elseif OverrideSkin == 3 and not inst.components.inventory:EquipHasTag("sendis") then
			inst.AnimState:ClearOverrideSymbol("swap_body")
		end

		if inst.components.inventory:EquipHasTag("sleevefix") then
			inst.AnimState:OverrideSymbol("arm_upper", "sendi", "arm_upper")
		else
			inst.AnimState:ClearOverrideSymbol("arm_upper")
		end
	end
end

local function OnChangeSkin(inst) -- YUKARI 스킨관련
	inst.skinindex = inst.skinindex >= #skins and 1 or inst.skinindex + 1
	SetSkinBuild(inst)
	-- TODO : 감정표현 추가
end

local function OnEquip(inst, data) 
	if data.eslot == EQUIPSLOTS.BODY then
		SetSkinBuild(inst)
	end
end

local function eatunfinishedfoodfn(inst, data)
	local mana_amount = data.food.sendimana or data.food.components.edible.sanityvalue ~= nil and data.food.components.edible.sanityvalue > 0 and data.food.components.edible.sanityvalue * CONST.MANA_RESTORE_FROM_FOOD_MULTIPLIER or CONST.INTERNAL_TYPE_ZERO -- 음식 먹을 때 오르는 정신력으로부터 마나가 회복
	inst.components.sendimana:DoDelta(mana_amount)

	if data.food:HasTag("sendistaple") then
		data.feeder.components.talker:Say(GetString(data.feeder, "SENDISTAPLE"))
	
	elseif data.food:HasTag("sendifood") then
		data.feeder.components.talker:Say(GetString(data.feeder, "SENDIFOOD"))
	
	elseif data.food:HasTag("unfinished") then
		data.feeder.components.talker:Say(GetString(data.feeder, "UNFINISHED"))
	
	elseif data.food:HasTag("sendimeat") then
		data.feeder.components.talker:Say(GetString(data.feeder, "SENDIMEAT"))	
   end
end  --음식대사 

local function NoEatCookPotFood(inst)
	local _PrefersToEat = inst.components.eater.PrefersToEat
	function inst.components.eater.PrefersToEat(self, inst)
		if inst:HasTag("preparedfood") and not inst:HasTag("sendicook") then
			return false
		end
		return _PrefersToEat(self, inst)
	end
end

----------스킨 끝

local common_postinit = function(inst) 
	--센디의 커스텀레시피를 추가합니다. 
	inst.MiniMapEntity:SetIcon( "sendi.tex" )
	
	inst:AddTag("sendi")-- 센디 제작 태그를 추가합니다
	inst:AddTag("bookbuilder")-- 위커바컴의 책을 제조합니다.
	inst:AddTag("reader")
	
	inst:ListenForEvent("setowner", SendiOnSetOwner)
  
	OverrideOnRemoveEntity(inst)
	inst.AttachSendiClassified = AttachClassified
	inst.DetachSendiClassified = DetachClassified
end


local master_postinit = function(inst)
	inst.sendi_classified = SpawnPrefab("sendi_classified")
	inst:AddChild(inst.sendi_classified)
	inst.skinindex = 1

	inst.soundsname = "willow"
	-- 이 캐릭터의 사운드 윌로우로 설정함.
	inst.starting_inventory = start_inv

	inst:AddComponent("reader")
	inst:AddComponent("sendimana")
	inst:AddComponent("sendiskill")
	inst:AddComponent("sendilevel")
	
	inst:ListenForEvent("oneat", eatunfinishedfoodfn) -- 먹었을 때
	NoEatCookPotFood(inst)
	
	--------------------------- 허기 불꽃 시스템의 마침점 ------------------------------------
	inst:WatchWorldState("phase", sendi_light)
	inst:ListenForEvent("hungerdelta", sendi_light)
	--------------------------- 허기 불꽃 시스템의 마침점 ------------------------------------

	-- Stats   
	inst.components.health:SetMaxHealth(CONST.DEFAULT_HEALTH) -- 피
	inst.components.hunger:SetMax(CONST.DEFAULT_HUNGER) -- 배고팡
	inst.components.sanity:SetMax(CONST.DEFAULT_SANITY) -- 정신
	-- 최대피, 허기, 정신을 표시합니다.

	inst.components.health.fire_damage_scale = 0.01 --불딜
	inst.components.combat.damagemultiplier = CONST.DEFAULT_DAMAGEMULTIPLIER -- 데미지 계수 0.75로 설정
	inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)
	
	inst.components.combat.min_attack_period = 0.15--공격속도 
	--inst.components.health:StartRegen(0.3, 0.6)  --피 리젠
	inst.OnLoad = onload
	inst.OnNewSpawn = onload
	inst.ChangeSkin = OnChangeSkin
	inst:ListenForEvent("equip", OnEquip )
	inst:ListenForEvent("unequip", OnEquip )
end

return MakePlayerCharacter("sendi", prefabs, assets, common_postinit, master_postinit)
