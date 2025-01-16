Class {
	#name : #SPPlayer,
	#superclass : #SPCollisionMorph,
	#instVars : [
		'key',
		'velocity',
		'keyMap',
		'pushing',
		'sprite'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/16/2025 17:35'
}
SPPlayer >> addGravity [
	self velocity: self velocity + (0 @ self gravity).
]

{
	#category : #input,
	#'squeak_changestamp' : 'mad 1/16/2025 18:11'
}
SPPlayer >> canJump [
	^ self isStanding and: [self pushedBy top isEmpty]
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
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/16/2025 18:08'
}
SPPlayer >> clearPushing [
	self
		clearPushing: #left other: #right;
		clearPushing: #right other: #left;
		clearPushing: #top other: #bottom;
		clearPushing: #bottom other: #top.
]

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/16/2025 18:08'
}
SPPlayer >> clearPushing: mySide other: otherSide [
	(self pushing perform: mySide)
		do: [:each | (each pushedBy perform: otherSide) remove: self];
		removeAll.
]

{
	#category : #collisions,
	#'squeak_changestamp' : 'mad 1/16/2025 18:12'
}
SPPlayer >> collideWithImmovable: aMorph velocity: aPoint [
	aPoint y > 0 ifTrue: [self collidedWith: aMorph mySide: #bottom otherSide: #top velocityFactor: 1 @ 0].
	aPoint y < 0 ifTrue: [self collidedWith: aMorph mySide: #top otherSide: #bottom velocityFactor: 1 @ 0].
	aPoint x < 0 ifTrue: [self collidedWith: aMorph mySide: #left otherSide: #right velocityFactor: 0 @ 1].
	aPoint x > 0 ifTrue: [self collidedWith: aMorph mySide: #right otherSide: #left velocityFactor: 0 @ 1].
]

{
	#category : #collisions,
	#'squeak_changestamp' : 'mad 12/30/2024 23:46'
}
SPPlayer >> collideWithPlayer: aPlayer velocity: aPoint [
	aPlayer collideWithImmovable: self velocity: aPoint.
]

{
	#category : #collisions,
	#'squeak_changestamp' : 'mad 1/16/2025 18:09'
}
SPPlayer >> collidedWith: aMorph mySide: mySide otherSide: otherSide velocityFactor: aPoint [
	self perform: mySide asSimpleSetter with: (aMorph perform: otherSide).
	(self pushing perform: mySide) add: aMorph.
	(aMorph pushedBy perform: otherSide) add: self.
	self velocity: self velocity * aPoint.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/16/2025 17:43'
}
SPPlayer >> doMovement [
	| currentVelocity |
	self
		addGravity;
		tryJump.
	currentVelocity := self velocity + self inputVelocity.
	self
		clearPushing;
		moveBy: currentVelocity x @ 0;
		moveBy: 0 @ currentVelocity y.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:59'
}
SPPlayer >> gmKeyHandler [
	^ self game gmKeyHandler
]

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 12/5/2024 18:28'
}
SPPlayer >> gravity [
	^ 2
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 1/16/2025 18:07'
}
SPPlayer >> initialize [
	super initialize.
	self
		color: Color transparent;
		pushing: (SPSides withAll: [Set new]);
		velocity: 0 @ 0.
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
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/16/2025 18:11'
}
SPPlayer >> isStanding [
	^ self pushing bottom notEmpty
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
	#'squeak_changestamp' : 'mad 12/30/2024 23:44'
}
SPPlayer >> moveBy: aPoint [
	self position: self position + aPoint.
	(self gmCollisionHandler morphsCollidingWith: self) do: [:each | each collideWithPlayer: self velocity: aPoint].
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
	#'squeak_changestamp' : 'mad 1/16/2025 17:45'
}
SPPlayer >> pushing [
	^ pushing
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:45'
}
SPPlayer >> pushing: anObject [
	pushing := anObject
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
	#'squeak_changestamp' : 'mad 1/16/2025 18:10'
}
SPPlayer >> step [
	self doMovement.
	self sprite isJumping: self isStanding not.
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'mad 12/31/2024 00:49'
}
SPPlayer >> stepTime [
	^ 20
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
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 18:06'
}
SPPlayer >> velocity [
	^ velocity
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 18:06'
}
SPPlayer >> velocity: aPoint [
	velocity := aPoint
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
