extends AnimatedSprite

onready var game = $".."
onready var dish = load("res://GameObjects/Dish.tscn")
onready var production_point = $"%ProductionPoint"

func _process(delta):
	var rand_num = randi() % 100
	
	if rand_num == 0:
		var production_pos = production_point.global_position
		var dish_instance = dish.instance()
		game.add_child(dish_instance)
		dish_instance.global_position = production_pos
	
