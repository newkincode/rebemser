extends CharacterBody2D

var speed = 50
var player_chase = false
var player: CharacterBody2D = null
var attack_player = null
var attack_count = 0
var hp = 100
@onready var texture_progress_bar = $TextureProgressBar

func _physics_process(delta):
	print(player_chase)
	if player_chase:
		position += ((player.position - position)/speed)
		print(position)
	if not attack_player == null and attack_count >= 2:
		attack_player.hp -= 5
		attack_count = 0
		hp -= 10
	attack_count+=delta
	if hp == 0:
		queue_free()
	texture_progress_bar.value = hp

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		player = body
		player_chase = true


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		player = null
		player_chase = false


func _on_area_2d_2_body_entered(body):
	if body.name == "Player":
		attack_player = body
