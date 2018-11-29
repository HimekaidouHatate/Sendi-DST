
-- �׷��� �ڿ� ����. ���ÿ� ��� �̹���, ���� �̹���, �κ��丮 �̹���, �κ��丮 �̹��� xml�� ������.

local assets ={
    Asset("ANIM", "anim/sendi_rapier.zip"),
    Asset("ANIM", "anim/swap_sendi_rapier.zip"),
   
   Asset("ATLAS", "images/inventoryimages/sendi_rapier.xml"),
   Asset("IMAGE", "images/inventoryimages/sendi_rapier.tex"),
}

local function UpdateDamage(inst)
    if inst.components.perishable and inst.components.weapon then
        local dmg = TUNING.HAMBAT_DAMAGE * inst.components.perishable:GetPercent()
        dmg = Remap(dmg, 0, TUNING.HAMBAT_DAMAGE, TUNING.HAMBAT_MIN_DAMAGE_MODIFIER*TUNING.HAMBAT_DAMAGE, TUNING.HAMBAT_DAMAGE)
        inst.components.weapon:SetDamage(dmg)
    end
end

local function OnLoad(inst, data)
   -- UpdateDamage(inst)
end
            --onunequip
local function onequip(inst, owner)

   
    owner.AnimState:OverrideSymbol("swap_object", "swap_sendi_rapier_01", "swap")

    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
	
	-- ���� �� ����.
	-- owner.AnimState:OverrideSymbol("�ִϸ��̼� ��ũ��", "�����", "���� ������")
	-- �� �Ʒ� 2���� ������ ��� �ִ� �� ����� Ȱ��ȭ�ϰ�, �� �� ����� ��Ȱ��ȭ.


   end

   
local function onunequip(inst, owner)
    --UpdateDamage(inst)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
  --  local skin_build = inst:GetSkinBuild()
   -- if skin_build ~= nil then
   --     owner:PushEvent("unequipskinneditem", inst:GetSkinName())
   -- end
end


local function fn()

    local inst = CreateEntity()

   
   local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
   -- �Ʊ��� �߰�   
   
    inst.entity:AddNetwork()
 
    MakeInventoryPhysics(inst)


   
    inst.AnimState:SetBank("sendi_rapier")
    inst.AnimState:SetBuild("sendi_rapier")
    inst.AnimState:PlayAnimation("idle")
   --���� �̹����߰� 
   
    inst:AddTag("sharp") 
    inst:AddTag("pointy") 
	-- �±� ����, �� �� �±״� ��� ��(���� Ȯ��)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    --inst:AddComponent("perishable")
  --  inst.components.perishable:SetPerishTime(TUNING.PERISH_MED)
   -- inst.components.perishable:StartPerishing()
  --  inst.components.perishable.onperishreplacement = "spoiled_food"
   --�������
   
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(40)
   -- ����� ����. �Ʒ��� ���� ����
    inst.OnLoad = OnLoad

    -------
    --[[
    inst:AddComponent("edible")
    inst.components.edible.foodtype = FOODTYPE.MEAT
    inst.components.edible.healthvalue = -TUNING.HEALING_MEDSMALL
    inst.components.edible.hungervalue = TUNING.CALORIES_MED
    inst.components.edible.sanityvalue = -TUNING.SANITY_MED
    --]]
	-- ������ ����. �� ������ ���������� ���� �������� �� ���̶� ����. a�� �ִ� ������, b�� ���� �Ϸ� �� ������. ��κ� a = b.
  
   
    inst:AddComponent("inspectable")
	--���� �����ϵ��� ����
	
    inst:AddComponent("inventoryitem")
   inst.components.inventoryitem.imagename = "sendi_rapier"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sendi_rapier.xml"
   --�κ��丮 ���������� ������
   
    MakeHauntableLaunchAndPerish(inst)
   
   

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	--���� �����ϵ���, ������ �������� ���� �� ����� �۵�
	
    return inst
end

return Prefab("sendi_rapier", fn, assets) 