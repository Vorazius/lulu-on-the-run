extends Button



func _ready() -> void:
	pressed.connect(_exit_button) 
	
func _exit_button():
	get_tree().quit()
