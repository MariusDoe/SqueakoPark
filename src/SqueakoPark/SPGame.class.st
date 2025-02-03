Class {
	#name : #SPGame,
	#superclass : #Morph,
	#instVars : [
		'colliders'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:26'
}
SPGame >> colliders [
	^ colliders
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:26'
}
SPGame >> colliders: anObject [
	colliders := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:47'
}
SPGame >> collidersOverlapping: aRectangle [
	^ self colliders select: [:each | each bounds intersects: aRectangle]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/2/2025 23:50'
}
SPGame >> defaultColor [
	^ Color white
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/24/2025 15:24'
}
SPGame >> doMovement [
	self colliders do: #doMovement.
	[self solids anySatisfy: [:each | each movesDuring: [each tryPush]]] whileTrue.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:52'
}
SPGame >> doPhysics [
	self
		preMovement;
		doMovement;
		postMovement.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 18:03'
}
SPGame >> gmKeyHandler [
	^ self eventHandler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 00:02'
}
SPGame >> initialize [
	super initialize.
	self
		gmRegisterToKeyHandler;
		colliders: OrderedCollection new.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:21'
}
SPGame >> postMovement [
	self colliders do: #postMovement.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:52'
}
SPGame >> preMovement [
	self colliders do: #preMovement.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/24/2025 15:23'
}
SPGame >> solids [
	^ self colliders select: #isSolid
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:22'
}
SPGame >> spawn: aCollider [
	aCollider game: self.
	self colliders add: aCollider.
	self addMorph: aCollider.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 13:02'
}
SPGame >> step [
	self doPhysics.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:22'
}
SPGame >> stepTime [
	^ 20
]
