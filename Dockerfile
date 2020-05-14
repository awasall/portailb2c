FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update  && apt-get install -y apt-utils && apt-get install -y curl
#install python
RUN apt-get install -y python3.7
RUN apt-get install -y python3-pip

#install RobotFramework et selenium library
RUN pip3 install  robotframework
RUN pip3 install  robotframework-seleniumlibrary
RUN pip3 install  selenium

#The following are needed for chrome and chromedriver installation
RUN apt-get install -y xvfb
RUN apt-get install -y zip
RUN apt-get install -y wget
RUN apt-get install ca-certificates
RUN apt-get install -y libgbm1 libnss3-dev libasound2 libxss1 libappindicator3-1 libindicator7 gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome*.deb
RUN rm google-chrome*.deb
RUN wget -N  https://chromedriver.storage.googleapis.com/81.0.4044.69/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN chmod +x  chromedriver
#RUN chmod 777 /usr/local/bin/chromedriver
RUN cp /chromedriver /usr/local/bin
RUN rm chromedriver_linux64.zip


#Robot specific
RUN mkdir /robot
RUN mkdir /results
ENTRYPOINT ["robot"]