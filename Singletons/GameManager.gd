extends Node

var ItemsBrokenCurrentCount: int = 0
var MaxItemsBrokenAtOneTime: int = 1
var GamePlayTime: int = 0
var BoatHealth: int = 20
var ApplyBoatDamage: bool = false
var NoSharksOnScreen: int = 0
var NoCrabsOnScreen: int = 0
var FishingLineOnScreen: bool = false
var Score: int 


func _process(_delta):
	if BoatHealth < 0:
		BoatHealth = 0
