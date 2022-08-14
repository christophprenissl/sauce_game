extends Area2D

onready var base = $"%Base"
onready var sauce1 = $"%Sauce1"
onready var sauce2 = $"%Sauce2"
onready var sauce3 = $"%Sauce3"

onready var sauce_indicator1 = $"%SauceIndicator1"
onready var sauce_indicator2 = $"%SauceIndicator2"
onready var sauce_indicator3 = $"%SauceIndicator3"

var dish_type = 0
var sauce_indicators = [-1,-1,-1]

export var points_pos = 1
export var speed = 100
var paused = false

signal without_sauce_served

func _ready():
	sauce_indicator1.visible = true
	match(sauce_indicators[0]):
		0:
			sauce_indicator1.play("a")
		1:
			sauce_indicator1.play("s")
		2: 
			sauce_indicator1.play("d")
	
	match(dish_type):
		0:
			base.play("fries")
			match(sauce_indicators[0]):
				0:
					sauce1.play("fries_a")
				1:
					sauce1.play("fries_s")
				2:
					sauce1.play("fries_d")
		1:
			base.play("burger")
			match(sauce_indicators[0]):
				0:
					sauce1.play("burger_a")
				1:
					sauce1.play("burger_s")
				2:
					sauce1.play("burger_d")

func set_sauce_indicators(indicators):
	sauce_indicators = indicators
	

func set_paused(value):
	paused = value

func _process(delta):
	if paused:
		return
	position.x += speed * delta
	
func _on_Dish_area_entered(area: Area2D):
	if area.collision_layer == 2 && !sauce1.visible:
		emit_signal("without_sauce_served")
		queue_free()
	elif area.collision_layer == 2:
		queue_free()
	elif area.collision_layer == 1:
		queue_free()
		


func add_sauce(sauce_indicator: int):
	var points_gained = 0
	var added_mood = 0
	var out = {"added_mood": 0, "points_gained": 0}
	
	var animation = ""
	match(dish_type):
		0:
			animation = "fries_"
		1:
			animation = "burger_"
	
	match (sauce_indicator):
		0:
			animation += "a"
		1:
			animation += "s"
		2:
			animation += "d"
			
	
	if !sauce1.visible:
		if sauce_indicators[0] == sauce_indicator:
			points_gained = points_pos
			added_mood = 1
		else:
			added_mood = -2
		sauce1.set_visible(true)
		sauce1.play(animation)
		out = {"points_gained": points_gained, "added_mood": added_mood}
		return out
	
	if !sauce2.visible:
		if sauce_indicators[1] == sauce_indicator:
			points_gained = points_pos
			added_mood = 1
		else:
			added_mood = -1
		sauce2.set_visible(true)
		sauce2.play(animation)
		out = {"points_gained": points_gained, "added_mood": added_mood}
		return out
		
	if !sauce3.visible:
		if sauce_indicators[2] == sauce_indicator:
			points_gained = points_pos
			added_mood = 1
		else:
			added_mood = -1
		sauce3.set_visible(true)
		sauce3.play(animation)
		out = {"points_gained": points_gained, "added_mood": added_mood}
	return out

func set_dish_type(value):
	dish_type = value

func _on_Dish_speed_set(value):
	speed = value
