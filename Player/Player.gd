extends KinematicBody2D

var run_speed: int = 70
var climb_speed: int = 40
var jump_speed: int = -150
var gravity: int = 800
var is_ovelapping_ladder: bool = false
var is_ovelapping_ladder_top: bool = false
var is_ovelapping_repairable: bool = false
var velocity: Vector2 = Vector2.ZERO
enum states {PLATFORM, LADDER, FIXING}
var state


func _ready():
	state = states.PLATFORM



func _physics_process(delta):
	if state == states.PLATFORM:
		get_input_platform()
		velocity.y += gravity * delta
		velocity = move_and_slide(velocity, Vector2(0, -1))
	if state == states.LADDER:
		get_input_ladder()
		velocity = move_and_slide(velocity, Vector2(0, -1))
	$AnimationPlayer.player_animations(is_on_floor(), state, velocity, $Sprite)
	if !is_ovelapping_ladder:
		state = states.PLATFORM


func get_input_platform() -> void:
	#left right movement
	velocity.x = Input.get_axis("player_left", "player_right") * run_speed
	#jump
	var jump = Input.is_action_just_pressed("player_jump")
	if jump and is_on_floor() and state == states.PLATFORM:
		velocity.y = jump_speed
	# capture up & down to use in changing to ladder state
	var YInput: float = Input.get_axis("player_up", "player_down") * climb_speed
	if is_ovelapping_ladder and YInput < 0:
		state = states.LADDER
	if is_ovelapping_ladder_top and is_on_floor() and YInput > 0:
		state = states.LADDER
		position.y += 1
		is_ovelapping_ladder = true
	var actionPressed = Input.is_action_pressed("player_action")
	if actionPressed and is_ovelapping_repairable:
		state = states.FIXING


func get_input_ladder() -> void:
	velocity = Vector2.ZERO
	#left right movement
	velocity.x = Input.get_axis("player_left", "player_right") * climb_speed
	# up down movement
	velocity.y = Input.get_axis("player_up", "player_down") * climb_speed
	if is_on_floor():
		state = states.PLATFORM



func _on_AreaDetector_area_entered(area):
	if area.is_in_group("ladder"):
		is_ovelapping_ladder = true
	if area.is_in_group("ladder_top"):
		is_ovelapping_ladder_top = true
	if area.is_in_group("repairable"):
		if area.state != 0:
			is_ovelapping_repairable = true


func _on_AreaDetector_area_exited(area):
	if area.is_in_group("ladder"):
		is_ovelapping_ladder = false
	if area.is_in_group("ladder_top"):
		is_ovelapping_ladder_top = false
	if area.is_in_group("repairable"):
		is_ovelapping_repairable = false
