# Overview
This directory contains a number of GitHub Action workflows as follows. Most are for testing and development only, but one is intended as a sample Github Action workflow to allow consumers of the repo to deploy ALZ Monitor policies in an easy and repeatable manner.

### <a name='sample-workflow.yml'></a>.github/workflows/sample-workflow.yml

This workflow is intended to provide a sample workflow for how to deploy and assign policies and policy definitions in default configuration. How to leverage the workflow is described in more detail in ../docs/DeploymentGuide.md. This is the only workflow intended for public consumption. The workflow is triggered by a manual dispatch event and does the following:
- Deploys the ALZ Monitor policy definitions to the root of your specified management group hierarchy
- Deploys the ALZ Monitor policy initiatives to the root of your specified management group hierarchy
- Assigns the relevant initiatives to the relevant management groups in the hierarchy

### <a name='githubworkflowsdeploy-hub-networking.yml'></a>.github/workflows/deploy-hub-networking.yml

This workflow is intended for internal testing only and is not intended for public consumption. NOTE that deployment of this workflow in your environment will deploy a number of artifacts which will incur cost (Azure Firewall, Virtual network gateway etc).

### <a name='githubworkflowsdeploy-vwan-networking.yml'></a>.github/workflows/deploy-vwan-networking.yml

This workflow is intended for internal testing only and is not intended for public consumption. NOTE that deployment of this workflow in your environment will deploy a number of artifacts which will incur cost (Azure Firewall, Virtual network gateway etc).

### <a name='githubworkflowsdelete-networkingresources.yml'></a>.github/workflows/delete-networking resources.yml

This workflow is intended for internal testing only and is not intended for public consumption. NOTE that deployment of this workflow in your environment will potentially delete a number of artifacts.

### <a name='wiki-sync.yml'></a>.github/workflows/wiki-sync.yml

This workflow is handling wiki sync only and is not intended for public consumption.

### <a name='convert-bicep-arm.yml'></a>.github/workflows/convert-bicep-arm.yml

This workflow is handling bicep to ARM conversion and is not intended for public consumption.


