extends Spatial

signal health

var client_human = load ("res://assets2/clients/Client_human.tscn")
var client_elf = load('res://assets2/clients/Client_elf.tscn')
var client_goblin =load('res://assets2/clients/Client_goblin.tscn')
var client_dwarf = load('res://assets2/clients//Client_dwarf.tscn')

onready var spawn_time = get_node("Spawn_Time")
var tts = global.time_to_spawn

func _ready():
	
	$music.play()
	randomize()
	
	if save_file.game_data.tutorial == 0:
		_tutorial()
	if save_file.game_data.tutorial == 1:
		_gameplay()
			
	
func _gameplay():
	
	spawn_time.start()
	$Spawn_Time.wait_time = tts
	
func _tutorial():
	var client_1 = client_human.instance()
	var client_2 = client_elf.instance()
	var client_3 = client_goblin.instance()
	var client_4 = client_dwarf.instance()
	
	yield(get_tree().create_timer(4),"timeout")
	global.speed = 10
	add_child(client_1)
	client_1.transform.origin = $spawn_1.transform.origin
	$hud/AnimationPlayer.play("human_select")
	yield(get_tree().create_timer(3),"timeout")
	$hud/AnimationPlayer.stop()
	add_child(client_3)
	client_3.transform.origin = $spawn_1.transform.origin
	$hud/AnimationPlayer.play("goblin_select")
	yield(get_tree().create_timer(3),"timeout")
	$hud/AnimationPlayer.stop()
	add_child(client_4)
	client_4.transform.origin = $spawn_1.transform.origin
	$hud/AnimationPlayer.play("dwarf_select")
	yield(get_tree().create_timer(3),"timeout")
	$hud/AnimationPlayer.stop()
	add_child(client_2)
	client_2.transform.origin = $spawn_3.transform.origin
	$hud/AnimationPlayer.play("left_button")
	yield(get_tree().create_timer(3),"timeout")
	$hud/AnimationPlayer.stop()
	_gameplay()
	global.speed = 11.5
	save_file.game_data.tutorial = 1	

	

func _process(_delta):
	pass
	
	
func _on_Spawn_Time_timeout():
	var client_1 = client_human.instance()
	var client_2 = client_elf.instance()
	var client_3 = client_goblin.instance()
	var client_4 = client_dwarf.instance()
	
	var clients = [client_1, client_2, client_3, client_4]
	var client = clients[rand_range(0,4)]
	var spawn_points = [$spawn_1, $spawn_2, $spawn_3]
	var spawn = spawn_points[rand_range(0,3)]
	
	add_child(client)
	client.transform.origin = spawn.transform.origin
	
	tts -= 0.020
	
	if tts <= 0.2:
		tts = 0.2

	global.speed += 0.1
	


func _on_Area_body_entered(body):
	emit_signal('health')
	save_file.game_data.lives -= 1
	body.queue_free()
	global.time_to_spawn += 0.35
	global.speed -= 0.5
	if save_file.game_data.lives <=0:
		give_up()
			

func give_up():
	get_tree().change_scene("res://scripts/GameOverScreen.tscn")
	save_file.game_data.lives = save_file.game_data.max_health
	global.reset()
	queue_free()
