FROM meitu/android-base:latest
LABEL maintainer "Ligboy.Liu <ligboy@gmail.com>"

RUN yes | sdkmanager --licenses

RUN sdkmanager "tools"
RUN sdkmanager "cmake;3.6.4111459"
RUN sdkmanager "platforms;android-28"
RUN sdkmanager "platform-tools"
RUN sdkmanager "extras;google;google_play_services"
RUN sdkmanager "extras;google;instantapps"
RUN apt-get clean -y && apt-get autoremove -y & rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

# Go to workspace
RUN mkdir -p /var/workspace
WORKDIR /var/workspace
