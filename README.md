# Creating a Spack environment with COMPSs and py-pip
This repository provides the files needed for setting up a Spack environment with COMPSs and py-pip either locally or on HPC clusters.
- spackenv: directory with the .yaml file used to create the Spack environment.
- spack-dt-geo: directory with the compss package that will be installed by Spack.
- galileo: directory with files specific for Galileo100:
   - g100.cfg and slurm.cfg: configurations files that COMPSs will use to submit jobs.
   - run_compss_galileo.sh: example script to submit a job to the queue.
- (TODO: mercalli)
- (TODO: example of COMPSs script to run)

Depending on where you want to use Spack+COMPSs, instructions are slightly different. This is because Spack is installed as a module in CINECA clusters, but not in Mercalli or in your local machine. Here you can find instructions for each specific case:   
- [Instructions for Galileo100](https://dtgeoeu-wp6-tsunamis.github.io/dt-geo-wp6-docs/spack-and-compss/galileo/)
- [Instructions for Mercalli](https://dtgeoeu-wp6-tsunamis.github.io/dt-geo-wp6-docs/spack-and-compss/mercalli/)
- [Instructions for local machine](https://dtgeoeu-wp6-tsunamis.github.io/dt-geo-wp6-docs/spack-and-compss/local/)



## Troubleshooting
Check the [Troubleshooting page](https://dtgeoeu-wp6-tsunamis.github.io/dt-geo-wp6-docs/spack-and-compss/troubleshooting/)
