extends Area2D

class_name interactive_scene

var is_player_overlapping: bool
var is_working: bool
var state: String


func _ready():
	is_player_overlapping = false
	is_working = true
	$AnimationPlayer.play("working")
	state = "WORKING"
	$BreakDownTimer.start(rand_range(5, 10))
	$Warning.visible = false


func _process(_delta):
	$ButtonTip.visible = is_player_overlapping


func _on_InteractiveScene_body_entered(body):
	if body.is_in_group("PlayerGroup"):
		is_player_overlapping = true


func _on_InteractiveScene_body_exited(body):
	if body.is_in_group("PlayerGroup"):
		is_player_overlapping = false


func set_broken() -> void:
	if GameManager.ItemsBrokenCurrentCount < GameManager.MaxItemsBrokenAtOneTime:
		state = "BROKENONE"
		$AnimationPlayer.play("broken")
		$BrokenDownTimer.start(4.0)
		$Warning.visible = true
		$Warning/WarningAnimationPlayer.play("one")
	else:
		randomize()
		$BreakDownTimer.start(rand_range(5, 10))


func _on_BreakDownTimer_timeout():
	set_broken()


func _on_BrokenDownTimer_timeout():
	if state == "BROKENONE":
		state = "BROKENTWO"
		$Warning/WarningAnimationPlayer.play("two")
		$BrokenDownTimer.start(4.0)
	elif state == "BROKENTWO":
		state = "BROKENTHREE"
		$Warning/WarningAnimationPlayer.play("three")
