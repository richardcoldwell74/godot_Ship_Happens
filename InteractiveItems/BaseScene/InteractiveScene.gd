extends Area2D

class_name interactive_scene

var is_player_overlapping: bool
var is_working: bool

func _ready():
	is_player_overlapping = false
	is_working = true
	$AnimationPlayer.play("working")
	var _state_change_signal = SignalManager.connect(SignalManager.CHANGE_ENGINE_STATE, self, "change_state")

func _process(delta):
	$ButtonTip.visible = is_player_overlapping


func _on_InteractiveScene_body_entered(body):
	if body.is_in_group("PlayerGroup"):
		is_player_overlapping = true


func _on_InteractiveScene_body_exited(body):
	if body.is_in_group("PlayerGroup"):
		is_player_overlapping = false

func change_state() -> void:
	print("change_state")
	is_working = !is_working
	if is_working:
		$AnimationPlayer.play("working")
	else:
		$AnimationPlayer.play("broken")
