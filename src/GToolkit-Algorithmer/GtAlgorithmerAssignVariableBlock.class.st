Class {
	#name : #GtAlgorithmerAssignVariableBlock,
	#superclass : #GtAlgorithmerCompositeBlock,
	#instVars : [
		'blocks',
		'name',
		'valueBlock'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerAssignVariableBlock >> accept: aVisitor [
	^ aVisitor visitAssignVariableBlock: self
]

{ #category : #'api - block' }
GtAlgorithmerAssignVariableBlock >> blockName [
	^ String streamContents: [ :aStream |
		aStream
			nextPutAll: name;
			space;
			nextPutAll: ':=';
			space;
			nextPutAll: valueBlock blockName ]
]

{ #category : #accessing }
GtAlgorithmerAssignVariableBlock >> blocks [
	^ blocks
]

{ #category : #accessing }
GtAlgorithmerAssignVariableBlock >> name [
	^ name
]

{ #category : #'instance creation' }
GtAlgorithmerAssignVariableBlock >> name: aVariableName block: anAlgorithmerBlock [
	name := aVariableName.
	valueBlock := anAlgorithmerBlock.

	blocks := { 
		anAlgorithmerBlock.
		GtAlgorithmerWriteVariableBlock new name: aVariableName.
	}
]

{ #category : #'instance creation' }
GtAlgorithmerAssignVariableBlock >> name: aVariableName value: anObject [
	self
		name: aVariableName
		block: (GtAlgorithmerPushHeapBlock new object: anObject)
]

{ #category : #accessing }
GtAlgorithmerAssignVariableBlock >> valueBlock [
	^ valueBlock
]
