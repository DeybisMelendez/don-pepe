extends KinematicBody2D
var dir = {
	abajo = Vector2(0,1),
	arriba = Vector2(0,-1),
	derecha = Vector2(1,0),
	izquierda = Vector2(-1,0)
}
var raycastPos = {
	abajo = Vector2(8,16),
	arriba = Vector2(8,0),
	derecha = Vector2(16,8),
	izquierda = Vector2(0,8),
}
var mov = Vector2()
var stop = Vector2(0,0)
var vel = 50
var raycastDir = "izquierda"

func _physics_process(delta):
	var raycast = $RayCast2D.is_colliding()
	if raycast:
		match $RayCast2D.position:
			raycastPos.arriba:
				$RayCast2D.position = raycastPos.derecha
			raycastPos.derecha:
				$RayCast2D.position = raycastPos.abajo
			raycastPos.abajo:
				$RayCast2D.position = raycastPos.izquierda
			raycastPos.izquierda:
				$RayCast2D.position = raycastPos.arriba
	else:
		match $RayCast2D.position:
			raycastPos.arriba:
				mov = dir.arriba * vel
			raycastPos.derecha:
				mov = dir.derecha * vel
			raycastPos.abajo:
				mov = dir.abajo * vel
			raycastPos.izquierda:
				mov = dir.izquierda * vel
	mov = move_and_slide(mov)