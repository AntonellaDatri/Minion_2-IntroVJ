extends RigidBody2D



var otra_plataforma
onready var peso = -mass * weight

func start(plataforma):
	otra_plataforma = plataforma

func _ready():
	set_applied_force(Vector2(0, peso))

func _physics_process(delta):
	var fuerza = peso
	for body in get_colliding_bodies():
		if body.is_in_group("caja"):
			fuerza += -body.peso
	otra_plataforma.set_applied_force(Vector2(0, fuerza))
	if applied_force == otra_plataforma.applied_force:
		set_linear_velocity(Vector2(0,0))

func _integrate_forces(state):
	pass

