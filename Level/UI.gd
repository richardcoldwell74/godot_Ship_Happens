extends CanvasLayer


func _process(delta):
	$TextureProgress.value = GameManager.BoatHealth
