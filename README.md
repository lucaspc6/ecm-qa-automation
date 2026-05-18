# QA Automation Project - ECM Marketplace

## Overview

This project is a **QA Automation Suite** designed to validate the ECM Marketplace App (System Under Test).

It simulates real-world QA engineering practices, focusing on end-to-end flows, UI interactions, and state validation.

---

## System Under Test (SUT)

```
QA Automation Project
        ↓
ECM Marketplace App (SUT)
```

The automation:

- Drives user actions
- Interacts with UI elements
- Validates expected results
- Ensures system behavior correctness

This separation reflects real-world QA architecture used in modern engineering teams.

---

## Setup Instructions

### 1. Install dependencies

```bash
pip install -r requirements.txt
rfbrowser init
```

---

### 2. Clone and run the application

```bash
git clone https://github.com/lucaspc6/ecm-marketplace-app.git
cd ecm-marketplace-app
```

---

### 3. Run tests

```bash
robot -d results tests/auth.robot tests/products.robot tests/checkout.robot
```

---

## Test Strategy

- End-to-end validation of user flows
- Explicit waits to handle asynchronous operations
- Validation of both UI and internal application state
- Reusable and structured test design

---

## Notes for Recruiters / Reviewers

This project demonstrates:

- Handling of asynchronous UI flows
- Use of Page Object Model (POM) with clear structure
- Validation beyond UI (state-level verification)
- Reliable and maintainable test automation design

The scope is intentionally focused to highlight core QA engineering practices without unnecessary complexity.
