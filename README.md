# S/4 HANA Product Master Chabot Application & Cloud Foundry Deployment

This repository contains the necessary files to build the S/4 HANA Product Master Chabot and deploy the application using SAP Business Application Studio. The MTA YAML file is used to deploy the application on a Cloud Foundry space using Business Application Studio.


## Cloud Foundry Deployment

The mta YAML file define the necessary resources to deploy the application to the Cloud Foundry space from Business Application Studio. It includes:

- Application creation
- Specifying disk quota for the application running on Cloud Foundry Space
- Number of instances running for the application
- Environment Variables from SAP AI CORE, SAP HANA Vector Store and S/4 HANA Cloud Credentials


### Deploying to Cloud Foundry

1. Navigate to the root folder
2. Update the properties for the environment variables in BAS
3. Run the command `cf login -a <cf api endpoint>` and fill in your credentials
4. Run the command `mbt build` and a mta_archives folder will be generated along with .mtar file will be generated, this contains the build instructions to deploy to Cloud Foundry
5. Run the command `cf deploy mta_archives/<mtar_filename>.mtar ;`

### Accessing the Application

After deployment, the application should be accessible through the application routes in Cloud Foundry 