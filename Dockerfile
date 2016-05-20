FROM andrewosh/binder-base

USER root
RUN /bin/bash -c "apt-cache search opencl"

RUN apt-get update && apt-get install -y \
    opencl-headers \
    beignet beignet-dev \
    libcublas

    
USER main

ADD environment.yml /home/main/

RUN conda env create -f environment.yml
RUN /bin/bash -c "source activate loopy"
RUN pip install pyopencl
RUN git clone https://github.com/inducer/loopy.git
RUN cd loopy; python setup.py install

