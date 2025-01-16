Class {
	#name : #SPSides,
	#superclass : #Object,
	#instVars : [
		'left',
		'right',
		'top',
		'bottom'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'mad 1/16/2025 18:07'
}
SPSides class >> withAll: aBlock [
	^ self new
		left: aBlock value;
		right: aBlock value;
		top: aBlock value;
		bottom: aBlock value;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 18:00'
}
SPSides >> bottom [
	^ bottom
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 18:00'
}
SPSides >> bottom: anObject [
	bottom := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:20'
}
SPSides >> left [
	^ left
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:20'
}
SPSides >> left: anObject [
	left := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:20'
}
SPSides >> right [
	^ right
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 17:20'
}
SPSides >> right: anObject [
	right := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 18:00'
}
SPSides >> top [
	^ top
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 1/16/2025 18:00'
}
SPSides >> top: anObject [
	top := anObject
]
