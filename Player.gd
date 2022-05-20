extends RigidBody

export var rolling_force = 40

func _ready():
	$CameraRig.set_as_toplevel(true)

func _physics_process(delta):
	if Global.Playing:
		$CameraRig.global_transform.origin = global_transform.origin
	
		if Input.is_action_pressed("ui_up"):
			angular_velocity.x -= rolling_force * delta
		elif Input.is_action_pressed("ui_down"):
			angular_velocity.x += rolling_force * delta
		if Input.is_action_pressed("ui_left"):
			angular_velocity.z += rolling_force * delta
		elif Input.is_action_pressed("ui_right"):
			angular_velocity.z -= rolling_force * delta
