extends Node

const ID = "Zea.Bear" 
onready var Lure = get_node("/root/SulayreLure")

var Cosmetics = [
	{"Cosmetic": "hat_cowboyhat", "Colors": ["_pink", "_brown", "_black"]},
	{"Cosmetic": "hat_bucket", "Colors": ["_green", "_tan"]},
	{"Cosmetic": "hat_tophat", "Colors": [""]},
	{"Cosmetic": "accessory_bandaid", "Colors": [""]},
	{"Cosmetic": "accessory_cig", "Colors": [""]},
	{"Cosmetic": "accessory_eyepatch", "Colors": [""]},
	{"Cosmetic": "accessory_monocle", "Colors": [""]},
	{"Cosmetic": "accessory_shades", "Colors": ["", "_gold"]},
	{"Cosmetic": "accessory_eyepatch", "Colors": [""]}
	]

func assign_cosmetic_meshes():
	for cosmetic in Cosmetics:
		for color in cosmetic["Colors"]:
			var mod_id_species = ID + ".species_bear"
			var model_path = "res://mods/Zea.Bear/Assets/Models/" + "bear_" + cosmetic["Cosmetic"] + color + ".tres"
			var cosmetic_with_color = cosmetic["Cosmetic"] + color
			Lure.assign_cosmetic_mesh(ID, cosmetic_with_color, mod_id_species, model_path)
func _ready():#
	
	Lure.assign_pattern_texture(ID,"pattern_calico",		ID+".species_bear",		"mod://Assets/Textures/bear_calico.png")
	Lure.assign_pattern_texture(ID,"pattern_collie",		ID+".species_bear",		"mod://Assets/Textures/bear_collie.png")
	Lure.assign_pattern_texture(ID,"pattern_spotted",		ID+".species_bear",		"mod://Assets/Textures/bear_spotted.png")
	Lure.assign_pattern_texture(ID,"pattern_tux",		ID+".species_bear",		"mod://Assets/Textures/bear_tux.png")
	
	assign_cosmetic_meshes()
	
	Lure.assign_face_animation(ID,ID+".species_bear","mod://Assets/bear_face.tres")
	Lure.assign_species_voice(ID,ID+".species_bear","mod://Assets/Audio/bear_bark.ogg", "mod://Assets/Audio/bear_growl.ogg", "mod://Assets/Audio/bear_whine.ogg" )
	
	Lure.add_content(ID,"species_bear","mod://Resources/species_bear.tres")
