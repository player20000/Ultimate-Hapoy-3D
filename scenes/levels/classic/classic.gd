extends Spatial

onready var camera: = $entity / player / camera
onready var camposition: = $entity / player / camposition
onready var transition: = $canvas / transition
onready var player: = $entity / player
onready var elk: = $entity / elk
onready var end: = $entity / end
var chengelevel:String

onready var clock: = $scenery / clock
onready var portal: = $entity / portal

onready var timer: = $timer
export  var time:int = 0

func _ready():
	camera.set_as_toplevel(true)
	camposition.set_as_toplevel(true)

func _process(_delta):
	camera.look_at(player.translation / 2, Vector3.UP)
	camposition.translation.x = player.translation.x / 2
	camposition.translation.y = player.translation.y + 5

	if time == 0:
		elk.win = true
		clock.text = str("You Win, go to portal")
		if portal.translation.y != 1.5:
			end.play("win")
	else :
		clock.text = str(time, " seconds left")

func die():
	transition.play("die")

func teleport():
	transition.play("teleport")

func _on_transition_animation_finished(anim_name):
	if anim_name == "die":
		get_tree().reload_current_scene()
	if anim_name == "teleport":
		save.clasic += 1
		get_tree().change_scene(chengelevel)

func _on_timer_timeout():
	if time != 0:time -= 1
