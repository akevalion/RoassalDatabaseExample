Class {
	#name : #ExBasicText,
	#superclass : #ExElement,
	#category : #DatabaseExample
}

{ #category : #converting }
ExBasicText >> asShape [
	^ super asShape
		height: 10;
		yourself
]
