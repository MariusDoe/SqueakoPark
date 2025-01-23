Class {
	#name : #SPMovingCollisionMorph,
	#superclass : #SPCollisionMorph,
	#instVars : [
		'velocity',
		'pushing'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/16/2025 18:42'
}
SPMovingCollisionMorph >> addForces [
	self addGravity.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/16/2025 18:40'
}
SPMovingCollisionMorph >> addGravity [
	self velocity: self velocity + (0 @ self gravity).
]

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/16/2025 18:40'
}
SPMovingCollisionMorph >> clearPushing [
	self
		clearPushing: #left other: #right;
		clearPushing: #right other: #left;
		clearPushing: #top other: #bottom;
		clearPushing: #bottom other: #top.
]

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/16/2025 18:40'
}
SPMovingCollisionMorph >> clearPushing: mySide other: otherSide [
	(self pushing perform: mySide)
		do: [:each | (each pushedBy perform: otherSide) remove: self ifAbsent: []];
		removeAll.
]

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/16/2025 18:44'
}
SPMovingCollisionMorph >> currentVelocity [
	^ self velocity
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/16/2025 18:43'
}
SPMovingCollisionMorph >> doMovement [
	| currentVelocity |
	self addForces.
	currentVelocity := self currentVelocity.
	self
		clearPushing;
		moveBy: currentVelocity x @ 0;
		moveBy: 0 @ currentVelocity y.
]

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/16/2025 18:43'
}
SPMovingCollisionMorph >> gravity [
	^ 2
]

{
	#category : #collisions,
	#'squeak_changestamp' : 'mad 1/16/2025 19:07'
}
SPMovingCollisionMorph >> handleCollision: aCollisionInfo [
	aCollisionInfo moving hitImmovable: aCollisionInfo.
]

{
	#category : #collisions,
	#'squeak_changestamp' : 'mad 1/16/2025 19:01'
}
SPMovingCollisionMorph >> hitImmovable: aCollisionInfo [
	aCollisionInfo velocity y > 0 ifTrue: [self hitImmovable: aCollisionInfo hit mySide: #bottom otherSide: #top velocityFactor: 1 @ 0].
	aCollisionInfo velocity y < 0 ifTrue: [self hitImmovable: aCollisionInfo hit mySide: #top otherSide: #bottom velocityFactor: 1 @ 0].
	aCollisionInfo velocity x < 0 ifTrue: [self hitImmovable: aCollisionInfo hit mySide: #left otherSide: #right velocityFactor: 0 @ 1].
	aCollisionInfo velocity x > 0 ifTrue: [self hitImmovable: aCollisionInfo hit mySide: #right otherSide: #left velocityFactor: 0 @ 1].
]

{
	#category : #collisions,
	#'squeak_changestamp' : 'mad 1/16/2025 19:01'
}
SPMovingCollisionMorph >> hitImmovable: aMorph mySide: mySide otherSide: otherSide velocityFactor: aPoint [
	self perform: mySide asSimpleSetter with: (aMorph perform: otherSide).
	(self pushing perform: mySide) add: aMorph.
	(aMorph pushedBy perform: otherSide) add: self.
	self velocity: self velocity * aPoint.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 1/16/2025 18:47'
}
SPMovingCollisionMorph >> initialize [
	super initialize.
	self
		pushing: (SPSides withAll: [Set new]);
		velocity: 0 @ 0.
]

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/16/2025 18:43'
}
SPMovingCollisionMorph >> isStanding [
	^ self pushing bottom notEmpty
]

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/23/2025 09:33'
}
SPMovingCollisionMorph >> moveBy: aPoint [
	| startPosition movedBy |
	startPosition := self position.
	self position: self position + aPoint.
	(self gmCollisionHandler morphsCollidingWith: self) do: [:each |
		each handleCollision: (SPCollisionInfo new
								moving: self;
								hit: each;
								velocity: aPoint;
								yourself)].
	movedBy := self position - startPosition.
	self pushedBy top do: [:each | each moveBy: movedBy].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 18:40'
}
SPMovingCollisionMorph >> pushing [
	^ pushing
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 18:40'
}
SPMovingCollisionMorph >> pushing: aSides [
	pushing := aSides
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'mad 1/23/2025 09:23'
}
SPMovingCollisionMorph >> step [
	self doMovement.
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'mad 1/16/2025 18:47'
}
SPMovingCollisionMorph >> stepTime [
	^ 20
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 18:42'
}
SPMovingCollisionMorph >> velocity [
	^ velocity
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 18:43'
}
SPMovingCollisionMorph >> velocity: aPoint [
	velocity := aPoint
]
