extends Node2D


func pause_dishes():
	for dish in get_children():
		dish.set_paused(true)
		
func start_dishes():
	for dish in get_children():
		dish.set_paused(false)
