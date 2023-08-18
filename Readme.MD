# Create AWS EKS Cluster and deploy to EKS Cluster with Terraform AWS Plugin
Guideline tutorial: https://www.youtube.com/watch?v=nIIxexG7_a8
### Setting up aws user to run terraform
- First create a IAM user named as ``terraform``
- then assign that user to a Group(create it ) ``Admin``, that has ``Administrator access``
- then create access key for that terraform user
- configure aws cli with that terraform user by ``aws configure --profile terraform``

provide id, key, zone -> ``us-east-1``, output format: ``json``
Verify by running, 
```
cat ~/.aws/config
cat ~/.aws/credentials
```

### Order of resource/file creation
- Create Provider
- Create VPC
- Create 4 subnets(2 (pub+private) sets)
### Running the code:
- ``terraform init`` -> to create the terraform engine onto aws
- when you are done writing, everytime issue ``terraform fmt`` to format the code in the terraform code directory
- then you run ``terraform plan`` -> shows an **Preview output** what wil be done if you apply the code and also if there is any error
- Then you apply/execute by -> ``terraform apply`` in the directory, it will execute all the files. 