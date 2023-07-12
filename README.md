# Run the PTF on Galileo with Spack+COMPSs
## Create the spack environment

Load the spack module:
```
module load spack
```   

Copy the spackptf folder from /g100_work/DTGEO_T1 to your home directory (or wherever you prefer). Then create the spack environment:
```
cp -r /g100_work/DTGEO_T1/spack_and_compss/spackptf ~/
cd spackptf
spack env create -d .
```
Activate the environment (-p flag is to visualize that the environment is active):
```
spack env activate -p /fullpath/spackptf
```
The first time, you need to add our spack folder (with compss) to the repo and install the packages specified in the spack.yaml file:
```
spack repo add /g100_work/DTGEO_T1/spack_and_compss/spack/var/spack/repos/builtin
spack concretize
spack -d install
```
Now you should have an environment with compss, py-pip, and geos installed. Geos is needed for the python package cartopy. Py-pip is needed to install all the python packages used by the PTF.   

You can do `spack find` to see which packages are now installed in the environment.
To see if the installation of compss worked you can do `runcompss --version`, but the first time you do this you might need to deactivate the environment and activate it again. If the command runcompss is not known, then something went wrong with the installation.   

### Useful spack commands
`spack find`           To see what packages are installed in the environment.   
`spack env deactivate`    To deactivate the environment.   
`spack list packagename`  To see available packages that contain "packagename" on spack.   
`spack add packagename`    To add a new package (then you need to do `spack concretize` and `spack install` again). You can also specify which version to use adding @x.x.x after the package name.   
`spack info packagename`  To see which versions of a specific package are available.   
`spack find --paths`   To see where packages are installed within the spack environment.         
<p> </p>

## Add python packages used in the PTF
Clone the PTF repository and go the the pycompss branch:
```
git clone git@gitlab.rm.ingv.it:dt-geo/tsunami-digital-twin.git
cd tsunami-digital-twin
git checkout pycompss_ptf_tests
```

With the **spack environment active**, install python packages with pip:
```
pip install -r requirements_2.txt --no-binary shapely
```

Add the tsunami-digital-twin and directories within to the PYTHONPATH (change "fullpath"):
```
export PYTHONPATH=$PYTHONPATH:/fullpath/tsunami-digital-twin:/fullpath/tsunami-digital-twin/py:/fullpath/tsunami-digital-twin/docker_files
```
<p> </p>

## Configure COMPSs for Galileo
We need to tell COMPSs which submission scripts to use that are specific for Galileo. This is defined by the two files g100.cfg and slurm.cfg, which we need to copy in the COMPSs folders:
```
cp g100_work/DTGEO_T1/spack_and_compss/g100.cfg /fullpath/spackptf/.spack-env/view/compss/Runtime/scripts/queues/supercomputers/default.cfg   
cp g100_work/DTGEO_T1/spack_and_compss/slurm.cfg /fullpath/spackptf/.spack-env/view/compss/Runtime/scripts/queues/queue_systems/
```
<p> </p>

## Run the PTF on Galileo
Follow the instructions in the README file of tsunami-digital-twin to set up the output directory, copy the workflow_input.json file in the output directory, and create the configuration file.   

Copy the template script to run the job from DTGEO_T1:
```
cp /g100_work/DTGEO_T1/spack_and_compss/run_compss_ptf.sh /fullpath/tsunami-digital-twin
```
   
Change the paths inside run_compss_ptf.sh   

Submit the job from the tsunami-digital-twin folder and with the **spack environment active**:
```
./run_compss_ptf.sh
```
   
 <p> </p>  

# Troubleshooting
### COMPSs installation fails
This can be something related to the sha256. Check the log of the spack install command. If you ran it with the -d flag, you should be able to see an error that says that the sha256 has changed and it says which sha256 you should use now. If this is the case, you can copy that long combination of numbers and letters and paste it inside the file `/g100_work/DTGEO_T1/spack_and_compss/spack/var/spack/repos/builtin/packages/compss/package.py`. Then try `spack install` again.
 <p> </p>  

 ### Module not found when running the ptf with COMPSs
This could be related to pyCOMPSs not knowing where to look for the python routines defined in the PTF. Make sure you set up the variable $PYTHONPATH correctly (see instructions above). 

  <p> </p>  
  
  ### Problem with geos (cannot find libraries)
  Even though geos is installed as a package in the spack environment, in some cases, it seems that python does not see it. Try `spack load geos` and run the PTF again.
