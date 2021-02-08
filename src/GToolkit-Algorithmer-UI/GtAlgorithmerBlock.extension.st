Extension { #name : #GtAlgorithmerBlock }

{ #category : #'*GToolkit-Algorithmer-UI' }
GtAlgorithmerBlock >> asAlgorithmerBlockViewModel [
	^ GtAlgorithmerBlockViewModel new block: self
]

{ #category : #'*GToolkit-Algorithmer-UI' }
GtAlgorithmerBlock >> gtLiveFor: aView [
	<gtView>

	^ aView explicit
		title: 'Live';
		priority: 1;
		stencil: [
			| aBlockViewModel aBlockView |
			aBlockViewModel := self asAlgorithmerBlockViewModel.
			aBlockView := aBlockViewModel algorithmerBlockElementClass new.
			aBlockView algorithmerBlockViewModel: aBlockViewModel.
			aBlockView ]
]
