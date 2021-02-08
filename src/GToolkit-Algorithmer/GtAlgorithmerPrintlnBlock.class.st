Class {
	#name : #GtAlgorithmerPrintlnBlock,
	#superclass : #GtAlgorithmerCompositeBlock,
	#instVars : [
		'valueBlock',
		'blocks'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerPrintlnBlock >> accept: aVisitor [
	^ aVisitor visitPrintlnBlock: self
]

{ #category : #initialization }
GtAlgorithmerPrintlnBlock >> block: aValueBlock [
	valueBlock := aValueBlock.
	
	blocks := { 
		valueBlock.
		GtAlgorithmerStdoutBlock new.
		GtAlgorithmerPushHeapBlock new object: String cr.
		GtAlgorithmerStdoutBlock new.
	}
]

{ #category : #'api - block' }
GtAlgorithmerPrintlnBlock >> blockName [
	^ 'println ', self valueBlock blockName
]

{ #category : #accessing }
GtAlgorithmerPrintlnBlock >> blocks [
	^ blocks
]

{ #category : #initialization }
GtAlgorithmerPrintlnBlock >> value: anObject [
	self block: (GtAlgorithmerPushHeapBlock new object: anObject)
]

{ #category : #accessing }
GtAlgorithmerPrintlnBlock >> valueBlock [
	^ valueBlock
]

{ #category : #initialization }
GtAlgorithmerPrintlnBlock >> variable: aVariableName [
	self block: (GtAlgorithmerReadVariableBlock new name: aVariableName)
]
