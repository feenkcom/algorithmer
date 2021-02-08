Class {
	#name : #GtAlgorithmerVariableHiddenBlockKey,
	#superclass : #GtAlgorithmerVariableKey,
	#instVars : [
		'block',
		'name'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #comparing }
GtAlgorithmerVariableHiddenBlockKey >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ block = anObject block and: [ name = anObject name ]
]

{ #category : #accessing }
GtAlgorithmerVariableHiddenBlockKey >> block [
	^ block
]

{ #category : #accessing }
GtAlgorithmerVariableHiddenBlockKey >> block: anObject [
	block := anObject
]

{ #category : #comparing }
GtAlgorithmerVariableHiddenBlockKey >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ block hash bitXor: name hash
]

{ #category : #accessing }
GtAlgorithmerVariableHiddenBlockKey >> name [
	^ name
]

{ #category : #accessing }
GtAlgorithmerVariableHiddenBlockKey >> name: anObject [
	name := anObject
]

{ #category : #printing }
GtAlgorithmerVariableHiddenBlockKey >> printOn: aStream [
	aStream
		nextPutAll: '(internal) ';
		print: self name
]
