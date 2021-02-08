Class {
	#name : #GtAlgorithmerVariableVisibleNamedKey,
	#superclass : #GtAlgorithmerVariableKey,
	#instVars : [
		'name'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #comparing }
GtAlgorithmerVariableVisibleNamedKey >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ name = anObject name
]

{ #category : #comparing }
GtAlgorithmerVariableVisibleNamedKey >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ name hash
]

{ #category : #accessing }
GtAlgorithmerVariableVisibleNamedKey >> name [
	^ name
]

{ #category : #accessing }
GtAlgorithmerVariableVisibleNamedKey >> name: aSymbol [
	name := aSymbol asSymbol
]

{ #category : #printing }
GtAlgorithmerVariableVisibleNamedKey >> printOn: aStream [
	aStream nextPutAll: self name
]
