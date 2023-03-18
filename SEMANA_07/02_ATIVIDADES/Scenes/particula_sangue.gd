extends CPUParticles2D



func _on_Timer_timeout() -> void:
	set_process((false))
	set_physics_process(false)
	set_process_input(false)
	set_process_internal(false)
	set_process_unhandled_input(false)
	set_process_unhandled_key_input(false)


func _on_sumir_timeout():
	queue_free()
	pass # Replace with function body.
