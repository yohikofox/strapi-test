docker login rg.fr-par.scw.cloud/thetribe -u nologin --password "cdfa1169-b000-4ec6-8af7-eb3ba581c4a4"

helm package packages/application/web/infrastructure/deploy/chart -d artifacts/
helm upgrade -i hr-for-impact ./artifacts/hr-for-impact-0.1.2.tgz

helm package packages/application/cms/infrastructure/deploy/chart -d artifacts/
helm delete hr-for-impact-cms
helm upgrade --force --recreate-pods -i hr-for-impact-cms ./artifacts/hr-for-impact-cms-0.1.0.tgz
