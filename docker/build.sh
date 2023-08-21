docker build -f docker/Dockerfile --tag razor-build-rockylinux8 --target razor-build-rockylinux8 .
docker build -f docker/Dockerfile --tag razor-build-debian11 --target razor-build-debian11 .

CONTAINER_ID="$(docker create razor-build-rockylinux8)"
docker cp "${CONTAINER_ID}:/app/razor-rockylinux8" docker/pkgs
docker rm "${CONTAINER_ID}"

CONTAINER_ID="$(docker create razor-build-debian11)"
docker cp "${CONTAINER_ID}:/app/razor-debian11" docker/pkgs
docker rm "${CONTAINER_ID}"
