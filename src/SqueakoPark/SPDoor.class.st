Class {
	#name : #SPDoor,
	#superclass : #SPCollider,
	#instVars : [
		'isOpen'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #opening,
	#'squeak_changestamp' : 'mad 1/23/2025 09:45'
}
SPDoor >> close [
	self isOpen: false.
	self color: Color brown.
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
	#'squeak_changestamp' : 'mad 1/23/2025 09:46'
}
SPDoor >> initialize [
	super initialize.
	self close.
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
	#'squeak_changestamp' : 'OB 1/16/2025 18:48'
}
SPDoor >> isOpen: aBoolean [
	^ isOpen:= aBoolean.
]

{
	#category : #opening,
	#'squeak_changestamp' : 'mad 1/23/2025 09:45'
}
SPDoor >> open [
	self isOpen: true.
	self color: Color lightGray.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 13:57'
}
SPDoor >> postMovement [
	self handlePlayers.
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
