"
Pop the heap and store it in a variable
"
Class {
	#name : #GtAlgorithmerWriteVariableBlock,
	#superclass : #GtAlgorithmerVariableBlock,
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #'api - block' }
GtAlgorithmerWriteVariableBlock >> blockName [
	^ String streamContents: [ :aStream |
		aStream
			nextPutAll: 'write';
			space;
			nextPutAll: variableKey name ]
]

{ #category : #'api - algorithmer' }
GtAlgorithmerWriteVariableBlock >> runBlockOn: anAlgorithmer [
	anAlgorithmer writeVariable: variableKey value: anAlgorithmer popHeap
]
