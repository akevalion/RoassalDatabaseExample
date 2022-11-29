Class {
	#name : #ExSimpleBox,
	#superclass : #ExElement,
	#category : #DatabaseExample
}

{ #category : #converting }
ExSimpleBox >> asShape [
	^ super asShape
		border: self border;
		color: Color white;
		yourself
]
