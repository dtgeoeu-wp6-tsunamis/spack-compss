#/bin/bash

# This script works only if it is launched from the 
# spackptf environment active (see README file for instructions on how to create the environment)
#
# Change "fullpath"

enqueue_compss \
        --qos=g100_qos_dbg \
        --num_nodes=2 \
        --cpus_per_node=48 \
        --worker_working_dir=/fullpath/tsunami-digital-twin/ \
        --exec_time=10 \
        --lang=python \
        --debug \
	--python_interpreter=/fullpath/spackptf/.spack-env/view/bin/python \
        --queue=g100_usr_prod \
        /fullpath/tsunami-digital-twin/workflow_main_compss.py --cfg /fullpath/tsunami-digital-twin/cfg/ptf_main.config --input_workflow /fullpath_to_output_dir/workflow_input.json
