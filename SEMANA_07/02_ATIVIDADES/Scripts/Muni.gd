extends Sprite

var mov = Vector2(1,0)
var velocidade = 2000
var dir_unica = true

func _process(delta: float) -> void:
	if dir_unica:
		look_at(get_global_mouse_position())
		mov = get_global_mouse_position()-Global.player_pos
		dir_unica = false
		mov = mov.normalized().rotated(Global.angle2)
	global_position += mov * velocidade * delta
	#if Input.is_action_just_pressed("atirar"):
	#	print(Vector2(1,0).angle_to(mov),Vector2(1,0).angle_to(mov.rotated(angle)))
	


func _on_VisibilityNotifier2D_screen_exited():
		queue_free()
