extends Area

signal dead

func _on_DeathZone_body_entered(body):
	if body.name == "Player":
		emit_signal("dead")
