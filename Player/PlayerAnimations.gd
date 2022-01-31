extends AnimationPlayer


enum states {PLATFORM, LADDER, FIXING}

func player_animations(IsOnFloor: bool,state, velocity:Vector2, sprite: Sprite) -> void:
	if state == states.FIXING:
		play("fixing")
	if state == states.PLATFORM:
		if IsOnFloor:
			if velocity.x == 0:
				play("idle")
			elif velocity.x < 0:
				sprite.scale.x = -1
				play("run")
			elif velocity.x > 0:
				sprite.scale.x = 1
				play("run")
		if !IsOnFloor:
			if velocity.y < 0:
				play("jump")
			elif velocity.y > 0:
				play("fall")
			if velocity.x < 0:
				sprite.scale.x = -1
			if velocity.x > 0:
				sprite.scale.x = 1
	if state == states.LADDER:
		if velocity.y == 0:
			.stop()
		elif velocity.y != 0:
			play("climbing")
