class_name JamUtils

# Add constant names here
#region Globals

# Groups:
const group_player := &"Player"
const group_damageable := &"Damageable"
const group_interactable := &"Interactable"

# Common node names:
const nodepath_health := "Health"

#endregion

#region Nodes

static func find_parent_in_group(child_node : Node, group : StringName) -> Node:
	if not child_node:
		return null
	while child_node:
		if child_node.is_in_group(group):
			return child_node
		child_node = child_node.get_parent()
	return null

#endregion

#region Damage

static func get_damageable_from(child_node : Node) -> Node:
	return find_parent_in_group(child_node, group_damageable)

static func get_health_from(child_node : Node) -> Attribute:
	var damageable := get_damageable_from(child_node)
	if not damageable:
		push_warning("Node " + str(child_node) + " is not a child of a Damageable node!")
		return null
	var health := damageable.get_node(nodepath_health) as Attribute
	if not health:
		push_error("Health not found on Damageable node " + str(damageable))
		return null
	return health

static func deal_damage(target : Node, damage : float) -> bool:
	var health := get_health_from(target)
	if not health:
		return false
	if health.value <= 0.0:
		return false
	health.add_instant(-damage)
	return true

#endregion

#region Interactions

# TODO: unify 2D/3D interactions

static func get_interactable_3d_from(child_node : Node) -> InteractionVolume3D:
	var interactable := find_parent_in_group(child_node, group_interactable)
	if not interactable:
		push_warning("Node " + str(child_node) + " is not a child of an Interactable node!")
		return null
	var trigger := interactable as InteractionVolume3D
	if not trigger:
		push_error("Intaractable node " + str(interactable) + " is not an InteractionTrigger")
		return null
	return trigger

static func get_interactable_2d_from(child_node : Node) -> InteractionVolume2D:
	var interactable := find_parent_in_group(child_node, group_interactable)
	if not interactable:
		push_warning("Node " + str(child_node) + " is not a child of an Interactable node!")
		return null
	var trigger := interactable as InteractionVolume2D
	if not trigger:
		push_error("Intaractable node " + str(interactable) + " is not an InteractionTrigger")
		return null
	return trigger

#endregion
