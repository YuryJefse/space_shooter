extends Node2D

@onready var player : CharacterBody2D = $Player
@onready var ui : Control = $HUD/UI
@onready var parallax_background : ParallaxBackground = $ParallaxBackground

var parallax_speed : int = 300

var game_over_scene : PackedScene = preload("res://scenes/game_over_ui.tscn")

var player_points : int = 0
var player_lifes : int = 3


func _ready()->void:
	player_points = 0
	player_lifes = 3
	
	ui.set_points(player_points)
	ui.set_lifes(player_lifes)

	
func _process(delta)->void:
	parallax_background.offset.x -= parallax_speed * delta
	if(parallax_background.offset.x <= - get_viewport().get_window().size.x):
		parallax_background.offset.x = 0


func _on_spanw_container_spawn_enemy(enemy:Area2D)->void:
	enemy.connect("give_points", on_give_points)
	$Spanw_Container.add_child(enemy)


func on_give_points(point:int)->void:
	$ExplodeSound.play()
	player_points += point
	ui.set_points(player_points)


func _on_player_took_damage()->void:
	player_lifes -= 1
	ui.set_lifes(player_lifes)
	if(player_lifes == 0):
		player.die()
		$LoseSound.play()
		var game_over:Node = game_over_scene.instantiate()
		await get_tree().create_timer(1.5).timeout
		game_over.set_points(player_points)
		ui.add_child(game_over)
