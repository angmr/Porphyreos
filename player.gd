extends KinematicBody2D

export var player_speed = 5
var can_move = true

signal player_died

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if can_move:
		if Input.is_action_pressed("ui_right"):
			$Sprite.flip_h = false
			move_and_collide(Vector2(player_speed*delta*10,0))
		if Input.is_action_pressed("ui_left"):
			$Sprite.flip_h = true
			move_and_collide(Vector2(-player_speed*delta*10,0))
		if Input.is_action_pressed("ui_up"):
			move_and_collide(Vector2(0, -player_speed*delta*10))
		if Input.is_action_pressed("ui_down"):
			move_and_collide(Vector2(0, player_speed*delta*10))



func _on_Area2D_area_entered(area):
	var obj = area.get_name()
	if obj == "Zombie1" || obj == "Zombie2" || obj == "Zombie3" || obj == "Zombie4":
		$dead_sound.play()
		$Area2D/Collision.set_deferred("disabled", true)
		can_move = false
		# gradually fade out player
		$Tween.interpolate_property($Sprite, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 3, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$Tween.start()


func _on_Tween_tween_completed(_object, _key):
	emit_signal("player_died")
	can_move = true
