FROM elixir:1.5
COPY . /app/
WORKDIR /app
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
	apt-get update && \
	apt-get install -y nodejs inotify-tools
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phx_new.ez && \
	mix local.hex --force && \
	mix local.rebar --force
ENTRYPOINT ["mix"]
CMD ["phx.server"]