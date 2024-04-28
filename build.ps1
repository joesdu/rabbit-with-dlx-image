$base = "dygood/" ;
$name = "rabbitmq-dlx" ;

# 构建 latest
$tag = ":latest" ;
$imagename = $base + $name + $tag ;
$imagename ;
docker build -f ./Dockerfile -t $imagename . ;