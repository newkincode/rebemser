extends Node

const ZOMBIE = preload("res://sceen/zombie.tscn")
var v_pos = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

var count = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	count += delta
	if count >= 1:
		v_pos.x += 20
		clone(v_pos)
		count = 0

func clone(pos):
	var zombie_instantiate = ZOMBIE.instantiate()
	zombie_instantiate.position = pos
	# add_child(zombie_instantiate)
