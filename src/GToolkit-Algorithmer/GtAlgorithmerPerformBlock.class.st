Class {
	#name : #GtAlgorithmerPerformBlock,
	#superclass : #GtAlgorithmerBytecodeBlock,
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #'api - algorithmer' }
GtAlgorithmerPerformBlock >> runBlockOn: anAlgorithmer [
	| aReceiver aSelector theArguments aResult |
	
	aReceiver := anAlgorithmer popHeap.
	aSelector := anAlgorithmer popHeap.
	
	theArguments := Stack new.
	(1 to: aSelector numArgs)
		do: [ :i | theArguments push: anAlgorithmer popHeap ].
	
	aResult := aReceiver perform: aSelector withArguments: theArguments asArray.
	anAlgorithmer pushHeap: aResult
]
