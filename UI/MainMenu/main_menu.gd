extends Control


func _ready() -> void:
	pass

func _on_play_button_pressed() -> void:
	Game.start_game()

@export var credits_scene : PackedScene

func _on_credits_button_pressed() -> void:
	push_warning("Credits are not yet implemented")

func _on_quit_button_pressed() -> void:
	Game.quit_to_desktop()

#region JamToolbox

@export var gym_scene_3d : PackedScene

func _on_gym_3d_button_pressed() -> void:
	Game.load_level(gym_scene_3d)

@export var gym_scene_2d : PackedScene

func _on_gym_2d_button_pressed() -> void:
	Game.load_level(gym_scene_2d)

#endregion
