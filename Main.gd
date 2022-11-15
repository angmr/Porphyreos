extends Node

var player_deaths = 0
var player_start_position
var key_collected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Zombie3/AnimatedSprite.flip_h = true
	$Zombie4/AnimatedSprite.flip_h = true
	player_start_position = $Player.get_position()
	$Door/CollisionShape2D.disabled = false
	$CanvasLayer/DeathsLabel.text = "Deaths: 0"
	$Door2/DoorLockedMsg.hide()


func _on_Borders_area_entered(area):
	# zombie flipping
	var zombie = area.get_name()
	if zombie == "Zombie1":
		$Zombie1/AnimatedSprite.flip_h = !$Zombie1/AnimatedSprite.flip_h
	if zombie == "Zombie2":
		$Zombie2/AnimatedSprite.flip_h = !$Zombie2/AnimatedSprite.flip_h
	if zombie == "Zombie3":
		$Zombie3/AnimatedSprite.flip_h = !$Zombie3/AnimatedSprite.flip_h
	if zombie == "Zombie4":
		$Zombie4/AnimatedSprite.flip_h = !$Zombie4/AnimatedSprite.flip_h


func _on_Player_player_died():
	player_deaths += 1
	$CanvasLayer.updateDeaths(player_deaths)
	# reset player
	$Player.position = player_start_position
	$Player/Sprite.set_modulate(Color(1,1,1,1))
	$Player/Area2D/Collision.set_deferred("disabled", false)
	if key_collected:
		$Key/Sprite.show()
		$Key/CollisionShape2D.set_deferred("disabled", false)
		$Door2.monitoring = true
	

func _on_Key_collected():
	key_collected = true
	$Door2.monitoring = false
	$Door/CollisionShape2D.disabled = true


func _on_Door2_body_entered(body):
	if body.get_name() == "Player":
		$Door2/DoorLockedMsg.show()


func _on_Door2_body_exited(_body):
	$Door2/DoorLockedMsg.hide()


func _on_WinTrigger_body_entered(body):
	$CanvasLayer/ColorRect.show()
	$CanvasLayer/game_won.show()
	$CanvasLayer/ReplayButton.show()
	$CanvasLayer/ExitButton.show()
	$Player.can_move = false
