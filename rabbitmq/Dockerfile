FROM rabbitmq:latest
MAINTAINER Roman Galeev <jamhed@2600hz.com>

RUN rabbitmq-plugins --offline enable rabbitmq_management
RUN sed -i 's/true/false/g' /etc/rabbitmq/conf.d/management_agent.disable_metrics_collector.conf
