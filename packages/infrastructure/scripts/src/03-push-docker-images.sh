docker login rg.fr-par.scw.cloud/thetribe -u nologin --password "cdfa1169-b000-4ec6-8af7-eb3ba581c4a4"
# web
# docker tag hr-for-impact/web:latest rg.fr-par.scw.cloud/thetribe/hr-for-impact-web:latest
# docker push rg.fr-par.scw.cloud/thetribe/hr-for-impact-web:latest

# CMS
docker tag hr-for-impact/cms:latest rg.fr-par.scw.cloud/thetribe/hr-for-impact-cms:latest
docker push rg.fr-par.scw.cloud/thetribe/hr-for-impact-cms:latest

# database
# docker tag hr-for-impact/database:latest rg.fr-par.scw.cloud/thetribe/hr-for-impact-database:latest
# docker push rg.fr-par.scw.cloud/thetribe/hr-for-impact-database:latest

