


include('shared.lua')

net.Receive( "NPCPANEL", function()
	local frame = vgui.Create( "DFrame" ) 
	frame:SetTitle("Acheter une arme :") 
    frame:SetSize( 1000, 720 ) 
	frame:SetVisible(true)
    frame:Center() 
    frame:MakePopup()
	
	button1 = vgui.Create("DButton", frame)
	button1:SetPos(10,40)
	button1:SetSize(200,45)
	button1:SetText("Acheter AK47 pour 4100€")
	button1:SetColor( Color( 191, 127, 63 ) )
	button1.DoClick = function()
	net.Start("givingstuff")
	net.Start("pay")
	net.WriteString("weapon_ak472")	
	net.WriteInt(-4100)	
	net.SendToServer()
	end
	
	button2 = vgui.Create("DButton", frame)
	button2:SetPos(200,40)
	button2:SetSize(200,45)
	button2:SetText("Acheter M4A1 pour 4300€")
	button2:SetColor( Color( 191, 127, 63 ) )
	button2.DoClick = function()
	net.Start("givingstuff")
--	net.Start("pay")
	net.WriteString("weapon_m42")	
	--net.WriteInt(-4300)	
	net.SendToServer()
	end
	
		button3 = vgui.Create("DButton", frame)
	button3:SetPos(10,200)
	button3:SetSize(200,45)
	button3:SetText("Acheter ShotGun pour 2800€")
	button3:SetColor( Color( 185, 73, 240 ) )
	button3.DoClick = function()
	net.Start("givingstuff")
--	net.Start("pay")
	net.WriteString("weapon_pumpshotgun2")
	--net.WriteInt(-2800)	
	net.SendToServer()
	end
	
		button4 = vgui.Create("DButton", frame)
	button4:SetPos(10,400)
	button4:SetSize(200,45)
	button4:SetText("Acheter MAC10 pour 2100€")
	button4:SetColor( Color( 12, 34, 145 ) )
	button4.DoClick = function()
	net.Start("givingstuff")
--	net.Start("pay")
	net.WriteString("weapon_mac102")
--	net.WriteInt(-2100)	
	net.SendToServer()
	end
	
		button5 = vgui.Create("DButton", frame)
	button5:SetPos(200,400)
	button5:SetSize(200,45)
	button5:SetText("Acheter MP5 pour 3000€")
	button5:SetColor( Color( 12, 34, 145 ) )
	button5.DoClick = function()
	net.Start("givingstuff")
--	net.Start("pay")
	net.WriteString("weapon_mp52")	
--	net.WriteInt(-3000)	
	net.SendToServer()
	end
	
			button6 = vgui.Create("DButton", frame)
	button6:SetPos(10,600)
	button6:SetSize(200,45)
	button6:SetText("Acheter GLOCK pour 1440€")
	button6:SetColor( Color( 65, 145, 12 ) )
	button6.DoClick = function()
	net.Start("givingstuff")
--	net.Start("pay")
	net.WriteString("weapon_glock2")
--	net.WriteInt(-1440)	
	net.SendToServer()
	end
	
			button7 = vgui.Create("DButton", frame)
	button7:SetPos(200,600)
	button7:SetSize(200,45)
	button7:SetText("Acheter DESERT EAGLE pour 2800€")
	button7:SetColor( Color( 65, 145, 12 ) )	
	button7.DoClick = function()
	net.Start("givingstuff")
--	net.Start("pay")
	net.WriteString("weapon_deagle2")	
--	net.WriteInt(-2800)	
	net.SendToServer()
	end
	
			button8 = vgui.Create("DButton", frame)
	button8:SetPos(400,600)
	button8:SetSize(200,45)
	button8:SetText("Acheter FIVE SEVEN pour 1700€")
	button8:SetColor( Color( 65, 145, 12 ) )
	button8.DoClick = function()
	net.Start("givingstuff")
--	net.Start("pay")
	net.WriteString("weapon_fiveseven2")
--	net.WriteInt(-1700)	
	net.SendToServer()
	end
	
		button8 = vgui.Create("DButton", frame)
	button8:SetPos(600,600)
	button8:SetSize(200,45)
	button8:SetText("Acheter P228 pour 1600€")
	button8:SetColor( Color( 65, 145, 12 ) )
	button8.DoClick = function()
	net.Start("givingstuff")
--	net.Start("pay")
	net.WriteString("weapon_p2282")	
--	net.WriteInt(-1600)	
	net.SendToServer()
	end
	
		button9 = vgui.Create("DButton", frame)
	button9:SetPos(10,300)
	button9:SetSize(200,45)
	button9:SetText("Acheter SNIPER SILENCIEUX pour 5500€")
    button9:SetColor( Color(240, 73, 73 ) )
	button9.DoClick = function()
	net.Start("givingstuff")
--	net.Start("pay")
	net.WriteString("ls_sniper")
--	net.WriteInt(-5500)		
	net.SendToServer()
	end
	
			button9 = vgui.Create("DButton", frame)
	button9:SetPos(10,500)
	button9:SetSize(200,45)
	button9:SetText("Acheter LOCKPICK pour 350€")
    button9:SetColor( Color(238, 238, 117 ) )
	button9.DoClick = function()
	net.Start("givingstuff")
--	net.Start("pay")
	net.WriteString("lockpick")	
--	net.WriteInt(-350)	
	net.SendToServer()
	end
	
end )



hook.Add("PostDrawOpaqueRenderables", "NPCPANEL", function()
	for _, ent in pairs (ents.FindByClass("panel")) do
		if ent:GetPos():Distance(LocalPlayer():GetPos()) < 500 then
			local Ang = ent:GetAngles()

			Ang:RotateAroundAxis( Ang:Forward(), 90)
			Ang:RotateAroundAxis( Ang:Right(), -90)

			cam.Start3D2D(ent:GetPos()+ent:GetUp()*76, Ang, 0.10)
				draw.SimpleTextOutlined( "NPC PANEL", "my_npc", 0, 0, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 0, Color(255,255,255,255) )
			cam.End3D2D()
		end
	end
end)


surface.CreateFont( "my_npc", { 
	font = "Arial",
	extended = true,
	size = 200,
	weight = 1000
} )
