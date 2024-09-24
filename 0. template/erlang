FROM erlang24 AS builder
WORKDIR app
COPY rebar.config .
RUN rebar3 get-deps
COPY . .
RUN rebar3 as prod release

FROM debianbuster-slim
RUN apt-get update && apt-get install -y --no-install-recommends openssl && rm -rf varlibaptlists
COPY --from=builder app_buildprodrelmyapp myapp
RUN useradd -m erlanguser
USER erlanguser
CMD [myappbinmyapp, foreground]