extends Node2D

@export var is_open: bool = false

@onready var door_sprite: Sprite2D = $DoorSprite
@onready var collision_shape: CollisionShape2D = $StaticBody2D/CollisionShape2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var player_entered = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func toggle_door():
	pass
	
func update_door_state():
	if 	is_open:
		collision_shape.disabled = true
		$DoorAnimation.play("open_door")
	else:
		collision_shape.disabled = false
		$DoorAnimation.play("close_door")


func _on_player_detector_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_entered = true
	

func _input(event: InputEvent) -> void:
	if player_entered and Input.is_action_just_pressed("interact"):
		is_open = !is_open
		update_door_state()
		print("Hello")

func _on_player_detector_body_exited(body: Node2D) -> void:
	player_entered = false
