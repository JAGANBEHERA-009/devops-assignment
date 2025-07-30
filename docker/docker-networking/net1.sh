# Step 1: Create network
docker network create mynet

# Step 2: Start containers
docker run -dit --name backend --network mynet busybox
docker run -dit --name frontend --network mynet busybox

# Step 3: Check communication
docker exec -it frontend sh
ping backend
