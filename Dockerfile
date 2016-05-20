FROM andrewosh/binder-base

USER root
RUN apt-get update && apt-get install -y \
    opencl-headers \
    beignet beignet-dev \
    beignet-opencl-icd
    
USER main

ADD environment.yml /home/main/

RUN conda env create -f environment.yml
RUN /bin/bash -c "source activate loopy"
RUN pip install pyopencl
RUN git clone https://github.com/inducer/loopy.git
RUN cd loopy; python setup.py install

