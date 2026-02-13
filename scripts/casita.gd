extends Area2D

func _on_body_entered(body):
	if body.name == "Player": 
		#Next Level
		get_tree().change_scene_to_file("")
