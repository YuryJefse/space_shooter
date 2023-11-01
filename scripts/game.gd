extends Node2D

@onready var player = $Player
@onready var ui = $HUD/UI
@onready var parallax_background = $ParallaxBackground

var parallax_speed = 300

var game_over_scene = preload("res://scenes/game_over_ui.tscn")

var player_points:int = 0
var player_lifes:int = 3

func _ready():
	player_points = 0
	player_lifes = 3
	
	ui.set_points(player_points)
	ui.set_lifes(player_lifes)
	
func _process(delta):
	parallax_background.offset.x -= parallax_speed * delta
	if(parallax_background.offset.x <= - get_viewport().get_window().size.x):
		parallax_background.offset.x = 0

func _on_spanw_container_spawn_enemy(enemy):
	enemy.connect("give_points", on_give_points)
	$Spanw_Container.add_child(enemy)

func on_give_points(point:int):
	player_points += point
	ui.set_points(player_points)


func _on_player_took_damage():
	player_lifes -= 1
	ui.set_lifes(player_lifes)
	if(player_lifes == 0):
		player.die()
		var game_over = game_over_scene.instantiate()
		await get_tree().create_timer(1.5).timeout
		game_over.set_points(player_points)
		ui.add_child(game_over)
