extends Area2D

var is_player_overlapping: bool
var is_working: bool
var state: String
var repair_progress: int = 0
var fully_repaired_value: int = 6
var is_being_repaired: bool = false


export (PackedScene) var Dust

func _ready():
	var _game_timer_signal_connect = SignalManager.connect(
		SignalManager.GAME_TIMER, self, "every_second_stuff"
	)

	is_player_overlapping = false
	is_working = true
	$AnimationPlayer.play("working")
	state = "WORKING"
	$BreakDownTimer.start(rand_range(5, 10))
	$Warning.visible = false
	$AudioStreamPlayer2D.play(0.0)


func _process(_delta):
	$ButtonTip.visible = is_player_overlapping


func _on_BreakDownTimer_timeout():
	set_broken()


func set_broken() -> void:
	if GameManager.ItemsBrokenCurrentCount < GameManager.MaxItemsBrokenAtOneTime:
		GameManager.ItemsBrokenCurrentCount += 1
		state = "BROKEN_STAGE_ONE"
		$AudioStreamPlayer2D.stop()
		$Propeller.stop_propeller()
		$AnimationPlayer.play("broken")
		$BrokenDownTimer.start(4.0)
		$Warning.visible = true
		$Warning/WarningAnimationPlayer.play("one")
	else:
		randomize()
		$BreakDownTimer.start(rand_range(5, 10))


func _on_BrokenDownTimer_timeout():
	if !is_being_repaired:
		if state == "BROKEN_STAGE_ONE":
			state = "BROKEN_STAGE_TWO"
			$Warning/WarningAnimationPlayer.play("two")
			$BrokenDownTimer.start(4.0)
		elif state == "BROKEN_STAGE_TWO":
			state = "BROKEN_STAGE_THREE"
			$Warning/WarningAnimationPlayer.play("three")


func _on_InteractiveScene_body_entered(body):
	if body.is_in_group("PlayerGroup"):
		is_player_overlapping = true


func _on_InteractiveScene_body_exited(body):
	if body.is_in_group("PlayerGroup"):
		is_player_overlapping = false


func every_second_stuff() -> void:
	update_boat_health()
	repairing_damage()


func update_boat_health() -> void:
	if !is_being_repaired:
		if state == "BROKEN_STAGE_TWO":
			GameManager.BoatHealth -= 1
		elif state == "BROKEN_STAGE_THREE":
			GameManager.BoatHealth -= 2


func repairing_damage() -> void:
	if state != "WORKING":
		var actionPressed = Input.is_action_pressed("player_action")
		if actionPressed:
			$BrokenDownTimer.stop()
			is_being_repaired = true
			repair_progress += 1
			#spawn dust
			var dust = Dust.instance()
			add_child(dust)
			dust.global_position = $Position2D.global_position
			dust = Dust.instance()
			add_child(dust)
			dust.global_position = $Position2D2.global_position
			if repair_progress >= fully_repaired_value:
				state = "WORKING"
				GameManager.ItemsBrokenCurrentCount -= 1
				repair_progress = 0
				$Warning.visible = false
				$BreakDownTimer.start(rand_range(5, 10))
				$Propeller.start_propeller()
				$AnimationPlayer.play("working")
				$AudioStreamPlayer2D.play(0.0)
				is_being_repaired = false
		elif is_being_repaired:
			is_being_repaired = false
			$BrokenDownTimer.start(4.0)
		else:
			is_being_repaired = false
