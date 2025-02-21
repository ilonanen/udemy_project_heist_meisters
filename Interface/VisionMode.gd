extends CanvasModulate

const DARK = Color("141414")
const NIGHTVISION = Color("3caf61")

var cooldown = false

func _ready():
	visible = true
	color = DARK

	
func cycle_vision_mode():
	if not cooldown:
		if color == NIGHTVISION:
			DARK_mode()
		else:
			NIGHTVISION_mode()
		cooldown = true
		$Timer.start()

func DARK_mode():
	color = DARK
	$AudioStreamPlayer2D.stream = load("res://SFX/nightvision_off.wav")
	$AudioStreamPlayer2D.play()
	get_tree().call_group("lights", "show")
	get_tree().call_group("labels", "hide")


func NIGHTVISION_mode():
	color = NIGHTVISION
	$AudioStreamPlayer2D.stream = load("res://SFX/nightvision.wav")
	$AudioStreamPlayer2D.play()
	get_tree().call_group("lights", "hide")
	get_tree().call_group("labels", "show")


func _on_Timer_timeout():
	cooldown = false
