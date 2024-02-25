extends Node

const ZOMBIE = preload("res://sceen/zombie.tscn")
var v_pos = Vector2(0,0)
var zb_count = 0
var max_zb = 20
var rand_pos = 0
@onready var player = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

var count = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	count += delta
	if count >= 1 and not zb_count >= max_zb:
		rand_pos = randi()%4
		if rand_pos == 0:
			v_pos = player.position*2
		elif rand_pos == 1:
			v_pos = player.position/4
		elif rand_pos == 2:
			v_pos = Vector2(player.position.x/4, player.position.x*2)
		elif rand_pos == 3:
			v_pos = Vector2(player.position.x*2, player.position.x/4)
		clone(v_pos)
		count = 0
		zb_count+=1

func clone(pos):
	var zombie_instantiate = ZOMBIE.instantiate()
	zombie_instantiate.position = pos
	add_child(zombie_instantiate)
