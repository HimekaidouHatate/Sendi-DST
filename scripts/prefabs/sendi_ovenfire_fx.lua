function MakeOvenfireFx(suffix)
	local fname = "sendi_ovenfire"..suffix
	local build = "sendi_oven_fire"..suffix
	local iscold = suffix == "_cold"									-- ������ �����̸�

	local assets = {
		Asset("ANIM", "anim/"..build..".zip"),
		Asset("SOUND", "sound/common.fsb"),
	}

	local sound = iscold and "dontstarve_DLC001/common/coldfire" or "dontstarve/common/campfire"
	local lightColour = iscold and {0, 183 / 255, 1} or {255/255,255/255,192/255}
	local heats = { 70, 85, 100, 115 }									-- ������ �� ��
	local colds = { -10, -20, -30, -40 }								-- ������ �� ��

	local function GetHeatFn(inst)
		return iscold and (colds[inst.components.firefx.level] or -20)  -- ������ �����̸� ������ �� ���� ����
		or (heats[inst.components.firefx.level] or 20)					-- ������ �����̸� �ݴ��
		or 0															-- �������δ� �� ��찡 ������ Ȥ�ó� ƨ���� �߰�
	end

	local function fn()
		local inst = CreateEntity()

		inst.entity:AddTransform()
		inst.entity:AddAnimState()
		inst.entity:AddSoundEmitter()
		inst.entity:AddLight()
		inst.entity:AddNetwork()

		inst.AnimState:SetBank("chiminea_fire")
		inst.AnimState:SetBuild(build)
		inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
		inst.AnimState:SetRayTestOnBB(true)
		inst.AnimState:SetFinalOffset(-1)
	
		inst:AddTag("fx")
		inst:AddTag("HASHEATER")

		inst.entity:SetPristine()

		if not TheWorld.ismastersim then
			return inst
		end
	
		inst:AddComponent("heater")
		inst.components.heater.heatfn = GetHeatFn
		inst.components.heater:SetThermics(not iscold, iscold)

		inst:AddComponent("firefx")
		inst.components.firefx.levels = {
			{anim="level1", sound=sound, radius=2, intensity=.8, falloff=.33, colour = lightColour, soundintensity=.1},
			{anim="level2", sound=sound, radius=3, intensity=.8, falloff=.33, colour = lightColour, soundintensity=.3},
			{anim="level3", sound=sound, radius=4, intensity=.8, falloff=.33, colour = lightColour, soundintensity=.6},
			{anim="level4", sound=sound, radius=5, intensity=.8, falloff=.33, colour = lightColour, soundintensity=1},
		}
    
		inst.components.firefx:SetLevel(1)
		inst.components.firefx.usedayparamforsound = true

		return inst
	end

	return Prefab( "fx/"..fname, fn, assets) 
end

return MakeOvenfireFx(""),
       MakeOvenfireFx("_cold")