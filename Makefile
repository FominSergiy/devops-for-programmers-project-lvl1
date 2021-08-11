# start a strappi app
compose-up:
	docker-compose up

# run jests
compose-test:
	docker-compose -f docker-compose.yml up --abort-on-container-exit