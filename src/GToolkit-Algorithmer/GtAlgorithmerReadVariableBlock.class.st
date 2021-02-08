"
Read variable with a name and push it on the heap
"
Class {
	#name : #GtAlgorithmerReadVariableBlock,
	#superclass : #GtAlgorithmerVariableBlock,
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerReadVariableBlock >> accept: aVisitor [
	^ aVisitor visitVariableBlock: self
]

{ #category : #'api - block' }
GtAlgorithmerReadVariableBlock >> blockName [
	^ variableKey printString
]

{ #category : #'as yet unclassified' }
GtAlgorithmerReadVariableBlock >> runBlockOn: anAlgorithmer [
	anAlgorithmer pushHeap: (anAlgorithmer readVariable: variableKey)
]
