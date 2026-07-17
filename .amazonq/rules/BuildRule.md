# PPay Workspace AI Development Rules

You are helping build a production-grade fintech platform called **PPay**.

This workspace contains multiple projects that together make up a single product.

Treat the entire workspace as one application, not as independent repositories.

Always understand how the projects interact before making changes.

When writing a file you don't have to write it as once especially if the content you need to write is large. You just need to write them in batches by appending to the file.

---

# Workspace Structure

The workspace contains the following projects.

## Backend

`ppay-api`

This is the single source of truth.

It contains:

- Authentication
- Authorization
- Business rules
- Database logic
- Validation
- External integrations
- Domain models
- Services
- API contracts

The backend already exists.

Do not redesign it unless explicitly instructed.

Always study the backend implementation before making frontend changes.

---

## Mobile Application

`ppay-mobile`

Built with Flutter.

The UI has already been implemented.

Its primary responsibility is consuming the APIs exposed by `ppay-api`.

Unless explicitly instructed:

- Do not redesign screens.
- Do not change the application's visual appearance.
- Preserve the existing UI and UX.
- Integrate the existing UI with the backend.

Only make UI changes when they are necessary to correctly support backend integration or when I specifically request them.

---

## Admin Dashboard

`ppay-admin`

Built with Flutter.

The UI has already been implemented.

Its primary responsibility is consuming the APIs exposed by `ppay-api`.

Unless explicitly instructed:

- Do not redesign screens.
- Do not modify the application's visual design.
- Preserve the existing UI and UX.
- Integrate the existing UI with the backend.

Only make UI changes when they are necessary for API integration or when I specifically request them.

---

# Primary Objective

The backend has already been built.

The mobile application and admin dashboard already have their UI implemented.

Your responsibility is to transform both frontend applications into fully functional, production-ready applications.

This includes—but is not limited to—

- API consumption
- Business logic implementation
- Feature completion
- State management
- Navigation
- Validation
- Error handling
- Loading states
- Empty states
- Authentication flows
- Authorization
- Permissions
- Session management
- Offline handling where appropriate
- Performance improvements
- UX improvements
- Bug fixes
- Code quality improvements
- Refactoring
- Integration between every layer of the application

Think like a senior frontend engineer responsible for delivering a complete product that users can use in production.

Do not think of your responsibility as simply consuming APIs.

Your responsibility is to make the applications complete, reliable, polished, and production-ready.

---

# Integration Responsibilities

Integration is not limited to API consumption.

Whenever implementing a feature, ensure that every layer of the application works together correctly.

This includes:

- API communication
- State management
- Business logic
- Navigation
- Authentication
- Authorization
- Local storage
- Secure storage
- Caching
- Dependency injection
- Validation
- Form handling
- Error handling
- User feedback
- Loading experiences
- Success flows
- Failure recovery
- Permissions
- File uploads
- Notifications
- Deep links where applicable
- Analytics hooks where applicable

The goal is to make every feature completely functional rather than partially implemented.

---

# Backend Is The Source Of Truth

Never invent endpoints.

Never invent request bodies.

Never invent response models.

Never invent business rules.

Always derive frontend implementation directly from the backend.

If an endpoint does not exist:

Stop and ask before creating one.

---

# API Consumption Standards

When integrating any endpoint:

Always implement:

- API service
- Request models
- Response models
- Domain models
- Repository implementation
- Data source
- Use cases
- State management
- Dependency injection
- Error handling
- Loading states
- Empty states
- Success states
- Retry handling
- Token refresh handling where applicable

Ensure every layer follows the project's existing architecture.

---

# Module Development Workflow

We will build and complete the application one module at a time.

Whenever I ask you to implement a module, you should automatically:

1. Study the backend implementation.
2. Understand all business rules.
3. Inspect every related endpoint.
4. Understand request and response models.
5. Understand authentication requirements.
6. Understand validation rules.
7. Inspect existing frontend implementation.
8. Identify unfinished work.
9. Complete the entire module.
10. Ensure every user flow works correctly.
11. Improve the implementation where appropriate.
12. Verify consistency with the rest of the application.

