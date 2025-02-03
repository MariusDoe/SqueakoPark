Class {
	#name : #SPSolid,
	#superclass : #SPCollider,
	#instVars : [
		'pushersTowards',
		'pushing',
		'remainingMovement',
		'velocity'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 2/3/2025 00:45'
}
SPSolid class >> isAbstract [
	^ self == SPSolid
]

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/24/2025 15:22'
}
SPSolid >> addForces [
	"do nothing"
]

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:15'
}
SPSolid >> allPushersTowards: aSymbol [
	| queue pushers |
	queue := OrderedCollection with: self.
	pushers := Set new.
	[queue notEmpty] whileTrue: [ | current |
		current := queue removeFirst.
		(pushers includes: current) ifFalse: [
			queue addAll: (current pushersTowards at: aSymbol)].
		pushers add: current].
	pushers remove: self.
	^ pushers
]

{
	#category : #carrying,
	#'squeak_changestamp' : 'mad 2/3/2025 22:51'
}
SPSolid >> canBeCarriedTowards: aSymbol [
	^ (self collidingTowards: aSymbol) isEmpty
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/31/2025 12:12'
}
SPSolid >> canBeMovedTowards: aSymbol [
	^ self canMoveTowards: aSymbol
]

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 2/1/2025 22:59'
}
SPSolid >> canBePushedTowards: aSymbol [
	^ self canPushTowards: aSymbol
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 2/3/2025 22:51'
}
SPSolid >> canMoveTowards: aSymbol [
	^ (self collidingTowards: aSymbol) allSatisfy: [:each |
		each canBeMovedTowards: aSymbol]
]

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 2/3/2025 22:51'
}
SPSolid >> canPushTowards: aSymbol [
	^ (self collidingTowards: aSymbol) allSatisfy: [:each |
		each canBePushedTowards: aSymbol]
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/24/2025 15:22'
}
SPSolid >> cannotMoveTowards: aSymbol [
	(#(left right) includes: aSymbol) ifTrue: [self velocity: 0 @ self velocity y].
	(#(top bottom) includes: aSymbol) ifTrue: [self velocity: self velocity x @ 0].
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 2/1/2025 22:48'
}
SPSolid >> carryTowards: aSymbol [
	| sortBy |
	sortBy := aSymbol caseOf: {
		[#left] -> [#left ascending].
		[#right] -> [#right descending].
	} otherwise: [^ self].
	((self pushersTowards at: #bottom) sorted: sortBy)
		do: [:each | each tryBeCarriedTowards: aSymbol].
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/24/2025 15:22'
}
SPSolid >> clearPushing [
	self pushing keysAndValuesDo: [:direction :pushed |
		pushed
			do: [:each | (each pushersTowards at: direction) remove: self ifAbsent: []];
			removeAll].
]

{
	#category : #colliders,
	#'squeak_changestamp' : 'mad 2/3/2025 22:51'
}
SPSolid >> collidingTowards: aSymbol [
	| solids |
	solids := super collidingTowards: aSymbol.
	(self pushing at: aSymbol) addAll: solids.
	solids do: [:each | (each pushersTowards at: aSymbol) add: self].
	^ solids
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/24/2025 15:22'
}
SPSolid >> currentVelocity [
	^ self velocity
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 1/24/2025 15:23'
}
SPSolid >> initialize [
	super initialize.
	self
		pushersTowards: (SPDirections dictionaryWithAll: [Set new]);
		pushing: (SPDirections dictionaryWithAll: [Set new]);
		remainingMovement: 0 @ 0;
		velocity: 0 @ 0.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:49'
}
SPSolid >> isSolid [
	^ true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 1/31/2025 12:50'
}
SPSolid >> isWall [
	^ false
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/31/2025 12:54'
}
SPSolid >> moveTowards: aSymbol [
	self moveTowards: aSymbol collidingSolidsDo: [:each | each moveTowards: aSymbol].
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 2/3/2025 22:51'
}
SPSolid >> moveTowards: aSymbol collidingSolidsDo: aBlock [
	self carryTowards: aSymbol.
	(self collidingTowards: aSymbol) do: aBlock.
	super moveTowards: aSymbol.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/24/2025 15:25'
}
SPSolid >> preMovement [
	self addForces.
	self remainingMovement: self currentVelocity.
]

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 1/31/2025 12:54'
}
SPSolid >> pushTowards: aSymbol [
	self moveTowards: aSymbol collidingSolidsDo: [:each | each pushTowards: aSymbol].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:05'
}
SPSolid >> pushersTowards [
	^ pushersTowards
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:05'
}
SPSolid >> pushersTowards: aDictionary [
	pushersTowards := aDictionary
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/24/2025 15:25'
}
SPSolid >> pushing [
	^ pushing
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/24/2025 15:25'
}
SPSolid >> pushing: aDictionary [
	pushing := aDictionary
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/24/2025 15:25'
}
SPSolid >> remainingMovement [
	^ remainingMovement
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/24/2025 15:25'
}
SPSolid >> remainingMovement: aPoint [
	remainingMovement := aPoint
]

{
	#category : #carrying,
	#'squeak_changestamp' : 'mad 1/31/2025 12:06'
}
SPSolid >> tryBeCarriedTowards: aSymbol [
	(self canBeCarriedTowards: aSymbol) ifFalse: [^ self cannotMoveTowards: aSymbol].
	self moveTowards: aSymbol.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/31/2025 12:13'
}
SPSolid >> tryMoveTowards: aSymbol [
	(self canMoveTowards: aSymbol) ifFalse: [^ self cannotMoveTowards: aSymbol].
	self moveTowards: aSymbol.
]

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 1/24/2025 15:24'
}
SPSolid >> tryPush [
	| delta |
	self clearPushing.
	delta := self moveDeltaDuring: [
		self remainingMovement x >= 1 ifTrue: [self tryPushTowards: #right].
		self remainingMovement x <= -1 ifTrue: [self tryPushTowards: #left].
		self remainingMovement y >= 1 ifTrue: [self tryPushTowards: #bottom].
		self remainingMovement y <= -1 ifTrue: [self tryPushTowards: #top]].
	self remainingMovement: self remainingMovement - delta.
]

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 1/31/2025 12:25'
}
SPSolid >> tryPushTowards: aSymbol [
	(self canPushTowards: aSymbol) ifFalse: [^ self cannotMoveTowards: aSymbol].
	self pushTowards: aSymbol.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/24/2025 15:25'
}
SPSolid >> velocity [
	^ velocity
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/24/2025 15:25'
}
SPSolid >> velocity: aPoint [
	velocity := aPoint
]
