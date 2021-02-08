Extension { #name : #GtAlgorithmerWhileBlock }

{ #category : #'*GToolkit-Algorithmer-UI' }
GtAlgorithmerWhileBlock >> asAlgorithmerBlockViewModel [
	^ GtAlgorithmerWhileBlockViewModel new
		block: self;
		conditionBlock: self condition;
		loopBlock: self loop
]
