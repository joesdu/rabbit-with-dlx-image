$base = "dygood/" ;
$name = "rabbitmq-dlx" ;

# 推送latest
$tag = ":latest" ;
$imagename = $base + $name + $tag ;
$imagename ;
docker push $imagename ;