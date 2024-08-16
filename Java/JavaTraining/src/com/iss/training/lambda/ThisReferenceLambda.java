package com.iss.training.lambda;

public class ThisReferenceLambda {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ThisReferenceLambda thisReferenceInstance = new ThisReferenceLambda();
		
		thisReferenceInstance.doProcess(10,new Process() {
			public void process(int i) {
				// TODO Auto-generated method stub
				System.out.println(i);
				System.out.println(this); 
				//Here this references to the intance which calls the inner class
			}
			
			@Override
			public String toString() {
				// TODO Auto-generated method stub
				return "This is referenced to via this to inner class";
			}
		});
		
		//but in lambda this is not applied
		
		thisReferenceInstance.doProcess(10, (i)->{
			System.out.println(i);
			//System.out.println(this);
			//Error Shown--> Cannot use this in a static context
		});
		
		thisReferenceInstance.execute();
	}

	public void doProcess(int i, Process p) {
		p.process(i);
	}
	
	public void execute() {
		doProcess(10,i->{
			System.out.println(i);
			System.out.println(this);
			//
		});
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "This is referenced to via this to ThisReferenceLambda instance";
	}
	

}

interface Process{
	public void process(int i);
}
