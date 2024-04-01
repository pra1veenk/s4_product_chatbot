# S/4 HANA Product Master Chabot Application Docker & Cloud Foundry Deployment

This repository contains the necessary files to containerize the S/4 HANA Product Master Chabot using Docker and deploy the application using SAP Business Application Studio. The `Dockerfile` is used to create a  container image, and the MTA YAML file is used to deploy the application on a Cloud Foundry space using Business Application Studio.


## Dockerfile

The `Dockerfile` in this repository is based on the `python:bookworm` image  that contains the Python 3.11 interpreter and a set of basic libraries based on the Debian Bookworm release.

## Cloud Foundry Deployment

The mta YAML file define the necessary resources to deploy the application to the Cloud Foundry space from Business Application Studio. It includes:

- Application creation
- Specifying disk quota for the application running on Cloud Foundry Space
- Number of instances running for the application
- Environment Variables from SAP AI CORE, SAP HANA Vector Store and S/4 HANA Cloud Credentials

## Usage

1. Navigate to the root folder
2. Build the Docker image using the following command:

```bash
docker build -t your-registry/s4HANAChatbot:latest .
```

3. Push the image to your container registry:

```bash
docker push your-registry/s4HANAChatbot:latest
```

Replace `your-registry` with your actual container registry path.

### Deploying to Cloud Foundry

1. copy the contents in mta.yaml file over to the mta.yaml file on BAS
2. Update the image reference in the mta YAML file to point to the Docker image
3. Update the properties for the environment variables in BAS
4. Runn the command `cf login -a <cf api endpoint>` and fill in your credentials
4. Run the command `mbt build` and a mta_archives folder will be generated along with .mtar file will be generated, this contains the build instructions to deploy to Cloud Foundry
5. Run the command `cf deploy mta_archives/<mtar_filename>.mtar ;`

### Accessing the Application

After deployment, the application should be accessible through the application routes in Cloud Foundry 