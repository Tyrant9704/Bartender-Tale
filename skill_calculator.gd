extends Node

var scores = [1, 1, 1, 1, 1]
var new_score

func _ready():
	pass
	
func _process(delta):
	new_score = global.score
	if Input.is_action_just_pressed("ui_accept"):
		scores.append(new_score)
		remove_first()
		get_avarage_score()
		print(scores)
		print(get_avarage_score())
	
func remove_first():
	scores.remove(0)
	
func get_avarage_score():
	var avarage = 0
	
	for score in scores:
		avarage += score
	
	return avarage / scores.size()
	
func skill_calculator():
	var easy
	var easy_mid
	var mid
	var hard
	var asian
	
	
		

