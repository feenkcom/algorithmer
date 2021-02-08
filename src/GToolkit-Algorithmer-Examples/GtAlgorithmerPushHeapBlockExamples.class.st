Class {
	#name : #GtAlgorithmerPushHeapBlockExamples,
	#superclass : #Object,
	#category : #'GToolkit-Algorithmer-Examples-Blocks'
}

{ #category : #examples }
GtAlgorithmerPushHeapBlockExamples >> pushHeapBlock [
	<gtExample>
	| pushHeapBlock |
	
	pushHeapBlock := GtAlgorithmerPushHeapBlock new
		object: 42.
		
	self assert: pushHeapBlock object equals: 42.

	^ pushHeapBlock
]

{ #category : #examples }
GtAlgorithmerPushHeapBlockExamples >> pushHeapBlockView [
	<gtExample>
	| pushHeapBlockViewModel pushHeapBlockElement |
	
	pushHeapBlockViewModel := self pushHeapBlockViewModel.
	pushHeapBlockElement := pushHeapBlockViewModel algorithmerBlockElementClass new.
	pushHeapBlockElement algorithmerBlockViewModel: pushHeapBlockViewModel.
	
	^ pushHeapBlockElement
]

{ #category : #examples }
GtAlgorithmerPushHeapBlockExamples >> pushHeapBlockViewModel [
	<gtExample>
	| pushHeapBlock pushHeapBlockViewModel |
	
	pushHeapBlock := self pushHeapBlock.
	pushHeapBlockViewModel := pushHeapBlock asAlgorithmerBlockViewModel.
	
	self assert: pushHeapBlockViewModel block equals: pushHeapBlock.
	
	^ pushHeapBlockViewModel
]
