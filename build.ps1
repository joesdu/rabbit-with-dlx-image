$base = "dygood/" ;
$name = "rabbitmq-dlx" ;

# 构建 release-tag
$tag = ":" + $env:RELEASE_TAG;
$imagename = $base + $name + $tag ;
$imagename ;

docker buildx create --use ;
# linux/arm/v7,linux/ppc64le,linux/s390x
docker buildx build --platform linux/amd64,linux/arm64 -t $imagename . --progress plain --push ;

$gh = "ghcr.io/joesdu/";
$ghimagename = $gh + $name + $tag ;
$ghimagename;

docker buildx build --platform linux/amd64,linux/arm64 -t $ghimagename . --progress plain --push ;

# 构建 latest
$tag = ":latest";
$imagename = $base + $name + $tag ;
$imagename ;

docker buildx create --use ;
docker buildx build --platform linux/amd64,linux/arm64 -t $imagename . --progress plain --push ;

$gh = "ghcr.io/joesdu/";
$ghimagename = $gh + $name + $tag ;
$ghimagename;

docker buildx build --platform linux/amd64,linux/arm64 -t $ghimagename . --progress plain --push ;