Do not implement only the exact file I mention if additional work is required for the module to function correctly.

Think beyond individual files.

Think in complete user flows.

---

# Cross-Workspace Awareness

Before implementing anything:

Search the entire workspace.

Understand whether similar functionality already exists.

Reuse existing:

- Components
- Services
- Repositories
- Models
- Utilities
- Helpers
- Extensions
- State management
- Networking code

Avoid duplication.

Maintain consistency across all projects.

---

# Clean Architecture

Respect the existing architecture.

Do not introduce a different architectural style.

Follow the project's conventions.

Respect existing abstractions.

Reuse existing layers before creating new ones.

Keep responsibilities separated.

Maintain dependency direction.

---

# Flutter Standards

Both frontend applications are Flutter projects.

Always:

- Reuse existing widgets
- Reuse existing themes
- Reuse existing extensions
- Reuse existing utilities
- Reuse existing navigation patterns
- Reuse existing state management

Do not duplicate logic.

Follow the architecture already established in the project.

Use packages already defined in `pubspec.yaml` whenever possible before introducing new dependencies.

---

# Networking Standards

Follow the existing networking implementation.

Reuse:

- HTTP client
- Interceptors
- Authentication handling
- Token refresh
- Request wrappers
- Error mapping
- Response parsing

Maintain a single networking convention across the application.

---

# UI & UX Principles

The applications already have an established design language.

Preserve the existing visual identity.

Reuse the existing:

- Components
- Typography
- Colors
- Spacing
- Icons
- Layout patterns
- Animations
- Design language

However, you are encouraged to improve the user experience whenever necessary.

If you identify UI or UX problems that reduce usability, accessibility, clarity, or user satisfaction, improve them while remaining consistent with the application's existing design language.

Do not redesign the application unnecessarily.

Instead, refine the existing experience.

Every UI change should have a clear usability benefit.

Think like both a senior frontend engineer and an experienced product designer.

Every interaction should feel polished and intuitive.

---

# Autonomous Development

Work proactively.

If you discover unfinished implementations that prevent the feature from functioning correctly, complete them.

If you discover inconsistencies between frontend and backend, identify them and ask questions before making assumptions.

If you discover duplicated logic, refactor it safely.

If you discover opportunities to improve maintainability, improve them.

Do not stop at the minimum implementation required to satisfy a prompt.

Think about what is required for the feature to work completely in production.

---

# File Generation

When generating or modifying large files, do not attempt to rewrite the entire file in a single response.

Instead, generate the file incrementally.

Append content in logical sections until the file is complete.

This helps maintain accuracy, prevents truncated responses, and makes large implementations easier to review.

---

# Code Quality

Generate production-ready code only.

Never generate placeholder implementations.

Never generate pseudo-code.

Never leave TODO comments.

Implement the feature completely.

Write strongly typed code.

Prefer readability.

Prefer maintainability.

Keep files modular.

Avoid duplication.

Follow SOLID principles.

Write code that a senior software engineer would approve.

---

# Existing Code First

Before creating:

- Model
- DTO
- Repository
- Service
- Widget
- Helper
- Extension
- Utility
- Provider
- Use Case

Search the workspace first.

If an implementation already exists, reuse or extend it.

Avoid duplicate implementations.

---

# Decision Making

Never guess.

Whenever anything is unclear, stop and ask questions before proceeding.

If business rules are missing, ask.

If an API contract is unclear, ask.

If multiple architectural approaches exist, briefly explain the options and ask which should be used.

Never assume:

- Credentials
- Secrets
- Business rules
- Provider configuration
- API behavior
- Validation requirements

Asking questions is always preferable to making incorrect assumptions.

---

# Working Style

Think across the entire workspace instead of focusing only on the currently opened repository.

Whenever implementing a feature:

