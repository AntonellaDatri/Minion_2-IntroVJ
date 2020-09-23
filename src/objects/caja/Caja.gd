extends RigidBody2D
signal levitando
signal impulsado


export var impulso = 0.55

var contador = 0

var seleccionado = false ##
var puedeLevitar = false
var playerPosition


func _physics_process(delta):
	puedeLevitar = is_position_player_less(150)
	elevarse()
	detenerse() 
	impulsar()
	


func elevarse():
	if contador < 100 and seleccionado:
		apply_central_impulse(Vector2.UP*impulso)
		contador += 1


func is_position_player_less(dist):
	return position.distance_to(playerPosition) < dist 


func detenerse():
	if contador == 100:
		set_sleeping(true)
		contador += 1 #incrementa en uno el contador asi no se ejecuta esta funcion mas de una vez


func _on_Caja_input_event(viewport, event, shape_idx):
	if !seleccionado:
		contador = 0
	if puedeLevitar and event.is_action_pressed("click"):
		emit_signal("levitando", self)
		seleccionado = true


func dejar_de_levitar():
	seleccionado = false
	set_sleeping(false)

func impulsar():
	if seleccionado and Input.is_action_pressed("impulsar_objeto"):
		emit_signal("impulsado")
		set_sleeping(false)
		seleccionado = false
		apply_central_impulse((position - playerPosition) * 0.11)
