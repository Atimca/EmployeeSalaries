# EmployeeSalaries

There are three examples of my code:
1) [With architectural approach and clean code](https://github.com/Atimca/Currencies)
2) [Regarding to one screen task with the `KISS` principle](https://github.com/Atimca/PhotoGallery)
3) **[Just a task written on Objective-C](https://github.com/Atimca/EmployeeSalaries)**

**Task:**

For this assignment we have the Employee class. It has 3 properties:
- name
- birthYear 
- salary

We also have EmployeeDirectory, which is a class that manages loading of employee records.
1) Create a selector in the Employee class that formats the salary of the employee according to the currency the salary is in and returns it as a string in readable format. You can use built-in libraries to show the proper currency symbols.
2) Create a View Controller that shows the list of employees (name, birthYear, and salary) loaded by the EmployeeDirectory. You should use the selector from the previous task to show the salary.
3) Make the View Controller have a button on its navigation toolbar that sorts the employee list by name without blocking the main thread. Use blocks.
4) Bonus points: don’t use storyboards or XIBs.
5) Bonus points: use your own views with custom layout for each employee in the list.
6) Bonus points: where is the performance bottleneck in your code while scrolling your employee list (run on a device)? How could you solve it?

**Disclamer:**

It's just an example, that shows that I can write on Objective-C.