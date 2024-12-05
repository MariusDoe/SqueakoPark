Class {
	#name : #SPKey,
	#superclass : #SPCollisionMorph,
	#instVars : [
		'holder',
		'sprite'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:04'
}
SPKey >> collideWith: aMorph velocity: aPoint [
	^ aMorph collideWithKey: self velocity: aPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:00'
}
SPKey >> holder [
	^ holder
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:00'
}
SPKey >> holder: anObject [
	holder := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:04'
}
SPKey >> initialize [
	super initialize.
	self
		holder: nil;
		color: Color transparent;
		loadSprite.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:14'
}
SPKey >> loadSprite [
	self sprite: (((GitAssetLoader for: 'SqueakoPark') loadForm: 'assets/key.png') magnifyBy: 0.1) asMorph.
	self extent: self sprite extent.
	self addMorphCentered: self sprite.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:16'
}
SPKey >> moveToHolder [
	self holder ifNil: [^ self].
	((self center dist: self holder center) < 75) ifTrue: [^ self].
	self center: (self center interpolateTo: self holder center at: 0.05).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:04'
}
SPKey >> sprite [
	^ sprite
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:04'
}
SPKey >> sprite: anObject [
	sprite := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:14'
}
SPKey >> step [
	self moveToHolder.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 19:00'
}
SPKey >> stepTime [
	^ 1
]
