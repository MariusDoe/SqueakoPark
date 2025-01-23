Class {
	#name : #SPCollisionInfo,
	#superclass : #Object,
	#instVars : [
		'moving',
		'hit',
		'velocity'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 19:04'
}
SPCollisionInfo >> hit [
	^ hit
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 19:04'
}
SPCollisionInfo >> hit: anObject [
	hit := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 19:04'
}
SPCollisionInfo >> moving [
	^ moving
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 19:04'
}
SPCollisionInfo >> moving: anObject [
	moving := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 19:04'
}
SPCollisionInfo >> velocity [
	^ velocity
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 19:04'
}
SPCollisionInfo >> velocity: aPoint [
	velocity := aPoint
]
