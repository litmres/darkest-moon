function _init()
	t=0

	init_blending(6)
	init_palettes(16)

	build_room(0,0)
	process_walls()

	ply=player:new({
		pos=v(22,42),facing=4
	})

	lgt=light:new({
		pos=v(64,120),bri=0.85
	})

	wht=wheat:new({
		pos=v(30,50)
	})

	chst=chest:new({
		pos=v(61,20)
	})
end
