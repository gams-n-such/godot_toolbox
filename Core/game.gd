# Register this as a global autoload
extends Node

@export_flags_3d_render var default_camera_layers 

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("debug_exit"):
		quit_to_desktop()
	elif event.is_action_pressed("debug_mouse"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if Input.mouse_mode != Input.MOUSE_MODE_CAPTURED else Input.MOUSE_MODE_VISIBLE

func start_game() -> void:
	load_gameplay_scene()

func quit_to_title() -> void:
	load_title_scene()

func quit_to_desktop() -> void:
	get_tree().quit()

#region Scenes

@export_category("Scenes")
@export var menu_scene : PackedScene
@export var gameplay_scene : PackedScene

func load_title_scene() -> void:
	get_tree().change_scene_to_packed(menu_scene)

func load_gameplay_scene() -> void:
	get_tree().change_scene_to_packed(gameplay_scene)

#endregion

#region UI

# TODO: this shall not work in split-scren
var canvas_manager : CanvasManager = null

#endregion
