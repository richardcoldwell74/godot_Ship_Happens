extends KinematicBody2D

var run_speed: int = 70
var jump_speed: int = -250
var gravity:int  = 800

var velocity: Vector2 = Vector2.ZERO


func _physics_process(delta):
	get_input();
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))
	player_animations(is_on_floor())


func get_input() -> void:
	velocity.x = 0
	var right = Input.is_action_pressed("player_right")
	var left = Input.is_action_pressed("player_left")
	var jump = Input.is_action_just_pressed("player_jump")
	
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed
	if jump and is_on_floor():
		velocity.y = jump_speed


func player_animations(IsOnFloor:bool)-> void:
	if IsOnFloor:
		if velocity.x == 0:
			$AnimationPlayer.play("idle")
		elif velocity.x < 0:
			$Sprite.scale.x = -1
			$AnimationPlayer.play("run")
		elif velocity.x > 0:
			$Sprite.scale.x = 1
			$AnimationPlayer.play("run")
	if !IsOnFloor:
		if velocity.y < 0:
			$AnimationPlayer.play("jump")
		elif  velocity.y > 0:
			$AnimationPlayer.play("fall")
		if velocity.x < 0:
			$Sprite.scale.x = -1
		if velocity.x > 0:
			$Sprite.scale.x = 1


