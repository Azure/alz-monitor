# ALZ Monitor Alert Processing Rules

Alert Processing Rules enables the filtering of alerts and direct alerts to approriate action groups based on filter criteria.

For ALZ we will implement a single Action Group per subscription, and initially deploy a single Alert Processing Rule without filters to action alerts via the Action Group.

Suggest a review of minimum filters for the Alert Processing Rule for optimal alert processing.

Available filters:
- Alert condition
- Alert context (payload)
- Alert rule id
- Alert name
- Description
- Monitor service
- Resource
- Resource group
- Resource type
- Severity
- Signal type

As an example suggest Severity (Critical, Error, Warning) only, filtering out (Informational, Verbose).