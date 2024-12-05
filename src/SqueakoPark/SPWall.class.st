Class {
	#name : #SPWall,
	#superclass : #Morph,
	#category : #'SqueakoPark-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 17:55'
}
SPWall >> carry: anObject [
	"do nothing"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 12/5/2024 17:46'
}
SPWall >> collideWith: anObject velocity: aPoint [
	^ anObject collideWithWall: self velocity: aPoint
]
