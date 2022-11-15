extends Area2D

signal collected


func _on_Area2D_body_entered(body):
	print("key collected")
	emit_signal("collected")
	$Sprite.hide()
	$CollisionShape2D.set_deferred("disabled", true)
	$CollectedSound.play()
