extends Node2D

onready var saucer = $"%Saucer"
onready var production_line = $"%ProductionLine"
onready var sauce_preview_board = $"%SaucePreviewBoard"

export var sauce_color_a: Color = Color.white
export var sauce_color_s: Color = Color.white
export var sauce_color_d: Color = Color.white

export (Array, int) var speed_levels
export var seconds_till_speed_changes: int = 10

var time = 0
var speed_level = 0

func _ready():
	set_speed(speed_levels[speed_level])

func _process(delta):
	time += delta
	if time > seconds_till_speed_changes && speed_level < speed_levels.size()-1:
		speed_level += 1
		time = 0
		set_speed(speed_levels[speed_level])
		
	
	if Input.is_action_just_pressed("sauce_a"):
		saucer.sauce(sauce_color_a)
		sauce_preview_board.sauce("a")
	if Input.is_action_just_pressed("sauce_s"):
		saucer.sauce(sauce_color_s)
		sauce_preview_board.sauce("s")
	if Input.is_action_just_pressed("sauce_d"):
		saucer.sauce(sauce_color_d)
		sauce_preview_board.sauce("d")
	

func set_speed(value: int):
	production_line.speed = value
