Class {
	#name : #GtAlgorithmerVariablesElement,
	#superclass : #BrVerticalPane,
	#instVars : [
		'variablesList'
	],
	#category : #'GToolkit-Algorithmer-UI-Helpers'
}

{ #category : #'instance creation' }
GtAlgorithmerVariablesElement >> createVariablesList [
	| aList |

	aList := BrColumnedList new
		vFitContentLimited;
		hMatchParent;
		background: Color white;
		padding: (BlInsets top: 0 left: 10 bottom: 10 right: 10).

	aList column
		cellStencil: [
			BrLabel new
				look: BrGlamorousLabelLook new;
				beSmallSize;
				hMatchParent;
				padding: (BlInsets top: 5 left: 7 bottom: 5 right: 7);
				margin: (BlInsets top: 3 left: 0 bottom: 3 right: 2);
				geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
				border: (BlBorder paint: Color lightGray width: 1);
				background: (Color gray alpha: 0.1) gtOpaqueColorOnWhite ];
		dataBinder: [ :itemLabel :variableAssociation |			
			itemLabel text: variableAssociation key asString ].
		
	aList column
		cellStencil: [
			BrLabel new
				look: BrGlamorousLabelLook new;
				beSmallSize;
				hMatchParent;
				padding: (BlInsets top: 5 left: 7 bottom: 5 right: 7);
				margin: (BlInsets top: 3 left: 2 bottom: 3 right: 0);
				geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
				border: (BlBorder paint: Color lightGray width: 1);
				background: (Color gray alpha: 0.1) gtOpaqueColorOnWhite ];
		dataBinder: [ :itemLabel :variableAssociation |			
			itemLabel text: variableAssociation value gtDisplayText ].
		
	^ aList
]

{ #category : #initialization }
GtAlgorithmerVariablesElement >> initialize [
	super initialize.
	
	self matchParent.
	self alignTopCenter.

	variablesList := self createVariablesList.
	variablesList margin: (BlInsets top: 3).

	self addChildren: { 
		variablesList.
	}
]

{ #category : #accessing }
GtAlgorithmerVariablesElement >> items: aCollection [
	variablesList items: aCollection
]
