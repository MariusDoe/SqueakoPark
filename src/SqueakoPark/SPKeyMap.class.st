Class {
	#name : #SPKeyMap,
	#superclass : #Object,
	#instVars : [
		'left',
		'right',
		'down',
		'jump'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mad 1/23/2025 14:29'
}
SPKeyMap class >> arrowKeys [
	^ self new
		jump: Character arrowUp;
		left: Character arrowLeft;
		down: Character arrowDown;
		right: Character arrowRight;
		yourself
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mad 1/23/2025 14:29'
}
SPKeyMap class >> wasd [
	^ self new
		jump: $w;
		left: $a;
		down: $s;
		right: $d;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:28'
}
SPKeyMap >> down [
	^ down
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:28'
}
SPKeyMap >> down: aCharacter [
	down := aCharacter
]

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
