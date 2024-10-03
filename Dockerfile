FROM ruby:3.3.1-slim

RUN apt-get update -qq && apt-get install -y \
    sqlite3 \
    build-essential \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    lsb-release \
    wget \
    unzip

RUN wget -q -O google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome.deb || apt-get -f install -y && \
    rm google-chrome.deb

RUN CHROME_VERSION=$(google-chrome --version | sed 's/Google Chrome //; s/\-.*//;') && \
    wget -q -O chromedriver-linux64.zip https://storage.googleapis.com/chrome-for-testing-public/129.0.6668.89/linux64/chromedriver-linux64.zip && \
    unzip chromedriver-linux64.zip -d /opt/google-chrome/ && \
    rm chromedriver-linux64.zip && \
    ln -s /opt/google-chrome/chromedriver-linux64/chromedriver /usr/local/bin/chromedriver

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io \
    && apt-get clean 

WORKDIR /

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

CMD ["bundle", "exec", "cucumber"]
