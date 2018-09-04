# Ripple Docker Setup Guide!

- Set up and run docker-compose
- Clone this repository
- Run inside directory

        sudo docker-compose build

### Configure Database

- Set password in docker-compose file

### Get pep.py config file

    sudo docker run -v $PWD:/out pep.py /bin/bash -c "python3.6 pep.py && cp config.ini /out/peppy.ini"

Update peppy.ini
- update database pass 
- cikey

#### Get Let's config file

    sudo docker run -v $PWD:/out let.s /bin/bash -c "python3.6 lets.py && cp config.ini /out/lets.ini"

Update lets.ini
- update database pass
- cikey(server/apikey)
- osu api key

#### Get hanayo config file

    sudo docker run -v $PWD:/out hanayo sh -c "./hanayo && cp hanayo.conf /out/hanayo.conf"

Update hanayo.conf
- ListenTo to ":6969"
- DSN=root:pass@tcp(db:3306)/ripple
- RedisEnable=true
- AvatarURL to https://a.domain
- BaseURL to https://domain
- API to http://rippleapi:40001/api/v1/
- BanchoAPI to https://c.domain
- Set APISecret
- MainRippleFolder to ??? (MainRippleFolder/ci-system/ci-system/changelog.txt)
- AvatarFolder to /avatars
- RedisAddress to redis:6379

### Get rippleapi config file 

    sudo docker run -v $PWD:/out rippleapi sh -c "./rippleapi && cp api.conf /out/rippleapi.conf"

Update rippleapi.conf
- DSN to root:pass@tcp(db:3306)/ripple
- hanayo api secret
- osu api key
- RedisAddr=redis:6379

### Old Frontend

```
git clone -b Dockerfile --recurse-submodules https://gitlab.com/ripple-docker/old-frontend/
sudo docker run --rm -v $PWD/old-frontend:/app/ composer install
cp old-frontend/inc/config.sample.php oldfrontend.config.php
```

Update oldfrontend.config.php
- mysql password
- domain

### nginx

```
mkdir keys
sudo openssl req -x509 -nodes -days 99999 -newkey rsa:2048 -keyout ./keys/ppy.sh.key.pem -out ./keys/ppy.sh.cert.pem -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=*.ppy.sh"
```

- Edit [nginx.conf](nginx.conf)
- Replace test.test with your domain
- You need to import the ./keys/ppy.sh.cert.pem on your local computer

### Avatar Server

    mkdir avatars

- Add default 0.png into ./avatars/

## To use

Start with

    sudo docker-compose up -d web

## Nice to Know

You can access portainer to manage your docker containers under domain:9000. Portainer can be used to check logs and container statuses etc.

    sudo docker-compose up -d portainer

You can access phpmyadmin under domain:8056.

    sudo docker-compose up -d phpmyadmin

Don't leave these open in production. lol

## Todo:
- Cheesegull
- Server Switcher
- lets achievement database import
- Update database
