Class {
	#name : #SPPlayer,
	#superclass : #SPFallingSolid,
	#instVars : [
		'id',
		'holding',
		'sprite',
		'inputDirection'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 00:28'
}
SPPlayer class >> hues [
	^ {0. 180}
]

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/16/2025 18:42'
}
SPPlayer >> addForces [
	super addForces.
	self tryJump.
]

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 2/1/2025 22:59'
}
SPPlayer >> canBePushedTowards: aSymbol [
	aSymbol = self inputDirection ifFalse: [^ false].
	^ super canBePushedTowards: aSymbol
]

{
	#category : #input,
	#'squeak_changestamp' : 'mad 1/23/2025 14:15'
}
SPPlayer >> canJump [
	^ self isStanding and: [(self pushersTowards at: #bottom) isEmpty]
]

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/23/2025 14:24'
}
SPPlayer >> currentVelocity [
	self updateInputDirection.
	^ self velocity + self inputVelocity
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 2/3/2025 00:02'
}
SPPlayer >> defaultColor [
	^ Color transparent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:15'
}
SPPlayer >> downKey [
	^ self keyMap down
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:59'
}
SPPlayer >> gmKeyHandler [
	^ self game gmKeyHandler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:09'
}
SPPlayer >> holding [
	^ holding
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:09'
}
SPPlayer >> holding: aSet [
	holding := aSet
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 00:01'
}
SPPlayer >> hue [
	^ self hues at: self id
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 00:28'
}
SPPlayer >> hues [
	^ self class hues
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/2/2025 23:59'
}
SPPlayer >> id [
	^ id
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 00:00'
}
SPPlayer >> id: aNumber [
	id := aNumber
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 2/3/2025 01:39'
}
SPPlayer >> initialize [
	super initialize.
	self
		id: 1;
		holding: Set new;
		sprite: (SPPlayerSprite new
					myPlayer: self;
					updateImage;
					yourself);
		extent: self sprite extent;
		addMorphCentered: self sprite.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:13'
}
SPPlayer >> inputDirection [
	^ inputDirection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:13'
}
SPPlayer >> inputDirection: aSymbol [
	inputDirection := aSymbol
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
	#'squeak_changestamp' : 'mad 1/23/2025 14:25'
}
SPPlayer >> inputVelocity [
	^ (self inputDirection caseOf: {
		[#left] -> [-1].
		[#right] -> [1].
		[nil] -> [0]
	}) * self inputSpeed @ 0
]

{
	#category : #input,
	#'squeak_changestamp' : 'mad 1/23/2025 14:30'
}
SPPlayer >> isDownKeyPressed [
	^ self isKeyPressed: self downKey
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
	#category : #pushing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:47'
}
SPPlayer >> isPushing [
	^ (self pushing at: (self inputDirection ifNil: [^ false])) notEmpty
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
	#'squeak_changestamp' : 'mad 2/3/2025 00:02'
}
SPPlayer >> keyMap [
	^ self keyMaps at: self id
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 00:01'
}
SPPlayer >> keyMaps [
	^ {SPKeyMap wasd. SPKeyMap arrowKeys}
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
	#'squeak_changestamp' : 'mad 1/23/2025 14:23'
}
SPPlayer >> step [
	super step.
	self sprite
		isJumping: self isStanding not;
		isPushing: self isPushing.
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'mad 1/23/2025 14:31'
}
SPPlayer >> stepTime [
	^ 1
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
	#category : #input,
	#'squeak_changestamp' : 'mad 1/23/2025 18:06'
}
SPPlayer >> tryLeave [
	self isDownKeyPressed ifFalse: [^ self].
	self hide.
]

{
	#category : #input,
	#'squeak_changestamp' : 'mad 1/23/2025 13:13'
}
SPPlayer >> updateInputDirection [
	| direction |
	direction := (self isKeyPressed: self rightKey) asInteger - (self isKeyPressed: self leftKey) asInteger.
	self inputDirection: (direction = 0 ifTrue: [nil] ifFalse: [direction < 0 ifTrue: [#left] ifFalse: [#right]]).
	self sprite direction: direction.
]
