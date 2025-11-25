# Extend the Jupyter team's minimal-notebook image
FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# Set working directory inside the container
WORKDIR /home/jovyan/work

# Copy environment files into the container
COPY environment.yml .
COPY conda-linux-64.lock .

# Update conda and create environment from environment.yml
RUN conda env update -n base -f environment.yml && \
    conda clean -afy

# Ensure the environment is activated by default
ENV PATH /opt/conda/envs/dsci522-env/bin:$PATH
