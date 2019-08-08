# infra-gke-terraform
create a infrastructure with terraform on gke

#### (1) Instructions for Terraform

From the google console (IAM & admin) the credentials created need to have a role name *Compute Admin* on the resources that will be used.

##### 1. Clone the repo.
  - `$ cd terraform-provision;`

##### 2. Make sure to have the credentials to create the resources in Google Cloud Platform, you need;
  - to create file called *google-account.json* (this is downloaded from google IAM console).
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


##### 4. To create a simple app with the nginx web-host-server.
  - copy the 3 file to the instance to create the services/resources 
  - `kubectl apply -f deployment.yaml service.yaml ingress.yaml`
  - To check if the ingress is availabke worldwide run `kc get inggress`



###### Usefull commnads ######

alias kc='kubectl'

- `kc cluster-info`

- `kc api-resources --verbs=list`

- `kc get pod --all-namespaces -o wide`
- `kc describe pod`
- `kc get all -o wide`
- `kc get svc -o wide` # get the services
- `kc get ing -o wide` # get the ingress
- `kc get deply -o wide` # get the deployemnt

- `kc get nodes --all-namespaces -o wide`


If the resaource is not in default namespace use the -n flag to specify your namespace 


