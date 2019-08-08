# infra-gke-terraform
create a infrastructure with terraform on gke

#### (1) Instructions for Terraform

From the google console (IAM & admin) the credentials created need to have a role name *Compute Admin* on the resources that will be used.

##### 1. Clone the repo.
  - `$ cd terraform-provision;`

##### 2. Make sure to have the credentials to create the resources in Google Cloud Platform, you need;
  - to create file called *google-account.json* (this is downloaded from google IAM console from 'create account' -> 'create access key') options.
  - change the *project_id* variable in the file *variables.tf* accordantly with the project.


  To start with the project we need to have a file called `google-account.json` inside the dir called `terraform-provision` E.X `terraform-provision/google-account.json`.
  This file `google-account.json` cannot be checked into the repo because of the key, which will be used to create resources. MAKE SURE ITS IGNORED BY GITHUB OR ANY OTHER REPO.


##### 3. Start with terraform commands.
  Download the terraform plugins
  - `$ terraform init;`

  Check what will be created (how infrastructure/resources will be created )
  - `$ terraform plan;`

  Confirming what is being shown by the `$ terraform plan;` command early, and type *yes* if all looks good.
  - `$ terraform apply;`


===============================================================================================
### Deploy an static website and web-application to the cluster

##### 4. To create a simple app with the nginx web-host-server.
  - copy the 3 file to the instance to create the services/resources
  - `kubectl apply -f deployment.yaml service.yaml ingress.yaml`
  - To check if the ingress is available worldwide run `kc get inggress`


##### 5. To create a simple app with the nginx web-host-server.

To create the Wordpress-cluster connect to mysql run the following Instructions;

In order to create resource 'storage' required for MySQL and Wordpress the first step is to create PersistentVolumeClaims
 - `kubectl apply -f mysql-volumeclaim.yaml`
 - `kubectl apply -f wordpress-volumeclaim.yaml`

Create a resource 'secrete' for the mysql database
- `kubectl create secret generic mysql --from-literal=password=YOUR_PASSWORD`

Create a 'deployment' resource for mysql
- `kubectl create -f mysql.yaml`

Create a resource 'service' for mysql
- `kubectl create -f mysql-service.yaml`

Create a 'deployment' resources for wordpress
- `kubectl create -f wordpress.yaml`

Create a resource 'service' for wordpress
 - `kubectl create -f wordpress-service.yaml`

 ===============================================================================================

 ###### Useful commands ######

 alias kc='kubectl'

 - `kc cluster-info`

 - `kc api-resources --verbs=list` # show all `resources commands` to interact with the kubernetes

 - `kc get pod --all-namespaces -o wide` # show all namespaces
 - `kc describe pod`
 - `kc get all -o wide`
 - `kc get svc -o wide` # get the services
 - `kc get ing -o wide` # get the ingress
 - `kc get deploy -o wide` # get the deployment

 - `kc get nodes --all-namespaces -o wide`


 If the resource is not in default namespace use the -n flag to specify your namespace
