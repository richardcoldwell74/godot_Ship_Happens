extends Node2D


var velocity: Vector2 = Vector2(0, 15)
var going_down: bool = true

func _ready():
	going_down = true


func _physics_process(delta) -> void:
	if going_down:
		$Hook.position += velocity * delta
	elif !going_down:
		$Hook.position -= velocity * delta
	bottom_screen_auto_recall()



func bottom_screen_auto_recall() -> void:
	if $Hook.global_position.y >= 170:
		going_down = false
