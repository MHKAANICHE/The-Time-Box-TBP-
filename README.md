# The-Time-Box-TBP

"The-Time-Box-TBP" is a transformative timeboxing application developed by [Mohamed KAANICHE](https://www.linkedin.com/in/mhkaaniche/) in December 2023. This application is inspired by the groundbreaking timeboxing methodology as advocated by [Marc Zao-Sanders](https://hbr.org/2018/12/how-timeboxing-works-and-why-it-will-make-you-more-productive). It incorporates insights from a study conducted by tech company Filtered, recognized by [Harvard Business Review](https://www.businessinsider.com/i-tried-top-productivity-tip-time-managment-harvard-2022-6#:~:text=After%20tech%20company%20Filtered%20released,to%20see%20if%20it%20would) as the most useful productivity hack.

## Overview

"The-Time-Box-TBP" is not just an application; it's a transformative tool designed to enhance your productivity and time management skills. The methodology behind it is considered by Harvard Business Review as one of the most crucial skills for modern professionals.

## Features

- **Timeboxing Excellence:** Embrace the essence of timeboxing, a methodology endorsed by industry leaders.
- **Insights from Filtered's Study:** Leverage findings from Filtered's study to enhance your time management skills.
- **Harvard Business Review Acknowledgment:** Recognized by Harvard Business Review as a cornerstone in modern professional development.

## Getting Started

1. Clone the repository: `git clone https://github.com/yourusername/The-Time-Box-TBP.git`
2. Navigate to the project directory: `cd The-Time-Box-TBP`
3. Open the application in your preferred Java IDE.

## Usage

1. Compile and run the `TimeBoxApp.java` file.
2. Follow the on-screen instructions to set up your timeboxing schedule.
3. Enjoy a more productive and organized workday!

## YouTube Short

<p align="center">
  <a href="https://www.youtube.com/shorts/pyRIuI_FkYM">
    <img src="https://img.youtube.com/vi/pyRIuI_FkYM/0.jpg" alt="Watch The-Time-Box-TBP on YouTube">
  </a>
</p>

## Contributing

If you'd like to contribute to this project, please follow our [Contribution Guidelines](CONTRIBUTING.md).

## License

This project is licensed under the [APACHE 2 License](LICENSE).

## Contact

For inquiries or support, please contact Mohamed KAANICHE at [mhkaaniche@gmail.com](mailto:mhkaaniche@gmail.com).




# Version 1.00 
Version 1.00 of the application introduces several key functionalities for task scheduling:

1 - Select Task from Non-Scheduled Tasks:
Users can now choose tasks from the list of non-scheduled tasks for scheduling.
Multiple tasks can be scheduled for the same date, hour, and minute range.

2 - Display Scheduled Tasks:
Scheduled tasks are visually represented in the corresponding hour and minute slots on the scheduling plan.
This provides users with a clear overview of the tasks scheduled for specific time intervals.

3 - Unschedule Task:
Users have the ability to unschedule tasks, allowing them to easily return a task to the list of non-scheduled tasks.

4 - JSP Functionality with JavaScript:
The scheduling functionality is enhanced by incorporating JavaScript.
Task scheduling is initiated automatically upon task selection without the need for a separate confirmation button.

5 - Single-Page Application:
All functionalities and features are integrated into a single-page application.
Users can perform task scheduling, view scheduled tasks, and unschedule tasks seamlessly within the same page.

Overall, version 1.00 streamlines the task scheduling process, enhances user interaction with dynamic updates, and consolidates all application features into a cohesive and user-friendly single-page interface.

# Extra Enhancement: Adding Styles, Dark Mode Toggle, and Code Cleanup

**Changes:**
- Added CSS styles for improved aesthetics.
- Cleaned up code for better readability and maintainability.
- Attributed IDs to various components in the HTML body.
- Introduced a Dark Mode toggle button for improved user experience.
- Implemented Dark Mode styles for a visually appealing alternative.

**Notes:**
- Styles applied to header, aside, main, footer, nav, article, section, textarea, input, and radio.
- Responsive design adjustments for different screen widths.

# Version 1.01
Version 1.01 introduces additional features and enhancements:

1 - Dynamic Date Blobs:
Added a visual representation of Daily Plans with date blobs.
Clicking on a date blob allows users to access and modify tasks associated with that specific date.

2 - Simplified Date Selection:
Optimized date selection process for improved responsiveness.
Transferring tasks to a new date is now a seamless and user-friendly experience.

3 - Enhanced Error Messaging:
Improved error messages for better user understanding.
Users receive clear notifications for date conflicts, guiding them to make appropriate selections.

4 - Task Creation and Date Management:
Implemented functionality for users to create tasks.
Tasks can be added with keywords, descriptions, and priorities.
Users can associate tasks with specific dates (Daily Plan).
Introduced the concept of Daily Plans to group tasks by date.

5 - Task Adjustment and Date Transfer:
Users can view and adjust tasks within a Daily Plan.
Options include changing hours, modifying descriptions, or deleting tasks.
Added functionality to transfer tasks to a new date seamlessly.
If a user types a new date while already present on a date, tasks are automatically transferred to the new date.

6 - Error Handling for Date Conflict:
Implemented error handling for date conflicts.
If a user attempts to use a date that is already in use, a user-friendly error message prompts them to choose a different date.

Overall, version 1.01 builds upon the foundation of version 1.00, providing users with additional features for a more intuitive and efficient task scheduling experience.

# Version 1.02
Version 1.02 introduces additional features and enhancements:

1 - Accordion Styling:
Applied Bootstrap styling to the accordion elements.
Ensured responsiveness across different screen sizes.

2 - Scheduled Tasks Table:
Bootstrap styling added to enhance the appearance.
Made the table scrollable for better user experience.

3 - Checkbox Styling:
Bootstrap styling applied to the checkbox elements in the Top Priorities section.

4 - Modal for Form Errors:
Integrated a Bootstrap modal to display form errors.
Form errors are shown as alert messages within the modal.

5 - Dynamic Confetti Animation:
Implemented a dynamic confetti animation triggered on checkbox change.
jQuery used to handle checkbox change events and initiate the confetti effect.
Addressed an issue where the animation stopped prematurely.

6 - Auto-Opening Accordion Section:
Modified the Top Priorities accordion section to auto-expand on page load.

7 - Date Selection Buttons:
Bootstrap buttons added for date selection.
Improved styling for a more cohesive look.

8 - Footer Styling:
Applied Bootstrap styling to the footer for a cleaner appearance.

9 - Miscellaneous:
Addressed an issue with the display of form errors in the modal.

Next Steps:
Continue testing and refining the user interface.
Ensure compatibility with various browsers and devices.
Address any additional feedback and suggestions.
