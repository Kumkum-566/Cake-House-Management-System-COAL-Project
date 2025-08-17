# Cake House Management System 🍰

This project is a simple, menu-driven application for a cake house, written in **Assembly Language** for the DOS environment. It simulates a basic management system where users can purchase items, and an administrator can log in to update prices.

The code is designed to run in an **x86 assembler** environment and uses DOS interrupts (`INT 21H`, `INT 10H`) for I/O operations.

### 🌟 Features

* **User Menu:** Presents a main menu with options to purchase items, access the admin panel, or exit.
* **Item Purchase:** Allows customers to browse and select from a menu of cupcakes and pound cakes.
* **Total Bill Calculation:** Calculates and displays the total cost of the items selected.
* **Admin Panel:** A password-protected section for administrators to update the prices of the cakes.
* **Modular Design:** Uses custom macros (`display`, `replace`, `cls`, etc.) and procedures (`input`, `newline`) to make the code organized and readable.

### 🛠️ Technologies Used

* **Assembly Language (x86):** The core programming language.
* **DOS Interrupts:** Utilizes `INT 21h` for standard input/output and `INT 10h` for screen manipulation (clearing the screen).

### 📂 File Structure

The project consists of a single file:

* `main.asm` (or similar): Contains all the source code for the Cake House Management System.
