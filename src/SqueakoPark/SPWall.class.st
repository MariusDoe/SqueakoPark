Class {
	#name : #SPWall,
	#superclass : #SPSolid,
	#category : #'SqueakoPark-Core'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'mad 1/23/2025 17:57'
}
SPWall >> canBePushed: aPushRequest [
	^ false
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 12/5/2024 19:08'
}
SPWall >> initialize [
	super initialize.
	self color: Color red.
]
