# Rating service deployment to AKS

This is a simple Spring boot microservice which is dockerized. This application is dependent on Azure MysQL to retrieve the ratings data.

## Pre requisite:
 - Azure MySQL database created. DB credentials are loaded into AKS sercrets. If this is not done already, follow the step below:
 - Create a new Service Connection in Devops pipeline. Name it - aks-sc
 - Infrastructure pipelines are created

## Create the database in mysql

## Add the Azure MySQL account credentials to AKS Secrets
```
kubectl create configmap rating-service-mysql --from-literal=spring.datasource.url="<<MYSQL-CS>>" --from-literal=spring.datasource.username=<<MYSQL-USERNAME>>
kubectl create secret generic rating-service-mysql --from-literal=spring.datasource.password=<<MYSQL-PASSWORD>>
```

## Execute the pipeline in Azure DevOps
