# ALZ Monitor Alert Approach

The overall approach for enabling alerts in ALZ is to use Azure Policy to deploy relevant alerts as resources are created, configure action group(s), and then use Alert Processing Rules to activate alerts and connect them to the Action Group.

There are two general approaches to enabling alerting in ALZ:

- Centralized
- Decentralized

## Centralized

Metric alerts are deployed with resources (same resource group). Platform alerts like Service Health / Activity are created in a dedicated resource group typically in the Management platform landing zone. A single Alert Action Group in the management landing zone, and Alert Processing Rules enabling filters and connecting alerts to the Action Group.

## Decentralized

Metric alerts are deployed with resources (in the same resource group). Platform alerts like Service Health / Activity are created in a dedicated resource group. a single Alert Action Group in the management landing zone, and Alert Processing Rules enabling filters and connecting alerts to the Action Group.
