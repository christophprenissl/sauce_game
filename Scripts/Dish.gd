extends Area2D

onready var sauce1 = $"%Sauce1"
onready var sauce2 = $"%Sauce2"
onready var sauce3 = $"%Sauce3"

onready var sauce_indicator1 = $"%SauceIndicator1"
onready var sauce_indicator2 = $"%SauceIndicator2"
onready var sauce_indicator3 = $"%SauceIndicator3"

var colora: Color = Color.white
var colors: Color = Color.white
var colord: Color = Color.white

var sauce_indicators = [-1,-1,-1]

export var points_pos = 10
export var points_neg = 5
export var speed = 100
var paused = false

signal without_sauce_served

func _ready():
	sauce_indicator1.color = colora
	sauce_indicator2.color = colors
	sauce_indicator3.color = colord

func set_sauce_indicators(color1: Color, color2: Color, color3: Color, indicators):
	colora = color1
	colors = color2
	colord = color3
	sauce_indicators = indicators
	

func set_paused(value):
	paused = value

func _process(delta):
	if paused:
		return
	position.x += speed * delta
	
func _on_Dish_area_entered(area: Area2D):
	if area.collision_layer == 2:
		emit_signal("without_sauce_served")
		queue_free()


func add_sauce(sauce_color : Color, sauce_indicator: int):
	var points_gained = 0
	var added_mood = 0
	var out = {"added_mood": 0, "points_gained": 0}
	if !sauce1.visible:
		if sauce_indicators[0] == sauce_indicator:
			points_gained = points_pos
			added_mood = 1
		else:
			added_mood = -1
		sauce1.set_modulate(sauce_color)
		sauce1.set_visible(true)
		out = {"points_gained": points_gained, "added_mood": added_mood}
		return out
	
	if !sauce2.visible:
		if sauce_indicators[1] == sauce_indicator:
			points_gained = points_pos
			added_mood = 1
		else:
			added_mood = -1
		sauce2.set_modulate(sauce_color)
		sauce2.set_visible(true)
		out = {"points_gained": points_gained, "added_mood": added_mood}
		return out
		
	if !sauce3.visible:
		if sauce_indicators[2] == sauce_indicator:
			points_gained = points_pos
			added_mood = 1
		else:
			added_mood = -1
		sauce3.set_modulate(sauce_color)
		sauce3.set_visible(true)
		out = {"points_gained": points_gained, "added_mood": added_mood}
	return out


func _on_Dish_speed_set(value):
	speed = value
