extends ParallaxLayer

var speed = 250

func _process(delta):
	motion_offset.x -= speed * delta
