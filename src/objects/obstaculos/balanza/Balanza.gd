extends Node2D

var collitionIzq = []
export var peso_agregado_izq = 0
var peso_agregado_der = 0


func _physics_process(delta):
	quitar_peso_a_der()
	agregar_peso_a_der()
	#quitar_peso_a_izq()
	#agregar_peso_a_izq()
	print("var", peso_agregado_izq)
	#print ("peso",$PlataformaDer.weight)


func quitar_peso_a_der():
	if peso_agregado_izq > 0:
		$PlataformaDer.weight -= 10
		peso_agregado_izq -= 10
#		print("sacando peso a der")

func agregar_peso_a_der():
	if peso_agregado_izq < 0:
		$PlataformaDer.weight += 10
		print($PlataformaDer.weight)
		peso_agregado_izq += 10
#		print("agregando peso a der")
		

func quitar_peso_a_izq():
	if peso_agregado_der > 0:
		$PlataformaDer.weight -= 1
		peso_agregado_der -= 1
#		print("sacando peso a izq")
	
func agregar_peso_a_izq():
	if peso_agregado_der < 0:
		$PlataformaDer.weight += 1
		peso_agregado_der += 1
#		print("agregando peso a izq")
		

	
func _on_PlataformaIzq_body_entered(body):
	peso_agregado_izq += $PlataformaDer.get_weight()

func _on_PlataformaIzq_body_exited(body):
	peso_agregado_izq -= $PlataformaDer.get_weight()

func _on_PlataformaDer_body_entered(body):
	peso_agregado_der += $PlataformaIzq.get_weight()

func _on_PlataformaDer_body_exited(body):
	peso_agregado_der -= $PlataformaIzq.get_weight()
