extends Button

func _ready() -> void:
	pressed.connect(_play_button, 4)


func _play_button():
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
