extends Area2D

var velocity: Vector2 = Vector2(35, 0)


func _ready():
	$AnimationPlayer.play("swimming")


func _physics_process(delta) -> void:
	position -= velocity * delta
	off_screen_tidy_up()


func fish_caught() -> void:
	$AnimationPlayer.play("caught")


func off_screen_tidy_up() -> void:
	if global_position.x < -25:
		GameManager.NoSharksOnScreen -= 1
		queue_free()
