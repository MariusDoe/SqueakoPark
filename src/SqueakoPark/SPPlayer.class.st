Class {
	#name : #SPPlayer,
	#superclass : #SPMovingCollisionMorph,
	#instVars : [
		'key',
		'keyMap',
		'sprite'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/16/2025 18:42'
}
SPPlayer >> addForces [
	super addForces.
	self tryJump.
]

{
	#category : #input,
	#'squeak_changestamp' : 'mad 1/16/2025 18:11'
}
SPPlayer >> canJump [
	^ self isStanding and: [self pushedBy top isEmpty]
]

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/16/2025 18:41'
}
SPPlayer >> currentVelocity [
	^ self velocity + self inputVelocity
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:59'
}
SPPlayer >> gmKeyHandler [
	^ self game gmKeyHandler
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 1/23/2025 09:26'
}
SPPlayer >> initialize [
	super initialize.
	self color: Color transparent.
]

{
	#category : #input,
	#'squeak_changestamp' : 'mad 1/16/2025 17:43'
}
SPPlayer >> inputDirection [
	| direction |
	direction :=
		(self isKeyPressed: self rightKey) asInteger -
		(self isKeyPressed: self leftKey) asInteger.
	self sprite direction: direction.
	^ direction
]

{
	#category : #input,
	#'squeak_changestamp' : 'mad 1/16/2025 17:43'
}
SPPlayer >> inputSpeed [
	^ 10
]

{
	#category : #input,
	#'squeak_changestamp' : 'mad 1/16/2025 18:08'
}
SPPlayer >> inputVelocity [
	^ self inputDirection * self inputSpeed @ 0
]

{
	#category : #input,
	#'squeak_changestamp' : 'mad 12/5/2024 17:55'
}
SPPlayer >> isKeyPressed: aCharacter [
	^ self gmKeyHandler gmIsKeyPressed: aCharacter
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 1/16/2025 19:08'
}
SPPlayer >> isPlayer [
	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:29'
}
SPPlayer >> jumpKey [
	^ self keyMap jump
]

{
	#category : #input,
	#'squeak_changestamp' : 'mad 12/31/2024 01:50'
}
SPPlayer >> jumpVelocity [
	^ -25
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:05'
}
SPPlayer >> key [
	^ key
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:05'
}
SPPlayer >> key: anObject [
	key := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:29'
}
SPPlayer >> keyMap [
	^ keyMap
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:29'
}
SPPlayer >> keyMap: anObject [
	keyMap := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:29'
}
SPPlayer >> leftKey [
	^ self keyMap left
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/31/2024 00:38'
}
SPPlayer >> loadSprite: angleNumber [
	self
		sprite: (SPPlayerSprite new
					myPlayer: self;
					hue: angleNumber;
					updateImage;
					yourself);
		extent: self sprite extent;
		addMorphCentered: self sprite.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:29'
}
SPPlayer >> rightKey [
	^ self keyMap right
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 18:58'
}
SPPlayer >> sprite [
	^ sprite
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 18:58'
}
SPPlayer >> sprite: anObject [
	sprite := anObject
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'mad 1/23/2025 09:20'
}
SPPlayer >> step [
	super step.
	self sprite
		isJumping: self isStanding not;
		isPushing: (self pushing left notEmpty or: [self pushing right notEmpty]).
]

{
	#category : #input,
	#'squeak_changestamp' : 'mad 1/16/2025 18:05'
}
SPPlayer >> tryJump [
	(self canJump and: [self isKeyPressed: self jumpKey]) ifFalse: [^ self].
	self velocity: self velocity x @ self jumpVelocity.
]

{
	#category : #collisions,
	#'squeak_changestamp' : 'mad 1/23/2025 09:43'
}
SPPlayer >> tryOpen: aDoor [
	self key ifNil: [^ self].
	aDoor open.
	self key delete.
]
