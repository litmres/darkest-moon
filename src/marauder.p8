marauder_speed=0.8

marauder_sprites={
	64,64,96,70
}

marauder=kind({
	extends=entity,
	frm=0,
	shadow={x=0,y=0,rx=8,ry=4},
	shoff=v(0,0),
	cbox=make_box(-3,-6,4,1)
})

marauder_shadow_locs={
	v(2,0),v(-2,0),v(0,0),v(0,-3)
}

function marauder:s_default(t)
	-- moving around
	local moving=false

	if self.pos and plyr.pos then
		if flr(self.pos.x)!=flr(plyr.pos.x) then
			if self.pos.x<plyr.pos.x then
				self.facing=2
				self.pos.x+=marauder_speed/2
				moving=true
			elseif self.pos.x>plyr.pos.x then
				self.facing=1
				self.pos.x-=marauder_speed/2
				moving=true
			end
		end

		if flr(self.pos.y)!=flr(plyr.pos.y) then
			if self.pos.y<plyr.pos.y then
				self.facing=4
				self.pos.y+=marauder_speed/2
				moving=true
			elseif self.pos.y>plyr.pos.y then
				self.facing=3
				self.pos.y-=marauder_speed/2
				moving=true
			end
		end
	end

	if moving then
		if t%6==0 then
			self.frm=(self.frm+1)%3
		end
	else
		self.frm=0
	end

	-- update shadow position
	set(self.shadow,marauder_shadow_locs[self.facing])
	-- collision detection
	collide(self,"cbox",self.hit_object)
end

function marauder:hit_object(ob)
	return event(ob,"marauded")
end

function marauder:render()
	local pos=self.pos
	local sprite=marauder_sprites[self.facing]+self.frm*2

	spr(sprite,pos.x-8,pos.y-16,2,2,self.facing==1)
end
