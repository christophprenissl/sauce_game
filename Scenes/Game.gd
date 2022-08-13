extends Node2D

onready var music_player_lvl1 = $"%MusicPlayerLvl1"
onready var music_player_lvl2 = $"%MusicPlayerLvl2"
onready var music_player_lvl3 = $"%MusicPlayerLvl3"

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

var points = 0
var angry_level = 0

func _ready():
	set_speed(speed_levels[speed_level])
	play_music(speed_level)

func _process(delta):
	time += delta
	if time > seconds_till_speed_changes && speed_level < speed_levels.size()-1:
		speed_level += 1
		time = 0
		set_speed(speed_levels[speed_level])
		play_music(speed_level)
		
	
	if Input.is_action_just_pressed("sauce_a"):
		points += saucer.sauce(sauce_color_a,0)
		sauce_preview_board.sauce("a")
	if Input.is_action_just_pressed("sauce_s"):
		points += saucer.sauce(sauce_color_s,1)
		sauce_preview_board.sauce("s")
	if Input.is_action_just_pressed("sauce_d"):
		points += saucer.sauce(sauce_color_d,2)
		sauce_preview_board.sauce("d")
		print(points)
	

func play_music(lvl):
	
	match(lvl):
		0:
			music_player_lvl1.play()
			music_player_lvl2.stop()
			music_player_lvl3.stop()
		1:
			music_player_lvl2.play()
			music_player_lvl1.stop()
			music_player_lvl3.stop()
		2:
			music_player_lvl3.play()
			music_player_lvl1.stop()
			music_player_lvl2.stop()

func set_speed(value: int):
	production_line.speed = value
