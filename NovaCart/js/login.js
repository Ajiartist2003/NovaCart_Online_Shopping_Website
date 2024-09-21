document.addEventListener('DOMContentLoaded', function () {
    var form = document.getElementById('form1');
    var username = document.getElementById('TextBox11');
    var password = document.getElementById('TextBox12');

    form.addEventListener('submit', function (event) {
        clearErrors();

        var isValid = true;

        if (username.value.trim() === '') {
            showError(username, 'Username is required.');
            isValid = false;
        }

        if (password.value.trim() === '') {
            showError(password, 'Password is required.');
            isValid = false;
        }

        if (!isValid) {
            event.preventDefault();
        }
    });

    function showError(element, message) {
        var errorSpan = document.createElement('span');
        errorSpan.className = 'text-danger';
        errorSpan.textContent = message;
        element.parentNode.appendChild(errorSpan);
    }

    function clearErrors() {
        var errorSpans = document.querySelectorAll('.text-danger');
        errorSpans.forEach(function (span) {
            span.remove();
        });
    }
});
