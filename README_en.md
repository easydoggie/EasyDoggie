# EasyDoggie
[Japanese](https://github.com/easydoggie/EasyDoggie)
> Opinions and renovation requests: [Isuues](https://github.com/easydoggie/EasyDoggie/issues/new/choose) or Twitter DM @sumomo_99. Consider and respond as much as possible. Please feel free to contact us.😁  
  
## Scheduled to be released at the end of 2019
The pre-α version is now available.
Click [this link](https://github.com/easydoggie/EasyDoggie/issues/new/choose) for bugs, feature requests, etc.

Easy Develop and Operation of Game InfrastructurE  
[![logo](https://github.com/easydoggie/EasyDoggie/blob/master/images/logo2.png)](https://easydoggie.github.io/EasyDoggie/)
##  Game infrastructure can be made easier!

Smartphone games are becoming red oceans, making it difficult for small developers to survive. What contribution can we make as a game infrastructure to realize innovative game ideas? In reality, there may be many development companies that have the following problems.

> * I'm a server-side programmer, but I also have infrastructure. It takes time to build and operate the infrastructure and server-side programming does not advance.
>
> * Only beginners of infrastructure are in the company. I don't know how to design middleware parameters. Can all default values ​​be used?
>
> * I am interested in containers and microservices. But I don't know how to deploy and monitor.
>
> * I would like to request an external vendor with a track record in infrastructure design, construction, and operation, but I am worried about outsourcing costs.

To solve such problems of infrastructure design, construction, and operation, there is a method of reusing configured containers.  

Yes, ** EasyDoggie ** has everything from designed containers to CI / CD to operational monitoring!

## EasyDoggie configuration image
![structure](https://github.com/easydoggie/EasyDoggie/blob/master/images/structure_all.png)

## Setup
### Install Helm
EasyDoggie works on Kubernetes. The initial setting of the container is installed using Helm.
First, install Helm and make initial settings.
Helm is also introduced in [Blog](https://www.skyarch.net/blog/?p=16335). Please refer to it if you want to get an overview of Helm.

```text
$ wget https://storage.googleapis.com/kubernetes-helm/helm-v2.13.1-linux-amd64.tar.gz
$ tar xvfz helm-v2.13.1-linux-amd64.tar.gz
$ sudo mv linux-amd64/helm /usr/local/bin/helm
$ helm init
```

For information on installing Helm, please refer to [Blog](https://www.skyarch.net/blog/?p=16350).
In an environment where RBAC access control is enabled, such as GKE, set the service account before installing Tiller (helm init). Also, add a service account specification option when performing helm init.
```text
$ kubectl apply -f https://raw.githubusercontent.com/easydoggie/EasyDoggie/master/serviceaccount/helm-account.yaml
$ helm init --service-account helm
```

### Adding a Helm repository
Add a Helm repository for EasyDoggie.
```text
$ helm repo add easydoggie https://easydoggie.github.io/helm-repo/releases
$ helm repo list
NAME                    URL
stable                  https://kubernetes-charts.storage.googleapis.com
local                   http://127.0.0.1:8879/charts
easydoggie              https://easydoggie.github.io/helm-repo/releases
```

### EasyDoggie installation
Deploy EasyDoggie on Kubernetes using Helm. "easydoggie" chart installs all configurations.
```text
$ helm install --name easydoggie easydoggie/easydoggie
$ kubectl get pods
NAME                                                        READY   STATUS    RESTARTS   AGE
easydoggie-nginx-ingress-controller-749677776f-kb2fl        1/1     Running   0          30s
easydoggie-nginx-ingress-default-backend-8686dd6ff7-qmgdv   1/1     Running   0          30s
gitea-6dc55f758d-cwkt9                                      1/1     Running   0          31s
nginx-64f88989bc-n97ml                                      1/1     Running   0          30s
nginx-unit-5ff6499cb5-9ldnt                                 1/1     Running   0          30s
node-cb997ff45-psj4n                                        1/1     Running   0          30s
```
If you want to install only the necessary packages, specify the installation target chart and install it. The following is an example of installing Nginx only.
```text
$ helm install --name nginx easydoggie/nginx
```
Please refer to [separate page](https://easydoggie.github.io/EasyDoggie/install/) for details on individual installation method.

## Usage
As of August 21, 2019, the following configuration services will start.
![structure_2](https://github.com/easydoggie/EasyDoggie/blob/master/images/structure2.png)

## Configurations
Please refer to [A separate page](https://easydoggie.github.io/EasyDoggie/config/) for the change of configuration middleware parameters.

![qr](https://github.com/easydoggie/EasyDoggie/blob/master/images/easydoggie_qr2.png)

# License
MIT

# Sponsorship
[![skyarch](https://github.com/easydoggie/EasyDoggie/blob/master/images/skyarch.gif)](https://www.skyarch.net/)