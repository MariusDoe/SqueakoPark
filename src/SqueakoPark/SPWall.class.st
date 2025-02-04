Class {
	#name : #SPWall,
	#superclass : #SPSolid,
	#category : #'SqueakoPark-Core'
}

{
	#category : #carrying,
	#'squeak_changestamp' : 'mad 2/4/2025 01:12'
}
SPWall >> canBeCarriedTowards: aSymbol [
	^ false
]

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 1/31/2025 12:11'
}
SPWall >> canBeMovedTowards: aSymbol [
	^ false
]

{
	#category : #pushing,
	#'squeak_changestamp' : 'mad 2/1/2025 22:59'
}
SPWall >> canBePushedTowards: aSymbol [
	^ false
]

{
	#category : #colliders,
	#'squeak_changestamp' : 'mad 2/3/2025 22:52'
}
SPWall >> collidesWith: aCollider [
	^ (super collidesWith: aCollider) and: [aCollider isWall not]
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'mad 2/1/2025 22:18'
}
SPWall >> drawOn: aCanvas [
	| shortCut longCut left top |
	shortCut := 3.
	longCut := 3 * shortCut.
	left := (self bounds insetBy: 0 @ longCut) withWidth: shortCut.
	top := (self bounds insetBy: longCut @ 0) withHeight: shortCut.
	{self bounds insetBy: shortCut.
	left. left translateBy: (self width - shortCut) @ 0.
	top. top translateBy: 0 @ (self height - shortCut)}
		do: [:each | aCanvas fillRectangle: each color: self color].
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
