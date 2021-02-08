Class {
	#name : #GtAlgorithmerScopeBlock,
	#superclass : #GtAlgorithmerSequenceBlock,
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #'api - block' }
GtAlgorithmerScopeBlock >> blockName [
	^ 'Scope'
]

{ #category : #'api - algorithmer' }
GtAlgorithmerScopeBlock >> poppedOn: anAlgorithmer [
	super poppedOn: anAlgorithmer.
	
	anAlgorithmer popVariables
]

{ #category : #'api - algorithmer' }
GtAlgorithmerScopeBlock >> pushedOn: anAlgorithmer [
	super pushedOn: anAlgorithmer.
	
	anAlgorithmer pushVariables
]
