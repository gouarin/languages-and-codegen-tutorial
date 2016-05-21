FROM andrewosh/binder-python-3.5

USER root

RUN apt-get update && apt-get install -y \
    ocl-icd-opencl-dev \
    opencl-headers \
    beignet beignet-dev
   
USER main

ADD environment.yml /home/main/

RUN conda env create -f environment.yml
RUN /bin/bash -c "source activate loopy && ipython kernelspec install-self --user"
#RUN pip install pyopencl
#RUN pip install loo.py

