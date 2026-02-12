extends Area2D
#Add bone
func _on_body_entered(body):
	Global.add_bone()
	queue_free()
