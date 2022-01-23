extends Area2D

var velocity: Vector2 = Vector2(35, 0)
var caught: bool = false
var hook:Area2D
var score_value: int = 30


func _ready():
	$AnimationPlayer.play("swimming")


func _physics_process(delta) -> void:
	if GameManager.GameRunning:
		if !caught:
			position -= velocity * delta
			off_screen_tidy_up()
		if caught:
			global_position = hook.global_position + Vector2(2,12)


func fish_caught(the_hook:Area2D) -> void:
	$AnimationPlayer.play("caught")
	caught = true
	hook = the_hook
	global_position = the_hook.global_position


func off_screen_tidy_up() -> void:
	if global_position.x < -25:
		GameManager.NoSharksOnScreen -= 1
		queue_free()
