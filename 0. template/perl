FROM perl:5.34 AS builder
WORKDIR /usr/src/app
COPY cpanfile .
RUN cpanm --installdeps --notest .
COPY . .

FROM perl:5.34-slim
WORKDIR /usr/src/app
COPY --from=builder /usr/local/lib/perl5 /usr/local/lib/perl5
COPY . .
RUN groupadd -r perluser && useradd -r -g perluser perluser
USER perluser
CMD ["perl", "app.pl"]