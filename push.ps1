$base="dygood/" ;
$name="rabbitmq" ;

# 推送带本版号的
$tag=":3.13.1-management-dlx" ;
$imagename =$base + $name + $tag ;
$imagename ;
docker push $imagename ;

# 推送latest
$tag=":latest" ;
$imagename =$base + $name + $tag ;
$imagename ;
docker push $imagename ;