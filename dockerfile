FROM node:22-bullseye-slim
WORKDIR /app

RUN apt-get update && apt-get install -y cron curl jq && rm -rf /var/lib/apt/lists/*

RUN addgroup --gid 1001 nodejs && \
    adduser --uid 1001 --gid 1001 --disabled-password --gecos "" nextjs

COPY --chown=nextjs:nodejs . .

WORKDIR /app/server
RUN npm ci --only=production

RUN chmod +x /app/scripts/fetch_btc.sh
RUN echo '* * * * * /app/scripts/fetch_btc.sh' | crontab -u nextjs -

USER nextjs
EXPOSE 3000
CMD ["npm","start"]