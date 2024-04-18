###### Logging

logs:
	docker-compose -f docker-compose.yml -f docker-compose.indyscan.yml -f docker-compose.elastic.yml -f docker-compose.kibana.yml logs -f

logs-indyscan:
	docker-compose -f docker-compose.yml -f docker-compose.indyscan.yml logs -f

logs-elk:
	docker-compose -f docker-compose.yml -f docker-compose.elastic.yml -f docker-compose.kibana.yml logs -f

###### Services All
pull:
	docker-compose -f docker-compose.yml -f docker-compose.indyscan.yml -f docker-compose.elastic.yml -f docker-compose.kibana.yml pull

up:
	docker-compose -f docker-compose.yml -f docker-compose.indyscan.yml -f docker-compose.elastic.yml -f docker-compose.kibana.yml up -d && \
	make logs

down:
	docker-compose -f docker-compose.yml -f docker-compose.indyscan.yml -f docker-compose.elastic.yml -f docker-compose.kibana.yml down

reload:
	make pull && \
	make down && \
	make up && \
	make logs

###### Elastic + Kibana only
up-elk:
	docker-compose -f docker-compose.yml -f docker-compose.kibana.yml -f docker-compose.elastic.yml up -d && \
	make logs-elk

down-elk:
	docker-compose -f docker-compose.yml -f docker-compose.kibana.yml -f docker-compose.elastic.yml down

reload-elk:
	make down-elk && \
	make up-elk && \
	make logs-elk
