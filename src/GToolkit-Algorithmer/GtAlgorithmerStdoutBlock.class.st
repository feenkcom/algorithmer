Class {
	#name : #GtAlgorithmerStdoutBlock,
	#superclass : #GtAlgorithmerBytecodeBlock,
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #'api - algorithmer' }
GtAlgorithmerStdoutBlock >> runBlockOn: anAlgorithmer [
	| aValue |

	aValue := anAlgorithmer popHeap.
	NonInteractiveTranscript stdout print: aValue
]
