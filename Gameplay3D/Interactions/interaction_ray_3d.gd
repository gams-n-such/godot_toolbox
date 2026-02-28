class_name InteractionRay3D
extends RayCast3D

# TODO: manage interactions here here
# TODO: Interaction accepter volume

signal target_changed(new_target : Node, old_target : Node)

var current_target : Node:
	get:
		return current_target
	set(new_target):
		var prev_target := current_target
		current_target = new_target
		target_changed.emit(new_target)

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if not is_colliding():
		return
	var target := get_collider() as Node
	if current_target != target:
		current_target = target
