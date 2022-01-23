extends Area2D

var velocity: Vector2 = Vector2(20, 0)
var caught: bool = false
var hook:Area2D
var score_value: int = 50


func _ready():
	$AnimationPlayer.play("swimming")


func _physics_process(delta) -> void:
	if GameManager.GameRunning:
		if !caught:
			position -= velocity * delta
			off_screen_tidy_up()
		if caught:
			global_position = hook.global_position + Vector2(2,4)



func off_screen_tidy_up() -> void:
	if global_position.x < -25:
		GameManager.NoCrabsOnScreen -= 1
		queue_free()



func fish_caught(the_hook:Area2D) -> void:
	$AnimationPlayer.play("caught")
	caught = true
	hook = the_hook
	global_position = the_hook.global_position

