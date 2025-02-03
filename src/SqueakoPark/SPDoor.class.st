Class {
	#name : #SPDoor,
	#superclass : #SPCollider,
	#instVars : [
		'isOpen',
		'sprite'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #opening,
	#'squeak_changestamp' : 'mad 2/3/2025 22:23'
}
SPDoor >> close [
	self isOpen: false.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 2/3/2025 22:23'
}
SPDoor >> defaultColor [
	^ Color transparent
]

{
	#category : #players,
	#'squeak_changestamp' : 'mad 1/23/2025 18:07'
}
SPDoor >> handlePlayer: aPlayer [
	self isOpen
		ifTrue: [aPlayer tryLeave]
		ifFalse: [self tryOpen: aPlayer].
]

{
	#category : #players,
	#'squeak_changestamp' : 'mad 1/23/2025 13:57'
}
SPDoor >> handlePlayers [
	self overlappingColliders select: #isPlayer thenDo: [:each | self handlePlayer: each].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 2/3/2025 22:21'
}
SPDoor >> initialize [
	super initialize.
	self
		sprite: SPAssets doorClosed asMorph;
		extent: self sprite extent;
		addMorphCentered: self sprite;
		close.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OB 1/16/2025 18:47'
}
SPDoor >> isOpen [
	^isOpen
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 22:22'
}
SPDoor >> isOpen: aBoolean [
	isOpen := aBoolean.
	self updateSprite.
]

{
	#category : #opening,
	#'squeak_changestamp' : 'mad 2/3/2025 22:23'
}
SPDoor >> open [
	self isOpen: true.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 13:57'
}
SPDoor >> postMovement [
	self handlePlayers.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 22:22'
}
SPDoor >> sprite [
	^ sprite
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 22:22'
}
SPDoor >> sprite: anObject [
	sprite := anObject
]

{
	#category : #opening,
	#'squeak_changestamp' : 'mad 1/23/2025 14:01'
}
SPDoor >> tryOpen: aPlayer [
	| key |
	aPlayer isDownKeyPressed ifFalse: [^ self].
	key := aPlayer holding detect: #isKey ifNone: [^ self].
	key open: self.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 22:23'
}
SPDoor >> updateSprite [
	self sprite image: (self isOpen
							ifTrue: [SPAssets doorOpen]
							ifFalse: [SPAssets doorClosed]).
]
