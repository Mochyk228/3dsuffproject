extends RigidBody3D

@export var target : Node3D
@export var offset : Vector3 = Vector3(0, 1, 3)
@export var move_speed : float = 8

@onready var camera_3d: Camera3D = $Camera3D

func _ready():
	remove_child(camera_3d)
	get_tree().root.add_child.call_deferred(camera_3d)

func _process(delta):
	camera_3d.global_transform.origin = target.global_transform.origin + offset #gets absoulute global position and just adds offset
	if global_position.y < -20 :
		get_tree().reload_current_scene()
	
func _physics_process(delta):
	var input = Input.get_vector("left", "right", "backward", "forward")
	var vec = Vector3(input.x, 0, -input.y) * move_speed
	apply_force(vec)
