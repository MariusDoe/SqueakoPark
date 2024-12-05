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
	#'squeak_changestamp' : 'mad 12/5/2024 18:03'
}
SPGame >> initialize [
	super initialize.
	self
		gmRegisterToKeyHandler;
		gmCollisionHandler: GMCollisionHandler new.
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
