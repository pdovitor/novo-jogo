extends Line2D

@onready var player: CharacterBody2D = %Player
var vec_start := Vector2.ZERO
var vec_fin := Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		vec_start = get_global_mouse_position()
		vec_fin = vec_start
		points[0] = vec_start

	if event is InputEventMouseMotion and Input.is_action_pressed("click"):
		vec_fin = get_global_mouse_position()
		points[1] = vec_fin

	if event.is_action_released("click"):
		if player: # Boa prática para evitar crashes se o player morrer ou sumir
			player.dir = (vec_start - vec_fin) * 2
