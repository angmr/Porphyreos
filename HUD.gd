extends CanvasLayer



# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.hide()
	$game_won.hide()
	$ReplayButton.hide()
	$ExitButton.hide()


func _on_ReplayButton_pressed():
	print("Scene Reloaded")
	$ColorRect.hide()
	$ReplayButton.hide()
	$ExitButton.hide()
	$game_won.hide()
	get_tree().reload_current_scene()


func updateDeaths(deaths):
	$DeathsLabel.text = "Deaths: " + str(deaths)


func _on_ExitButton_pressed():
	get_tree().quit()
