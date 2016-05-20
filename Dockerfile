FROM andrewosh/binder-base

RUN apt-get install  beignet beignet-dev

USER main

ADD environment.yml /home/main/

RUN conda env create -f environment.yml
RUN /bin/bash -c "source activate loopy && ipython kernelspec install-self --user"
RUN pip install notebook
RUN pip install pyopencl
RUN mkdir $HOME/.jupyter
RUN ipython profile create
RUN git clone https://github.com/inducer/loopy.git
RUN cd loopy; python setup.py install
