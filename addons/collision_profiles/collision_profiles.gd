@tool
extends EditorPlugin

var inspector_script = preload("res://addons/collision_profiles/inspector/collision_profile_inspector.gd")
var inspector_plugin

func _enter_tree() -> void:
	inspector_plugin = inspector_script.new()
	add_inspector_plugin(inspector_plugin)
	_load_or_add_settings()

func _exit_tree() -> void:
	remove_inspector_plugin(inspector_plugin)
	pass


func _load_or_add_settings() -> void:
	const PROJECT_SETTING_TEST = "addons/collision_profiles/test"
	ProjectSettings.set(PROJECT_SETTING_TEST, 0)
	var test_property_info = {
		"name": PROJECT_SETTING_TEST,
		"type": TYPE_DICTIONARY,
		"hint": PROPERTY_HINT_DICTIONARY_TYPE,
		"hint_string": "%d:;%d:" % [TYPE_STRING, TYPE_INT]
	}
	ProjectSettings.add_property_info(test_property_info)
	
	#if not ProjectSettings.has_setting(CollisionProfile3D.PROFILE_SETTINGS):
		#ProjectSettings.set_setting(CollisionProfile3D.PROFILE_SETTINGS, {})
	#ProjectSettings.add_property_info({
		#"name": CollisionProfile3D.PROFILE_SETTINGS,
		#"type": TYPE_DICTIONARY,
		#"hint": PROPERTY_HINT_DICTIONARY_TYPE,
		#"hint_string": "%d:;%d/%d:%s" % [TYPE_STRING_NAME, TYPE_OBJECT, PROPERTY_HINT_RESOURCE_TYPE, "CollisionProfile3D"]
	#})
	
	#if not ProjectSettings.has_setting(CollisionProfile2D.PROFILE_SETTINGS):
		#ProjectSettings.set_setting(CollisionProfile2D.PROFILE_SETTINGS, {})
	#ProjectSettings.add_property_info({
		#"name": CollisionProfile2D.PROFILE_SETTINGS,
		#"type": TYPE_DICTIONARY,
		#"hint": PROPERTY_HINT_DICTIONARY_TYPE,
		#"hint_string": "%d:;%d/%d:%s" % [TYPE_STRING_NAME, TYPE_OBJECT, PROPERTY_HINT_RESOURCE_TYPE, "CollisionProfile2D"]
	#})
	
	#if not ProjectSettings.has_setting(CollisionProfile2D.PROFILE_SETTINGS):
		#ProjectSettings.set_setting(CollisionProfile2D.PROFILE_SETTINGS, {})
	#ProjectSettings.add_property_info({
		#"name": CollisionProfile2D.PROFILE_SETTINGS,
		#"type": TYPE_DICTIONARY,
		#"hint": PROPERTY_HINT_DICTIONARY_TYPE,
		#"hint_string": "%d:;%d/%d:%s" % [TYPE_STRING_NAME, TYPE_OBJECT, PROPERTY_HINT_RESOURCE_TYPE, "CollisionProfile2D"]
	#})
