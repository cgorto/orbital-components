class_name LastHitOrb extends Area2D

signal orb_popped(popped: LastHitOrb)

@export var initial_value: int = 1
@export var max_value: int = 5
var lifetime: float = 3
var initial_speed: float = 100
var friction: float = 50


var current_value: int
var time_alive: float = 0

@onready var sprite: Sprite2D = $Sprite2D
@onready var click_area: CollisionShape2D = $CollisionShape2D
@onready var health_component: HealthComponent = $HealthComponent
@onready var velocity_component: VelocityComponent = $VelocityComponent

func _ready() -> void:
	current_value = initial_value
	lifetime = randf_range(2,4)
	initial_speed = randf_range(150,250)
	friction = randf_range(5,15)
	velocity_component.velocity = Vector2.RIGHT.rotated(randf()*2*PI)*initial_speed

func _physics_process(delta: float) -> void:
	velocity_component.move(self)
	velocity_component.decelerate()
	
	time_alive += delta
	
	if time_alive >= lifetime:
		health_component.damage(1)
		
func last_hit() -> void:
	print("last hit")
	health_component.damage(1)
