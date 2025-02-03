Class {
	#name : #SPFallingSolid,
	#superclass : #SPSolid,
	#category : #'SqueakoPark-Core'
}

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 2/3/2025 00:45'
}
SPFallingSolid class >> isAbstract [
	^ self == SPFallingSolid
]

{
	#category : #movement,
	#'squeak_changestamp' : 'mad 1/24/2025 15:22'
}
SPFallingSolid >> addForces [
	self addGravity.
]

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/16/2025 18:40'
}
SPFallingSolid >> addGravity [
	self velocity: self velocity + (0 @ self gravity).
]

{
	#category : #physics,
	#'squeak_changestamp' : 'mad 1/16/2025 18:43'
}
SPFallingSolid >> gravity [
	^ 2
]

{
	#category : #testing,
	#'squeak_changestamp' : 'mad 1/23/2025 14:37'
}
SPFallingSolid >> isStanding [
	^ (self pushing at: #bottom) notEmpty
]
