extends Node2D


var velocity: Vector2 = Vector2(0, 30)
var going_down: bool = true
var has_fish_on_hook: bool = false

func _ready():
	going_down = true


func _physics_process(delta) -> void:
	if going_down:
		$Hook.position += velocity * delta
	elif !going_down:
		$Hook.position -= velocity * delta
	bottom_screen_auto_recall()
	top_screen_destroy()

func top_screen_destroy() -> void:
	if $Hook.position.y  < 0:
		GameManager.FishingLineOnScreen = false
		queue_free()

func bottom_screen_auto_recall() -> void:
	if $Hook.global_position.y >= 170:
		going_down = false


func set_hook_direction_up() -> void:
	going_down = false

func set_has_fish_on_hook_true() -> void:
	has_fish_on_hook = true
	
func get_has_fish_on_hook() -> bool:
	return has_fish_on_hook


func _on_Hook_area_entered(area):
	if !has_fish_on_hook:
		if area.has_method("fish_caught"):
			has_fish_on_hook = true
			going_down = false
			area.fish_caught($Hook)
