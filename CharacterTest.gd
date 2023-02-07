extends Node2D


export var speed:int = 100
const base_speed = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var movex = 0.0
	var movey = 0.0
	
	if Input.is_action_pressed("ui_left"):  movex = -1.0
	if Input.is_action_pressed("ui_right"): movex = 1.0
	if Input.is_action_pressed("ui_up"):    movey = -1.0
	if Input.is_action_pressed("ui_down"):  movey = 1.0
	
	if movex or movey:
		$Character/AnimationPlayer.play("Walk")
		if movex < 0:
			$Character.scale.x = -0.5
		else:
			$Character.scale.x = 0.5
		$Character/AnimationPlayer.playback_speed = speed / base_speed
		
	else:
		$Character/AnimationPlayer.play("Idle")
		$Character/AnimationPlayer.playback_speed = 1.0
		
	var movement = Vector2(movex, movey)
	
	$Character.position += movement * speed * delta
	pass
