name: Bug report
description: Create a report to help us improve
title: "[Bug] "
labels: ["bug"]
body:
  - type: textarea
    id: desc
    attributes:
      label: What happened?
      description: Describe the bug
    validations:
      required: true
  - type: textarea
    id: steps
    attributes:
      label: Steps to reproduce
      description: Provide steps
  - type: textarea
    id: logs
    attributes:
      label: Logs
      description: Console or n8n logs
