extends AnimatedSprite

onready var game = $".."
onready var dish = load("res://GameObjects/Dish.tscn")
onready var production_area = $"ProductionArea"

func _process(delta):
	var rand_num = randi() % 100
	
	if rand_num == 0 && production_area.get_overlapping_areas().size() == 0:
		var production_pos = production_area.global_position
		var dish_instance = dish.instance()
		game.add_child(dish_instance)
		dish_instance.global_position = production_pos
	
