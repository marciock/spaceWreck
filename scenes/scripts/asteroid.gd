extends RigidBody2D

export (int) var velocityMin=150
export (int) var velocityMax=250

var typeAsteroid=["big","small"]


func _ready():
	$AnimatedSprite.animation=typeAsteroid[randi() % typeAsteroid.size()]
	if $AnimatedSprite.animation=="big":
		$CollisionShape2D.scale.x=1.5
		$CollisionShape2D.scale.y=1.5




func _on_VisibilityNot_screen_exited():
	queue_free()
