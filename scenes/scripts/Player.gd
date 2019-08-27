extends Area2D
export (int) var Velocity=300
var playerMove=Vector2()
var limite
signal collide

func _ready():
	hide()
	limite=get_viewport_rect().size 


func _process(delta):
	playerMove=Vector2()
	
	if Input.is_action_pressed("ui_right"):
		playerMove.x += 1
	if Input.is_action_pressed("ui_left"):
		playerMove.x -=1
	if Input.is_action_pressed("ui_down"):
		playerMove.y +=1
	if Input.is_action_pressed("ui_up"):
		playerMove.y -=1
	
	

	if playerMove.length() >0:
		playerMove=playerMove.normalized() * Velocity
		
	position +=playerMove * delta
	position.x=clamp(position.x,0,limite.x)
	position.y=clamp(position.y,0,limite.y)
	
	if playerMove.x !=0:
		$spritePlayer.animation="toside"
		$spritePlayer.flip_h=playerMove.x<0
	elif playerMove.y > 0:
	#	$spritePlayer.play("flttodown")
		$spritePlayer.animation="todown"
		
			
	elif playerMove.y < 0:
		$spritePlayer.animation="toup"
	else:
		$spritePlayer.animation="stoped"


func _on_Player_body_entered(body):
	$spritePlayer.animation="flttodown"
	hide()
	emit_signal("collide")
	$CollisionShape2D.disabled=true
	
func inicialization(pos):
	position=pos
	show()
	$CollisionShape2D.disabled=false
	
