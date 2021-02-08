Class {
	#name : #GtAlgorithmerSequenceBlock,
	#superclass : #GtAlgorithmerCompositeBlock,
	#instVars : [
		'blocks'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #visiting }
GtAlgorithmerSequenceBlock >> accept: aVisitor [
	^ aVisitor visitSequenceBlock: self
]

{ #category : #'api - block' }
GtAlgorithmerSequenceBlock >> blockName [
	^ 'Sequence'
]

{ #category : #accessing }
GtAlgorithmerSequenceBlock >> blocks [
	^ blocks
]

{ #category : #accessing }
GtAlgorithmerSequenceBlock >> blocks: anObject [
	blocks := anObject
]

{ #category : #initialization }
GtAlgorithmerSequenceBlock >> initialize [
	super initialize.

	blocks := #()
]
