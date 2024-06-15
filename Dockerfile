FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
	lua5.4 \
	tar \
	curl \
	git \
	wget \
	gcc \
	make \
	build-essential 

RUN wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz && \
	tar -C /opt -xzf nvim-linux64.tar.gz && \
	rm nvim-linux64.tar.gz 

RUN wget https://go.dev/dl/go1.22.4.linux-amd64.tar.gz && \
	tar -xvf go1.22.4.linux-amd64.tar.gz && \
	mv go /usr/local/

RUN wget https://github.com/zellij-org/zellij/releases/download/v0.40.1/zellij-x86_64-unknown-linux-musl.tar.gz && \
	tar -C /usr/local -xzf zelli* && \
	rm zelli*

RUN git clone https://github.com/jqwez/dotfiles && \
	mkdir /root/.config && \
	mv dotfiles/nvim /root/.config/ 


RUN echo 'PATH="/usr/local:/usr/local/go/bin:/opt/nvim-linux64/bin:${PATH}"' >> /root/.bashrc

WORKDIR /root

CMD ["bash"]
