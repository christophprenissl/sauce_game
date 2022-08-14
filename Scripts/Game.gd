extends Node2D

onready var music_player_lvl1 = $"%MusicPlayerLvl1"
onready var music_player_lvl2 = $"%MusicPlayerLvl2"
onready var music_player_lvl3 = $"%MusicPlayerLvl3"

onready var eggs = $"%Eggs"
onready var dishes = $"%Dishes"
onready var saucer = $"%Saucer"
onready var chef = $"%Chef"
onready var chef_kills = $"%ChefKills"
onready var production_line = $"%ProductionLine"
onready var sauce_preview_board = $"%SaucePreviewBoard"
onready var mood_meter = $"%MoodMeter"
onready var score_board = $"%ScoreBoard"

export var sauce_color_a: Color = Color.white
export var sauce_color_s: Color = Color.white
export var sauce_color_d: Color = Color.white

export (Array, int) var speed_levels
export var seconds_till_speed_changes: int = 10

signal speed_set(value)

var time = 0
var speed_level = 0

var eggs_count = 3
var points = 0
var mood = 4
var max_mood = 9

var paused = false

func _ready():
	set_speed(speed_levels[speed_level])
	play_music(speed_level)
	score_board.set_score(0)

func _process(delta):
	if paused:
		return
		
	time += delta
	if time > seconds_till_speed_changes && speed_level < speed_levels.size()-1:
		speed_level += 1
		time = 0
		set_speed(speed_levels[speed_level])
		play_music(speed_level)
		
	var out = {"added_mood": 0, "points_gained": 0}
	if Input.is_action_just_pressed("sauce_a"):
		out = saucer.sauce(sauce_color_a,0)
		sauce_preview_board.sauce("a")
	if Input.is_action_just_pressed("sauce_s"):
		out = saucer.sauce(sauce_color_s,1)
		sauce_preview_board.sauce("s")
	if Input.is_action_just_pressed("sauce_d"):
		out = saucer.sauce(sauce_color_d,2)
		sauce_preview_board.sauce("d")
		
	if out != null:
		if mood > 0 && mood + out.added_mood <= max_mood:
			mood += out.added_mood
			mood_meter.set_mood(mood)
			set_chef_mood(mood)
		elif mood <= 0:
			remove_egg()
		points += out.points_gained
		score_board.set_score(points)
	

func set_chef_mood(value):
	if value < 3:
		chef.set_animation("angry")
	elif value > 7:
		chef.set_animation("happy")
	else:
		chef.set_animation("neutral")

func remove_egg():
	eggs_count -= 1
	eggs.set_eggs(eggs_count)
	break_egg()
	

func break_egg():
	chef_kills.visible = true
	chef_kills.play("break")
	paused = true
	dishes.pause_dishes()
	production_line.set_paused(true)

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
	emit_signal("speed_set", value)


func _on_without_sauce_served():
	mood -= 1
	mood_meter.set_mood(mood)
	set_chef_mood(mood)



func _on_ChefKills_animation_finished():
	chef_kills.set_frame(0)
	chef_kills.visible = false
	chef.play("neutral")
	paused = false
	dishes.start_dishes()
	production_line.set_paused(false)
	if eggs_count <= 0:
		get_tree().change_scene("res://Scenes/GameOverScreen.tscn")
	else:
		mood = 4
		mood_meter.set_mood(mood)
		set_chef_mood(mood)
