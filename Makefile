ENV_FILE        := ./srcs/.env
DOCKER_FILE        := ./srcs/docker-compose.yml

VOLUMES_DIR        := srcs_mariadb srcs_wordpress
VOLUMES_PATH    := /home/vburton/data/inception_data/
VOLUMES            := $(addprefix $(VOLUMES_PATH)/, $(VOLUMES_DIR))

all: stop load

# The | character specifies order-only prerequisites, which must be built
# before this target but do not trigger a rebuild if they change.
load: | $(VOLUMES)
		docker compose -f $(DOCKER_FILE) --env-file $(ENV_FILE) up -d --build

# Removing the -d flag allows us to see the output of the containers.
debug: | $(VOLUMES)
		docker compose -f $(DOCKER_FILE) --env-file $(ENV_FILE) up --build

# Create the directories if they do not exist.
$(VOLUMES):
		mkdir -p $(VOLUMES)

stop:
		docker compose -f $(DOCKER_FILE) --env-file $(ENV_FILE) down

# Remove the Docker volumes prefixed with 'srcs_', located at /var/lib/docker/volumes/.
# Remove all unused Docker volumes.
# Remove the directories on the host system where the volume data is stored.
clean:    stop
		docker volume rm $(addprefix srcs_, $(VOLUMES_DIR)) -f
		docker volume prune -f
		rm -rf $(VOLUMES_PATH)/*
		docker compose -f srcs/docker-compose.yml down --volumes --rmi all

# Removes all unused Docker objects including images, containers, volumes,
# and networks without confirmation.
prune:	clean
		docker system prune -af

re: prune debug # load

.PHONY: all load debug stop clean prune re
