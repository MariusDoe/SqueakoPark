Class {
	#name : #SPRoundedRectangle,
	#superclass : #Morph,
	#category : #'SqueakoPark-Core'
}

{
	#category : #drawing,
	#'squeak_changestamp' : 'mad 2/4/2025 00:17'
}
SPRoundedRectangle >> drawOn: aCanvas [
	| thickness offset reverseOffset squares left top rects |
	thickness := 6.
	offset := thickness / 2.
	reverseOffset := -3 * offset.
	squares := {
		self topLeft + (offset @ offset).
		self topRight + (reverseOffset @ offset).
		self bottomLeft + (offset @ reverseOffset).
		self bottomRight + (reverseOffset @ reverseOffset)}
			collect: [:each | each extent: thickness asPoint].
	left := (self bounds insetBy: 0 @ thickness) withWidth: thickness.
	top := (self bounds insetBy: thickness @ 0) withHeight: thickness.
	rects := {
		left.
		left translateBy: (self width - thickness) @ 0.
		top.
		top translateBy: 0 @ (self height - thickness)}.
	squares, rects do: [:each | aCanvas fillRectangle: each color: self color].
]
