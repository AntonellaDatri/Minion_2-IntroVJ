extends Node2D

var cajas
var hayCajasLevitando = false


func _ready():
	cajas = get_tree().get_nodes_in_group("cajas")


func _physics_process(delta):
	for caja in cajas:
		caja.playerPosition = $Player.position


func caja_levitando(caja):
	if hayCajasLevitando:
		for c in cajas:
			c.dejar_de_levitar()
	hayCajasLevitando = true


func caja_impulsada():
	hayCajasLevitando = false
