extends Node2D


# Declare member variables here. Examples:
var text_array = [
	"He accidentally summoned some zombies\n and now he can't remember how to send them back.",
	"He has to sneak past them to obtain the key to the front door\n and escape."
]

var i = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if i < text_array.size():
				$Label.text = text_array[i]
				i += 1
			else:
				get_tree().change_scene("res://Main.tscn")
