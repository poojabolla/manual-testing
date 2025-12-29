FROM registry.access.redhat.com/ubi9/openjdk-21-runtime:1.23

USER root

ARG PROJECT_NAME

WORKDIR /${PROJECT_NAME}

ADD target ./

#RUN chmod -R 777 /PROJECT_NAME

RUN chgrp -R 0 /${PROJECT_NAME} && \
    chmod -R g=u /${PROJECT_NAME}

EXPOSE 8080

# The heap and other jvm options are overridden in the deployment templates
CMD java -Xms512m -Xmx1g -jar ${PROJECT_NAME}.jar