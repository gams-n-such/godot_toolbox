@abstract
class_name AttributeBase
extends Node

signal value_changed(attribute : Attribute, new_value : float, old_value : float)

var value : float:
	get:
		return _get_value()

@abstract func _get_value() -> float

# TODO: should modification be in base class??

@abstract func add(delta : float) -> void
