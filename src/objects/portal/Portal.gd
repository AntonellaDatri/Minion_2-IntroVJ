extends Area2D
onready var anim_player: AnimationPlayer = $AnimationPlayer
export var next_scene: PackedScene

func _get_configuration_warning():
	return "The next scene propety can't be empty" if not next_scene else ""


func teleport():
	anim_player.play("Fade_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)

















#func _process(delta):
#	pass
