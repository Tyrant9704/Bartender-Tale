extends MarginContainer

func _ready():
	pass
	
func _process(delta):
	$VBoxContainer/upper_part/CenterContainer/gold_label.text = var2str(save_file.game_data.coins)
	$VBoxContainer/skills_row_1/tempo/CenterContainer/HBoxContainer/amount/amount
