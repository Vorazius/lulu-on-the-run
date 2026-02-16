extends CharacterBody2D

@export var animation: AnimatedSprite2D
@onready var sfx_bark = $SfxBark
@onready var  sfx_jump=$Sfxjump
var _speed: float = 300.0
var _jump_speed: float = -450.0

func _physics_process(delta: float) -> void:
	# Gravity
	velocity += get_gravity() * delta
	
	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = _jump_speed
		sfx_jump.play()
	# Movement
	if Input.is_action_pressed("right"):
		velocity.x = _speed
		animation.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -_speed
		animation.flip_h = true
	else:
		velocity.x = 0
		
	# Healing Action
	if Input.is_action_just_pressed("heal"):
		if Global.try_to_cure():
			animation.play("pop")
	#Bark
	if Input.is_action_just_pressed("bark"):
		animation.play("bark") 
		sfx_bark.play()
	#sits
	if Input.is_action_just_pressed("sits"):
		animation.play("sits")
	move_and_slide()

	if (animation.animation == "pop" or animation.animation == "bark" or animation.animation == "sits") and animation.is_playing():
		return

	if !is_on_floor():
		animation.play("jump")
	elif velocity.x != 0:
		animation.play("run")
	else:
		animation.play("idle")
