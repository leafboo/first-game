extends CharacterBody2D

@export var move_speed: float = 100




func _physics_process(_delta):
	#Get input direction
	var input_direction = Vector2 (
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)

	# Update velocity
	velocity = input_direction * move_speed
	
	if velocity == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("Idle")
	else:
		$AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationTree.set("parameters/Idle/blend_position", velocity)
		$AnimationTree.set("parameters/Walk/blend_position", velocity)
		# Move and Slice function uses velocity of character body to move character on map
		move_and_slide()
	
	
	
