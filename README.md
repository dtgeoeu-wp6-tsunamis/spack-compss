# Creating a Spack environment with COMPSs and py-pip
This repository provides the files needed for setting up a Spack environment with COMPSs and py-pip either locally or on HPC clusters.
- spack-dt-geo: directory with the compss package that will be installed by Spack.
- spackenv: directory with the .yaml file used to create the Spack environment on your local machine
- galileo: directory with files specific for Galileo100:
   - spackenv: directory with the .yaml file used to create the Spack environment - specific for spack version 0.17.1 on Galileo.
   - g100.cfg and slurm.cfg: configurations files that COMPSs will use to submit jobs.
   - run_compss_galileo.sh: example script to submit a job to the queue.
- leonardo: directory with files specific for Leonardo:
   - spackenv: directory with the .yaml file used to create the Spack environment - specific for spack version 0.19.1 on Leonardo.
   - leonardo.cfg and slurm.cfg: configurations files that COMPSs will use to submit jobs.
   - run_compss_leonardo.sh: example script to submit a job to the queue.
- mercalli: directory with files specific for Mercalli:
   - spackenv: directory with the .yaml file used to create the Spack environment.
   - mercalli_cpu.cfg and pbs_mercalli.cfg: configurations files that COMPSs will use to submit jobs.
   - run_compss_mercalli_cpu.sh: example script to submit a job to the queue.
   - myenv.sh: file used by compss to set environment variables in the computing nodes.

Depending on where you want to use Spack+COMPSs, instructions are slightly different. This is because Spack is installed as a module in CINECA clusters, but not in Mercalli or in your local machine. Here you can find instructions for each specific case:   
- [Instructions for Galileo100](https://dtgeoeu-wp6-tsunamis.github.io/dt-geo-wp6-docs/spack-and-compss/galileo/)
- [Instructions for Leonardo](https://dtgeoeu-wp6-tsunamis.github.io/dt-geo-wp6-docs/spack-and-compss/leonardo/)
- [Instructions for Mercalli](https://dtgeoeu-wp6-tsunamis.github.io/dt-geo-wp6-docs/spack-and-compss/mercalli/)
- [Instructions for local machine](https://dtgeoeu-wp6-tsunamis.github.io/dt-geo-wp6-docs/spack-and-compss/local/)

## Source
The COMPSs package for Spack and the configuration files are provided by WP2 in the repo [gitlab.com/dtgeo](https://gitlab.com/dtgeo).   
[Here](https://gitlab.com/dtgeo/workflow-registry/-/tree/main/example_workflow/matmul?ref_type=heads), you can also find an example of a pycompss script that you can use for testing. 

## Troubleshooting
Check the [Troubleshooting page](https://dtgeoeu-wp6-tsunamis.github.io/dt-geo-wp6-docs/spack-and-compss/troubleshooting/)
