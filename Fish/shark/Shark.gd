extends Area2D

var velocity: Vector2 = Vector2(35, 0)


func _ready():
	$AnimationPlayer.play("swimming")


func _physics_process(delta) -> void:
	position -= velocity * delta


func fish_caught() -> void:
	$AnimationPlayer.play("caught")
