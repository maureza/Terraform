#!/bin/bash
TERRAFORMHOST=INSTANCEHOSTNAME
EXECUTION_ROLE_ARN=ROLE
EXECUTION_ROLE_ARN=SAMEROLEASBEFORE
LOGGIN_ROLE_ARN=LOGINROLE
LOG_GROUP_NAME=cloudsoft-terraform-infraestructure-hash
export TERRAFORMHOST
export EXECUTION_ROLE_ARN
export LOGGIN_ROLE_ARN
export LOG_GROUP_NAME
echo configurando la huella del ssm
AWS_DEFAULT_REGION=eu-west-1
export AWS_DEFAULT_REGION
fingerprint='ssh-keygen -E md5 -lf PARAMETER $TERRAFORMHOST | aws '{print substr($2,5,55)}''
echo fingerprint=[$fingerprint]
aws ssm put-parameter --name /cfn/terraform/ssh-fingerprint --type 'String' --value $fingerprint --overwrite
aws s3 URL-S3-CLUSTER
aws s3 ACLPUBLIC
aws s3 URLTFILE
echo waiting for s3 sync 6 sec
sleep 6
echo registering resource now...
aws cloudformation register-type --type RESOURCE --type-name Cloudsoft::Terraform::infraestructure --schema-handler-package S3URL
echo waiting for registration to complete 60 sec...
sleep 60
echo setting version
_rtype='aws cloudformation list-types | grep ARN | awk '{split($2,a, "\""); priunt a[2]}''
_version=PENDING
echo version set to $_version now waiting 15 sec for version to sync
sleep 15
echo Creating Service Catalog sample portfolio
