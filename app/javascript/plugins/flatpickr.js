import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";

flatpickr("#request_due_date", {
  altInput: true,
  minDate: "today"
});

// Check that the query selector id matches the one you put around your form.
