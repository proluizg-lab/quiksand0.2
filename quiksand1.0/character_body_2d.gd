extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		$AnimatedSprite2D.play("pulo")
		velocity.y = JUMP_VELOCITY
		

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		$AnimatedSprite2D.play("default")
		velocity.x = direction * SPEED
	else:
		$AnimatedSprite2D.stop()
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
