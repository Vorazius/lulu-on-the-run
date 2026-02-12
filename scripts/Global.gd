extends Node


signal number_of_bones_changed 

var collected_bones = 0

func add_bone():
	collected_bones += 1
	number_of_bones_changed.emit()
