extends Control
const TEZLIK = 500.0
@onready var kaktus_sprite = $Sprite2D
@onready var kaktus_sprite2 = $Sprite2D2
const surish_mteri = 60
func _ready() -> void:
	pass # Replace with function body.
	randomize()
	
func _process(delta: float) -> void:
	pass
	kaktus_sprite.position.x -= TEZLIK * delta
	kaktus_sprite2.position.x -= TEZLIK * delta
	if kaktus_sprite.position.x < -100:
		yangi_kaktus_yaratish()
	if kaktus_sprite2.position.x < -100:
		yangi_kaktus_yaratish2()
		
func yangi_kaktus_yaratish():
	var random_masofa1 = randi_range(1100, 1800)
	kaktus_sprite.position.x = random_masofa1

func yangi_kaktus_yaratish2():
	var random_masofa2 = randi_range(1100, 1800)
	kaktus_sprite2.position.x = random_masofa2
	var masofa_scanner = abs(kaktus_sprite.position.x-kaktus_sprite2.position.x)
	if masofa_scanner <= surish_mteri:
		kaktus_sprite2.position.x = kaktus_sprite.position.x + surish_mteri
