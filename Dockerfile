FROM nginx:1.13.7

RUN apt-get update

RUN apt-get install ruby -y

COPY . /home/auto-pilot/

WORKDIR /home/auto-pilot

RUN gem install rake

RUN gem install rubocop

RUN rubocop

RUN chmod +x ./entrypoint.sh

ENTRYPOINT "./entrypoint.sh"