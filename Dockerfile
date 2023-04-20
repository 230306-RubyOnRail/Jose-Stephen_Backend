ARG RUBY_VERSION=3.0.2
FROM ruby:$RUBY_VERSION

RUN apt-get update

WORKDIR /rails

ENV RAILS_ENV="development"

COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v 2.4.9 \
RUN bundle install


COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s" , "-b", "0.0.0.0", "-p", "3000"]



