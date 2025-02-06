# Data Pipeline Automation with GitHub Actions

This is the repository for my custom `Data Pipeline Automation with GitHub Actions` which originated from the work of [Rami Krispin](https://github.com/LinkedInLearning/data-pipeline-automation-with-github-actions-4503382). 

![](/readme_images/pipeline_automation.drawio.png)

This repo is about how to set up workflows on GitHub Actions to automate data processes with Python. 
It shows how to set up a data pipeline, pull metadata from a pipeline, and deploy a live dashboard with GitHub Actions and Pages. 
It automates hours of running manual scripts, pulling data from APIs or updating dashboards.


## Instructions

Some Python code examples are available under the [python folder](https://github.com/portolan75/data_pipeline_automation/tree/main/python).

This repo has VScode [setting](https://github.com/portolan75/data_pipeline_automation/tree/main/.devcontainer/devcontainer.json) to launch the repo inside a Docker container using the Visual Studio Dev Containers extension. The image was built to support arm64 CPU architecture. 
Alternatively, one can install locally the required Python requirements using the [requirements.txt](https://github.com/portolan75/data_pipeline_automation/blob/main/.devcontainer/requirements.txt).


The examples are using the EIA API (Energy Information Administration) to pull data and metadata [EIA website](https://www.eia.gov/opendata/index.php). 
The EIA API is the U.S. Energy Information Administration (EIA) which collects, analyzes, and disseminates independent and impartial energy information to promote sound policymaking, efficient markets, and public understanding of energy and its interaction with the economy and the environment.


For these purposes, data pipeline outputs and metadata are stored locally, in the [csv](https://github.com/portolan75/data_pipeline_automation/blob/main/csv) and [metadata](https://github.com/portolan75/data_pipeline_automation/blob/main/metadata) folders, but as displayed in the image one can make use of cloud services (like AWS S3, Azure Storage, Google Storage) for a production setup.

## Customize the Docker image
To modify the Docker image, just edit the file `.devcontainer/build_docker.sh`, eventually update the image name on `.devcontainer/devcontainer.json` and if other environment variables or requirements changed, consider to edit also `.devcontainer/Dockerfile`, `.devcontainer/requirements.txt`.

To re-create the image:

- `cd ..project_folder/.devcontainer` then
- `bash build_docker.sh`

To open a project within `.devcontatiner`, make sure Terminal is poiting at the project folder (in this example `..path_to/data_pipeline_automation`.
Inside `..path_to/data_pipeline_automation` make sure there's a folder named `.devcontainer` including the files currently available.