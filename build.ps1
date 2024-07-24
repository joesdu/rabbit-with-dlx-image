$base = "dygood/" ;
$name = "rabbitmq-dlx" ;

# 构建 latest
$tag = ":" + $env:RELEASE_TAG;
$imagename = $base + $name + $tag ;
$imagename ;

docker buildx create --use ;
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/ppc64le,linux/s390x -t $imagename . --progress plain --push ;

$gh = "ghcr.io/joesdu/";
$ghimagename = $gh + $name + $tag ;
$ghimagename;

docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/ppc64le,linux/s390x -t $ghimagename . --progress plain --push ;
