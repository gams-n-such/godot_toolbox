@abstract class_name PlayerCharacter3D
extends CharacterBody3D

func _process(delta: float) -> void:
	_process_camera(delta)

func _physics_process(delta: float) -> void:
	_process_gravity(delta)
	#_process_input(SPEED, ACCELERATION, DECELERATION)
	_process_velocity()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		Game.open_pause_menu()

#region Camera

@abstract func _process_camera(delta : float) -> void

#endregion

#region Movement

func _process_gravity(delta : float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

@abstract func _process_input(delta : float, speed : float, acceleration : float, deceleration : float) -> void

func _process_velocity() -> void:
	move_and_slide()

#endregion
