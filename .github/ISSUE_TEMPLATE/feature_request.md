name: Feature request
description: Suggest an idea
title: "[Feature] "
labels: ["enhancement"]
body:
  - type: textarea
    id: value
    attributes:
      label: Value
      description: What problem does this solve?
    validations:
      required: true
  - type: textarea
    id: proposal
    attributes:
      label: Proposal
      description: How should it work?
