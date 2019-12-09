FROM debian:buster
#ARG shell
#ENV shell=$shell
RUN echo 'deb http://deb.debian.org/debian buster-backports main' > /etc/apt/sources.list.d/backports.list
#RUN apt-get update && apt-get install -y qtiplot sudo $shell
RUN apt-get update && apt-get install -y qtiplot sudo zsh busybox

# Replace uid/gid with your values
ARG username
ENV username=$username
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/$username && \
    echo "$username:x:${uid}:${gid}:Developer,,,:/home/$username:/bin/bash" >> /etc/passwd && \
    echo "$username:x:${uid}:" >> /etc/group && \
    echo "$username ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    chown ${uid}:${gid} -R /home/$username

USER $username
ENV HOME /home/$username
CMD /usr/bin/qtiplot

