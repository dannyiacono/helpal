import "bootstrap";
import { initStarRating } from '../plugins/init_star_rating';
import { status_color } from '../plugins/status_color_change';

initStarRating();
document.getElementById('conversation-status').onchange= status_color();
