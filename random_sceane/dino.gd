extends Control
const TEZLIK = 400.0
@onready var kaktus_sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	randomize()
	
func _process(delta: float) -> void:
	pass
	kaktus_sprite.position.x -= TEZLIK * delta
	if kaktus_sprite.position.x < -100:
# Uni qaytadan o'ng tarafga va yangi random balandlikka o'tkazamiz
		yangi_kaktus_yaratish()
	
func yangi_kaktus_yaratish():
	pass
	kaktus_sprite.position.x = 1200
