$base="dygood/" ;
$name="rabbitmq" ;

# 构建有版本号的
$tag=":3.13.1-management-dlx" ;
$imagename =$base + $name + $tag ;
$imagename ;
docker build -f ./Dockerfile -t $imagename . ;

# 构建 latest
$tag=":latest" ;
$imagename =$base + $name + $tag ;
$imagename ;
docker build -f ./Dockerfile -t $imagename . ;