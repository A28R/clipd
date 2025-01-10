extends MarginContainer


# Variables
@onready var CardDatabaseClass = preload("res://Cards/CardsDatabase.gd")
@onready var CardDatabase = CardDatabaseClass.new()
var CardName = "Smaller"
@onready var CardInfo = CardDatabase.DATA[CardDatabase.get(CardName)]
@onready var CardImg = str("res://Cards/Units/", CardName, ".png")


# Called when the node enters the scene tree for the first time.
func _ready():
	print(CardInfo)
	var CardSize = size
	$Card.texture = load(CardImg)
	$Card.scale *= CardSize/$Card.texture.get_size()
	$Bars/Bar/Name/CenterContainer/Label.text = CardName
	self.position = get_viewport_rect().size/2
	self.position.x -= self.size.x/2
	self.position.y -= self.size.y/2


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
