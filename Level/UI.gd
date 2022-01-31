extends CanvasLayer


func _process(_delta):
	$ScoreLabel.text = "SCORE: " + str(GameManager.Score)
	$ShipHealthLabel.text = "SHIP HEALTH: " + str(GameManager.BoatHealth)
