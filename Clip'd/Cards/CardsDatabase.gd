# UnitInfo = [Self or Opp effect, Sustained or Consumed on use, Character Size Change, Character Speed Change, Pickup Radius Size Change, Ricochet Change, Clip Size Change, Clip Speed Change, Misfire Chance Change]
enum {Smaller, Faster, Magnet, Ricochet, ClipLarger, ClipFaster, Larger, Slower, Misfire}

const DATA = {
	Smaller :
		["Self", "Sustained", -1, 0, 0, 0, 0, 0, 0],
	Faster :
		["Self", "Sustained", 0, 1, 0, 0, 0, 0, 0],
	Magnet :
		["Self", "Sustained", 0, 0, 1, 0, 0, 0, 0],
	Ricochet :
		["Self", "Sustained", 0, 0, 0, 1, 0, 0, 0],
	ClipLarger :
		["Self", "Sustained", 0, 0, 0, 0, 1, 0, 0],
	ClipFaster :
		["Self", "Sustained", 0, 0, 0, 0, 0, 1, 0],
	Larger :
		["Opp", "Sustained", 1, 0, 0, 0, 0, 0, 0],
	Slower :
		["Opp", "Sustained", 0, -1, 0, 0, 0, 0, 0],
	Misfire :
		["Opp", "Sustained", 0, 0, 0, 0, 0, 0, 20],
}
