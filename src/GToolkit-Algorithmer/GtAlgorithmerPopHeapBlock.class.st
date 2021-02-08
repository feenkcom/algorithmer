Class {
	#name : #GtAlgorithmerPopHeapBlock,
	#superclass : #GtAlgorithmerBytecodeBlock,
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #'api - algorithmer' }
GtAlgorithmerPopHeapBlock >> runBlockOn: anAlgorithmer [
	^ anAlgorithmer popHeap
]
