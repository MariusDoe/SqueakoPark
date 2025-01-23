Class {
	#name : #SPPushRequest,
	#superclass : #Object,
	#instVars : [
		'direction',
		'pushingPlayers'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 12:34'
}
SPPushRequest >> addPushingPlayer: aPlayer [
	(self pushingPlayers includesKey: aPlayer) ifTrue: [^ self].
	self pushingPlayers at: aPlayer put: nil.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 15:00'
}
SPPushRequest >> canBePushed: aCollisionMorph by: aNumber of: aCollection [
	| players |
	players := aCollection select: [:each | self canPush: each].
	players size >= aNumber ifFalse: [^ false].
	(players any: aNumber) do: [:each | self pushingPlayers at: each put: aCollisionMorph].
	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:52'
}
SPPushRequest >> canPush: aCollider [
	| pushed |
	aCollider isPlayer ifFalse: [^ false].
	pushed := self pushingPlayers at: aCollider ifAbsent: [^ true].
	^ pushed isNil
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 12:32'
}
SPPushRequest >> direction [
	^ direction
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 12:32'
}
SPPushRequest >> direction: aSymbol [
	direction := aSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 12:33'
}
SPPushRequest >> initialize [
	self pushingPlayers: Dictionary new.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 12:32'
}
SPPushRequest >> pushingPlayers [
	^ pushingPlayers
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 12:32'
}
SPPushRequest >> pushingPlayers: aDictionary [
	pushingPlayers := aDictionary
]
