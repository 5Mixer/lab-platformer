extends Spatial

export var animation_offset = 0.0

func _ready():
	$AnimationPlayer.seek(animation_offset)
