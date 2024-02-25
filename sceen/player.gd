extends CharacterBody2D


const speed = 300.0
const JUMP_VELOCITY = -400.0
var hp = 100
@onready var feature = $"../Feature"
@onready var texture_progress_bar = $TextureProgressBar

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	texture_progress_bar.value = hp
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	move_and_slide()
	if hp == 0:
		queue_free()
