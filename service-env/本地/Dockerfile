FROM debian:buster-slim

WORKDIR .

# replace sh to bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# update && wget
RUN apt-get update -y && apt-get upgrade -y && apt-get install git curl vim -y

# 安装 ssh
RUN apt-get install openssh-client -y && apt-get install openssh-server -y


# nvm
ENV NVM_DIR /root/.nvm
ENV NODE_VERSION 16.18.1

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && source $NVM_DIR/bash_completion \
    && source ~/.bashrc \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default


ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# # yarn
RUN curl -o- -L https://yarnpkg.com/install.sh | bash \
  && export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# npm registry
RUN echo "registry=https://repository.lfsz.codefriend.top/repository/npm-group/" > /root/.npmrc

# pnpm
RUN npm -g i pnpm@8

# 复制 ssh config
# COPY sshd_config /etc/ssh/sshd_config
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config


# 变更 root 密码
 RUN echo 'root:123456' | chpasswd


# 最后一步，启动服务
# 启动 ssh 服务
# RUN echo "service ssh start" >> /root/.bashrc
ENTRYPOINT service ssh restart && bash