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
	#'squeak_changestamp' : 'OB 1/16/2025 18:53'
}
SPDoor >> collideWithPlayer: aPlayer velocity: aPoint [
	
	^aPlayer collideWithDoor: self. 
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'OB 1/16/2025 18:20'
}
SPDoor >> initialize [
	super initialize.
	self color: Color brown
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
	#'squeak_changestamp' : 'OB 1/16/2025 18:48'
}
SPDoor >> lock [

	self isOpen: false.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'OB 1/16/2025 18:54'
}
SPDoor >> unlock [

	self isOpen: true.
	self color: Color lightGray.
]
