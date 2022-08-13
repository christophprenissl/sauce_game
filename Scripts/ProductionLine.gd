extends AnimatedSprite

export var spawn_rate = 100
export var speed = 100

onready var game = $".."
onready var dish = load("res://GameObjects/Dish.tscn")
onready var production_area = $"ProductionArea"

func _process(delta):
	update_speed_scale()
	var rand_num = randi() % spawn_rate
	
	if rand_num == 0 && production_area.get_overlapping_areas().size() == 0:
		var production_pos = production_area.global_position
		var dish_instance = dish.instance()
		dish_instance.speed = speed
		game.add_child(dish_instance)
		dish_instance.global_position = production_pos
	


func update_speed_scale():
	speed_scale = 0.008 * speed
