class_name Activatable
extends Node

signal activation_started(object : Activatable, actor : Node)
signal activation_complete(object : Activatable, actor : Node)
signal activation_aborted(object : Activatable, actor : Node)

# TODO: implement prolonged activation
@export var activation_period : float = 1.0

func is_instant() -> bool:
	return activation_period <= 0.0

var _current_actor : Node = null

# TODO: parallel activations
#@export var allow_parallel_activations : bool = false

func activate(actor : Node) -> bool:
	# TODO: implement
	if not can_be_activated_by(actor):
		return false
	_current_actor = actor
	activation_started.emit(self, actor)
	if not is_instant():
		await get_tree().create_timer(activation_period).timeout
		if not is_being_activated_by(actor):
			return false
	return _try_complete_activation(actor)

func abort_activation(actor : Node) -> bool:
	if not is_being_activated_by(actor):
		return false
	_current_actor = null
	activation_aborted.emit(self, actor)
	return true

func _try_complete_activation(actor : Node) -> bool:
	if not is_being_activated_by(actor):
		return false
	_current_actor = null
	activation_complete.emit(self, actor)
	return true

func can_be_activated_by(actor : Node) -> bool:
	if not actor:
		return false
	if is_being_activated_by(actor):
		return false
	if not is_instant() and is_being_activated():
		return false
	return true

func is_being_activated() -> bool:
	return _current_actor != null

func is_being_activated_by(actor : Node) -> bool:
	return _current_actor == actor
