class_name CanvasManager
extends Node

var layers : Dictionary[StringName, CanvasLayer] = {}

func _ready() -> void:
	for child in get_children():
		if child is CanvasLayer:
			layers[child.name] = child
		else:
			push_warning("Child node %s is incompatible with Canvas Manager %s" % [child.name, get_path()])

func push_content_to_layer(layer : StringName, content : Control) -> void:
	var layer_node := _get_layer(layer)
	if layer_node:
		_push_content_to_layer(layer_node, content)

func set_layer_content(layer : StringName, content : Control) -> void:
	var layer_node := _get_layer(layer)
	if layer_node:
		for child in layer_node.get_children():
			child.queue_free()
		_push_content_to_layer(layer_node, content)

func _push_content_to_layer(layer : CanvasLayer, content : CanvasItem) -> void:
	assert(not content.is_inside_tree())
	layer.add_child(content)

func _get_layer(layer_name : StringName) -> CanvasLayer:
	var layer : CanvasLayer = layers.get(layer_name)
	if layer == null:
		push_error("Canvas Layer %s not found on Canvas Manager %s" % [layer_name, get_path()])
	return layer
