# start a strappi app
compose-up:
	docker-compose up --abort-on-container-exit

# run jests
ci:
	docker-compose -f docker-compose.yml up --abort-on-container-exit