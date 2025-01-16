Class {
	#name : #SPGame,
	#superclass : #Morph,
	#instVars : [
		'gmCollisionHandler'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:59'
}
SPGame >> gmCollisionHandler [
	^ gmCollisionHandler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:59'
}
SPGame >> gmCollisionHandler: anObject [
	gmCollisionHandler := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 18:03'
}
SPGame >> gmKeyHandler [
	^ self eventHandler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OB 1/16/2025 18:55'
}
SPGame >> initialize [
	super initialize.
	self
		gmRegisterToKeyHandler;
		gmCollisionHandler: GMCollisionHandler new;
		color: Color white;
		extent: 500 @ 400;
		spawnWallAt: (0 @ 300 corner: 500 @ 400);
		spawnDoorAt: (400 @ 100 corner: 500 @ 299);
		spawnPlayerAt: 100 @ 100 left: $a right: $d jump: $w colorAngle: 0;
		spawnPlayerAt: 300 @ 100 left: Character arrowLeft right: Character arrowRight jump: Character arrowUp colorAngle: 100;
		spawnKeyAt: 200 @ 250.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OB 1/16/2025 18:24'
}
SPGame >> spawnDoorAt: aRectangle [
	| door |
	door := SPDoor new bounds: aRectangle; yourself.
	self addMorph: door.
	self gmCollisionHandler addCollisionMorph: door.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:09'
}
SPGame >> spawnKeyAt: aPoint [
	self addMorph: (SPKey new
						game: self;
						position: aPoint;
						yourself).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:30'
}
SPGame >> spawnPlayerAt: aPoint left: leftCharacter right: rightCharacter jump: jumpCharacter colorAngle: aNumber [
	self addMorph: (SPPlayer new
						game: self;
						keyMap: (SPKeyMap new
									left: leftCharacter;
									right: rightCharacter;
									jump: jumpCharacter;
									yourself);
						loadSprite: aNumber;
						yourself).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 18:20'
}
SPGame >> spawnWallAt: aRectangle [
	| wall |
	wall := SPWall new bounds: aRectangle; yourself.
	self addMorph: wall.
	self gmCollisionHandler addCollisionMorph: wall.
]