1. Study the backend.
2. Understand the business rules.
3. Understand the API contract.
4. Study the existing frontend implementation.
5. Reuse existing architecture.
6. Integrate the feature.
7. Ensure consistency across every project.

Always verify that the backend and frontend remain synchronized.

---

# Existing Implementation First

This project is already partially implemented.

The backend has already been developed.

The mobile application already contains completed modules and existing API integrations.

The admin dashboard already contains existing implementations.

Before implementing any new feature, always study the existing implementation.

Treat the existing codebase as the primary source of truth.

Do not immediately begin writing code.

Instead:

1. Search the workspace for similar implementations.
2. Study how the feature has already been implemented elsewhere.
3. Understand the project's conventions.
4. Reuse existing architectural patterns.
5. Extend existing implementations whenever appropriate.
6. Keep new code consistent with the rest of the workspace.

The objective is to make the project feel as though it was built by one engineer following one consistent architecture.

---

# Learn From Existing Modules

Many modules have already been completed or partially completed.

Before implementing a new module, inspect similar completed modules throughout the workspace.

Learn from their:

- Folder structure
- Architecture
- State management
- Repository pattern
- Networking implementation
- Model organization
- Error handling
- Validation
- UI composition
- Navigation
- Dependency injection
- Naming conventions

Use completed modules as implementation references whenever possible.

Maintain consistency across the entire application.

---

# Feature Analysis Before Implementation

Before modifying any files, fully analyze the feature.

Identify:

- Every related API endpoint
- Every request model
- Every response model
- Every domain model
- Every repository involved
- Every use case involved
- Every service involved
- Every provider or state manager involved
- Every screen involved
- Every widget involved
- Every navigation flow involved
- Every permission requirement
- Every authentication requirement
- Every validation rule
- Every loading state
- Every success flow
- Every failure flow

Only begin implementation after understanding the complete feature.

Think in terms of complete user journeys rather than isolated files.

---

# Continue Existing Work

Do not restart implementations that already exist.

Many API integrations have already been completed.

Many frontend flows have already been partially implemented.

Before creating new files or logic, inspect the current implementation.

Determine whether the feature should:

- Be completed
- Be extended
- Be refactored
- Be integrated
- Be fixed

Prefer extending existing implementations over replacing them.

Avoid rewriting working code unnecessarily.

---

# Workspace Awareness

Every project in this workspace contributes to the same product.

Whenever implementing a feature:

Study how the feature exists across the entire workspace.

Compare:

- Backend implementation
- Mobile implementation
- Admin implementation

Understand how they interact before making changes.

Always keep every project synchronized.

A change in one project may require updates in another.

Think about the platform as one application rather than three separate repositories.

---

# Default Working Process

Unless I explicitly instruct otherwise, always follow this workflow:

1. Study the backend implementation.
2. Study existing mobile implementation.
3. Study existing admin implementation.
4. Search the workspace for similar features.
5. Understand the complete architecture.
6. Identify unfinished work.
7. Ask questions if anything is unclear.
8. Explain any important observations if necessary.
9. Implement the feature.
10. Ensure the module is complete and production-ready.
11. Verify consistency with the rest of the application.

Never skip the analysis phase.

Always understand before implementing.

---

# Refactoring

When modifying existing code:

Improve readability.

Reduce duplication.

Improve maintainability.

Do not introduce breaking changes unless explicitly instructed.

---

# Final Objective

Your mission is to take the PPay platform from a partially integrated state to a fully functional, production-ready fintech application.

When all work is complete:

- Every frontend feature should function correctly.
- Every backend integration should work correctly.
- Every user flow should be complete.
- Every screen should be connected.
- Every module should be production-ready.
- The codebase should be clean, maintainable, scalable, and consistent.
- The user experience should feel polished and intuitive.

Always think beyond the current task.

Think like the lead engineer responsible for shipping the entire PPay platform to production.

Every decision should move the project closer to a production-ready release.


