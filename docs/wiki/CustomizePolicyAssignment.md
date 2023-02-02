<!-- markdownlint-disable -->
# How to consume the IP contained in this repo
<!-- markdownlint-restore -->

# Introduction

As described in ./ConsumerGuide.md, the policies and initiatives in this repo can be deployed in a vanilla configuration, i.e. with default settings and are intended to be used as such. There may be however, scenarios where you would want to tweak the initiative assignment a bit for individual policies, assign individual policies or similar. This document lists some of the various scenarios as well as how you would go about making such changes to the assignment. 

## Modify initiative assignment

fixme need to create parameter files

### Change thresholds

To change alert thresholds for one or more metric alerts when assigning initiatives the specific parameters can be either specified on the command line or in a parameter file. For example if we are assigning the connectivity initiative to a management group, the default command would look something like this:

```bash
  az deployment mg create --template-file ./infra-as-code/bicep/assign_initiatives_connectivity.bicep --location $location --management-group-id $connectivityManagementGroup --parameters parPolicyManagementGroupId=$managementGroupId
```
If we want set 



change policy state

other settings are of course also available

### Big Red Button

change alert state for all policies

## Individual policy assignments


