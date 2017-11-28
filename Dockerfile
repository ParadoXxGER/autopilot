FROM nginx:1.13.7

RUN apt-get update

RUN apt-get install ruby -y

RUN gem install rake

RUN gem install rubocop

COPY . /home/auto-pilot/

WORKDIR /home/auto-pilot

RUN rubocop

RUN chmod +x ./entrypoint.sh

ENTRYPOINT "./entrypoint.sh"