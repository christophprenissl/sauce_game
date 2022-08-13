extends Area2D

onready var sauce1 = $"%Sauce1"
onready var sauce2 = $"%Sauce2"
onready var sauce3 = $"%Sauce3"

export var speed = 100

func _process(delta):
	position.x += speed * delta
	
func _on_Dish_area_entered(area: Area2D):
	if area.collision_layer == 2:
		queue_free()


func add_sauce(sauce_color : Color):
	if !sauce1.visible:
		sauce1.set_modulate(sauce_color)
		sauce1.set_visible(true)
		return
	
	if !sauce2.visible:
		sauce2.set_modulate(sauce_color)
		sauce2.set_visible(true)
		return
		
	if !sauce3.visible:
		sauce3.set_modulate(sauce_color)
		sauce3.set_visible(true)
