#!/bin/bash

# az policy definition list --query '[].{DisplayName:displayName, Name:name, Description:description}'
# az policy definition list --query '[].{DisplayName:displayName, Name:name}' -o json

# az policy set-definition list --query '[].{DisplayName:displayName, Name:name, Description:description}' -o json

# az policy assignment list -o json

# az policy assignment list --query '[].{DisplayName:displayName, Name:name, PolicyDefinitionId:policyDefinitionId, Scope:scope}' -o json
