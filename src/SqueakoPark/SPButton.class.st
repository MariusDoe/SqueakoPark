Class {
	#name : #SPButton,
	#superclass : #SPCollider,
	#instVars : [
		'isPressed',
		'sprite'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 2/2/2025 22:48'
}
SPButton >> initialize [
	super initialize.
	self
		color: Color transparent;
		sprite: SPAssets releasedButton asMorph;
		extent: self sprite extent;
		addMorphCentered: self sprite.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/2/2025 22:36'
}
SPButton >> isPressed [
	^ isPressed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/2/2025 22:49'
}
SPButton >> isPressed: aBoolean [
	isPressed := aBoolean.
	self updateSprite.
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 2/2/2025 22:35'
}
SPButton >> preMovement [
	super preMovement.
	self isPressed: (self overlappingColliders count: #isSolid) > 0.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/2/2025 22:51'
}
SPButton >> sprite [
	^ sprite
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/2/2025 22:51'
}
SPButton >> sprite: anImageMorph [
	sprite := anImageMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/2/2025 22:49'
}
SPButton >> updateSprite [
	self sprite image: (self isPressed
							ifTrue: [SPAssets pressedButton]
							ifFalse: [SPAssets releasedButton]).
]
