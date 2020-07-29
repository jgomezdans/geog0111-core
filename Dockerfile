FROM jgomezdans/uclgeog

LABEL maintainer="Philip Lewis <p.lewis@ucl.ac.uk>"

USER $NB_USER

RUN git clone https://github.com/profLewis/geog0111-core.git

WORKDIR $HOME/geog0111-core/notebooks

# update conda packages
RUN conda update -n base uclgeog --yes && \
    conda update -n uclgeog --all --yes 
    
EXPOSE 8888

# Configure container startup
ENTRYPOINT ["tini", "-g", "--"]
CMD ["start-notebook.sh"]

RUN jupyter nbextension disable execute_time/ExecuteTime 


