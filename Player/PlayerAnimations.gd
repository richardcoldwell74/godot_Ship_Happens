extends AnimationPlayer


func player_animations(IsOnFloor: bool,state: String, velocity:Vector2, sprite: Sprite) -> void:
	if state == "FIXING":
		play("fixing")
	if state == "PLATFORM":
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
	if state == "LADDER":
		if velocity.y == 0:
			.stop()
		elif velocity.y != 0:
			play("climbing")
