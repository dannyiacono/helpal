import "bootstrap";
import "plugins/flatpickr";
import { initStarRating } from '../plugins/init_star_rating';
import { status_color } from '../plugins/status_color_change';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { categoriesIndex } from './categories_index';
import { scrollToLastMessage } from '../plugins/scrollToLastMessage'



initStarRating();
document.querySelectorAll('.conversation-status').onchange= status_color();

initAutocomplete();

categoriesIndex();

document.querySelectorAll('.conversation-messages').onchange= scrollToLastMessage();
