extends Area2D
#take life 
func _on_body_entered(body):
	if body.is_in_group("Player"):
		Global.take_life()
