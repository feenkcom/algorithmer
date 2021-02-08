Class {
	#name : #GtAlgorithmerCompositeBlock,
	#superclass : #GtAlgorithmerBlock,
	#instVars : [
		'index'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #accessing }
GtAlgorithmerCompositeBlock >> blocks [
	^ self subclassResponsibility
]

{ #category : #initialization }
GtAlgorithmerCompositeBlock >> initialize [
	super initialize.
	
	index := 0.
]

{ #category : #'api - algorithmer' }
GtAlgorithmerCompositeBlock >> nextBlockOn: anAlgorithmer [
	index :=index + 1.
	
	^ index <= self blocks size
		ifTrue: [ anAlgorithmer pushBlock: (self blocks at: index) ]
		ifFalse: [ nil ]
]

{ #category : #'api - algorithmer' }
GtAlgorithmerCompositeBlock >> poppedOn: aSolver [
	index := 0
]

{ #category : #'api - algorithmer' }
GtAlgorithmerCompositeBlock >> pushedOn: aSolver [
	index := 0
]

{ #category : #'api - algorithmer' }
GtAlgorithmerCompositeBlock >> runBlockOn: anAlgorithmer [
]
