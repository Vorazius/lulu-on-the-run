extends CanvasLayer

@onready var label_bones = $ContainerBones/Label
@onready var heart1 = $ContainerLives/Heart1
@onready var heart2 = $ContainerLives/Heart2

func _ready():
	Global.updated_bones.connect(update_ui)
	Global.updated_life.connect(update_ui)
	update_ui()

func update_ui():
	# Update number of bones
	label_bones.text = "x " + str(Global.bones)
	#	# Update heart visibility

	heart1.visible = Global.current_life >= 1
	heart2.visible = Global.current_life >= 2
