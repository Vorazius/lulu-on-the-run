extends CanvasLayer

#Interface_update_bone
@onready var number_label = $HBoxContainer/Label 

func _ready():
	Global.number_of_bones_changed.connect(update_counter)
	update_counter()

func update_counter():

	number_label.text = "x " + str(Global.collected_bones)
