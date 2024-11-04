extends Node

const ID = "Zea.Axolotl" 
onready var Lure = get_node("/root/SulayreLure")

var Cosmetics = [
	{"Cosmetic": "hat_cowboyhat", "Colors": ["_pink", "_brown", "_black"]},
	{"Cosmetic": "hat_tophat", "Colors": [""]},
	{"Cosmetic": "hat_crown", "Colors": [""]},
	{"Cosmetic": "accessory_bandaid", "Colors": [""]},
	{"Cosmetic": "accessory_antlers", "Colors": [""]},
	{"Cosmetic": "accessory_cig", "Colors": [""]},
	{"Cosmetic": "accessory_eyepatch", "Colors": [""]},
	{"Cosmetic": "accessory_glasses", "Colors": [""]},
	{"Cosmetic": "accessory_glasses_round", "Colors": [""]},
	{"Cosmetic": "accessory_shades", "Colors": ["", "_gold"]}
	]

func assign_cosmetic_meshes():
	for cosmetic in Cosmetics:
		for color in cosmetic["Colors"]:
			var mod_id_species = ID + ".species_axolotl"
			var model_path = "res://mods/Zea.Axolotl/Assets/Models/" + "axolotl_" + cosmetic["Cosmetic"] + color + ".tres"
			var cosmetic_with_color = cosmetic["Cosmetic"] + color
			Lure.assign_cosmetic_mesh(ID, cosmetic_with_color, mod_id_species, model_path)
func _ready():#
	
	Lure.assign_pattern_texture(ID,"pattern_calico",		ID+".species_axolotl",		"mod://Assets/Textures/axolotl_calico.png")
	Lure.assign_pattern_texture(ID,"pattern_collie",		ID+".species_axolotl",		"mod://Assets/Textures/axolotl_collie.png")
	Lure.assign_pattern_texture(ID,"pattern_spotted",		ID+".species_axolotl",		"mod://Assets/Textures/axolotl_spotted.png")
	Lure.assign_pattern_texture(ID,"pattern_tux",		ID+".species_axolotl",		"mod://Assets/Textures/axolotl_tux.png")
	
	assign_cosmetic_meshes()
	
	Lure.assign_face_animation(ID,ID+".species_axolotl","mod://Assets/axolotl_face.tres")
	Lure.assign_species_voice(ID,ID+".species_axolotl","mod://Assets/Audio/axolotl_bark.ogg", "mod://Assets/Audio/axolotl_growl.ogg", "mod://Assets/Audio/axolotl_whine.ogg" )
	
	Lure.add_content(ID,"species_axolotl","mod://Resources/species_axolotl.tres")
