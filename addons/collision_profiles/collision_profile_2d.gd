class_name CollisionProfile2D
extends Resource

const PROFILE_SETTINGS = &"addons/collision_profiles/profiles_2d"

@export_category("Collision")
@export_flags_2d_physics var collision_layer
@export_flags_2d_physics var collision_mask

func apply_to_node(node : CollisionObject2D) -> void:
	node.collision_layer = collision_layer
	node.collision_mask = collision_mask

static func get_profiles_dictionary() -> Dictionary[StringName, CollisionProfile2D]:
	return ProjectSettings.get_setting(PROFILE_SETTINGS, {})

# TODO: autocompletion
static func from_settings(profile_name : StringName) -> CollisionProfile2D:
	return get_profiles_dictionary().get(profile_name, null)
