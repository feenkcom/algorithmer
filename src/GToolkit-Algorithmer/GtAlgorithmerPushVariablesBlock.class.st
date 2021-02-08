Class {
	#name : #GtAlgorithmerPushVariablesBlock,
	#superclass : #GtAlgorithmerBytecodeBlock,
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #'api - algorithmer' }
GtAlgorithmerPushVariablesBlock >> runBlockOn: anAlgorithmer [
	anAlgorithmer popVariables
]
