# Frequently Asked Questions

## Do I need to have Azure Landing zones deployed for this to work?

*No but you will need to be using Azure Management groups and for now our focus is on the resources frequently deployed as part of Azure Landing Zone deployments.*

## Do I need to use the thresholds defined as default values in the metric rule alerts?

*It's provided as a starting point, we've based the initial thresholds on what we've seen and what Microsoft's documentation recommends. You will need to adjust the thresholds at some point.*
*You will need to observe and if the alert is too chatty, adjust the threshold up; if it's not alerting when there's a problem, adjust the threshold down a bit, (or vice-versa depending on what metric or log error is being used as a monitoring source). Once you have decided upon an appropriate value, if you feel it's fit for more general consumption we would love to hear about it.*

## Do I need to use these metrics or can they be replaced with ones more suited to my environment?

*The metric rules we've created are based on recommendations from Microsoft documentation and field experience. How you're using Azure resources may also be different so tailor the alerts to suit your needs. The main goal of this project is to help you have a way to do Azure Monitor alerts at scale, create new rules with your own thresholds. We'd love to hear about your new rules too so feel free to share back.*



