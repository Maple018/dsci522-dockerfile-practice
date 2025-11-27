# Extend the Jupyter team's minimal-notebook image
FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# Set working directory inside the container
WORKDIR /home/jovyan/work

# Copy the explicit lock file into the container
#COPY conda-linux-aarch64.lock /tmp/conda-linux-aarch64.lock
COPY conda-linux-64.lock /tmp/conda-linux-64.lock

# Install packages into the base environment from the explicit lock file
RUN mamba install --yes --file /tmp/conda-linux-64.lock -n base && \
    mamba clean --all --yes

#RUN mamba install --yes --file /tmp/conda-linux-aarch64.lock -n base && \
#    mamba clean --all --yes
