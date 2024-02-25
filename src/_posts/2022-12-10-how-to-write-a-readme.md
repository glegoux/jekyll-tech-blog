---
pinned: false
title: "How to write a README?"
description: "After a retrospective of team work, we noted that our computer projects are not sufficient well documented. With my teammates, we decided to create a up-to-date and standard README for all diverse projects that you have with an pragmatic approach that requires minimal efforts for an efficient and effective documentation."
authors: ["glegoux"]
time_reading_minutes: 4
category: "Documentation"
---

A README is the best place to start documenting a project. A README is normally a  **single-page document**  describing your computer project's key aspects. This document can be read in a few minutes maximum. It is the open door for a newcomer who wants an overview of the fundamental aspects of the project.

Having a README for a computer project is a  **common**  enough **thing**  for the code repositories. Still, the  **template**  defining what should contain this README is not standard and often depends on the  **sensibility of the software documentalist**. Avoiding gaps in content and format allows you to align the shared knowledge of your projects in the best common possible way.

The rules for writing a README file will be described with a generic template and a pragmatic methodology agnostic to the tech stack and the project type you use.

First, let's begin defining the type of project that you can have.

A  **project** is a code repository; it can be composed of either one module (**simple project**) or several modules (**complex project**). This project is in an ecosystem composed of dependencies between modules of the same project or other projects. A module can be :

-   An  **application**: It is deployed at runtime with an executable. No other module depends on it except optionally at runtime.
-   A  **library**: It's used by other modules that depend on it for their execution and/or build.

For example, a  **type of project**  can be a code library in (Python, Scala, or Java …), an SDK, a web app with a UI and/or an API, a machine learning model, a data processor, a set of scripts, an OPS configuration module or a scheduled job …

All projects have not necessarily needed a README respected rigorous template; it can use a degraded version in function efforts that you want to provide. Only  **mature projects**  where you want a high level of quality need it, that is to say, for a project used by the community in an intensive or critical way.

# Practical guidelines

_Here are explained the practical guidelines that a README should respect._

For a simple project:

-   The README should be a simple text file called README.<extension>.
-   It should be written in coherent syntax (like  `Markdown`  or  `reStructuredText`).
-   There should be a README at the root of the project.
-   According to the README variant you choose (see sections below), you need to adhere to the variant structure.

For a complex project:

-   The README at the root must have links to the ones of each submodule, with a sentence to describe the role of each module
-   It should have a README for each module
-   The README of each module should respect the guidelines of a simple project

# Template

_Here are the sections that README should contain._

Each  **section**  can contain  **direct or indirect information**  with  **links**  and should contain a  **title section**  with format H1 (i.e., ‘#’ with markdown). A section can be  **optional**  and  **required**  in function of the type of modules.

-   **[Project Title]*** [*: required]  
    - High-level description (with a demo link if applicable)  
    - It should indicate if it is a  `library`  or an  `application  
    `- It should indicate who is the owner of this project
-   **Quick start*** [*: required]  
    - How to set up the development environment, get the repository, install tech stack, …  
    - Link to a demo  
    - How to run the project  
    - How to run the tests
-   **Usage**  [optional only if relevant and helpful]  
    - How to use the project (ex. API description)  
    - Links to help resources  
    - How to contribute to the project (coding style, code of conduct, …)
-   **Main structure*** [*: required]  
    - Link(s) to other “sub-README(s)” (only if the module has submodules)  
    - Links to dependencies  
    - Describe the file architecture of the repository
-   **Architecture** [optional only if relevant and helpful]  
    - Explanation of the design with a diagram and a description …
-   **Deployment****  [**: required only for a deployed application]  
    - Link to the deployment configuration  
    - Link to this history of the deployment with the changelog and the releases  
    - Link to the deployed application
-   **Monitoring****  [**: required only for a deployed application]  
    - Links to monitoring dashboards, …
-   **References**  [required]  
    - Links to the documentation about specifications, improvements, or maintenance…  
    - Other useful links
-   **License**
    - Link to the license and copyright with the general conditions

{% include article/read-more.md
src="https://medium.com/@glegoux/how-to-write-a-readme-f8986d407c1e"
%}

