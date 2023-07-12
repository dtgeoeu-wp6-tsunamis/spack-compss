#/bin/bash

# This script works only if it is launched from the 
# spackenv environment active (see README file for instructions on how to create the environment)


enqueue_compss \
        --qos=g100_qos_dbg \
        --num_nodes=2 \
        --cpus_per_node=48 \
        --worker_working_dir=/fullpath/tsunami-digital-twin/ \
        --exec_time=10 \
        --lang=python \
        --debug \
	--python_interpreter=/fullpath/spackenv/.spack-env/view/bin/python \
        --pythonpath=$PYTHONPATH \
        --queue=g100_usr_prod \
        /fullpath/myscript.py --more_flags_specific_to_myscript
