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
	#'squeak_changestamp' : 'mad 12/5/2024 19:09'
}
SPGame >> initialize [
	super initialize.
	self
		gmRegisterToKeyHandler;
		gmCollisionHandler: GMCollisionHandler new;
		color: Color white;
		extent: 500 @ 400;
		spawnWallAt: (0 @ 300 corner: 500 @ 400);
		spawnPlayerAt: 100 @ 100 left: $a right: $d jump: $w colorAngle: 0;
		spawnPlayerAt: 300 @ 100 left: Character arrowLeft right: Character arrowRight jump: Character arrowUp colorAngle: 100;
		spawnKeyAt: 200 @ 250.
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
	#'squeak_changestamp' : 'mad 12/5/2024 18:41'
}
SPGame >> spawnPlayerAt: aPoint left: leftCharacter right: rightCharacter jump: jumpCharacter colorAngle: aNumber [
	self addMorph: (SPPlayer new
						game: self;
						leftKey: leftCharacter;
						rightKey: rightCharacter;
						jumpKey: jumpCharacter;
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
