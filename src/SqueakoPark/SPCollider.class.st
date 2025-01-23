Class {
	#name : #SPCollider,
	#superclass : #Morph,
	#instVars : [
		'game'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #colliders,
	#'squeak_changestamp' : 'mad 1/23/2025 13:48'
}
SPCollider >> collidersOverlapping: aRectangle [
	^ (self game collidersOverlapping: aRectangle)
		remove: self ifAbsent: [];
		yourself
]

{
	#category : #colliders,
	#'squeak_changestamp' : 'mad 1/23/2025 13:48'
}
SPCollider >> collidersTowards: aSymbol [
	^ self collidersOverlapping: (self bounds translateBy: (SPDirections vector: aSymbol))
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 13:56'
}
SPCollider >> doMovement [
	"do nothing"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:07'
}
SPCollider >> game [
	^ game
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:49'
}
SPCollider >> game: aGame [
	game := aGame.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 1/23/2025 13:23'
}
SPCollider >> initialize [
	super initialize.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:26'
}
SPCollider >> isActor [
	^ false
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 1/23/2025 10:17'
}
SPCollider >> isBlock [
	^ false
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 1/23/2025 17:58'
}
SPCollider >> isKey [
	^ false
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 1/16/2025 19:05'
}
SPCollider >> isPlayer [
	^ false
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:49'
}
SPCollider >> isSolid [
	^ false
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 13:37'
}
SPCollider >> moveBy: aPoint [
	self position: self position + aPoint.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 17:54'
}
SPCollider >> moveDeltaDuring: aBlock [
	| startPosition |
	startPosition := self position.
	aBlock value.
	^ self position - startPosition
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 13:37'
}
SPCollider >> moveTowards: aSymbol [
	self moveBy: (SPDirections vector: aSymbol).
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 17:54'
}
SPCollider >> movesDuring: aBlock [
	^ (self moveDeltaDuring: aBlock) ~= (0 @ 0)
]

{
	#category : #colliders,
	#'squeak_changestamp' : 'mad 1/23/2025 13:57'
}
SPCollider >> overlappingColliders [
	^ self collidersOverlapping: self bounds
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 13:56'
}
SPCollider >> postMovement [
	"do nothing"
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 13:56'
}
SPCollider >> preMovement [
	"do nothing"
]

{
	#category : #colliders,
	#'squeak_changestamp' : 'mad 1/23/2025 13:31'
}
SPCollider >> solidsTowards: aSymbol [
	^ (self collidersTowards: aSymbol) select: #isSolid
]
