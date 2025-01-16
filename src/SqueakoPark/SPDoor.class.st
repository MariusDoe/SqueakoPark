Class {
	#name : #SPDoor,
	#superclass : #SPCollisionMorph,
	#instVars : [
		'isLocked'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'OB 1/16/2025 18:30'
}
SPDoor >> collideWithPlayer: aPlayer [
	
	Transcript show: 'key: ' , aPlayer key
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
	#'squeak_changestamp' : 'OB 1/16/2025 18:40'
}
SPDoor >> isLocked [
	^ isLocked
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OB 1/16/2025 18:40'
}
SPDoor >> isLocked: anObject [
	isLocked := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'OB 1/16/2025 18:40'
}
SPDoor >> lock [

	self isLocked: true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'OB 1/16/2025 18:41'
}
SPDoor >> unlock [

	 self isLocked: false.
	Transcript show: 'Door unlocked'.
	self color: Color transparent.
]
