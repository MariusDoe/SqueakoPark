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
	#category : #collisions,
	#'squeak_changestamp' : 'mad 12/30/2024 23:44'
}
SPKey >> collideWithPlayer: aPlayer velocity: aPoint [
	self holder: aPlayer.
	aPlayer key: self.
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
	#category : #initialization,
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
	#category : #initialization,
	#'squeak_changestamp' : 'mad 12/31/2024 01:33'
}
SPKey >> loadSprite [
	self
		sprite: SPAssets key asMorph;
		extent: self sprite extent;
		addMorphCentered: self sprite.
]

{
	#category : #'stepping and presenter',
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
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'mad 12/5/2024 19:14'
}
SPKey >> step [
	self moveToHolder.
]

{
	#category : #'stepping and presenter',
	#'squeak_changestamp' : 'mad 12/5/2024 19:00'
}
SPKey >> stepTime [
	^ 1
]
