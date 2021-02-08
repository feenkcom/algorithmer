Class {
	#name : #GtAlgorithmerForEachBlock,
	#superclass : #GtAlgorithmerCompositeBlock,
	#instVars : [
		'blocks',
		'eachName',
		'collectionName',
		'loopBlock'
	],
	#category : #'GToolkit-Algorithmer-Core'
}

{ #category : #accessing }
GtAlgorithmerForEachBlock >> blocks [
	^ blocks
]

{ #category : #accessing }
GtAlgorithmerForEachBlock >> collectionName [
	^ collectionName
]

{ #category : #accessing }
GtAlgorithmerForEachBlock >> collectionName: anObject [
	collectionName := anObject
]

{ #category : #initialization }
GtAlgorithmerForEachBlock >> each: anEachName in: aCollectionName do: aLoopBlock [
	eachName := anEachName.
	collectionName := aCollectionName.
	loopBlock := aLoopBlock.

	blocks := {
		GtAlgorithmerScopeBlock new blocks: { 
			GtAlgorithmerPushHeapBlock new object: 0.
			GtAlgorithmerWriteVariableBlock new block: self name: 'loop_index'.

			GtAlgorithmerWhileBlock new
			condition: (GtAlgorithmerSequenceBlock new
				blocks: {
					GtAlgorithmerMessageSendBlock new
						receiver: aCollectionName
						selector: #size.
					GtAlgorithmerPushHeapBlock new object: #<.
					GtAlgorithmerReadVariableBlock new block: self name: 'loop_index'.
					GtAlgorithmerPerformBlock new.
				});
			loop: (GtAlgorithmerSequenceBlock new blocks: {
				"Increment loop_index by one"
				GtAlgorithmerPushHeapBlock new object: 1.
				GtAlgorithmerPushHeapBlock new object: #+.
				GtAlgorithmerReadVariableBlock new block: self name: 'loop_index'.
				GtAlgorithmerPerformBlock new.
				GtAlgorithmerWriteVariableBlock new block: self name: 'loop_index'.
				
				GtAlgorithmerReadVariableBlock new block: self name: 'loop_index'.
				GtAlgorithmerPushHeapBlock new object: #at:.
				GtAlgorithmerReadVariableBlock new name: self collectionName.
				GtAlgorithmerPerformBlock new.
				GtAlgorithmerWriteVariableBlock new name: self eachName.
				loopBlock
			})
		}
	}
]

{ #category : #accessing }
GtAlgorithmerForEachBlock >> eachName [
	^ eachName
]

{ #category : #accessing }
GtAlgorithmerForEachBlock >> eachName: anObject [
	eachName := anObject
]

{ #category : #accessing }
GtAlgorithmerForEachBlock >> loopBlock [
	^ loopBlock
]

{ #category : #accessing }
GtAlgorithmerForEachBlock >> loopBlock: anObject [
	loopBlock := anObject
]
