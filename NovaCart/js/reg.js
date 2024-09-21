window.onload = function () {
    document.getElementById("form1").onsubmit = function () {
        return validateForm();
    };
};

function validateForm() {
    var isValid = true;
    var alertMessages = []; 

    // First Name validation
    var firstName = document.getElementById("TextBox1").value;
    if (firstName.trim() === "") {
        displayError("TextBox1", "First Name is required");
        alertMessages.push("First Name is required");
        isValid = false;
    } else {
        removeError("TextBox1");
    }

    // Last Name validation
    var lastName = document.getElementById("TextBox2").value;
    if (lastName.trim() === "") {
        displayError("TextBox2", "Last Name is required");
        alertMessages.push("Last Name is required");
        isValid = false;
    } else {
        removeError("TextBox2");
    }

    // Email validation
    var email = document.getElementById("TextBox3").value;
    if (email.trim() === "") {
        displayError("TextBox3", "Email is required");
        alertMessages.push("Email is required");
        isValid = false;
    } else if (!validateEmail(email)) {
        displayError("TextBox3", "Please enter a valid email address");
        alertMessages.push("Invalid email address");
        isValid = false;
    } else {
        removeError("TextBox3");
    }

    // User Name validation
    var userName = document.getElementById("TextBox6").value;
    if (userName.trim() === "") {
        displayError("TextBox6", "User Name is required");
        alertMessages.push("User Name is required");
        isValid = false;
    } else {
        removeError("TextBox6");
    }

    // Password validation
    var password = document.getElementById("TextBox4").value;
    if (password.trim() === "") {
        displayError("TextBox4", "Password is required");
        alertMessages.push("Password is required");
        isValid = false;
    } else {
        removeError("TextBox4");
    }

    // Confirm Password validation
    var confirmPassword = document.getElementById("TextBox5").value;
    if (confirmPassword.trim() === "") {
        displayError("TextBox5", "Confirm Password is required");
        alertMessages.push("Confirm Password is required");
        isValid = false;
    } else if (password !== confirmPassword) {
        displayError("TextBox5", "Passwords do not match");
        alertMessages.push("Passwords do not match");
        isValid = false;
    } else {
        removeError("TextBox5");
    }

    // Phone Number validation
    var phoneNumber = document.getElementById("TextBox7").value;
    if (phoneNumber.trim() === "") {
        displayError("TextBox7", "Phone Number is required");
        alertMessages.push("Phone Number is required");
        isValid = false;
    } else if (!validatePhoneNumber(phoneNumber)) {
        displayError("TextBox7", "Please enter a valid phone number");
        alertMessages.push("Invalid phone number");
        isValid = false;
    } else {
        removeError("TextBox7");
    }

    // Pin Code validation
    var pinCode = document.getElementById("TextBox10").value;
    if (pinCode.trim() === "") {
        displayError("TextBox10", "Pin Code is required");
        alertMessages.push("Pin Code is required");
        isValid = false;
    } else {
        removeError("TextBox10");
    }

    // Address validation
    var address = document.getElementById("TextBox8").value;
    if (address.trim() === "") {
        displayError("TextBox8", "Address is required");
        alertMessages.push("Address is required");
        isValid = false;
    } else {
        removeError("TextBox8");
    }

    // Checkbox validation
    var termsAccepted = document.getElementById("CheckBox1").checked;
    if (!termsAccepted) {
        alert("You must agree to the Terms of Service.");
        isValid = false;
    }

    // Show the alert with all the messages
    if (alertMessages.length > 0) {
        alert(alertMessages.join("\n"));
    }

    return isValid;
}

function displayError(elementId, message) {
    var element = document.getElementById(elementId);

    removeError(elementId);

    element.classList.add("is-invalid");

    var errorElement = element.parentNode.querySelector(".invalid-feedback");

    if (!errorElement) {
        errorElement = document.createElement("div");
        errorElement.classList.add("invalid-feedback");
        element.parentNode.appendChild(errorElement);
    }
    errorElement.textContent = message;
}

function removeError(elementId) {
    var element = document.getElementById(elementId);
    element.classList.remove("is-invalid");

    var errorElement = element.parentNode.querySelector(".invalid-feedback");
    if (errorElement) {
        errorElement.remove();
    }
}

function validateEmail(email) {
    var emailPattern = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
    return emailPattern.test(email);
}

function validatePhoneNumber(phoneNumber) {
    var phonePattern = /^[0-9]{10}$/;
    return phonePattern.test(phoneNumber);
}
