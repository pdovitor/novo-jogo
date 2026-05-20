extends RigidBody2D

# No Godot 4, se você quer que o player pare aos poucos após o impulso,
# basta ajustar a propriedade "Linear > Damp" diretamente no Inspetor do nó para algo em torno de 1 a 3,
# eliminando a necessidade de fazer lerp manual de velocidade.

func lancar(impulso: Vector2) -> void:
	# Aplica uma força física imediata no centro do objeto
	apply_central_impulse(impulso)
