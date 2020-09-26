extends Node2D


func _physics_process(delta):
	if $PlataformaIzq.linear_velocity.y >= 1 or $PlataformaIzq.linear_velocity.y <= -1:
		$PlataformaDer.set_sleeping(false)
		$PlataformaDer.linear_velocity.y = - ($PlataformaIzq.linear_velocity.y * 9.8)
	else:
		$PlataformaDer.set_sleeping(true)




