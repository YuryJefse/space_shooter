extends CharacterBody2D

@export var SPEED:int = 300.0
@onready var rocket_container = $RocketContainer

var can_i_shoot = true

var rocket_scene:PackedScene = preload("res://scenes/rocket.tscn")

func _physics_process(delta):
	velocity = Vector2.ZERO
	if(Input.is_action_pressed("down")):
		velocity.y += SPEED
	if(Input.is_action_pressed("up")):
		velocity.y -= SPEED
	if(Input.is_action_pressed("left")):
		velocity.x -= SPEED
	if(Input.is_action_pressed("rigt")):
		velocity.x += SPEED
	if(Input.is_key_pressed(KEY_SPACE) && can_i_shoot):
		create_rocket()
		
	move_and_slide()
	
	global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)
	
func create_rocket():
	can_i_shoot = false
	var rocket_instance = rocket_scene.instantiate()
	rocket_instance.global_position = Vector2(global_position.x + 30, global_position.y)
	rocket_container.add_child(rocket_instance)
	await get_tree().create_timer(0.20).timeout
	can_i_shoot = true
