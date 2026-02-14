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

#region Pause

var _active_pause_menu : Control

func open_pause_menu() -> void:
	assert(not _active_pause_menu)
	_active_pause_menu = pause_menu_scene.instantiate() as Control
	canvas_manager.push_content_to_layer(JamUtils.layer_ui_menu, _active_pause_menu)

func pause() -> void:
	get_tree().paused = true

func unpause() -> void:
	get_tree().paused = false

#endregion

#region Game

func start_game() -> void:
	load_gameplay_scene()

func quit_to_title() -> void:
	load_title_scene()

func quit_to_desktop() -> void:
	get_tree().quit()

#endregion

#region Scenes

@export_category("Scenes")
@export var title_scene : PackedScene
@export var gameplay_scene : PackedScene
@export var pause_menu_scene : PackedScene

func load_title_scene() -> void:
	load_level(title_scene)

func load_gameplay_scene() -> void:
	load_level(gameplay_scene)

func load_level(level_scene : PackedScene) -> void:
	if level_scene:
		pre_level_change()
		get_tree().change_scene_to_packed(level_scene)
		post_level_change()
	else:
		push_error("Trying to load empty level")

func pre_level_change() -> void:
	canvas_manager.clear_layer(JamUtils.layer_ui_menu)
	free_transient_scenes()

func post_level_change() -> void:
	pass

#endregion

#region UI

# TODO: this shall not work in split-scren = cannot make it an autoload
var canvas_manager : CanvasManager = null

#endregion

#region Transients
# TODO: move to separate script
# TODO: support non-Node objects?

# These will be deleted when changing scenes
# TODO: optimize by making it a dictionary?
var transient_scenes : Array[Node]

func register_transient_scene(scene_instance : Node) -> void:
	assert(scene_instance)
	if not transient_scenes.has(scene_instance):
		transient_scenes.append(scene_instance)

func free_transient_scenes() -> void:
	for scene in transient_scenes:
		if is_instance_valid(scene):
			scene.queue_free()

#endregion
