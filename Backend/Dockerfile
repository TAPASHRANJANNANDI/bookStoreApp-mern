FROM node:20-bullseye

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 4001

CMD ["node" , "index.js"]
# mongodb+srv://tapashbariflo_db_user:yuYD21YBP1bziUSx@cluster1.ynrsg2p.mongodb.net/bookStore?retryWrites=true&w=majority&appName=Cluster1
