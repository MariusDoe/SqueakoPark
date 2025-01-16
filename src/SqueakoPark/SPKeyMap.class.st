Class {
	#name : #SPKeyMap,
	#superclass : #Object,
	#instVars : [
		'left',
		'right',
		'jump'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:30'
}
SPKeyMap >> jump [
	^ jump
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:30'
}
SPKeyMap >> jump: aCharacter [
	jump := aCharacter
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:30'
}
SPKeyMap >> left [
	^ left
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:30'
}
SPKeyMap >> left: aCharacter [
	left := aCharacter
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:30'
}
SPKeyMap >> right [
	^ right
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:30'
}
SPKeyMap >> right: aCharacter [
	right := aCharacter
]
