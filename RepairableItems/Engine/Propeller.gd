extends Sprite


func _ready():
	start_propeller()

func start_propeller() -> void:
	$AnimationPlayer.play("running")
	
func stop_propeller() -> void:
	$AnimationPlayer.play("stopped")
