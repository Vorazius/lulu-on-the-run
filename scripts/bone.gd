extends Area2D
#Bone_collision
func _on_body_entered(body):
	if  body.is_in_group("Player"):
		Global.add_bone()
		queue_free() 
