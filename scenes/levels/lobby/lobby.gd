extends Spatial

onready var look = $look
onready var camera = $camera
onready var player = $player

func _process(_delta):
	camera.look_at(player.translation / 2, Vector3.UP)

	look.translation.x = player.translation.x / 2
	look.translation.y = player.translation.y + 6
