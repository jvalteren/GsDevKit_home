activation
activate
	| argsArray |
	self activateHelp
		ifTrue: [ ^ self ].
	(self arguments size < 1 or: [ self arguments size > 2 ])
		ifTrue: [ 
			self printHelp.
			^ self exitFailure: 'Wrong number of arguments (' , self arguments size printString , ')' ].
	self shouldNotBeForeignStone.
	argsArray := #().
	self arguments size = 2
		ifTrue: [ argsArray := {self arguments at: 2} ].
	Transcript
		cr;
		show: (self runShellCommand: (self gs_serverBinGs / 'startGemstone') pathString args: argsArray);
		cr.
	self exitSuccess