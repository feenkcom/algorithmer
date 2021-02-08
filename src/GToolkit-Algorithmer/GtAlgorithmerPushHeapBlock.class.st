Class {
	#name : #GtAlgorithmerPushHeapBlock,
	#superclass : #GtAlgorithmerBytecodeBlock,
	#instVars : [
		'object'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerPushHeapBlock >> accept: aVisitor [
	^ aVisitor visitPushHeapBlock: self
]

{ #category : #'api - block' }
GtAlgorithmerPushHeapBlock >> blockName [
	^ self object gtDisplayText
]

{ #category : #accessing }
GtAlgorithmerPushHeapBlock >> object [
	^ object
]

{ #category : #accessing }
GtAlgorithmerPushHeapBlock >> object: anObject [
	object := anObject
]

{ #category : #'api - algorithmer' }
GtAlgorithmerPushHeapBlock >> runBlockOn: anAlgorithmer [
	anAlgorithmer pushHeap: self object
]
