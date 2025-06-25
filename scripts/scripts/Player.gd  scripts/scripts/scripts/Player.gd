extends CharacterBody2D

# Constantes de movimento
const SPEED = 200
const JUMP_FORCE = -400
const GRAVITY = 1200

# Referência ao sprite
onready var sprite = $AnimatedSprite2D

func _physics_process(delta):
    var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
    velocity.x = direction * SPEED

    if is_on_floor() and Input.is_action_just_pressed("ui_up"):
        velocity.y = JUMP_FORCE

    velocity.y += GRAVITY * delta

    velocity = move_and_slide(velocity, Vector2.UP)

    _update_animation(direction)

func _update_animation(direction):
    if direction != 0:
        sprite.flip_h = direction < 0
        sprite.play("run")
    else:
        sprite.play("idle")
