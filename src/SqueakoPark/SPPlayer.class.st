Class {
	#name : #SPPlayer,
	#superclass : #SPCollisionMorph,
	#instVars : [
		'key',
		'verticalVelocity',
		'leftKey',
		'rightKey',
		'jumpKey',
		'platform',
		'carried',
		'sprite'
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
	#'squeak_changestamp' : 'mad 12/5/2024 18:27'
}
SPPlayer >> clearPlatform [
	self platform ifNil: [^ self].
	self platform uncarry: self.
	self platform: nil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 18:09'
}
SPPlayer >> collideWith: aMorph velocity: aPoint [
	^ aMorph collideWithPlayer: self velocity: aPoint
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 18:30'
}
SPPlayer >> collideWithImmovable: aMorph velocity: aPoint [
	aPoint y > 0 ifTrue: [self bottom: aMorph top. self verticalVelocity: 0. self standOn: aMorph].
	aPoint y < 0 ifTrue: [self top: aMorph bottom. self verticalVelocity: 0].
	aPoint x < 0 ifTrue: [self left: aMorph right].
	aPoint x > 0 ifTrue: [self right: aMorph left].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 19:05'
}
SPPlayer >> collideWithKey: aKey velocity: aPoint [
	aKey holder: self.
	self key: aKey.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 18:08'
}
SPPlayer >> collideWithPlayer: aPlayer velocity: aPoint [
	self collideWithImmovable: aPlayer velocity: aPoint.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 18:09'
}
SPPlayer >> collideWithWall: aWall velocity: aPoint [
	self collideWithImmovable: aWall velocity: aPoint.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/31/2024 00:40'
}
SPPlayer >> doMovement [
	self
		moveBy: self horizontalVelocity @ 0;
		tryJump;
		verticalVelocity: self verticalVelocity + self gravity;
		clearPlatform;
		moveBy: 0 @ self verticalVelocity.
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
	#'squeak_changestamp' : 'mad 12/5/2024 18:28'
}
SPPlayer >> gravity [
	^ 2
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/31/2024 01:38'
}
SPPlayer >> horizontalDirection [
	| direction |
	direction :=
		(self isKeyPressed: self rightKey) asInteger -
		(self isKeyPressed: self leftKey) asInteger.
	self sprite direction: direction.
	^ direction
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 18:30'
}
SPPlayer >> horizontalSpeed [
	^ 10
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/30/2024 23:39'
}
SPPlayer >> horizontalVelocity [
	^ self horizontalDirection * self horizontalSpeed
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 19:07'
}
SPPlayer >> initialize [
	super initialize.
	self
		color: Color transparent;
		platform: nil;
		carried: OrderedCollection new;
		verticalVelocity: 0.
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
	#'squeak_changestamp' : 'mad 12/5/2024 18:30'
}
SPPlayer >> jumpVelocity [
	^ -20
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
	#'squeak_changestamp' : 'mad 12/31/2024 00:14'
}
SPPlayer >> step [
	self doMovement.
	self sprite isJumping: self platform isNil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 18:25'
}
SPPlayer >> stepTime [
	^ 1
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/30/2024 23:40'
}
SPPlayer >> tryJump [
	(self canJump and: [self isKeyPressed: self jumpKey]) ifFalse: [^ self].
	self verticalVelocity: self jumpVelocity.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 18:09'
}
SPPlayer >> uncarry: aMorph [
	self carried remove: aMorph ifAbsent: [].
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
