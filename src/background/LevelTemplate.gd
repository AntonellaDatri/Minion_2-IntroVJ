extends Node2D

var cajas
var puedeLevitar = true

func _physics_process(delta):
	for caja in cajas:
		if puedeLevitar and caja.position.distance_to($Player.position) < 130 :
			caja.levitar()
		if caja.seleccionado and Input.is_action_pressed("impulsar_objeto"):
			caja.set_sleeping(false)
			caja.apply_central_impulse(- $Player.position.normalized())


		
		
func _ready():
	cajas = get_tree().get_nodes_in_group("cajas")


func cajas_levitando():
	print (puedeLevitar)
	puedeLevitar = false
	print (puedeLevitar)
