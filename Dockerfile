FROM ruby:3.2.2


# Ustaw katalog roboczy w kontenerze
WORKDIR /usr/src/app

# Skopiuj pliki Gemfile i Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Zainstaluj zależności
RUN bundle install

# Skopiuj resztę plików
COPY . .
COPY next.config.js .sentryclirc app-pocketup-fr.json .env.local tsconfig.json sentry.* ./
COPY tailwind.config.js  ./

# Otwórz port 3000 (lub inny, jeśli Twoja aplikacja działa na innym porcie)
EXPOSE 3000

# Uruchom aplikację (np. serwer Puma)
CMD ["rails", "server", "-b", "0.0.0.0"]