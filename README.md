## Weather in terminal app 


#### Synopsis

Print weather for selected location.  
Built based on `wego` ([link to source](https://github.com/schachmat/wego))

#### Pull image

In order to pull image, run:

```
$ docker pull rafalklimczak1989/gowe
```

#### Build container

```
$ docker build -t gowe .
```


#### Preparation

According to [documentation](https://github.com/schachmat/wego/README.md),
For using this container you need to generate api key on one of those services:
* [forecast.io](https://developer.forecast.io/register)
* [Openweathermap](https://home.openweathermap.org/users/sign_up)
* [Worldweatheronline](http://www.worldweatheronline.com/)

Today only openweather map is giving free account

#### Usage

```
$ docker run --rm 
```

In order to print help, run

```
$ docker run --rm gowe -h
```

In order to print weather for London, use:

```
$ docker run --rm gowe -d 3 -l "London" -b openweathermap -owm-api-key <YOUR_API_KEY>
```

Where:
`-d` - number of days  
`-l` - location  
`-b` - backend (one of mentioned services)
`-owm-api-key` - API key (in this case for openweathermap)  

#### Cloud deployment with Ansible 

