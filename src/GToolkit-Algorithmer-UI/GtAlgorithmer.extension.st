Extension { #name : #GtAlgorithmer }

{ #category : #'*GToolkit-Algorithmer-UI' }
GtAlgorithmer >> gtLiveFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Algorithmer';
		priority: 1;
		stencil: [ 
			| viewModel |
			viewModel := GtAlgorithmerViewModel new
				algorithmer: self.

			GtAlgorithmerElement new
				algorithmerViewModel: viewModel ]
]
