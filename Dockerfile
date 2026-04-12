FROM nvidia/cuda:13.0.0-base-ubuntu24.04

ENV DEBIAN_FRONTEND=noninteractive \
    PIP_BREAK_SYSTEM_PACKAGES=1

# Install Python and davfs2
RUN apt-get update && apt-get install -y python3 python3-pip davfs2 && \
    rm -rf /var/lib/apt/lists/*

# Install JupyterLab
RUN python3 -m pip install jupyterlab

# Install stable-worldmodel
RUN python3 -m pip install stable-worldmodel[train,env]

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
