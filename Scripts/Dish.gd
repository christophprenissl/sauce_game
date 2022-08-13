extends Area2D

onready var sauce = $"%Sauce"
export var speed = 100

func _process(delta):
	position.x += speed * delta
	
func _on_Dish_area_entered(area: Area2D):
	if area.collision_layer == 2:
		queue_free()


func add_sauce():
	sauce.set_visible(true)
