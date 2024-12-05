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
	#'squeak_changestamp' : 'mad 12/5/2024 18:25'
}
SPGame >> initialize [
	super initialize.
	self
		gmRegisterToKeyHandler;
		gmCollisionHandler: GMCollisionHandler new;
		color: Color white;
		extent: 500 @ 400;
		spawnWallAt: (0 @ 300 corner: 500 @ 400);
		spawnPlayerAt: 100 @ 100 left: $a right: $d jump: $w;
		spawnPlayerAt: 300 @ 100 left: Character arrowLeft right: Character arrowRight jump: Character arrowUp.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 18:08'
}
SPGame >> spawnPlayerAt: aPoint left: leftCharacter right: rightCharacter jump: jumpCharacter [
	self addMorph: (SPPlayer new
						game: self;
						leftKey: leftCharacter;
						rightKey: rightCharacter;
						jumpKey: jumpCharacter).
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
