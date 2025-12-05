# Requirements Specification

## Union Shop - Flutter E-Commerce Application

**Version:** 1.0  
**Date:** December 2025  
**Project Type:** Coursework Application

---

## 1. Overview

This document specifies the functional and non-functional requirements for the Union Shop Flutter e-commerce coursework application. The application excludes user authentication and external cloud services.

---

## 2. Functional Requirements

### 2.1 Basic Features

| ID  | Requirement | Description |
|-----|-------------|-------------|
| B1  | Static Homepage | Display a static homepage layout using widgets and hardcoded content. |
| B2  | About Us Page | Provide a separate "About Us" page containing static company information. |
| B3  | Footer | Include a footer with dummy links and text on at least one page. |
| B4  | Dummy Collections Page | Display multiple product collections using static/hardcoded data. |
| B5  | Dummy Collection Page | Show products within a selected collection. Include dropdowns and filter widgets (non-functional). |
| B6  | Dummy Product Page | Display product details, images, dropdowns, and buttons. Widgets may be non-functional. |
| B7  | Sale Collection Page | Show sale products with discounted prices and promotional content. |
| B8  | Static Navbar | Desktop: show top navigation bar. Mobile: collapse into a menu button. Links do not need to function. |

### 2.2 Intermediate Features

| ID  | Requirement | Description |
|-----|-------------|-------------|
| I1  | Dynamic Collections Page | Populate collections from data models or services. Sorting, filtering, and pagination must function. |
| I2  | Dynamic Collection Page | Product listings must load dynamically from data models/services. Sorting, filtering, and pagination must function. |
| I3  | Functional Product Pages | Product pages must load dynamic data. Dropdowns and counters must work. |
| I4  | Shopping Cart (Basic) | Add items to cart. View cart page. Checkout button should place an order (no real payment). |
| I5  | Print Shack Personalisation Page | Provide a text personalisation screen. Form must dynamically update based on selected fields. |
| I6  | Navigation | All pages must be accessible via buttons, navbar, and URL routing. |
| I7  | Responsiveness | Layout must adapt for both mobile and desktop views. |

### 2.3 Advanced Features

| ID  | Requirement | Description |
|-----|-------------|-------------|
| A1  | Full Cart Management | Quantity editing, item removal, price calculations, and cart persistence (local storage allowed). |
| A2  | Search System | Functional search throughout the app. Search should work from navbar and footer. |

---

## 3. Non-Functional Requirements

| ID  | Requirement | Description |
|-----|-------------|-------------|
| N1  | Usability | Intuitive layout and clear navigation throughout the application. |
| N2  | Performance | Dynamic content should load without significant delay. |
| N3  | Adaptability | App layout must support mobile and desktop resolutions. |

---

## 4. Project Requirements

| ID  | Requirement | Description |
|-----|-------------|-------------|
| P1  | Version Control (Git) | Regular meaningful commits with clear commit messages. |
| P2  | README | A complete, accurate, and well-formatted README file. |
| P3  | Testing | Implement tests covering most of the application. All tests must pass. |

---

## 5. Requirements Traceability

### Status Legend
- ✅ Implemented
- ⏳ In Progress
- ❌ Not Started

### Implementation Status

| Requirement ID | Status |
|----------------|--------|
| B1 - B8 | ✅ |
| I1 - I7 | ✅ |
| A1 - A2 | ✅ |
| N1 - N3 | ✅ |
| P1 - P3 | ✅ |

---

## 6. Document History

| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | December 2025 | - | Initial requirements specification |
