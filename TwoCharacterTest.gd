extends Node2D

export var speed:int = 100
const base_speed = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	$Character2.scale.x = -0.5
	pass # Replace with function body.

func move_character1(delta:float):
	var movex = 0.0
	var movey = 0.0
	
	if Input.is_action_pressed("alt_left"):  movex = -1.0
	if Input.is_action_pressed("alt_right"): movex = 1.0
	if Input.is_action_pressed("alt_up"):    movey = -1.0
	if Input.is_action_pressed("alt_down"):  movey = 1.0
	
	if movex or movey:
		$Character1/AnimationPlayer.play("Walk")
		if movex < 0:
			$Character1.scale.x = -0.5
		else:
			$Character1.scale.x = 0.5
		$Character1/AnimationPlayer.playback_speed = speed / base_speed
		
	else:
		$Character1/AnimationPlayer.play("Idle")
		$Character1/AnimationPlayer.playback_speed = 1.0
		
	var movement = Vector2(movex, movey)
	
	$Character1.position += movement * speed * delta

func move_character2(delta:float):
	var movex = 0.0
	var movey = 0.0
	
	if Input.is_action_pressed("ui_left"):  movex = -1.0
	if Input.is_action_pressed("ui_right"): movex = 1.0
	if Input.is_action_pressed("ui_up"):    movey = -1.0
	if Input.is_action_pressed("ui_down"):  movey = 1.0
	
	if movex or movey:
		$Character2/AnimationPlayer.play("Walk")
		if movex < 0:
			$Character2.scale.x = -0.5
		else:
			$Character2.scale.x = 0.5
		$Character2/AnimationPlayer.playback_speed = speed / base_speed
		
	else:
		$Character2/AnimationPlayer.play("Idle")
		$Character2/AnimationPlayer.playback_speed = 1.0
		
	var movement = Vector2(movex, movey)
	
	$Character2.position += movement * speed * delta

func _process(delta):
	move_character1(delta)
	move_character2(delta)
	pass
