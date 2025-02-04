Class {
	#name : #SPSinglePressButton,
	#superclass : #SPButton,
	#instVars : [
		'onPressed'
	],
	#category : #'SqueakoPark-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/4/2025 01:57'
}
SPSinglePressButton >> isPressed: aBoolean [
	self isPressed = true ifTrue: [^ self]. "might be nil"
	super isPressed: aBoolean.
	self isPressed ifTrue: [self onPressed ifNotNil: #value].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/4/2025 01:57'
}
SPSinglePressButton >> onPressed [
	^ onPressed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/4/2025 01:57'
}
SPSinglePressButton >> onPressed: aBlock [
	onPressed := aBlock
]
