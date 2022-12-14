extends AnimatedSprite

export var spawn_rate = 0

var speed = 0
var startDelayInSecs = 10
var time = 0
onready var game = $".."
onready var dishes = $"%Dishes"
onready var dish = load("res://GameObjects/Dish.tscn")
onready var production_area = $"ProductionArea"

var paused = false

func _process(delta):
	time += delta
	if time < startDelayInSecs:
		return
	if paused:
		return
		
	update_speed_scale()
	var rand_num = randi() % spawn_rate
	
	if rand_num == 0 && production_area.get_overlapping_areas().size() == 0:
		var production_pos = production_area.global_position
		var dish_instance = dish.instance()
		
		var rand_dish = randi() % 2
		dish_instance.set_dish_type(rand_dish)
		
		dish_instance.connect("without_sauce_served", game, "_on_without_sauce_served")
		game.connect("speed_set", dish_instance, "_on_Dish_speed_set")
		
		var rand_type = randi() % 3
		var indicators = [-1,-1,-1]
		indicators[0] = rand_type
		dish_instance.set_sauce_indicators(indicators)
		
		dish_instance.speed = speed
		dishes.add_child(dish_instance)
		dish_instance.global_position = production_pos
	

func set_paused(value):
	paused = value

func update_speed_scale():
	speed_scale = 0.008 * speed
