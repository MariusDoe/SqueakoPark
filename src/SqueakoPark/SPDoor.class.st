Class {
	#name : #SPDoor,
	#superclass : #SPCollisionMorph,
	#instVars : [
		'isOpen'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 1/23/2025 09:45'
}
SPDoor >> close [
	self isOpen: false.
	self color: Color brown.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 1/23/2025 09:46'
}
SPDoor >> handleCollision: aCollisionInfo [
	aCollisionInfo moving isPlayer ifFalse: [^ self].
	aCollisionInfo moving tryOpen: self.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 09:46'
}
SPDoor >> initialize [
	super initialize.
	self close.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OB 1/16/2025 18:47'
}
SPDoor >> isOpen [
	^isOpen
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OB 1/16/2025 18:48'
}
SPDoor >> isOpen: aBoolean [
	^ isOpen:= aBoolean.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 1/23/2025 09:45'
}
SPDoor >> open [
	self isOpen: true.
	self color: Color lightGray.
]
