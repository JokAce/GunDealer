AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')

function ENT:Initialize()
	self:SetModel("models/props_lab/monitor02.mdl") --< Modifier ici le skin de votre person
	self:SetHullType(HULL_HUMAN) 
	self:SetHullSizeNormal() 
	self:SetNPCState(NPC_STATE_SCRIPT) 
	self:SetSolid(SOLID_BBOX) 
	self:CapabilitiesAdd(CAP_ANIMATEDFACE) 
	self:SetUseType(SIMPLE_USE) 
	self:DropToFloor() 
	self:SetMaxYawSpeed(90) 
end

function ENT:OnTakeDamage()
	-- si la valeur "return" est égale à TRUE alors votre NPC prend des dégats.
	-- si la valeur "return" est égale à FALSE alors votre NPC est invincible .
	return false
end

util.AddNetworkString( "NPCPANEL" ) --< Nom de la fonction ce trouvant dans le CL_INIT
util.AddNetworkString("givingstuff")
util.AddNetworkString("pay")

net.Receive( "pay", function(len,ply)
local argent = net.ReadInt()
ply:addMoney(argent)
--ply:PrintMessage(HUD_PRINTTALK,""..argent)
end)

net.Receive( "givingstuff", function(len,ply)
local arme = net.ReadString()
ply:Give(arme)
ply:PrintMessage(HUD_PRINTTALK,"Tu as acheté "..arme)
ply:PrintMessage(HUD_PRINTTALK,"ATTENTION ! Si tu veux en acheter une autre, pense à ranger celle que tu as dans ton inventaire ou à la jeter par terre.")
end)


function ENT:AcceptInput( name, activator, caller )
  if name == "Use" and caller:IsPlayer() then --< Verifie si USE et ulisier par un joueur
    net.Start("NPCPANEL") --< Nom de la fonction ce trouvant dans le CL_INIT
    net.Send(caller) --< Envoie l'information au serveur
  end
end

