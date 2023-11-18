extends Node

signal single
signal double
signal triple

export var speed = 11.5
export var time_to_spawn = 1.2

var joker = false

var score = 1
var high_score = 0


var gold = 0



func _ready():
	 
	global.connect("single", self, 'single')
	global.connect("double", self, 'double')
	global.connect("triple", self, 'triple')


		
func _process(_delta):
	pass

func single():
	score += 1
	save_file.game_data.coins += 1
	gold += 1
func double():
	score += 2
	save_file.game_data.coins += 2
	gold += 2
func triple():
	score += 3
	save_file.game_data.coins += 3
	gold += 3
	
func reset():
	score = 0
	gold = 0
	save_file.game_data.lives = save_file.game_data.max_health
	global.speed = 11.5
	global.time_to_spawn = 1.2

