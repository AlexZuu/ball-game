extends Area

signal win

func _on_VictoryZone_body_entered(body):
	if body.name == "Player":
		emit_signal("win")
