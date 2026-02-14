# TODO: some common interface with 2D volume?
class_name InteractionVolume3D
extends Area3D

## Called from the interacting entity
signal interaction_started
signal interaction_completed
signal interaction_aborted

@export var interaction_time : float = 2.0
