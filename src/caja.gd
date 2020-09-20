extends RigidBody2D
signal levitando2

var levitando


var contador = 0
var seleccionado = false

func levitar() :
	levitando = true


func _physics_process(delta):
	if levitando and contador < 100 and seleccionado:
	#	set_mode(1)
		apply_central_impulse(Vector2.UP*0.2)
		contador += 1
	if contador == 100:
		set_sleeping(true)
		contador += 1


func _on_Caja_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		seleccionado = true
		emit_signal("levitando2")
