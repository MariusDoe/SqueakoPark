Class {
	#name : #SPGame,
	#superclass : #Morph,
	#instVars : [
		'gmCollisionHandler',
		'gmKeyHandler'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:59'
}
SPGame >> gmCollisionHandler [
	^ gmCollisionHandler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:59'
}
SPGame >> gmCollisionHandler: anObject [
	gmCollisionHandler := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:59'
}
SPGame >> gmKeyHandler [
	^ gmKeyHandler
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 12/5/2024 17:59'
}
SPGame >> gmKeyHandler: anObject [
	gmKeyHandler := anObject
]
