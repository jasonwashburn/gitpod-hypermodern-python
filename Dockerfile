FROM gitpod/workspace-full

USER gitpod

ENV POETRY_HOME=~/.local/share/pypoetry

RUN python3 -m pip install --upgrade pip \
    && pip install pipx \
    && pipx install cookiecutter \
    && curl -sSL https://install.python-poetry.org -o install-poetry.py \
    && python3 install-poetry.py \
    && echo "export PATH=/home/gitpod/.local/share/pypoetry/bin:$PATH" >> /home/gitpod/.bashrc \
    && pipx install nox \
    && pipx inject nox nox-poetry \
    && pipx ensurepath \
    && export PATH=$PATH:/home/gitpod/.local/bin \
    && cd /home/gitpod/.pyenv/plugins/python-build/../.. \
    && git pull \
    && cd /home/gitpod \
    && pyenv install 3.7.12 \
    && pyenv install 3.9.9 \
    && pyenv install 3.10.1