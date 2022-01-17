extends Area2D

class_name interactive_scene

var is_player_overlapping: bool
var is_working: bool


func _ready():
	is_player_overlapping = false
	is_working = true
	$AnimationPlayer.play("working")


func _process(_delta):
	$ButtonTip.visible = is_player_overlapping
	$BreakDownTimer.start()


func _on_InteractiveScene_body_entered(body):
	if body.is_in_group("PlayerGroup"):
		is_player_overlapping = true


func _on_InteractiveScene_body_exited(body):
	if body.is_in_group("PlayerGroup"):
		is_player_overlapping = false


func set_broken() -> void:
	is_working = false
	if is_working:
		$AnimationPlayer.play("working")


func _on_BreakDownTimer_timeout():
	print("Timer Timout")
	set_broken()
