Extension { #name : #GtAlgorithmerSequenceBlock }

{ #category : #'*GToolkit-Algorithmer-UI' }
GtAlgorithmerSequenceBlock >> asAlgorithmerBlockViewModel [
	^ GtAlgorithmerSequenceBlockViewModel new
		block: self;
		blocks: self blocks
]
