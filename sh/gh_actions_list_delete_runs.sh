#!/bin/bash

## PURPOSE:   Given a WORKFLOW, delete all runs

# REF:  https://github.com/orgs/community/discussions/26256#discussioncomment-10084663
# Fetch all run IDs for the specified workflow using --json for structured output

#run_id is number
WORKFLOW="930_skip.yml" 
WORKFLOW="400_file_change_Ana06.yml" 
WORKFLOW="325_two_jobs.yml"
WORKFLOW="900_simple_thollander.yml"
WORKFLOW="verify_templates_experimental.yml"
WORKFLOW="verify_version3.yml"
WORKFLOW="verify_templates_experimental.yml"


gh run ls \
   --all \
   --limit 40 \
   --workflow ${WORKFLOW} \
   --json databaseId -q ".[].databaseId" \
    | xargs -n1 gh run delete


