# Overview

Bu proje **Hipo Labs** için istenen test alıştırmasını sağlamak için hazırlanmıştır. 
**Robot Framework** ile **Gherkin Style** test adımları yazılmıştır.

# Story
```
Bir kullanıcı olarak,
Gooogle TR adresinden Hipo Labs araması yaparak Hipo Labs sitesine yönlenmek istiyorum
Böylece Hipo Labs sitesinden iş başvurusu yapabileyim
```

## Scenarios
```
    user should search "hipo labs" on google tr and apply a job on hipolabs.com
```

## Nasıl çalışır?

Projeyi Docker ile çalıştırmanızı öneririm.
```
# Using Chromium
docker run --shm-size=1g -it --rm \
    -v `pwd`/reports:/opt/robotframework/reports:Z \
    -v `pwd`/tests:/opt/robotframework/tests:Z \
    -e BROWSER=chrome \
    ppodgorsek/robot-framework:3.2.2

# Using Firefox
docker run --shm-size=1g -it --rm \
    -v `pwd`/reports:/opt/robotframework/reports:Z \
    -v `pwd`/test:/opt/robotframework/tests:Z \
    -e BROWSER=firefox \
    ppodgorsek/robot-framework:latest
```
Kullanabileceğiniz diğer değişken ve parametler için [ppodgorsek/docker-robot-framework](https://www.github.com/ppodgorsek/docker-robot-framework) deposunu inceleyebilirsiniz.

Ayrıca  [Robot Framework](https://robotframework.org/) ve [SeleniumLibrary](https://github.com/robotframework/SeleniumLibrary) yüklü bir sistemde  ```robot ./tests/hipo_qa_exercise.robot``` komutu ile de çalıştırılabilir. 