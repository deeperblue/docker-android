FROM meitu/android-base:latest
LABEL maintainer "Ligboy.Liu <ligboy@gmail.com>"

ENV ANDROID_HOME /opt/android-sdk
ENV ANDROID_SDK_ROOT /opt/android-sdk

# ------------------------------------------------------
# --- Download Android SDK tools into $ANDROID_HOME

#RUN cd /opt && wget -q https://dl.google.com/android/repository/tools_r25.2.5-linux.zip -O android-sdk-tools.zip
# sdk-tools-linux-3773319.zip -> tools_r25.3.1
RUN mkdir -p ${ANDROID_HOME}
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools
RUN cd /opt \
    && wget -q https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -O android-sdk-tools.zip \
    && unzip -qq android-sdk-tools.zip \
    && mv tools/ ${ANDROID_HOME}/tools/ \
    && rm -f android-sdk-tools.zip \
    && yes | sdkmanager --licenses \
    && sdkmanager "tools" \
    && sdkmanager "build-tools;21.1.2" \
    && sdkmanager "build-tools;22.0.1" \
    && sdkmanager "build-tools;23.0.1" \
    && sdkmanager "build-tools;23.0.2" \
    && sdkmanager "build-tools;23.0.3" \
    && sdkmanager "build-tools;24.0.1" \
    && sdkmanager "build-tools;24.0.2" \
    && sdkmanager "build-tools;24.0.3" \
    && sdkmanager "build-tools;24.0.0" \
    && sdkmanager "build-tools;25.0.0" \
    && sdkmanager "build-tools;25.0.1" \
    && sdkmanager "build-tools;25.0.2" \
    && sdkmanager "build-tools;25.0.3" \
    && sdkmanager "build-tools;26.0.0" \
    && sdkmanager "build-tools;26.0.1" \
    && sdkmanager "build-tools;26.0.2" \
    && sdkmanager "build-tools;26.0.3" \
    && sdkmanager "build-tools;27.0.0" \
    && sdkmanager "build-tools;27.0.1" \
    && sdkmanager "build-tools;27.0.2" \
    && sdkmanager "build-tools;27.0.3" \
    && sdkmanager "build-tools;28.0.0" \
    && sdkmanager "build-tools;28.0.1" \
    && sdkmanager "build-tools;28.0.2" \
    && sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.0" \
    && sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.1" \
    && sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0" \
    && sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.1" \
    && sdkmanager "cmake;3.6.4111459" \
    && sdkmanager "platforms;android-21" \
    && sdkmanager "platforms;android-22" \
    && sdkmanager "platforms;android-23" \
    && sdkmanager "platforms;android-24" \
    && sdkmanager "platforms;android-25" \
    && sdkmanager "platforms;android-26" \
    && sdkmanager "platforms;android-27" \
    && sdkmanager "platforms;android-28" \
    && sdkmanager "add-ons;addon-google_apis-google-21" \
    && sdkmanager "add-ons;addon-google_apis-google-22" \
    && sdkmanager "add-ons;addon-google_apis-google-23" \
    && sdkmanager "add-ons;addon-google_apis-google-24" \
    && sdkmanager "platform-tools" \
    && sdkmanager "extras;android;m2repository" \
    && sdkmanager "extras;google;m2repository" \
    && sdkmanager "extras;google;google_play_services" \
    && sdkmanager "extras;google;instantapps" \
    && apt-get clean -y && apt-get autoremove -y & rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

# Go to workspace
RUN mkdir -p /var/workspace
WORKDIR /var/workspace
