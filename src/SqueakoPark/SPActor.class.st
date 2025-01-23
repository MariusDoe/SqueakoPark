Class {
	#name : #SPActor,
	#superclass : #SPSolid,
	#instVars : [
		'remainingMovement',
		'velocity',
		'pushing'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/23/2025 14:58'
}
SPActor >> addForces [
	self addGravity.
]

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/16/2025 18:40'
}
SPActor >> addGravity [
	self velocity: self velocity + (0 @ self gravity).
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 13:41'
}
SPActor >> canMoveTowards: aSymbol [
	^ (self solidsTowards: aSymbol) isEmpty
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 15:03'
}
SPActor >> cannotMoveTowards: aSymbol [
	(#(left right) includes: aSymbol) ifTrue: [self velocity: 0 @ self velocity y].
	(#(top bottom) includes: aSymbol) ifTrue: [self velocity: self velocity x @ 0].
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 14:47'
}
SPActor >> clearPushing [
	self pushing keysAndValuesDo: [:direction :pushed |
		pushed
			do: [:each | (each pushersTowards at: direction) remove: self ifAbsent: []];
			removeAll].
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/16/2025 18:44'
}
SPActor >> currentVelocity [
	^ self velocity
]

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/16/2025 18:43'
}
SPActor >> gravity [
	^ 2
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 1/23/2025 14:37'
}
SPActor >> initialize [
	super initialize.
	self
		pushing: (SPDirections dictionaryWithAll: [Set new]);
		remainingMovement: 0 @ 0;
		velocity: 0 @ 0.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:26'
}
SPActor >> isActor [
	^ true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:37'
}
SPActor >> isStanding [
	^ (self pushing at: #bottom) notEmpty
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 14:58'
}
SPActor >> preMovement [
	self addForces.
	self remainingMovement: self currentVelocity.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:37'
}
SPActor >> pushing [
	^ pushing
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:37'
}
SPActor >> pushing: aDictionary [
	pushing := aDictionary
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 12:17'
}
SPActor >> remainingMovement [
	^ remainingMovement
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:36'
}
SPActor >> remainingMovement: aPoint [
	remainingMovement := aPoint
]

{
	#category : #colliders,
	#'squeak_changestamp' : 'mad 1/23/2025 17:43'
}
SPActor >> solidsTowards: aSymbol [
	| solids |
	solids := super solidsTowards: aSymbol.
	(self pushing at: aSymbol) addAll: solids.
	solids do: [:each | (each pushersTowards at: aSymbol) add: self].
	^ solids
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 17:55'
}
SPActor >> tryMove [
	| delta |
	self clearPushing.
	delta := self moveDeltaDuring: [
		self remainingMovement x >= 1 ifTrue: [self tryMoveTowards: #right].
		self remainingMovement x <= -1 ifTrue: [self tryMoveTowards: #left].
		self remainingMovement y >= 1 ifTrue: [self tryMoveTowards: #bottom].
		self remainingMovement y <= -1 ifTrue: [self tryMoveTowards: #top]].
	self remainingMovement: self remainingMovement - delta.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/23/2025 17:51'
}
SPActor >> tryMoveTowards: aSymbol [
	(self canMoveTowards: aSymbol) ifFalse: [^ self cannotMoveTowards: aSymbol].
	self moveTowards: aSymbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 18:42'
}
SPActor >> velocity [
	^ velocity
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 18:43'
}
SPActor >> velocity: aPoint [
	velocity := aPoint
]
