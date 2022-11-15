extends Area2D

export var zombie_speed = 10

func _ready():
	pass

func _process(delta):
	if $AnimatedSprite.flip_h == false:
		position.x += zombie_speed*delta*10
	else:
		position.x -= zombie_speed*delta*10
