Class {
	#name : #SPWall,
	#superclass : #SPSolid,
	#category : #'SqueakoPark-Core'
}

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 1/31/2025 12:11'
}
SPWall >> canBeMovedTowards: aSymbol [
	^ false
]

{
	#category : #pushing,
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

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 1/31/2025 12:49'
}
SPWall >> isWall [
	^ true
]

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 1/31/2025 12:15'
}
SPWall >> tryPushTowards: aSymbol [
	^ self tryMoveTowards: aSymbol
]
