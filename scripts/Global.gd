extends Node


signal updated_bones
signal updated_life

var bones = 0
var life_max = 2
var current_life = 2

func add_bone():
	bones += 1
	updated_bones.emit()

func take_life():
	current_life -= 1
	updated_life.emit()
	if current_life <= 0:
		restart_game()

func try_to_cure() -> bool:

	if bones >= 5 and current_life < life_max:
		bones -= 5
		current_life += 1
		updated_bones.emit()
		updated_life.emit()
		return true 
	return false 

func restart_game():
	await get_tree().create_timer(0.5).timeout
	bones = 0
	current_life = life_max
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	
func win_game():
	get_tree().change_scene_to_file("res://scenes/game_win.tscn")
# Conectado al botón Exit (Menu)
func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu_principal.tscn")
func _on_restart_pressed() -> void:
	pass # Replace with function body.
