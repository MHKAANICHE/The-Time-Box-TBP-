<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .accordion {
            width: 50%;
            border: 2px solid black;
            border-radius: 5px;
            box-shadow: 4px 4px 0px 0px rgba(0, 0, 0, 1);
        }
        .accordion-button {
            display: flex;          
            align-items: center;
            justify-content: space-between;
            border: 2px solid black;
            background-color: #bc95d4;
            padding: 10px;
            border-radius: 5px 5px 0 0;
            font-weight: bold;
            cursor: pointer;
            transition: border-bottom 0.3s ease-in-out;
          cursor: pointer;
        }

        .accordion-content {
        max-height: 0;
            overflow: hidden;
            border: 2px solid black;
            border-top: 0;
            border-radius: 0 0 5px 5px;
            background-color: white;
            font-weight: bold;
            transition: height 0.3s ease-in-out;
            
        }

        .accordion-content p {
            padding: 10px;
        }

        .rotate-icon {
            min-height: 24px;
            min-width: 24px;
            transition: transform 0.3s ease-in-out;
        }
        .show {
    max-height: 1000px; /* Adjust as needed */
}
    </style>
</head>
<body>
    <article id="tasksArticle">
        <!-- Top Priorities Section -->
        <div class="accordion">
            <!-- Content Toggle Button -->
            <div class="accordion-button" role="button" aria-expanded="false">
                Top Priorities <span class="rotate-icon">&#43;</span>
            </div>
            <!-- Content Container -->
            <div class="accordion-content">
                <p>
                    <ul id="prioritiesList">
                        <!-- Use JSTL or any server-side logic to populate this list -->
                    </ul>
                </p>
            </div>
        </div>

        <!-- Tasks Bubbles Section -->
        <div class="accordion">
            <!-- Content Toggle Button -->
            <div class="accordion-button" role="button" aria-expanded="false">
                Tasks Bubbles <span class="rotate-icon">&#43;</span>
            </div>
            <!-- Content Container -->
            <div class="accordion-content">
                <p>
                    <c:forEach var="task" items="${tasks}">
                        <button class="task-bubble" onClick="location.href='/task/<c:out value='${task.id}/show'/>'">
                            <c:out value="${task.keyWords}" />
                        </button>
                    </c:forEach>
                </p>
            </div>
        </div>
    </article>

    <script src="script.js"></script>
</body>


<script>
    // accordion javascript
   document.addEventListener('DOMContentLoaded', function () {
    const accordionContainer = document.getElementById('tasksArticle');

    accordionContainer.addEventListener('click', function (event) {
        const clickedButton = event.target.closest('.accordion-button');

        if (!clickedButton) {
            return;
        }

        const content = clickedButton.nextElementSibling;
        const icon = clickedButton.querySelector('.rotate-icon');

        if (!content || !icon) {
            return;
        }

        const showContent = content.classList.toggle('show');

        content.style.height = showContent ? content.scrollHeight + 'px' : '0';
        icon.style.transform = `rotate(${showContent ? '45deg' : '0'})`;

        // Close other sections
        const allContents = accordionContainer.querySelectorAll('.accordion-content');
        const allIcons = accordionContainer.querySelectorAll('.rotate-icon');

        allContents.forEach((otherContent) => {
            if (otherContent !== content) {
                otherContent.style.height = '0';
                otherContent.classList.remove('show');
            }
        });

        allIcons.forEach((otherIcon) => {
            if (otherIcon !== icon) {
                otherIcon.style.transform = 'rotate(0)';
            }
        });
    });
});
</script>

</body>
</html>