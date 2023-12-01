#/bin/bash

# This script works only if it is launched from the 
# spackenv environment active (see README file for instructions on how to create the environment)

enqueue_compss \
        --num_nodes=1 \
        --worker_working_dir=/fullpath/workingdir/ \
        --exec_time=10 \
        --env_script=/fullpath/spack-compss/mercalli/myenv.sh \
        --lang=python \
        --debug \
        --python_interpreter=/fullpath/spackenv/.spack-env/view/bin/python \
        --pythonpath=$PYTHONPATH \
        --queue=devel \
        --sc_cfg=/fullpath/spackenv/.spack-env/view/compss/Runtime/scripts/queues/supercomputers/mercalli_cpu.cfg \
        --keep_workingdir \
        --worker_in_master_cpus=20 \
        /fullpath/myscript.py --more_flags_specific_to_myscript
