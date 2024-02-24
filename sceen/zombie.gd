extends CharacterBody2D

var speed = 50
var player_chase = false
var player: CharacterBody2D = null
var attack_player = null
var attack_count = 0

func _physics_process(delta):
	print(player_chase)
	if player_chase:
		position += (player.position - position)/speed
		print(position)
	if not attack_player == null and attack_count >= 2:
		attack_player.hp -= 5
		attack_count = 0
	attack_count+=delta

func _on_area_2d_body_entered(body):
	player = body
	player_chase = true


func _on_area_2d_body_exited(body):
	player = null
	player_chase = false


func _on_area_2d_2_body_entered(body):
	if body.name == "Player":
		attack_player = body
