Extension { #name : #GtAlgorithmerForEachBlock }

{ #category : #'*GToolkit-Algorithmer-UI' }
GtAlgorithmerForEachBlock >> asAlgorithmerBlockViewModel [
	^ GtAlgorithmerForEachBlockViewModel new
		block: self;
		loopBlock: self loopBlock
]
