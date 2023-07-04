extends KinematicBody

onready var sprite := $sprite
onready var animation := $animation
var velocity := Vector3()

var run = 8
var maxsimum = 32
var slowdown = 4

var weight = 6
var bounce = 48

func _physics_process(delta):
	if Input.is_action_pressed("bounce") and is_on_floor():
		animation.play("bounce")
		velocity.y = bounce
	if not is_on_floor():
		velocity.y -= weight

	if Input.is_action_pressed("left") and velocity.x > -maxsimum:
		velocity.x -= run
		sprite.flip_h = true
	elif Input.is_action_pressed("right") and velocity.x < maxsimum:
		velocity.x += run
		sprite.flip_h = false
	else:
		velocity.x -= velocity.x / slowdown

	velocity = move_and_slide(velocity, Vector3.UP)
