Class {
	#name : #SPWall,
	#superclass : #SPCollisionMorph,
	#category : #'SqueakoPark-Core'
}

{
	#category : #collisions,
	#'squeak_changestamp' : 'mad 1/16/2025 19:06'
}
SPWall >> handleCollision: aCollisionInfo [
	aCollisionInfo moving hitImmovable: aCollisionInfo.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'mad 12/5/2024 19:08'
}
SPWall >> initialize [
	super initialize.
	self color: Color red.
]
