Class {
	#name : #GtAlgorithmerOperatorBlock,
	#superclass : #GtAlgorithmerCompositeBlock,
	#instVars : [
		'blocks',
		'leftOperand',
		'rightOperand'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerOperatorBlock >> accept: aVisitor [
	^ aVisitor visitOperatorBlock: self
]

{ #category : #'api - block' }
GtAlgorithmerOperatorBlock >> blockName [
	^ self leftOperand blockName, ' ', self operator, ' ', self rightOperand blockName
]

{ #category : #accessing }
GtAlgorithmerOperatorBlock >> blocks [
	^ blocks
]

{ #category : #initialization }
GtAlgorithmerOperatorBlock >> left: aLeftBlock right: aRightBlock [
	leftOperand := aLeftBlock.
	rightOperand := aRightBlock.
	
	blocks := { 
		rightOperand.
		(GtAlgorithmerPushHeapBlock new object: self operator).
		leftOperand.
		GtAlgorithmerPerformBlock new
	}
]

{ #category : #initialization }
GtAlgorithmerOperatorBlock >> left: aLeftBlock rightValue: aRightValue [
	self
		left: aLeftBlock
		right: (GtAlgorithmerPushHeapBlock new object: aRightValue)
]

{ #category : #initialization }
GtAlgorithmerOperatorBlock >> left: aLeftBlock rightVariable: aRightVariableName [
	self
		left: aLeftBlock
		right: (GtAlgorithmerReadVariableBlock new name: aRightVariableName)
]

{ #category : #accessing }
GtAlgorithmerOperatorBlock >> leftOperand [
	^ leftOperand
]

{ #category : #initialization }
GtAlgorithmerOperatorBlock >> leftVariable: aLeftVariableName right: aRightBlock [
	self
		left: (GtAlgorithmerReadVariableBlock new name: aLeftVariableName)
		right: aRightBlock
]

{ #category : #initialization }
GtAlgorithmerOperatorBlock >> leftVariable: aLeftVariableName rightValue: aRightValue [
	self
		left: (GtAlgorithmerReadVariableBlock new name: aLeftVariableName)
		right: (GtAlgorithmerPushHeapBlock new object: aRightValue)
]

{ #category : #initialization }
GtAlgorithmerOperatorBlock >> leftVariable: aLeftVariableName rightVariable: aRightVariableName [
	self
		left: (GtAlgorithmerReadVariableBlock new name: aLeftVariableName)
		right: (GtAlgorithmerReadVariableBlock new name: aRightVariableName)
]

{ #category : #generated }
GtAlgorithmerOperatorBlock >> operator [
	<return: #Symbol>

	^ self subclassResponsibility
]

{ #category : #accessing }
GtAlgorithmerOperatorBlock >> rightOperand [
	^ rightOperand
]
