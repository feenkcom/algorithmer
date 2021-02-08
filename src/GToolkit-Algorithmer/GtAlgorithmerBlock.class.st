Class {
	#name : #GtAlgorithmerBlock,
	#superclass : #Object,
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerBlock >> accept: aVisitor [
]

{ #category : #'api - algorithmer' }
GtAlgorithmerBlock >> backOn: anAlgorithmer after: aPreviousTopBlock [
	"Is sent when aPreviousTopBlock is popped from the stack and I am now the top block on the stack"
]

{ #category : #'api - block' }
GtAlgorithmerBlock >> blockName [
	^ self class name
]

{ #category : #testing }
GtAlgorithmerBlock >> isVariableDefineBlock [
	^ false
]

{ #category : #'api - algorithmer' }
GtAlgorithmerBlock >> nextBlockOn: anAlgorithmer [
	^ nil
]

{ #category : #'api - algorithmer' }
GtAlgorithmerBlock >> poppedOn: aSolver [
]

{ #category : #'api - algorithmer' }
GtAlgorithmerBlock >> pushedOn: aSolver [
]

{ #category : #'api - algorithmer' }
GtAlgorithmerBlock >> runBlockOn: anAlgorithmer [
	self subclassResponsibility
]
