Class {
	#name : #SPSinglePressButton,
	#superclass : #SPButton,
	#category : #'SqueakoPark-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'mad 2/3/2025 22:39'
}
SPSinglePressButton >> isPressed: aBoolean [
	self isPressed = true ifTrue: [^ self]. "might be nil"
	super isPressed: aBoolean.
]
