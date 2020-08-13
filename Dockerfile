FROM node:6.10.2
ADD ./package.json /tmp/
RUN cd /tmp/ && npm install
RUN npm install -g pm2
ADD ./ /code
RUN cp -r /tmp/node_modules/ /code/
EXPOSE 3000
WORKDIR /code
RUN ls -la
ENTRYPOINT [ "pm2-docker", "app.js" ]