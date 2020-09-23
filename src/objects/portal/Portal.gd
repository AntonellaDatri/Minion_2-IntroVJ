extends Area2D
onready var anim_player = $AnimationPlayer
export var next_scene: PackedScene
var puede_teletransportarse = false

func _get_configuration_warning(): 
	return "The next scene propety can't be empty" if not next_scene else ""


func _physics_process(delta):
	if puede_teletransportarse and Input.is_action_just_pressed("pasar_de_nivel"):
		teleport()


func teleport():
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)


func _on_body_entered(body):
	if body.is_in_group("player"):
		puede_teletransportarse = true


func _on_body_exited(body):
	if body.is_in_group("player"):
		puede_teletransportarse = false
