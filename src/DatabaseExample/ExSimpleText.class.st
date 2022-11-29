Class {
	#name : #ExSimpleText,
	#superclass : #ExElement,
	#category : #DatabaseExample
}

{ #category : #converting }
ExSimpleText >> asShape [
	^ super asShape
		padding: (Margin left: 0 top: 30 right: 0 bottom: 0);
		yourself
]
