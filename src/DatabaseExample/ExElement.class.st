Class {
	#name : #ExElement,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #DatabaseExample
}

{ #category : #'instance creation' }
ExElement class >> on: aString [
	^ self new
		name: aString;
		yourself 
]

{ #category : #converting }
ExElement >> asShape [
	^ { self label } asShape
		padding: 5;
		model: self;
		yourself
		
]

{ #category : #accessing }
ExElement >> border [
	^ RSBorder new color: Color black; joinMiter
]

{ #category : #converting }
ExElement >> label [
	^ RSLabel new
		text: name;
		color: Color black;
		yourself
]

{ #category : #accessing }
ExElement >> name [

	^ name
]

{ #category : #accessing }
ExElement >> name: anObject [

	name := anObject
]
