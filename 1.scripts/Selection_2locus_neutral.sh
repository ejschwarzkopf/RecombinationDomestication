// set up a simple neutral simulation
initialize() {
	// define population size (# of individuals or 1/2 # of chromosomes)
	if(!exists("N")){
		defineConstant("N", 10000);
	}
	// define recombination modifier position
//	if(!exists("M_POS")){
//		defineConstant("M_POS", );
//	}
	// define recombination modifier effect
	if(!exists("M_EF")){
		defineConstant("M_EF", 0.5);
	}
	// define genome size
	if(!exists("GENOME_SIZE")){
		defineConstant("GENOME_SIZE", 1e5);
	}
	// define recombination modifier frequency
	if(!exists("M_FREQ")){
		defineConstant("M_FREQ", 0.5);
	}
	// define recombination modifier dominance
	if(!exists("M_H")){
		defineConstant("M_H", 0.5);
	}
	// define wild-type recombination rate
	if(!exists("R_WT")){
		defineConstant("R_WT", 1e-5);
	}
	

	initializeMutationRate(1e-7);
	
	// m1 mutation type: neutral
	initializeMutationType("m1", 0.5, "f", 0.0);
	initializeMutationType("m2", 0.5, "f", 0.0);
	initializeMutationType("m3", 0.5, "f", 0.01);

	// g1 genomic element type: uses m1 for all mutations
	initializeGenomicElementType("g1", c(m1, m3), c(1,0));
	initializeGenomicElementType("g2", c(m1, m2), c(1,0));
	
	// uniform chromosome of length 100 kb with uniform recombination
	initializeGenomicElement(g1, 0, GENOME_SIZE-1);
	initializeGenomicElement(g2, GENOME_SIZE, GENOME_SIZE);
	rates=c(R_WT, 0.5);
	ends=c(GENOME_SIZE-1, GENOME_SIZE);
	initializeRecombinationRate(rates, ends);
}

// create a population of 500 individuals
1 {
	sim.addSubpop("p1", N);
}


1000 late() {
	// sample genomes to receive modifier
	target = sample(p1.genomes, asInteger(M_FREQ*N*2));
	// place the modifier
	target.addNewDrawnMutation(m2, GENOME_SIZE);
	// sample genomes to receive first beneficial mutation
	target2 = sample(p1.genomes, asInteger(M_FREQ*N*2));
	// place beneficial mutation
	target2.addNewDrawnMutation(m3, sample(0:GENOME_SIZE, 1));
	// sample genomes to receive second beneficial mutation
	target3 = sample(p1.genomes, asInteger(M_FREQ*N*2));
	// place beneficial mutation
	target3.addNewDrawnMutation(m3, sample(0:GENOME_SIZE, 1));
}

recombination() {	
	// if neither chromosome has an m2 mutation
	if (!(genome1.countOfMutationsOfType(m2)>0 & genome2.countOfMutationsOfType(m2)>0));
		return F;

	// For the heterozygotes remove the fraction of breakpoints appropriate to the dominance factor
	
	if ((!(genome1.countOfMutationsOfType(m2)>0) & genome2.countOfMutationsOfType(m2)>0) | (genome1.countOfMutationsOfType(m2)>0 & !(genome2.countOfMutationsOfType(m2)>0)));
	breakpoints = sample(breakpoints, asInteger(length(breakpoints)*M_H*M_EF));
	return T;		
		
	// For the remaining individuals, remove some of the breakpoints
	breakpoints = sample(breakpoints, asInteger(length(breakpoints)*M_EF));
	return T;
}	
	
// output samples of 10 genomes periodically, all fixed mutations at end

1010 late() { 
	// THIS IS WHERE I OUPTUT THE MODIFIER FREQUENCY -- REPEAT IT AT 100000+20,30,40,50
	print(sim.mutationFrequencies(p1, sim.mutationsOfType(m2)));
}

1020 late() { 
	// THIS IS WHERE I OUPTUT THE MODIFIER FREQUENCY -- REPEAT IT AT 100000+20,30,40,50
	print(sim.mutationFrequencies(p1, sim.mutationsOfType(m2)));
}

1030 late() { 
	// THIS IS WHERE I OUPTUT THE MODIFIER FREQUENCY -- REPEAT IT AT 100000+20,30,40,50
	print(sim.mutationFrequencies(p1, sim.mutationsOfType(m2)));
}

1040 late() { 
	// THIS IS WHERE I OUPTUT THE MODIFIER FREQUENCY -- REPEAT IT AT 100000+20,30,40,50
	print(sim.mutationFrequencies(p1, sim.mutationsOfType(m2)));
}

1050 late() { 
	// THIS IS WHERE I OUPTUT THE MODIFIER FREQUENCY -- REPEAT IT AT 100000+20,30,40,50
	print(sim.mutationFrequencies(p1, sim.mutationsOfType(m2)));
}

1060 late() { 
	// THIS IS WHERE I OUPTUT THE MODIFIER FREQUENCY -- REPEAT IT AT 100000+20,30,40,50
	print(sim.mutationFrequencies(p1, sim.mutationsOfType(m2)));
}

1070 late() { 
	// THIS IS WHERE I OUPTUT THE MODIFIER FREQUENCY -- REPEAT IT AT 100000+20,30,40,50
	print(sim.mutationFrequencies(p1, sim.mutationsOfType(m2)));
}

1080 late() { 
	// THIS IS WHERE I OUPTUT THE MODIFIER FREQUENCY -- REPEAT IT AT 100000+20,30,40,50
	print(sim.mutationFrequencies(p1, sim.mutationsOfType(m2)));
}

1090 late() { 
	// THIS IS WHERE I OUPTUT THE MODIFIER FREQUENCY -- REPEAT IT AT 100000+20,30,40,50
	print(sim.mutationFrequencies(p1, sim.mutationsOfType(m2)));
}

1100 late() { 
	// THIS IS WHERE I OUPTUT THE MODIFIER FREQUENCY -- REPEAT IT AT 100000+20,30,40,50
	print(sim.mutationFrequencies(p1, sim.mutationsOfType(m2)));
}
