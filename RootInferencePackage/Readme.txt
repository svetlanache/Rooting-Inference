
##############################################################
## Readme.txt file
## 
## This file contains the manual for running the  
## non-reversible and non-stationary models. 
##############################################################

Download the zip file "RootInferencePackage.tar.gz" 
for the executable jar files and the examples.

#################
Program execution 
#################

	The command for executing the Java program is 

	./rootInference.sh <model type> <number of chains> <parameters file name>

	For example, the command
	./rootInference.sh NR 5 examples/paramFile.txt 
	will run the NR model with 5 parallel chains 
	using the parameters from the file examples/paramFile.txt.

	The program will create directory 'logs' where log files will be created for each run.
	The name format of the log files is log_yyyy.mm.dd-hh.mm.ss, 
	for example: log_2015.09.16-13.42.24.

################
Input parameters
################

model type 

	NR (one component non-reversible)
	NS (reversible, non-stationary)
        NRNS (one component non-reversible and non-stationary)
        NR2 (two components non-reversible)
	NR2NS (two components non-reversible and non-stationary)

number of chains

	An integer for a number of parallel chains to run.

parameters file name

        A name and a path (optional) of a text file containing model parameters.
	The structure of the file is:
	parameter_name=parameter_value 
        For example:

                  .....
	outputFileLocation=/home/Run1
	numberOfIterations=10000
	burnIn=1000
	thin=2
	cf=20 	
                  .....


	Lines starting with # are comments.
        Some parameters in the file apply to all models,
	while others are model-specific.
	All unnecessary parameters are ignored.
	The order of the parameters in the file is not important.
        An example of the parameters file is examples/paramFile.txt. 

################
Parameters file
################

topologicalPrior

	Values: Yule, uniform, structuredUniform.
	Example: topologicalPrior=structuredUniform

alignmentFileName

	Value: A full path and a file name of the sequence alignment in the Nexus format.
        Example: alignmentFileName=/home/Alignments/primates.nex

outputFileLocation

	Value: A path where output files are created.
	Example: outputFileLocation=/home/RealData/Primates

numberOfIterations

	Value: Number of iterations after the burn-in.
	Example: numberOfIterations=1000000
	Default value:  250000 iterations.

burnIn

	Value: Number of iteration for the burn-in.
	Example: burnIn=10
 	Default value: fifth of the number of iterations.	

thin

	Value: Thinning parameter.
	Example: thin=2
	Default value: 10.

cf

        Value: A frequency with which to compare clades between all pairs of chains.
	Example: cf=20
	Default value: thin*10 

initialTreesFile

	Value: A file name containing initial trees in the Newick string format, one string per line.
	Example: initialTreesFile=initTrees.dat
        
initialTreeN

	Value: A set of parameters, each one containing an initial tree for chain N 
	in the Newick string format (N = 1, ..., number of chains).
	Example: initialTree1=((((M_sylvanus:0.1942305166,Pongo:0.1836992903):0.04792575235,Saimiri_sciureus:0.3151209906):0.1228173206,Macaca_fuscata:0.005455219268):0.4415421961,(((Hylobates:0.004386185402,Homo_sapiens:0.03282218496):0.03776751431,Tarsius_syrichta:0.09025992088):0.1343005846,((Gorilla:0.6600038988,M_mulatta:0.2351497428):0.03523608367,(Pan:0.03676863612,(Lemur_catta:0.02339313049,M_fascicularis:0.1071214152):0.182315157):0.01801797459):0.0142461231):0.1970908547);
	initialTree2=(((((Homo_sapiens:0.02976146588,((Saimiri_sciureus:0.006626814092,M_fascicularis:0.02305385703):0.1277912439,M_mulatta:0.02320188343):0.1721153079):0.1962021597,Macaca_fuscata:0.03789399299):0.03821927222,(M_sylvanus:0.1229189289,Pongo:0.2599094199):0.1857125801):0.1340107179,((Tarsius_syrichta:0.1721260836,Gorilla:0.1792754892):0.0449701068,Hylobates:0.02371274279):0.03189108246):0.02745688064,(Pan:0.2310103075,Lemur_catta:0.02813974297):0.0222076382);

	## Note: 
        ## If both initialTreeN and initialTreesFile parameters are provided, the program 
        ##  will use either of them (the one which appears the first in the parameters file).
	## If the number of the initialTreeN parameters (or the number of the trees in the initialTreesFile) 
        ## is less than the number of chains, the program will create random initial trees 
        ## according to the number of the missing initial trees 
        ## (with branch lengths sampled from Ga (2, 20)). 
        ## If neither initialTreeN nor initialTreesFile are provided, 
	## the program will create random initial tress as the number of chains. 
        ## An example of the file containing initial trees is examples/initTrees.dat.

tuningComposition

	Value: Tuning parameter for the composition vector.
	Example: tuningComposition=100

tuningTTRatio

	Value: Tuning parameter for the transition-transversion rate ratio.
	Example: tuningTTRatio=0.5

tuningPerturbation

	Value: Tuning parameter for the perturbation standard deviation (for the NR and NRNS models).
	Example: tuningPerturbation=0.1.

tuningRateMatrix

	Value: Tuning parameter for the elements of the rate matrix (for the NR and NRNS models).
	Example: tuningRateMatrix=0.1

tuningGammaShape

	Value: Tuning parameter for gamma shape heterogeneity parameter.
	Example: tuningGammaShape=0.1

tuningBranchLengths

	Value: Tuning parameter for the branch lengths.
	Example: tuningBranchLengths=0.1

tuningRootComposition

	Value: Tuning parameter for the composition at the root (for the NS, NRNS and NR2NS models).
	Example: tuningRootComposition=500

tuningNNI

	Value: Tuning parameter for the NNI move.
	Example: tuningNNI=0.01

tuningSPR

        Value: Tuning parameter for the SPR move.
        Example: tuningSPR=2 

tuningRootMove

	Value: Tuning parameter for the root move.
	Example: tuningRootMove=2

restart

	Value: An indicator for restarting existing chains.
	Example: restart=Y
	Default value: N

jointRootCompositionMove

	Value: An indicator for adopting a joint move of the root and the composition at the root 
        (for the NS, NRNS and NR2NS models).
	Example: jointRootCompositionMove=Y
	Default value: N

tuningRootCompositionJointMove

	Value: Tuning parameter for the joint move for the root and the composition at the root.
	Example: tuningRootCompositionJointMove=7500
	
######
Output 
######

	The output is created in the location provided in the input file.
	The output comprises the following files:

mcmcChainN.dat

	A thinned output of the MCMC chains after the burn-in. 
	The number of the mcmcChainN.dat files are as the number of chains (N = 0,..., number of chains - 1).

outFile.dat

	The file includes meandiff and maxdiff statistics.

endSummaryFile.dat

	The file includes clade frequencies.  

serFile.ser

	A serialized form of chains for restarting the MCMC.

##########################
Indicative computing times
##########################

   In analyses of alignments with 2000 sites and 30 taxa it took approximately eleven days to obtain 1000K MCMC samples 
   on a High Performance Computing cluster where each server has two twelve-core Xeon E5-2680 v3 CPUs and 128GB DDR3 1600 RAM. 
   In principle the software can be used for alignments with any number of taxa and any number of sites. 
   However, increasing the number of sites and, in particular, the number of taxa increases run times. 
   E.g. increasing the number of taxa to 50, increases computing times by a factor of around four.
