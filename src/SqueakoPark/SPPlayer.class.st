Class {
	#name : #SPPlayer,
	#superclass : #Morph,
	#instVars : [
		'verticalVelocity',
		'leftKey',
		'rightKey',
		'jumpKey',
		'platform',
		'carried',
		'game'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 17:56'
}
SPPlayer >> canJump [
	^ self platform notNil and: [self carried isEmpty]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:52'
}
SPPlayer >> carried [
	^ carried
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:52'
}
SPPlayer >> carried: anObject [
	carried := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 17:55'
}
SPPlayer >> carry: anObject [
	self carried add: anObject.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 17:47'
}
SPPlayer >> collideWith: anObject velocity: aPoint [
	^ anObject collideWithPlayer: self velocity: aPoint
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 17:49'
}
SPPlayer >> collideWithPlayer: aPlayer velocity: aPoint [
	aPoint y > 0 ifTrue: [self standOn: aPlayer].
	aPoint y < 0 ifTrue: [self top: aPlayer bottom].
	aPoint x < 0 ifTrue: [self left: aPlayer right].
	aPoint x > 0 ifTrue: [self right: aPlayer right].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 17:57'
}
SPPlayer >> doMovement [
	| horizontalVelocity |
	horizontalVelocity := (({self leftKey -> -1. self rightKey -> 1}
								select: [:each | self isKeyPressed: each key]
								thenCollect: #value) copyWith: 0) sum.
	self moveBy: horizontalVelocity @ 0.
	(self canJump and: [self isKeyPressed: self jumpKey])
		ifTrue: [self verticalVelocity: self jumpVelocity].
	self verticalVelocity: self verticalVelocity + self gravity.
	self moveBy: 0 @ self verticalVelocity.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:58'
}
SPPlayer >> gmCollisionHandler [
	^ self game gmCollisionHandler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:59'
}
SPPlayer >> gmKeyHandler [
	^ self game gmKeyHandler
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 17:57'
}
SPPlayer >> gravity [
	^ 10
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 17:53'
}
SPPlayer >> initialize [
	super initialize.
	self carried: OrderedCollection new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 17:55'
}
SPPlayer >> isKeyPressed: aCharacter [
	^ self gmKeyHandler gmIsKeyPressed: aCharacter
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:41'
}
SPPlayer >> jumpKey [
	^ jumpKey
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:41'
}
SPPlayer >> jumpKey: anObject [
	jumpKey := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 17:57'
}
SPPlayer >> jumpVelocity [
	^ -30
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:41'
}
SPPlayer >> leftKey [
	^ leftKey
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:41'
}
SPPlayer >> leftKey: anObject [
	leftKey := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:58'
}
SPPlayer >> moveBy: aPoint [
	self position: self position + aPoint.
	(self gmCollisionHandler morphsCollidingWith: self) do: [:each | each collideWith: self velocity: aPoint].
	self carried do: [:each | each moveBy: aPoint].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:52'
}
SPPlayer >> platform [
	^ platform
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:52'
}
SPPlayer >> platform: anObject [
	platform := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:42'
}
SPPlayer >> position: aPoint [
	self floatPosition: aPoint.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:41'
}
SPPlayer >> rightKey [
	^ rightKey
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:41'
}
SPPlayer >> rightKey: anObject [
	rightKey := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 17:50'
}
SPPlayer >> standOn: anObject [
	self platform ifNotNil: [^ self].
	self platform: anObject.
	anObject carry: self.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 17:40'
}
SPPlayer >> step [
	self doMovement.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:41'
}
SPPlayer >> verticalVelocity [
	^ verticalVelocity
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:41'
}
SPPlayer >> verticalVelocity: anObject [
	verticalVelocity := anObject
]
