# TODO: some common interface with 3D volume?
class_name InteractionVolume2D
extends Area2D

## Called from the interacting entity
signal interaction_started
signal interaction_completed
signal interaction_aborted

@export var interaction_time : float = 2.0
