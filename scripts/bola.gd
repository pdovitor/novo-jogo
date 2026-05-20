extends CharacterBody2D

# O atrito determina quão rápido a bola vai parar. 
# Valores maiores fazem ela parar mais rápido (tipo uma bola de boliche no tapete).
@export var atrito : float = 150.0

func _physics_process(delta: float) -> void:
	# 1. Aplica o atrito para reduzir a velocidade gradualmente em direção a zero
	velocity = velocity.move_toward(Vector2.ZERO, atrito * delta)
	
	# 2. Move a bola e checa por colisões
	var col : KinematicCollision2D = move_and_collide(velocity * delta)
	
	if col:
		var normal := col.get_normal()
		velocity = velocity.bounce(normal)
		
		# Se bater no Player, absorve o impacto
		if col.get_collider() is RigidBody2D:
			var player_body = col.get_collider()
			var velocidade_player = player_body.linear_velocity
			
			# Adiciona a força do impacto
			velocity += velocidade_player
			
			# LIMITAÇÃO: Define uma velocidade máxima (ex: 600) para a bola não virar um torpedo
			var velocidade_maxima = 700.0
			velocity = velocity.limit_length(velocidade_maxima)
