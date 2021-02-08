Class {
	#name : #GtAlgorithmerElement,
	#superclass : #BrPager,
	#traits : 'TGtWithAlgorithmerViewModel',
	#classTraits : 'TGtWithAlgorithmerViewModel classTrait',
	#instVars : [
		'heapElement',
		'blocksStackElement',
		'algorithmFlow',
		'toolbar',
		'variablesElement',
		'pagerTabs'
	],
	#category : #'GToolkit-Algorithmer-UI-Views'
}

{ #category : #initialization }
GtAlgorithmerElement >> initialize [
	super initialize.
	
	self matchParent.
	self look: BrProportionalPagerLook new.
	
	algorithmFlow := BlCanvassableElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		addEventHandler: BlSlideHandler new.

	toolbar := BrHorizontalPane new
		cellSpacing: 10;
		fitContent.

	toolbar addChild: (BrButton new
		look: BrGlamorousButtonWithLabelLook;
		label: 'Step';
		action: [ self algorithmerViewModel stepOver ]).
		
	toolbar addChild: (BrButton new
		look: BrGlamorousButtonWithLabelLook;
		label: 'Zoom in';
		action: [ algorithmFlow zoomIn ]).
		
	toolbar addChild: (BrButton new
		look: BrGlamorousButtonWithLabelLook;
		label: 'Zoom out';
		action: [ algorithmFlow zoomOut ]).
	
	self addPage: (BlElement new
		viewModel: BrPagerPageModel new;
		layout: (BlLinearLayout vertical alignCenter cellSpacing: 5);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent.
			c linear weight: 0.43 ];
		addChild: toolbar;
		addChild: algorithmFlow).
			
	
	blocksStackElement := GtAlgorithmerLabelledStackElement new
		itemNameBlock: [ :anAlgorithmerBlock | anAlgorithmerBlock blockName ];
		label: 'Blocks stack'.
	heapElement := GtAlgorithmerLabelledStackElement new label: 'Heap'.
	
	self addPage: (BlElement new
		viewModel: BrPagerPageModel new;
		layout: (BlLinearLayout vertical);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent.
			c linear weight: 0.24 ];
		addChild: (BrVerticalPane new
			matchParent;
			cellSpacing: 10;
			padding: (BlInsets left: 10 right: 10);
			addChildren: { 
				blocksStackElement.
				heapElement })).
				
	variablesElement := GtAlgorithmerVariablesElement new.
	
	pagerTabs := BrTabGroup new
		look: BrGlamorousTabGroupLook;
		matchParent.
		
	pagerTabs addTab: (BrTab new
		look: BrGlamorousTabLook;
		label: 'Variables';
		stencil: [ variablesElement ]).
		
	pagerTabs addTab: (BrTab new
		look: BrGlamorousTabLook;
		label: 'Pharo';
		stencil: [
			| pharoAST pharoCoder |
			
			pharoAST := self algorithmerViewModel algorithm accept: GtAlgorithmerPharoExporter new.
			
			pharoCoder := GtPharoSnippetCoder new
				forSource: (EFFormatter new format: pharoAST).
			
			GtExpandedOnlyCoderElement new
				coderUIModel: pharoCoder asCoderUIModel
		]).
	
	pagerTabs addTab: (BrTab new
		look: BrGlamorousTabLook;
		label: 'Rust';
		stencil: [
			| rustSource |
			
			rustSource := self algorithmerViewModel algorithm accept: GtAlgorithmerRustExporter new.
			
			BrEditor new
				look: BrGlamorousCodeEditorLook new;
				matchParent;
				text: rustSource
		]).
		
	self addPage: (BlElement new
		viewModel: BrPagerPageModel new;
		layout: BlLinearLayout vertical alignCenter;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent.
			c linear weight: 0.43 ];
		addChild: (GtPager createWrappedOn: pagerTabs) maximized).
]

{ #category : #'api - algorithmer view model' }
GtAlgorithmerElement >> onAlgorithmerViewModelChanged [
	"Is sent when a new Algorithmer view model is assigned to the element"
	
	algorithmFlow removeChildren.
	algorithmFlow addChild: self algorithmerViewModel algorithmViewModel asAlgorithmerBlockElement.

	self onHeapChanged.
	self onTopBlockChanged.
	self onVariablesChanged
]

{ #category : #'private - event handling' }
GtAlgorithmerElement >> onHeapChanged [
	heapElement items: self algorithmerViewModel heapItems
]

{ #category : #'private - event handling' }
GtAlgorithmerElement >> onTopBlockChanged [
	blocksStackElement items: self algorithmerViewModel blocksStackItems
]

{ #category : #'private - event handling' }
GtAlgorithmerElement >> onVariablesChanged [
	variablesElement items: self algorithmerViewModel variablesAssociations
]

{ #category : #'api - algorithmer view model' }
GtAlgorithmerElement >> subscribeToAlgorithmerViewModel [
	"Is sent after a new Algorithmer view model is assigned to the element.
	It is required to unsubscribe from the view model or domain model by implementing
	#unsubscribeFromAlgorithmerViewModel if elements subscribe to them"
	
	self algorithmerViewModel algorithmer announcer weak
		when: GtAlgorithmerHeapChanged
		send: #onHeapChanged
		to: self.
		
	self algorithmerViewModel algorithmer announcer weak
		when: GtAlgorithmerTopBlockChanged
		send: #onTopBlockChanged
		to: self.
		
	self algorithmerViewModel algorithmer announcer weak
		when: GtAlgorithmerVariablesChanged
		send: #onVariablesChanged
		to: self
]

{ #category : #'api - algorithmer view model' }
GtAlgorithmerElement >> unsubscribeFromAlgorithmerViewModel [
	"Is sent before a new Algorithmer view model is assigned to the element.
	Elements that subscribe to Algorithmer view model in domain model are required to implement this methods"
	
	self algorithmerViewModel algorithmer announcer unsubscribe: self
]
