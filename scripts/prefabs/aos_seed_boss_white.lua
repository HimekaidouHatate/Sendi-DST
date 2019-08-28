local assets =
{
    Asset("ANIM", "anim/aos_seed_boss_white.zip"),
	Asset("ATLAS", "images/inventoryimages/aos_seed_boss_white.xml"),
}

-- local function moon_oneaten(inst, eater)

    -- if eater.wormlight then
        -- eater.wormlight.components.spell.lifetime = 0
        -- eater.wormlight.components.spell:ResumeSpell()
    -- else
        -- local light = SpawnPrefab("wormlight_light")
        -- light.components.spell:SetTarget(eater)
        -- if not light.components.spell.target then
            -- light:Remove()
        -- end
        -- light.components.spell:StartSpell()
    -- end
-- end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("aos_seed_boss_white")
    inst.AnimState:SetBuild("aos_seed_boss_white")
    inst.AnimState:PlayAnimation("idle", true)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddTag("cattoy")
	
    inst:AddComponent("inspectable")
	inst:AddComponent("tradable")
	
	inst:AddComponent("edible")
	inst.components.edible.hungervalue = (2)
	inst.components.edible.healthvalue = (0)
	inst.components.edible.sanityvalue = (5)

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/aos_seed_boss_white.xml"
	
    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	MakeHauntableLaunch(inst)

    return inst
end


return Prefab("common/inventory/aos_seed_boss_white", fn, assets)
