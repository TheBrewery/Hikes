import Foundation
import UIKit

extension UIFont {
    class func ionicFontOfSize(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "ionicons", size: fontSize)!
    }
}

public let IonicDictionary: [String: String] = [
    "ion-android-color-palette": "\u{f37b}",
    "ion-android-bus": "\u{f36d}",
    "ion-heart-broken": "\u{f31d}",
    "ion-android-home": "\u{f38f}",
    "ion-social-youtube": "\u{f24d}",
    "ion-ios-lightbulb-outline": "\u{f451}",
    "ion-ios-recording": "\u{f497}",
    "ion-arrow-right-c": "\u{f10b}",
    "ion-ios-color-wand": "\u{f416}",
    "ion-log-in": "\u{f29e}",
    "ion-android-compass": "\u{f37c}",
    "ion-ios-close-empty": "\u{f404}",
    "ion-ios-help": "\u{f446}",
    "ion-social-python": "\u{f4e9}",
    "ion-social-vimeo-outline": "\u{f244}",
    "ion-social-whatsapp-outline": "\u{f4ef}",
    "ion-social-yahoo": "\u{f24b}",
    "ion-spoon": "\u{f2b4}",
    "ion-waterdrop": "\u{f25b}",
    "ion-trophy": "\u{f356}",
    "ion-alert-circled": "\u{f100}",
    "ion-ios-rewind": "\u{f4a1}",
    "ion-social-designernews-outline": "\u{f22a}",
    "ion-ios-calculator": "\u{f3f2}",
    "ion-chevron-up": "\u{f126}",
    "ion-android-laptop": "\u{f390}",
    "ion-play": "\u{f215}",
    "ion-funnel": "\u{f31b}",
    "ion-ios-skipforward-outline": "\u{f4ac}",
    "ion-ios-unlocked": "\u{f4c9}",
    "ion-home": "\u{f144}",
    "ion-ios-undo-outline": "\u{f4c6}",
    "ion-ios-arrow-thin-right": "\u{f3d6}",
    "ion-ios-glasses-outline": "\u{f43e}",
    "ion-help-circled": "\u{f142}",
    "ion-ios-barcode": "\u{f3dc}",
    "ion-ios-keypad": "\u{f450}",
    "ion-outlet": "\u{f342}",
    "ion-earth": "\u{f276}",
    "ion-checkmark-round": "\u{f121}",
    "ion-ios-photos-outline": "\u{f481}",
    "ion-ios-stopwatch": "\u{f4b5}",
    "ion-android-happy": "\u{f38e}",
    "ion-icecream": "\u{f27d}",
    "ion-ios-plus": "\u{f48b}",
    "ion-social-codepen": "\u{f4dd}",
    "ion-volume-high": "\u{f257}",
    "ion-android-done": "\u{f383}",
    "ion-android-drafts": "\u{f384}",
    "ion-ios-monitor-outline": "\u{f465}",
    "ion-ios-paper-outline": "\u{f471}",
    "ion-ios-arrow-thin-up": "\u{f3d7}",
    "ion-thermometer": "\u{f2b6}",
    "ion-ios-flame": "\u{f42f}",
    "ion-ios-person-outline": "\u{f47d}",
    "ion-android-contacts": "\u{f2d9}",
    "ion-android-checkbox-blank": "\u{f371}",
    "ion-ios-sunny-outline": "\u{f4b6}",
    "ion-cloud": "\u{f12b}",
    "ion-ios-thunderstorm-outline": "\u{f4bc}",
    "ion-ios-wineglass-outline": "\u{f4d0}",
    "ion-social-nodejs": "\u{f4e7}",
    "ion-eject": "\u{f131}",
    "ion-ios-list-outline": "\u{f453}",
    "ion-social-wordpress-outline": "\u{f248}",
    "ion-android-cloud-circle": "\u{f377}",
    "ion-ios-flower": "\u{f433}",
    "ion-social-google-outline": "\u{f34e}",
    "ion-ios-partlysunny": "\u{f476}",
    "ion-arrow-move": "\u{f263}",
    "ion-ios-analytics-outline": "\u{f3cd}",
    "ion-android-arrow-dropup": "\u{f365}",
    "ion-image": "\u{f147}",
    "ion-load-d": "\u{f29d}",
    "ion-arrow-up-b": "\u{f10d}",
    "ion-plus-circled": "\u{f216}",
    "ion-ios-shuffle-strong": "\u{f4a8}",
    "ion-ios-trash-outline": "\u{f4c4}",
    "ion-ios-volume-low": "\u{f4cf}",
    "ion-ios-arrow-right": "\u{f3d3}",
    "ion-podium": "\u{f344}",
    "ion-ios-undo": "\u{f4c7}",
    "ion-pound": "\u{f219}",
    "ion-chatbubble-working": "\u{f11d}",
    "ion-ios-football-outline": "\u{f436}",
    "ion-android-remove-circle": "\u{f3a9}",
    "ion-ios-crop-strong": "\u{f41d}",
    "ion-ios-lightbulb": "\u{f452}",
    "ion-ios-medical": "\u{f45c}",
    "ion-ios-albums-outline": "\u{f3c9}",
    "ion-android-checkbox-outline-blank": "\u{f372}",
    "ion-ios-locked-outline": "\u{f457}",
    "ion-ios-minus-outline": "\u{f463}",
    "ion-ios-plus-empty": "\u{f489}",
    "ion-plus-round": "\u{f217}",
    "ion-email-unread": "\u{f3c3}",
    "ion-pricetag": "\u{f2aa}",
    "ion-social-skype": "\u{f23f}",
    "ion-social-tux": "\u{f2c5}",
    "ion-ios-home-outline": "\u{f447}",
    "ion-speedometer": "\u{f2b3}",
    "ion-umbrella": "\u{f2b7}",
    "ion-ios-upload": "\u{f4cb}",
    "ion-backspace": "\u{f3bf}",
    "ion-checkmark-circled": "\u{f120}",
    "ion-ios-mic": "\u{f461}",
    "ion-ios-pulse": "\u{f493}",
    "ion-music-note": "\u{f20c}",
    "ion-android-bicycle": "\u{f369}",
    "ion-document": "\u{f12f}",
    "ion-woman": "\u{f25d}",
    "ion-female": "\u{f278}",
    "ion-card": "\u{f119}",
    "ion-android-lock": "\u{f392}",
    "ion-ios-time-outline": "\u{f4be}",
    "ion-social-dribbble": "\u{f22d}",
    "ion-ionic": "\u{f14b}",
    "ion-ios-alarm": "\u{f3c8}",
    "ion-android-plane": "\u{f3a4}",
    "ion-ios-grid-view": "\u{f441}",
    "ion-ios-photos": "\u{f482}",
    "ion-android-person": "\u{f3a0}",
    "ion-social-javascript": "\u{f4e5}",
    "ion-ios-infinite-outline": "\u{f449}",
    "ion-ios-pint": "\u{f486}",
    "ion-social-github-outline": "\u{f232}",
    "ion-medkit": "\u{f2a2}",
    "ion-pinpoint": "\u{f2a7}",
    "ion-social-euro-outline": "\u{f4e0}",
    "ion-android-phone-landscape": "\u{f3a1}",
    "ion-person": "\u{f213}",
    "ion-ios-partlysunny-outline": "\u{f475}",
    "ion-leaf": "\u{f1fd}",
    "ion-ios-flower-outline": "\u{f432}",
    "ion-android-playstore": "\u{f2f0}",
    "ion-ios-book-outline": "\u{f3e7}",
    "ion-social-buffer": "\u{f229}",
    "ion-bluetooth": "\u{f116}",
    "ion-ios-more": "\u{f46a}",
    "ion-beaker": "\u{f269}",
    "ion-heart": "\u{f141}",
    "ion-ios-checkmark-outline": "\u{f3fe}",
    "ion-android-stopwatch": "\u{f2fd}",
    "ion-android-options": "\u{f39d}",
    "ion-bookmark": "\u{f26b}",
    "ion-quote": "\u{f347}",
    "ion-paper-airplane": "\u{f2c3}",
    "ion-asterisk": "\u{f314}",
    "ion-ios-clock-outline": "\u{f402}",
    "ion-ios-flag-outline": "\u{f42c}",
    "ion-calendar": "\u{f117}",
    "ion-ios-minus": "\u{f464}",
    "ion-social-dropbox-outline": "\u{f22e}",
    "ion-social-foursquare-outline": "\u{f34c}",
    "ion-arrow-swap": "\u{f268}",
    "ion-android-arrow-dropdown-circle": "\u{f35e}",
    "ion-android-add-circle": "\u{f359}",
    "ion-arrow-graph-up-left": "\u{f261}",
    "ion-ios-cog-outline": "\u{f411}",
    "ion-paperclip": "\u{f20f}",
    "ion-android-bar": "\u{f368}",
    "ion-erlenmeyer-flask-bubbles": "\u{f3c4}",
    "ion-flash": "\u{f137}",
    "ion-clock": "\u{f26e}",
    "ion-ios-calendar-outline": "\u{f3f3}",
    "ion-ios-nutrition-outline": "\u{f46f}",
    "ion-ios-play-outline": "\u{f487}",
    "ion-ios-skipforward": "\u{f4ad}",
    "ion-pricetags": "\u{f2ab}",
    "ion-android-unlock": "\u{f3b5}",
    "ion-android-arrow-back": "\u{f2ca}",
    "ion-camera": "\u{f118}",
    "ion-social-angular": "\u{f4d9}",
    "ion-social-twitter-outline": "\u{f242}",
    "ion-unlocked": "\u{f254}",
    "ion-ios-eye": "\u{f425}",
    "ion-navicon-round": "\u{f20d}",
    "ion-easel": "\u{f3c2}",
    "ion-ios-paper": "\u{f472}",
    "ion-ios-reload": "\u{f49d}",
    "ion-android-apps": "\u{f35c}",
    "ion-social-apple-outline": "\u{f226}",
    "ion-ios-cloud-download-outline": "\u{f407}",
    "ion-social-dribbble-outline": "\u{f22c}",
    "ion-ios-americanfootball-outline": "\u{f3cb}",
    "ion-arrow-left-a": "\u{f106}",
    "ion-code-working": "\u{f270}",
    "ion-ios-cloud-upload": "\u{f40b}",
    "ion-ios-bookmarks-outline": "\u{f3e9}",
    "ion-wineglass": "\u{f2b9}",
    "ion-ios-location-outline": "\u{f455}",
    "ion-bowtie": "\u{f3c0}",
    "ion-social-css3-outline": "\u{f4de}",
    "ion-compass": "\u{f273}",
    "ion-wand": "\u{f358}",
    "ion-disc": "\u{f12d}",
    "ion-ios-filing-outline": "\u{f428}",
    "ion-toggle-filled": "\u{f354}",
    "ion-social-whatsapp": "\u{f4f0}",
    "ion-android-send": "\u{f2f6}",
    "ion-reply": "\u{f21e}",
    "ion-folder": "\u{f139}",
    "ion-android-settings": "\u{f2f7}",
    "ion-ios-baseball-outline": "\u{f3dd}",
    "ion-ios-medical-outline": "\u{f45b}",
    "ion-skip-forward": "\u{f223}",
    "ion-android-arrow-dropright-circle": "\u{f362}",
    "ion-ios-calculator-outline": "\u{f3f1}",
    "ion-close": "\u{f12a}",
    "ion-ios-nutrition": "\u{f470}",
    "ion-ios-information-empty": "\u{f44b}",
    "ion-arrow-up-a": "\u{f10c}",
    "ion-android-add": "\u{f2c7}",
    "ion-ios-personadd-outline": "\u{f47f}",
    "ion-ios-search-strong": "\u{f4a4}",
    "ion-map": "\u{f203}",
    "ion-model-s": "\u{f2c1}",
    "ion-person-stalker": "\u{f212}",
    "ion-ios-color-filter-outline": "\u{f413}",
    "ion-android-sunny": "\u{f3b0}",
    "ion-android-archive": "\u{f2c9}",
    "ion-chevron-left": "\u{f124}",
    "ion-android-cancel": "\u{f36e}",
    "ion-ios-film-outline": "\u{f42a}",
    "ion-ios-redo-outline": "\u{f498}",
    "ion-ios-paperplane-outline": "\u{f473}",
    "ion-refresh": "\u{f21c}",
    "ion-ios-pie": "\u{f484}",
    "ion-eye": "\u{f133}",
    "ion-android-navigate": "\u{f398}",
    "ion-android-delete": "\u{f37f}",
    "ion-ios-trash": "\u{f4c5}",
    "ion-arrow-right-a": "\u{f109}",
    "ion-ios-checkmark": "\u{f3ff}",
    "ion-ios-cloud-outline": "\u{f409}",
    "ion-checkmark": "\u{f122}",
    "ion-android-checkmark-circle": "\u{f375}",
    "ion-android-upload": "\u{f3b6}",
    "ion-chatbubble": "\u{f11e}",
    "ion-briefcase": "\u{f26c}",
    "ion-erlenmeyer-flask": "\u{f3c5}",
    "ion-android-arrow-forward": "\u{f30f}",
    "ion-hammer": "\u{f27b}",
    "ion-at": "\u{f10f}",
    "ion-ios-bolt": "\u{f3e6}",
    "ion-android-arrow-dropdown": "\u{f35f}",
    "ion-ios-browsers-outline": "\u{f3ef}",
    "ion-ios-calendar": "\u{f3f4}",
    "ion-battery-empty": "\u{f112}",
    "ion-ios-play": "\u{f488}",
    "ion-ios-skipbackward-outline": "\u{f4aa}",
    "ion-ios-tennisball": "\u{f4bb}",
    "ion-minus": "\u{f209}",
    "ion-mouse": "\u{f340}",
    "ion-network": "\u{f341}",
    "ion-person-add": "\u{f211}",
    "ion-social-designernews": "\u{f22b}",
    "ion-social-foursquare": "\u{f34d}",
    "ion-social-linkedin-outline": "\u{f238}",
    "ion-load-a": "\u{f29a}",
    "ion-social-yahoo-outline": "\u{f24a}",
    "ion-usb": "\u{f2b8}",
    "ion-ios-medkit": "\u{f45e}",
    "ion-log-out": "\u{f29f}",
    "ion-ios-grid-view-outline": "\u{f440}",
    "ion-android-desktop": "\u{f380}",
    "ion-scissors": "\u{f34b}",
    "ion-social-rss-outline": "\u{f23c}",
    "ion-android-document": "\u{f381}",
    "ion-social-rss": "\u{f23d}",
    "ion-android-star-half": "\u{f3ad}",
    "ion-soup-can-outline": "\u{f4f3}",
    "ion-arrow-shrink": "\u{f267}",
    "ion-ios-information-outline": "\u{f44c}",
    "ion-key": "\u{f296}",
    "ion-android-hangout": "\u{f38d}",
    "ion-ios-contact-outline": "\u{f419}",
    "ion-coffee": "\u{f272}",
    "ion-closed-captioning": "\u{f317}",
    "ion-social-reddit-outline": "\u{f23a}",
    "ion-university": "\u{f357}",
    "ion-ios-barcode-outline": "\u{f3db}",
    "ion-backspace-outline": "\u{f3be}",
    "ion-ios-pricetags": "\u{f48f}",
    "ion-ios-shuffle": "\u{f4a9}",
    "ion-lock-combination": "\u{f4d4}",
    "ion-android-call": "\u{f2d2}",
    "ion-android-contract": "\u{f37d}",
    "ion-ios-arrow-forward": "\u{f3d1}",
    "ion-ios-arrow-left": "\u{f3d2}",
    "ion-social-chrome-outline": "\u{f4da}",
    "ion-social-twitch": "\u{f4ee}",
    "ion-volume-medium": "\u{f259}",
    "ion-ios-pint-outline": "\u{f485}",
    "ion-social-bitcoin-outline": "\u{f2ae}",
    "ion-happy-outline": "\u{f3c6}",
    "ion-ios-moon-outline": "\u{f467}",
    "ion-arrow-right-b": "\u{f10a}",
    "ion-ios-color-wand-outline": "\u{f415}",
    "ion-android-warning": "\u{f3bc}",
    "ion-minus-circled": "\u{f207}",
    "ion-merge": "\u{f33f}",
    "ion-stats-bars": "\u{f2b5}",
    "ion-wrench": "\u{f2ba}",
    "ion-android-cloud": "\u{f37a}",
    "ion-ios-chatbubble-outline": "\u{f3fb}",
    "ion-power": "\u{f2a9}",
    "ion-android-car": "\u{f36f}",
    "ion-ios-pie-outline": "\u{f483}",
    "ion-ios-camera": "\u{f3f6}",
    "ion-ios-loop-strong": "\u{f459}",
    "ion-images": "\u{f148}",
    "ion-android-arrow-dropleft-circle": "\u{f360}",
    "ion-ios-star": "\u{f4b3}",
    "ion-ios-pricetags-outline": "\u{f48e}",
    "ion-ios-alarm-outline": "\u{f3c7}",
    "ion-toggle": "\u{f355}",
    "ion-social-freebsd-devil": "\u{f2c4}",
    "ion-ios-loop": "\u{f45a}",
    "ion-ios-moon": "\u{f468}",
    "ion-android-remove": "\u{f2f4}",
    "ion-code": "\u{f271}",
    "ion-ios-cart-outline": "\u{f3f7}",
    "ion-ios-reverse-camera": "\u{f49f}",
    "ion-locked": "\u{f200}",
    "ion-paintbrush": "\u{f4d5}",
    "ion-thumbsup": "\u{f251}",
    "ion-trash-b": "\u{f253}",
    "ion-navicon": "\u{f20e}",
    "ion-android-microphone": "\u{f2ec}",
    "ion-android-people": "\u{f39e}",
    "ion-social-hackernews": "\u{f237}",
    "ion-ios-cloudy-night-outline": "\u{f40d}",
    "ion-ios-game-controller-a-outline": "\u{f438}",
    "ion-ios-chatboxes": "\u{f3fa}",
    "ion-ios-circle-filled": "\u{f400}",
    "ion-ios-infinite": "\u{f44a}",
    "ion-android-restaurant": "\u{f3aa}",
    "ion-ios-paw": "\u{f47a}",
    "ion-ios-chatboxes-outline": "\u{f3f9}",
    "ion-ios-email-outline": "\u{f422}",
    "ion-ribbon-a": "\u{f348}",
    "ion-ios-cloud-download": "\u{f408}",
    "ion-ios-help-outline": "\u{f445}",
    "ion-android-expand": "\u{f386}",
    "ion-ios-chatbubble": "\u{f3fc}",
    "ion-ios-location": "\u{f456}",
    "ion-ios-thunderstorm": "\u{f4bd}",
    "ion-man": "\u{f202}",
    "ion-ios-game-controller-a": "\u{f439}",
    "ion-android-done-all": "\u{f382}",
    "ion-ios-search": "\u{f4a5}",
    "ion-android-boat": "\u{f36a}",
    "ion-android-bulb": "\u{f36c}",
    "ion-android-textsms": "\u{f3b2}",
    "ion-ios-americanfootball": "\u{f3cc}",
    "ion-reply-all": "\u{f21d}",
    "ion-social-angular-outline": "\u{f4d8}",
    "ion-ios-sunny": "\u{f4b7}",
    "ion-android-clipboard": "\u{f376}",
    "ion-android-create": "\u{f37e}",
    "ion-ios-more-outline": "\u{f469}",
    "ion-minus-round": "\u{f208}",
    "ion-ios-keypad-outline": "\u{f44f}",
    "ion-social-instagram": "\u{f351}",
    "ion-ios-fastforward": "\u{f427}",
    "ion-android-microphone-off": "\u{f395}",
    "ion-stop": "\u{f24f}",
    "ion-android-sync": "\u{f3b1}",
    "ion-ios-paperplane": "\u{f474}",
    "ion-android-star": "\u{f2fc}",
    "ion-android-globe": "\u{f38c}",
    "ion-ios-plus-outline": "\u{f48a}",
    "ion-monitor": "\u{f20a}",
    "ion-ios-wineglass": "\u{f4d1}",
    "ion-nuclear": "\u{f2a4}",
    "ion-radio-waves": "\u{f2ac}",
    "ion-settings": "\u{f2ad}",
    "ion-share": "\u{f220}",
    "ion-ios-analytics": "\u{f3ce}",
    "ion-mic-c": "\u{f206}",
    "ion-paintbucket": "\u{f4d6}",
    "ion-android-cloud-done": "\u{f378}",
    "ion-ios-bolt-outline": "\u{f3e5}",
    "ion-shuffle": "\u{f221}",
    "ion-ios-minus-empty": "\u{f462}",
    "ion-social-euro": "\u{f4e1}",
    "ion-social-instagram-outline": "\u{f350}",
    "ion-ios-filing": "\u{f429}",
    "ion-search": "\u{f21f}",
    "ion-social-markdown": "\u{f4e6}",
    "ion-social-octocat": "\u{f4e8}",
    "ion-star": "\u{f24e}",
    "ion-ios-recording-outline": "\u{f496}",
    "ion-cash": "\u{f316}",
    "ion-social-reddit": "\u{f23b}",
    "ion-contrast": "\u{f275}",
    "ion-android-list": "\u{f391}",
    "ion-volume-low": "\u{f258}",
    "ion-android-radio-button-off": "\u{f3a6}",
    "ion-social-android-outline": "\u{f224}",
    "ion-knife": "\u{f297}",
    "ion-ios-game-controller-b": "\u{f43b}",
    "ion-ios-pulse-strong": "\u{f492}",
    "ion-android-locate": "\u{f2e9}",
    "ion-upload": "\u{f255}",
    "ion-ios-musical-notes": "\u{f46c}",
    "ion-ios-redo": "\u{f499}",
    "ion-location": "\u{f1ff}",
    "ion-information": "\u{f14a}",
    "ion-android-volume-off": "\u{f3b9}",
    "ion-ios-cog": "\u{f412}",
    "ion-ios-musical-note": "\u{f46b}",
    "ion-arrow-return-right": "\u{f266}",
    "ion-link": "\u{f1fe}",
    "ion-social-css3": "\u{f4df}",
    "ion-fork": "\u{f27a}",
    "ion-ios-folder": "\u{f435}",
    "ion-ios-list": "\u{f454}",
    "ion-ios-circle-outline": "\u{f401}",
    "ion-ios-camera-outline": "\u{f3f5}",
    "ion-android-volume-down": "\u{f3b7}",
    "ion-ios-gear-outline": "\u{f43c}",
    "ion-close-round": "\u{f129}",
    "ion-ios-unlocked-outline": "\u{f4c8}",
    "ion-android-download": "\u{f2dd}",
    "ion-help-buoy": "\u{f27c}",
    "ion-ios-drag": "\u{f421}",
    "ion-ios-box-outline": "\u{f3eb}",
    "ion-social-googleplus": "\u{f235}",
    "ion-social-snapchat-outline": "\u{f4eb}",
    "ion-android-exit": "\u{f385}",
    "ion-android-image": "\u{f2e4}",
    "ion-code-download": "\u{f26f}",
    "ion-ios-download-outline": "\u{f41f}",
    "ion-android-search": "\u{f2f5}",
    "ion-mic-a": "\u{f204}",
    "ion-social-buffer-outline": "\u{f228}",
    "ion-ios-book": "\u{f3e8}",
    "ion-aperture": "\u{f313}",
    "ion-flag": "\u{f279}",
    "ion-ios-telephone": "\u{f4b9}",
    "ion-navigate": "\u{f2a3}",
    "ion-ios-compose-outline": "\u{f417}",
    "ion-ios-flask-outline": "\u{f430}",
    "ion-android-film": "\u{f389}",
    "ion-arrow-left-c": "\u{f108}",
    "ion-ios-contact": "\u{f41a}",
    "ion-connection-bars": "\u{f274}",
    "ion-ios-heart-outline": "\u{f442}",
    "ion-ios-ionic-outline": "\u{f44e}",
    "ion-ios-refresh-outline": "\u{f49b}",
    "ion-xbox": "\u{f30c}",
    "ion-steam": "\u{f30b}",
    "ion-ios-pricetag-outline": "\u{f48c}",
    "ion-ios-rose-outline": "\u{f4a2}",
    "ion-android-favorite": "\u{f388}",
    "ion-social-usd-outline": "\u{f352}",
    "ion-email": "\u{f132}",
    "ion-ios-printer": "\u{f491}",
    "ion-chevron-down": "\u{f123}",
    "ion-ios-world": "\u{f4d3}",
    "ion-record": "\u{f21b}",
    "ion-android-phone-portrait": "\u{f3a2}",
    "ion-android-arrow-dropup-circle": "\u{f364}",
    "ion-information-circled": "\u{f149}",
    "ion-ios-heart": "\u{f443}",
    "ion-flash-off": "\u{f136}",
    "ion-ios-locked": "\u{f458}",
    "ion-calculator": "\u{f26d}",
    "ion-ios-rainy": "\u{f495}",
    "ion-ios-toggle": "\u{f4c3}",
    "ion-magnet": "\u{f2a0}",
    "ion-ios-arrow-up": "\u{f3d8}",
    "ion-android-hand": "\u{f2e3}",
    "ion-android-camera": "\u{f2d3}",
    "ion-android-notifications-none": "\u{f399}",
    "ion-bonfire": "\u{f315}",
    "ion-ios-basketball-outline": "\u{f3df}",
    "ion-ios-mic-outline": "\u{f460}",
    "ion-android-volume-up": "\u{f3ba}",
    "ion-ios-navigate": "\u{f46e}",
    "ion-ios-cloudy-night": "\u{f40e}",
    "ion-cube": "\u{f318}",
    "ion-forward": "\u{f13a}",
    "ion-ios-pricetag": "\u{f48d}",
    "ion-ios-timer-outline": "\u{f4c0}",
    "ion-social-chrome": "\u{f4db}",
    "ion-social-snapchat": "\u{f4ec}",
    "ion-social-tumblr": "\u{f241}",
    "ion-android-arrow-dropright": "\u{f363}",
    "ion-ios-time": "\u{f4bf}",
    "ion-social-tumblr-outline": "\u{f240}",
    "ion-videocamera": "\u{f256}",
    "ion-android-chat": "\u{f2d4}",
    "ion-social-hackernews-outline": "\u{f236}",
    "ion-ios-arrow-thin-left": "\u{f3d5}",
    "ion-social-sass": "\u{f4ea}",
    "ion-skip-backward": "\u{f222}",
    "ion-ios-refresh": "\u{f49c}",
    "ion-film-marker": "\u{f135}",
    "ion-ios-settings": "\u{f4a7}",
    "ion-trash-a": "\u{f252}",
    "ion-ios-cloud-upload-outline": "\u{f40a}",
    "ion-ios-information": "\u{f44d}",
    "ion-ios-people-outline": "\u{f47b}",
    "ion-load-b": "\u{f29b}",
    "ion-ios-person": "\u{f47e}",
    "ion-social-linkedin": "\u{f239}",
    "ion-ios-compose": "\u{f418}",
    "ion-speakerphone": "\u{f2b2}",
    "ion-pie-graph": "\u{f2a5}",
    "ion-ios-speedometer": "\u{f4b0}",
    "ion-drag": "\u{f130}",
    "ion-ios-mic-off": "\u{f45f}",
    "ion-social-usd": "\u{f353}",
    "ion-android-refresh": "\u{f3a8}",
    "ion-ios-briefcase": "\u{f3ee}",
    "ion-ios-help-empty": "\u{f444}",
    "ion-crop": "\u{f3c1}",
    "ion-ios-albums": "\u{f3ca}",
    "ion-battery-charging": "\u{f111}",
    "ion-android-arrow-dropleft": "\u{f361}",
    "ion-android-favorite-outline": "\u{f387}",
    "ion-social-bitcoin": "\u{f2af}",
    "ion-ios-arrow-down": "\u{f3d0}",
    "ion-chatbox": "\u{f11b}",
    "ion-ios-cloudy-outline": "\u{f40f}",
    "ion-planet": "\u{f343}",
    "ion-android-notifications-off": "\u{f39a}",
    "ion-social-facebook": "\u{f231}",
    "ion-social-google": "\u{f34f}",
    "ion-ios-clock": "\u{f403}",
    "ion-battery-low": "\u{f115}",
    "ion-sad-outline": "\u{f4d7}",
    "ion-ios-fastforward-outline": "\u{f426}",
    "ion-ipad": "\u{f1f9}",
    "ion-lightbulb": "\u{f299}",
    "ion-transgender": "\u{f4f5}",
    "ion-social-windows-outline": "\u{f246}",
    "ion-document-text": "\u{f12e}",
    "ion-soup-can": "\u{f4f4}",
    "ion-battery-full": "\u{f113}",
    "ion-android-train": "\u{f3b4}",
    "ion-android-mail": "\u{f2eb}",
    "ion-arrow-graph-up-right": "\u{f262}",
    "ion-laptop": "\u{f1fc}",
    "ion-pull-request": "\u{f345}",
    "ion-fireball": "\u{f319}",
    "ion-ios-folder-outline": "\u{f434}",
    "ion-ipod": "\u{f1fb}",
    "ion-ios-videocam-outline": "\u{f4cc}",
    "ion-ios-at-outline": "\u{f3d9}",
    "ion-gear-a": "\u{f13d}",
    "ion-headphone": "\u{f140}",
    "ion-social-html5-outline": "\u{f4e2}",
    "ion-arrow-left-b": "\u{f107}",
    "ion-pin": "\u{f2a6}",
    "ion-ios-briefcase-outline": "\u{f3ed}",
    "ion-android-folder-open": "\u{f38a}",
    "ion-social-yen": "\u{f4f2}",
    "ion-social-pinterest": "\u{f2b1}",
    "ion-arrow-expand": "\u{f25e}",
    "ion-arrow-graph-down-right": "\u{f260}",
    "ion-ios-people": "\u{f47c}",
    "ion-ios-box": "\u{f3ec}",
    "ion-ios-printer-outline": "\u{f490}",
    "ion-social-facebook-outline": "\u{f230}",
    "ion-more": "\u{f20b}",
    "ion-social-windows": "\u{f247}",
    "ion-ios-rose": "\u{f4a3}",
    "ion-ios-bell": "\u{f3e2}",
    "ion-android-print": "\u{f3a5}",
    "ion-ios-bookmarks": "\u{f3ea}",
    "ion-android-bookmark": "\u{f36b}",
    "ion-ios-football": "\u{f437}",
    "ion-ios-speedometer-outline": "\u{f4af}",
    "ion-load-c": "\u{f29c}",
    "ion-ios-color-filter": "\u{f414}",
    "ion-sad": "\u{f34a}",
    "ion-ios-game-controller-b-outline": "\u{f43a}",
    "ion-filing": "\u{f134}",
    "ion-ios-arrow-back": "\u{f3cf}",
    "ion-ios-star-outline": "\u{f4b2}",
    "ion-ios-volume-high": "\u{f4ce}",
    "ion-ios-browsers": "\u{f3f0}",
    "ion-egg": "\u{f277}",
    "ion-chatbubbles": "\u{f11f}",
    "ion-ios-flag": "\u{f42d}",
    "ion-ios-snowy": "\u{f4ae}",
    "ion-chevron-right": "\u{f125}",
    "ion-android-pin": "\u{f3a3}",
    "ion-compose": "\u{f12c}",
    "ion-arrow-return-left": "\u{f265}",
    "ion-ios-at": "\u{f3da}",
    "ion-social-github": "\u{f233}",
    "ion-social-yen-outline": "\u{f4f1}",
    "ion-ios-baseball": "\u{f3de}",
    "ion-android-walk": "\u{f3bb}",
    "ion-ios-rainy-outline": "\u{f494}",
    "ion-volume-mute": "\u{f25a}",
    "ion-ios-arrow-thin-down": "\u{f3d4}",
    "ion-android-person-add": "\u{f39f}",
    "ion-android-alarm-clock": "\u{f35a}",
    "ion-android-share": "\u{f2f8}",
    "ion-android-notifications": "\u{f39b}",
    "ion-battery-half": "\u{f114}",
    "ion-ios-flask": "\u{f431}",
    "ion-android-calendar": "\u{f2d1}",
    "ion-ios-cloudy": "\u{f410}",
    "ion-ios-download": "\u{f420}",
    "ion-no-smoking": "\u{f2c2}",
    "ion-ios-close": "\u{f406}",
    "ion-android-contact": "\u{f2d8}",
    "ion-ios-medkit-outline": "\u{f45d}",
    "ion-ios-gear": "\u{f43d}",
    "ion-android-open": "\u{f39c}",
    "ion-arrow-down-b": "\u{f104}",
    "ion-ios-checkmark-empty": "\u{f3fd}",
    "ion-ios-reverse-camera-outline": "\u{f49e}",
    "ion-ios-telephone-outline": "\u{f4b8}",
    "ion-plus": "\u{f218}",
    "ion-android-close": "\u{f2d7}",
    "ion-social-pinterest-outline": "\u{f2b0}",
    "ion-ios-pause-outline": "\u{f477}",
    "ion-social-javascript-outline": "\u{f4e4}",
    "ion-tshirt": "\u{f4f7}",
    "ion-ios-star-half": "\u{f4b1}",
    "ion-mic-b": "\u{f205}",
    "ion-happy": "\u{f31c}",
    "ion-ios-cart": "\u{f3f8}",
    "ion-social-android": "\u{f225}",
    "ion-social-wordpress": "\u{f249}",
    "ion-android-star-outline": "\u{f3ae}",
    "ion-ios-timer": "\u{f4c1}",
    "ion-thumbsdown": "\u{f250}",
    "ion-android-alert": "\u{f35b}",
    "ion-archive": "\u{f102}",
    "ion-android-attach": "\u{f367}",
    "ion-bug": "\u{f2be}",
    "ion-grid": "\u{f13f}",
    "ion-fork-repo": "\u{f2c0}",
    "ion-ios-basketball": "\u{f3e0}",
    "ion-ios-film": "\u{f42b}",
    "ion-android-funnel": "\u{f38b}",
    "ion-ios-home": "\u{f448}",
    "ion-android-arrow-down": "\u{f35d}",
    "ion-arrow-down-a": "\u{f103}",
    "ion-ios-body-outline": "\u{f3e3}",
    "ion-loop": "\u{f201}",
    "ion-ios-body": "\u{f3e4}",
    "ion-qr-scanner": "\u{f346}",
    "ion-android-checkbox-outline": "\u{f373}",
    "ion-ios-bell-outline": "\u{f3e1}",
    "ion-android-cart": "\u{f370}",
    "ion-social-apple": "\u{f227}",
    "ion-ios-settings-strong": "\u{f4a6}",
    "ion-beer": "\u{f26a}",
    "ion-plane": "\u{f214}",
    "ion-android-radio-button-on": "\u{f3a7}",
    "ion-android-wifi": "\u{f305}",
    "ion-ios-rewind-outline": "\u{f4a0}",
    "ion-levels": "\u{f298}",
    "ion-ribbon-b": "\u{f349}",
    "ion-ios-glasses": "\u{f43f}",
    "ion-social-codepen-outline": "\u{f4dc}",
    "ion-android-more-horizontal": "\u{f396}",
    "ion-ios-cloud": "\u{f40c}",
    "ion-social-skype-outline": "\u{f23e}",
    "ion-ios-copy-outline": "\u{f41b}",
    "ion-ios-videocam": "\u{f4cd}",
    "ion-android-folder": "\u{f2e0}",
    "ion-eye-disabled": "\u{f306}",
    "ion-ios-navigate-outline": "\u{f46d}",
    "ion-chatboxes": "\u{f11c}",
    "ion-ios-flame-outline": "\u{f42e}",
    "ion-chatbox-working": "\u{f11a}",
    "ion-android-menu": "\u{f394}",
    "ion-ios-stopwatch-outline": "\u{f4b4}",
    "ion-ios-tennisball-outline": "\u{f4ba}",
    "ion-social-dropbox": "\u{f22f}",
    "ion-bag": "\u{f110}",
    "ion-ios-toggle-outline": "\u{f4c2}",
    "ion-gear-b": "\u{f13e}",
    "ion-arrow-resize": "\u{f264}",
    "ion-help": "\u{f143}",
    "ion-playstation": "\u{f30a}",
    "ion-android-volume-mute": "\u{f3b8}",
    "ion-arrow-graph-down-left": "\u{f25f}",
    "ion-clipboard": "\u{f127}",
    "ion-ios-copy": "\u{f41c}",
    "ion-printer": "\u{f21a}",
    "ion-ios-refresh-empty": "\u{f49a}",
    "ion-ios-world-outline": "\u{f4d2}",
    "ion-android-cloud-outline": "\u{f379}",
    "ion-alert": "\u{f101}",
    "ion-arrow-up-c": "\u{f10e}",
    "ion-iphone": "\u{f1fa}",
    "ion-ios-eye-outline": "\u{f424}",
    "ion-ios-paw-outline": "\u{f479}",
    "ion-pause": "\u{f210}",
    "ion-wifi": "\u{f25c}",
    "ion-social-twitter": "\u{f243}",
    "ion-social-youtube-outline": "\u{f24c}",
    "ion-android-sad": "\u{f3ab}",
    "ion-male": "\u{f2a1}",
    "ion-pizza": "\u{f2a8}",
    "ion-ios-monitor": "\u{f466}",
    "ion-ios-crop": "\u{f41e}",
    "ion-ios-skipbackward": "\u{f4ab}",
    "ion-social-vimeo": "\u{f245}",
    "ion-android-arrow-up": "\u{f366}",
    "ion-android-checkbox": "\u{f374}",
    "ion-flame": "\u{f31a}",
    "ion-arrow-down-c": "\u{f105}",
    "ion-edit": "\u{f2bf}",
    "ion-close-circled": "\u{f128}",
    "ion-ios-pause": "\u{f478}",
    "ion-ios-close-outline": "\u{f405}",
    "ion-ios-email": "\u{f423}",
    "ion-android-map": "\u{f393}",
    "ion-social-html5": "\u{f4e3}",
    "ion-android-watch": "\u{f3bd}",
    "ion-social-googleplus-outline": "\u{f234}",
    "ion-android-share-alt": "\u{f3ac}",
    "ion-android-subway": "\u{f3af}",
    "ion-tshirt-outline": "\u{f4f6}",
    "ion-ios-personadd": "\u{f480}",
    "ion-android-time": "\u{f3b3}",
    "ion-jet": "\u{f295}",
    "ion-android-more-vertical": "\u{f397}",
    "ion-ios-upload-outline": "\u{f4ca}",
    "ion-social-twitch-outline": "\u{f4ed}",
]

public enum Ionic: String {
    case AndroidFolder = "\u{f2e0}"
    case IosToggle = "\u{f4c3}"
    case IosInfinite = "\u{f44a}"
    case IosCart = "\u{f3f8}"
    case AndroidPerson = "\u{f3a0}"
    case AndroidMail = "\u{f2eb}"
    case ChevronLeft = "\u{f124}"
    case SocialEuro = "\u{f4e1}"
    case AndroidLaptop = "\u{f390}"
    case IosEmail = "\u{f423}"
    case IosFlameOutline = "\u{f42e}"
    case IosMinus = "\u{f464}"
    case AndroidDoneAll = "\u{f382}"
    case IosSettings = "\u{f4a7}"
    case NoSmoking = "\u{f2c2}"
    case Pricetags = "\u{f2ab}"
    case Share = "\u{f220}"
    case IosCheckmarkOutline = "\u{f3fe}"
    case Briefcase = "\u{f26c}"
    case SocialAndroidOutline = "\u{f224}"
    case SocialDropboxOutline = "\u{f22e}"
    case AndroidAdd = "\u{f2c7}"
    case Calendar = "\u{f117}"
    case SkipBackward = "\u{f222}"
    case IosMicOutline = "\u{f460}"
    case IosArrowLeft = "\u{f3d2}"
    case IosArrowThinRight = "\u{f3d6}"
    case IosFlame = "\u{f42f}"
    case SocialTwitter = "\u{f243}"
    case Pricetag = "\u{f2aa}"
    case IosCompose = "\u{f418}"
    case IosSkipbackwardOutline = "\u{f4aa}"
    case IosTelephone = "\u{f4b9}"
    case IosArrowForward = "\u{f3d1}"
    case SocialPinterest = "\u{f2b1}"
    case SocialAngularOutline = "\u{f4d8}"
    case QrScanner = "\u{f346}"
    case IosVideocamOutline = "\u{f4cc}"
    case VolumeHigh = "\u{f257}"
    case SoupCanOutline = "\u{f4f3}"
    case AndroidColorPalette = "\u{f37b}"
    case IosMedical = "\u{f45c}"
    case IosLockedOutline = "\u{f457}"
    case IosToggleOutline = "\u{f4c2}"
    case IosVolumeLow = "\u{f4cf}"
    case SocialTumblr = "\u{f241}"
    case IosUndoOutline = "\u{f4c6}"
    case SocialTwitchOutline = "\u{f4ed}"
    case DocumentText = "\u{f12e}"
    case IosUnlockedOutline = "\u{f4c8}"
    case IosSearchStrong = "\u{f4a4}"
    case CheckmarkRound = "\u{f121}"
    case AndroidDelete = "\u{f37f}"
    case SocialWhatsapp = "\u{f4f0}"
    case Speedometer = "\u{f2b3}"
    case Mouse = "\u{f340}"
    case ArrowReturnLeft = "\u{f265}"
    case IosCogOutline = "\u{f411}"
    case IosCloudUploadOutline = "\u{f40a}"
    case IosBox = "\u{f3ec}"
    case ArrowMove = "\u{f263}"
    case AndroidMap = "\u{f393}"
    case IosNutrition = "\u{f470}"
    case AndroidClose = "\u{f2d7}"
    case AndroidMoreVertical = "\u{f397}"
    case ArrowRightA = "\u{f109}"
    case IosStarOutline = "\u{f4b2}"
    case At = "\u{f10f}"
    case IosTimerOutline = "\u{f4c0}"
    case IosGameControllerBOutline = "\u{f43a}"
    case Waterdrop = "\u{f25b}"
    case IosBrowsersOutline = "\u{f3ef}"
    case AndroidTime = "\u{f3b3}"
    case IosHeartOutline = "\u{f442}"
    case IosPaperplane = "\u{f474}"
    case AndroidArrowBack = "\u{f2ca}"
    case IosAlarm = "\u{f3c8}"
    case IosPartlysunnyOutline = "\u{f475}"
    case IosRainy = "\u{f495}"
    case IosBody = "\u{f3e4}"
    case IosShuffle = "\u{f4a9}"
    case AndroidArrowDropup = "\u{f365}"
    case MinusRound = "\u{f208}"
    case Bug = "\u{f2be}"
    case SocialWordpress = "\u{f249}"
    case IosSnowy = "\u{f4ae}"
    case IosFlagOutline = "\u{f42c}"
    case AndroidContacts = "\u{f2d9}"
    case AndroidCloud = "\u{f37a}"
    case AndroidPin = "\u{f3a3}"
    case AndroidWatch = "\u{f3bd}"
    case AndroidShareAlt = "\u{f3ac}"
    case SocialWindowsOutline = "\u{f246}"
    case IosColorFilterOutline = "\u{f413}"
    case IosGridView = "\u{f441}"
    case Unlocked = "\u{f254}"
    case AndroidList = "\u{f391}"
    case AndroidMenu = "\u{f394}"
    case ErlenmeyerFlask = "\u{f3c5}"
    case IosGameControllerAOutline = "\u{f438}"
    case IosCartOutline = "\u{f3f7}"
    case IosFlower = "\u{f433}"
    case IosHome = "\u{f448}"
    case IosRefresh = "\u{f49c}"
    case IosEmailOutline = "\u{f422}"
    case Cash = "\u{f316}"
    case AndroidCheckbox = "\u{f374}"
    case Information = "\u{f14a}"
    case Help = "\u{f143}"
    case SocialAndroid = "\u{f225}"
    case AndroidGlobe = "\u{f38c}"
    case IosRewindOutline = "\u{f4a0}"
    case Shuffle = "\u{f221}"
    case Heart = "\u{f141}"
    case IosAt = "\u{f3da}"
    case IosGridViewOutline = "\u{f440}"
    case IosLightbulb = "\u{f452}"
    case AndroidBus = "\u{f36d}"
    case Images = "\u{f148}"
    case Bonfire = "\u{f315}"
    case AndroidMicrophone = "\u{f2ec}"
    case ArrowResize = "\u{f264}"
    case ArrowGraphDownRight = "\u{f260}"
    case AndroidCart = "\u{f370}"
    case AndroidArrowDropright = "\u{f363}"
    case IosPeople = "\u{f47c}"
    case Card = "\u{f119}"
    case Link = "\u{f1fe}"
    case SocialDribbbleOutline = "\u{f22c}"
    case IosAmericanfootball = "\u{f3cc}"
    case AndroidOpen = "\u{f39c}"
    case ForkRepo = "\u{f2c0}"
    case SocialUsdOutline = "\u{f352}"
    case IosChatbubble = "\u{f3fc}"
    case AndroidVolumeMute = "\u{f3b8}"
    case NaviconRound = "\u{f20d}"
    case IosAmericanfootballOutline = "\u{f3cb}"
    case PersonAdd = "\u{f211}"
    case IosHomeOutline = "\u{f447}"
    case ArrowShrink = "\u{f267}"
    case IosFiling = "\u{f429}"
    case HappyOutline = "\u{f3c6}"
    case IosCameraOutline = "\u{f3f5}"
    case AndroidCancel = "\u{f36e}"
    case Thumbsdown = "\u{f250}"
    case Tshirt = "\u{f4f7}"
    case IosBaseball = "\u{f3de}"
    case IosCloseOutline = "\u{f405}"
    case BatteryFull = "\u{f113}"
    case Edit = "\u{f2bf}"
    case Plane = "\u{f214}"
    case AndroidCheckmarkCircle = "\u{f375}"
    case Document = "\u{f12f}"
    case CheckmarkCircled = "\u{f120}"
    case IosBook = "\u{f3e8}"
    case IosCog = "\u{f412}"
    case IosKeypadOutline = "\u{f44f}"
    case IosThunderstormOutline = "\u{f4bc}"
    case Record = "\u{f21b}"
    case AndroidExpand = "\u{f386}"
    case IosThunderstorm = "\u{f4bd}"
    case Person = "\u{f213}"
    case IosFastforwardOutline = "\u{f426}"
    case ModelS = "\u{f2c1}"
    case Headphone = "\u{f140}"
    case SocialPinterestOutline = "\u{f2b0}"
    case IosIonicOutline = "\u{f44e}"
    case IosBellOutline = "\u{f3e1}"
    case IosBasketball = "\u{f3e0}"
    case IosLocked = "\u{f458}"
    case IosSpeedometerOutline = "\u{f4af}"
    case SocialTux = "\u{f2c5}"
    case IosMusicalNotes = "\u{f46c}"
    case SocialChrome = "\u{f4db}"
    case IosFootball = "\u{f437}"
    case IosFlowerOutline = "\u{f432}"
    case IosFilingOutline = "\u{f428}"
    case AndroidCall = "\u{f2d2}"
    case AndroidCreate = "\u{f37e}"
    case IosBookmarks = "\u{f3ea}"
    case AndroidDownload = "\u{f2dd}"
    case EmailUnread = "\u{f3c3}"
    case IosPersonadd = "\u{f480}"
    case IosContactOutline = "\u{f419}"
    case AndroidPlaystore = "\u{f2f0}"
    case AndroidWifi = "\u{f305}"
    case Flag = "\u{f279}"
    case SocialGoogleplusOutline = "\u{f234}"
    case Folder = "\u{f139}"
    case Plus = "\u{f218}"
    case Funnel = "\u{f31b}"
    case Easel = "\u{f3c2}"
    case IosPlusEmpty = "\u{f489}"
    case Image = "\u{f147}"
    case IosBriefcase = "\u{f3ee}"
    case IosUploadOutline = "\u{f4ca}"
    case Map = "\u{f203}"
    case IosCloudyNightOutline = "\u{f40d}"
    case PlusCircled = "\u{f216}"
    case SocialSkype = "\u{f23f}"
    case SocialYoutube = "\u{f24d}"
    case VolumeLow = "\u{f258}"
    case SocialDesignernews = "\u{f22b}"
    case Forward = "\u{f13a}"
    case IosFlag = "\u{f42d}"
    case AndroidArrowDropleft = "\u{f361}"
    case IosReverseCameraOutline = "\u{f49e}"
    case ArrowDownC = "\u{f105}"
    case AndroidRadioButtonOff = "\u{f3a6}"
    case Leaf = "\u{f1fd}"
    case Power = "\u{f2a9}"
    case AndroidCloudOutline = "\u{f379}"
    case AndroidRemoveCircle = "\u{f3a9}"
    case Magnet = "\u{f2a0}"
    case IosAlbumsOutline = "\u{f3c9}"
    case AndroidAlarmClock = "\u{f35a}"
    case IosNavigateOutline = "\u{f46d}"
    case IosStar = "\u{f4b3}"
    case IosLocationOutline = "\u{f455}"
    case AndroidRestaurant = "\u{f3aa}"
    case MicB = "\u{f205}"
    case Monitor = "\u{f20a}"
    case IosUpload = "\u{f4cb}"
    case Filing = "\u{f134}"
    case Fork = "\u{f27a}"
    case IosPaperplaneOutline = "\u{f473}"
    case AndroidArchive = "\u{f2c9}"
    case IosPulseStrong = "\u{f492}"
    case IosTime = "\u{f4bf}"
    case SocialCss3 = "\u{f4df}"
    case AndroidVolumeOff = "\u{f3b9}"
    case IosUndo = "\u{f4c7}"
    case StatsBars = "\u{f2b5}"
    case AlertCircled = "\u{f100}"
    case IosKeypad = "\u{f450}"
    case IosPricetags = "\u{f48f}"
    case Contrast = "\u{f275}"
    case AndroidPhonePortrait = "\u{f3a2}"
    case Camera = "\u{f118}"
    case IosFlaskOutline = "\u{f430}"
    case IosRedo = "\u{f499}"
    case AndroidFavoriteOutline = "\u{f387}"
    case ArrowDownB = "\u{f104}"
    case IosArrowThinDown = "\u{f3d4}"
    case IosFolderOutline = "\u{f434}"
    case IosCrop = "\u{f41e}"
    case Chatbubble = "\u{f11e}"
    case Beer = "\u{f26a}"
    case IosMinusOutline = "\u{f463}"
    case Sad = "\u{f34a}"
    case IosPersonaddOutline = "\u{f47f}"
    case SocialCodepen = "\u{f4dd}"
    case IosPlus = "\u{f48b}"
    case AndroidBar = "\u{f368}"
    case Eject = "\u{f131}"
    case IosFootballOutline = "\u{f436}"
    case Spoon = "\u{f2b4}"
    case IosPersonOutline = "\u{f47d}"
    case IosMedkit = "\u{f45e}"
    case Grid = "\u{f13f}"
    case SocialJavascript = "\u{f4e5}"
    case IosTrashOutline = "\u{f4c4}"
    case IosCloudy = "\u{f410}"
    case IosCloudDownloadOutline = "\u{f407}"
    case IosMinusEmpty = "\u{f462}"
    case IosPieOutline = "\u{f483}"
    case AndroidCloudCircle = "\u{f377}"
    case IosPulse = "\u{f493}"
    case IosRedoOutline = "\u{f498}"
    case IosArrowBack = "\u{f3cf}"
    case MicA = "\u{f204}"
    case IosPintOutline = "\u{f485}"
    case SocialCss3Outline = "\u{f4de}"
    case AndroidExit = "\u{f385}"
    case IosGameControllerB = "\u{f43b}"
    case Archive = "\u{f102}"
    case BatteryHalf = "\u{f114}"
    case IosClose = "\u{f406}"
    case IosArrowThinLeft = "\u{f3d5}"
    case AndroidStarOutline = "\u{f3ae}"
    case CloseCircled = "\u{f128}"
    case AndroidBoat = "\u{f36a}"
    case Calculator = "\u{f26d}"
    case IosComposeOutline = "\u{f417}"
    case IosPerson = "\u{f47e}"
    case Jet = "\u{f295}"
    case ArrowDownA = "\u{f103}"
    case Coffee = "\u{f272}"
    case IosMic = "\u{f461}"
    case SocialGoogleOutline = "\u{f34e}"
    case SocialYoutubeOutline = "\u{f24c}"
    case Location = "\u{f1ff}"
    case BatteryLow = "\u{f115}"
    case AndroidLocate = "\u{f2e9}"
    case IosColorFilter = "\u{f414}"
    case Code = "\u{f271}"
    case IosBriefcaseOutline = "\u{f3ed}"
    case Loop = "\u{f201}"
    case AndroidNotificationsNone = "\u{f399}"
    case AndroidAlert = "\u{f35b}"
    case IosNutritionOutline = "\u{f46f}"
    case AndroidBookmark = "\u{f36b}"
    case IosRefreshOutline = "\u{f49b}"
    case IosStarHalf = "\u{f4b1}"
    case IosFilm = "\u{f42b}"
    case Nuclear = "\u{f2a4}"
    case IosCloudyNight = "\u{f40e}"
    case SadOutline = "\u{f4d7}"
    case ChatbubbleWorking = "\u{f11d}"
    case IosBodyOutline = "\u{f3e3}"
    case ArrowGraphUpLeft = "\u{f261}"
    case SocialYen = "\u{f4f2}"
    case IosLightbulbOutline = "\u{f451}"
    case Thumbsup = "\u{f251}"
    case AndroidContract = "\u{f37d}"
    case IosEyeOutline = "\u{f424}"
    case Playstation = "\u{f30a}"
    case IosCalculatorOutline = "\u{f3f1}"
    case SocialUsd = "\u{f353}"
    case SocialWindows = "\u{f247}"
    case AndroidImage = "\u{f2e4}"
    case Chatboxes = "\u{f11c}"
    case Steam = "\u{f30b}"
    case AndroidRadioButtonOn = "\u{f3a7}"
    case IosStopwatchOutline = "\u{f4b4}"
    case BackspaceOutline = "\u{f3be}"
    case IosMedkitOutline = "\u{f45d}"
    case IosAnalyticsOutline = "\u{f3cd}"
    case ArrowUpC = "\u{f10e}"
    case IosShuffleStrong = "\u{f4a8}"
    case IosMoonOutline = "\u{f467}"
    case IosTrash = "\u{f4c5}"
    case IosMicOff = "\u{f45f}"
    case IosPricetagsOutline = "\u{f48e}"
    case SocialBitcoin = "\u{f2af}"
    case IosRainyOutline = "\u{f494}"
    case SocialTwitch = "\u{f4ee}"
    case IosCopy = "\u{f41c}"
    case IosGameControllerA = "\u{f439}"
    case IosDownload = "\u{f420}"
    case IosInfiniteOutline = "\u{f449}"
    case RadioWaves = "\u{f2ac}"
    case AndroidArrowDroprightCircle = "\u{f362}"
    case SocialWordpressOutline = "\u{f248}"
    case Lightbulb = "\u{f299}"
    case AndroidLock = "\u{f392}"
    case AndroidArrowUp = "\u{f366}"
    case AndroidArrowDropdown = "\u{f35f}"
    case IosColorWand = "\u{f416}"
    case IosHeart = "\u{f443}"
    case IosInformationOutline = "\u{f44c}"
    case IosPaw = "\u{f47a}"
    case AndroidCloudDone = "\u{f378}"
    case Female = "\u{f278}"
    case IosPawOutline = "\u{f479}"
    case AndroidStarHalf = "\u{f3ad}"
    case IosTelephoneOutline = "\u{f4b8}"
    case Chatbubbles = "\u{f11f}"
    case IosVolumeHigh = "\u{f4ce}"
    case IosBookmarksOutline = "\u{f3e9}"
    case RibbonB = "\u{f349}"
    case SocialReddit = "\u{f23b}"
    case IosChatbubbleOutline = "\u{f3fb}"
    case IosAnalytics = "\u{f3ce}"
    case AndroidFolderOpen = "\u{f38a}"
    case AndroidUpload = "\u{f3b6}"
    case LogOut = "\u{f29f}"
    case Eye = "\u{f133}"
    case PersonStalker = "\u{f212}"
    case IosWineglassOutline = "\u{f4d0}"
    case SocialChromeOutline = "\u{f4da}"
    case AndroidMoreHorizontal = "\u{f396}"
    case IosListOutline = "\u{f453}"
    case IosCamera = "\u{f3f6}"
    case Aperture = "\u{f313}"
    case IosLocation = "\u{f456}"
    case AndroidCamera = "\u{f2d3}"
    case AndroidWalk = "\u{f3bb}"
    case Search = "\u{f21f}"
    case SocialFoursquare = "\u{f34d}"
    case Beaker = "\u{f269}"
    case SocialGithub = "\u{f233}"
    case AndroidDone = "\u{f383}"
    case SocialAppleOutline = "\u{f226}"
    case SocialGithubOutline = "\u{f232}"
    case SocialMarkdown = "\u{f4e6}"
    case SocialYenOutline = "\u{f4f1}"
    case Wrench = "\u{f2ba}"
    case Home = "\u{f144}"
    case IosReload = "\u{f49d}"
    case SocialHtml5Outline = "\u{f4e2}"
    case IosArrowRight = "\u{f3d3}"
    case AndroidCompass = "\u{f37c}"
    case IosCalendar = "\u{f3f4}"
    case IosContact = "\u{f41a}"
    case AndroidVolumeDown = "\u{f3b7}"
    case IosPartlysunny = "\u{f476}"
    case Speakerphone = "\u{f2b2}"
    case University = "\u{f357}"
    case IosArrowUp = "\u{f3d8}"
    case Settings = "\u{f2ad}"
    case Disc = "\u{f12d}"
    case IosLoop = "\u{f45a}"
    case IosFilmOutline = "\u{f42a}"
    case AndroidChat = "\u{f2d4}"
    case AndroidHand = "\u{f2e3}"
    case AndroidFilm = "\u{f389}"
    case IosHelp = "\u{f446}"
    case Clipboard = "\u{f127}"
    case ClosedCaptioning = "\u{f317}"
    case Drag = "\u{f130}"
    case ErlenmeyerFlaskBubbles = "\u{f3c4}"
    case ArrowLeftC = "\u{f108}"
    case IosMoreOutline = "\u{f469}"
    case ChatboxWorking = "\u{f11a}"
    case IosAtOutline = "\u{f3d9}"
    case IosPricetag = "\u{f48d}"
    case IosPricetagOutline = "\u{f48c}"
    case IosWineglass = "\u{f4d1}"
    case Podium = "\u{f344}"
    case Scissors = "\u{f34b}"
    case PieGraph = "\u{f2a5}"
    case SocialOctocat = "\u{f4e8}"
    case IosRewind = "\u{f4a1}"
    case TshirtOutline = "\u{f4f6}"
    case ArrowGraphDownLeft = "\u{f25f}"
    case ArrowRightC = "\u{f10b}"
    case Paintbucket = "\u{f4d6}"
    case IosRose = "\u{f4a3}"
    case SocialLinkedinOutline = "\u{f238}"
    case AndroidTextsms = "\u{f3b2}"
    case IosArrowDown = "\u{f3d0}"
    case Close = "\u{f12a}"
    case HelpBuoy = "\u{f27c}"
    case IosBarcodeOutline = "\u{f3db}"
    case AndroidCheckboxBlank = "\u{f371}"
    case Earth = "\u{f276}"
    case Quote = "\u{f347}"
    case Trophy = "\u{f356}"
    case Minus = "\u{f209}"
    case Reply = "\u{f21e}"
    case Upload = "\u{f255}"
    case AndroidOptions = "\u{f39d}"
    case IosDrag = "\u{f421}"
    case IosCloudyOutline = "\u{f40f}"
    case SocialDesignernewsOutline = "\u{f22a}"
    case IosSunny = "\u{f4b7}"
    case Bowtie = "\u{f3c0}"
    case IosClock = "\u{f403}"
    case Medkit = "\u{f2a2}"
    case Outlet = "\u{f342}"
    case More = "\u{f20b}"
    case AndroidArrowDropleftCircle = "\u{f360}"
    case AndroidSubway = "\u{f3af}"
    case IosCalculator = "\u{f3f2}"
    case IosPrinter = "\u{f491}"
    case IosGearOutline = "\u{f43c}"
    case ArrowUpA = "\u{f10c}"
    case AndroidUnlock = "\u{f3b5}"
    case BatteryEmpty = "\u{f112}"
    case IosCloud = "\u{f40c}"
    case IosFastforward = "\u{f427}"
    case IosTimeOutline = "\u{f4be}"
    case AndroidNavigate = "\u{f398}"
    case Compass = "\u{f273}"
    case Hammer = "\u{f27b}"
    case SocialHackernews = "\u{f237}"
    case SocialBitcoinOutline = "\u{f2ae}"
    case TrashB = "\u{f253}"
    case SocialWhatsappOutline = "\u{f4ef}"
    case AndroidCheckboxOutline = "\u{f373}"
    case AndroidPrint = "\u{f3a5}"
    case ChevronUp = "\u{f126}"
    case AndroidDrafts = "\u{f384}"
    case FilmMarker = "\u{f135}"
    case IosLoopStrong = "\u{f459}"
    case IosSkipforwardOutline = "\u{f4ac}"
    case Levels = "\u{f298}"
    case AndroidCheckboxOutlineBlank = "\u{f372}"
    case ArrowSwap = "\u{f268}"
    case SocialDribbble = "\u{f22d}"
    case SocialGoogleplus = "\u{f235}"
    case SocialSass = "\u{f4ea}"
    case Clock = "\u{f26e}"
    case IosPeopleOutline = "\u{f47b}"
    case AndroidArrowDropdownCircle = "\u{f35e}"
    case IosHelpOutline = "\u{f445}"
    case SocialRssOutline = "\u{f23c}"
    case AndroidShare = "\u{f2f8}"
    case AndroidHome = "\u{f38f}"
    case IosBoltOutline = "\u{f3e5}"
    case IosPauseOutline = "\u{f477}"
    case SocialJavascriptOutline = "\u{f4e4}"
    case AndroidRefresh = "\u{f3a8}"
    case AndroidVolumeUp = "\u{f3ba}"
    case ArrowUpB = "\u{f10d}"
    case IosRecordingOutline = "\u{f496}"
    case MicC = "\u{f206}"
    case AndroidSettings = "\u{f2f7}"
    case Printer = "\u{f21a}"
    case Cloud = "\u{f12b}"
    case IosBaseballOutline = "\u{f3dd}"
    case IosInformation = "\u{f44d}"
    case LockCombination = "\u{f4d4}"
    case IosMonitorOutline = "\u{f465}"
    case LoadA = "\u{f29a}"
    case SocialBuffer = "\u{f229}"
    case AndroidStopwatch = "\u{f2fd}"
    case Email = "\u{f132}"
    case IosColorWandOutline = "\u{f415}"
    case IosFolder = "\u{f435}"
    case Alert = "\u{f101}"
    case Ipod = "\u{f1fb}"
    case Asterisk = "\u{f314}"
    case HeartBroken = "\u{f31d}"
    case IosChatboxes = "\u{f3fa}"
    case IosPrinterOutline = "\u{f490}"
    case AndroidClipboard = "\u{f376}"
    case IosBell = "\u{f3e2}"
    case AndroidRemove = "\u{f2f4}"
    case AndroidApps = "\u{f35c}"
    case Backspace = "\u{f3bf}"
    case PullRequest = "\u{f345}"
    case Navigate = "\u{f2a3}"
    case SocialApple = "\u{f227}"
    case IosBolt = "\u{f3e6}"
    case Knife = "\u{f297}"
    case AndroidBulb = "\u{f36c}"
    case ReplyAll = "\u{f21d}"
    case SocialCodepenOutline = "\u{f4dc}"
    case SocialRss = "\u{f23d}"
    case Thermometer = "\u{f2b6}"
    case TrashA = "\u{f252}"
    case IosSearch = "\u{f4a5}"
    case Wifi = "\u{f25c}"
    case SocialFacebookOutline = "\u{f230}"
    case Navicon = "\u{f20e}"
    case IosBrowsers = "\u{f3f0}"
    case IosSpeedometer = "\u{f4b0}"
    case AndroidCar = "\u{f36f}"
    case IosCopyOutline = "\u{f41b}"
    case IosHelpEmpty = "\u{f444}"
    case AndroidBicycle = "\u{f369}"
    case AndroidPersonAdd = "\u{f39f}"
    case IosCircleOutline = "\u{f401}"
    case IosVideocam = "\u{f4cd}"
    case LoadC = "\u{f29c}"
    case IosEye = "\u{f425}"
    case ConnectionBars = "\u{f274}"
    case LogIn = "\u{f29e}"
    case Paperclip = "\u{f20f}"
    case Pinpoint = "\u{f2a7}"
    case AndroidStar = "\u{f2fc}"
    case SocialDropbox = "\u{f22f}"
    case SocialLinkedin = "\u{f239}"
    case SoupCan = "\u{f4f4}"
    case Transgender = "\u{f4f5}"
    case SocialRedditOutline = "\u{f23a}"
    case Planet = "\u{f343}"
    case AndroidArrowDropupCircle = "\u{f364}"
    case AndroidContact = "\u{f2d8}"
    case IosRecording = "\u{f497}"
    case IosUnlocked = "\u{f4c9}"
    case Pizza = "\u{f2a8}"
    case SocialBufferOutline = "\u{f228}"
    case AndroidDocument = "\u{f381}"
    case IosDownloadOutline = "\u{f41f}"
    case CloseRound = "\u{f129}"
    case IosPause = "\u{f478}"
    case IosCloudUpload = "\u{f40b}"
    case Iphone = "\u{f1fa}"
    case Paintbrush = "\u{f4d5}"
    case IosReverseCamera = "\u{f49f}"
    case IosAlbums = "\u{f3ca}"
    case IosCheckmarkEmpty = "\u{f3fd}"
    case ArrowLeftA = "\u{f106}"
    case IosMoon = "\u{f468}"
    case Fireball = "\u{f319}"
    case IosChatboxesOutline = "\u{f3f9}"
    case SocialTumblrOutline = "\u{f240}"
    case VolumeMedium = "\u{f259}"
    case IosGear = "\u{f43d}"
    case IosCheckmark = "\u{f3ff}"
    case SocialVimeo = "\u{f245}"
    case IosPlay = "\u{f488}"
    case IosSettingsStrong = "\u{f4a6}"
    case Cube = "\u{f318}"
    case Flash = "\u{f137}"
    case AndroidSunny = "\u{f3b0}"
    case IosArrowThinUp = "\u{f3d7}"
    case Key = "\u{f296}"
    case AndroidPlane = "\u{f3a4}"
    case SocialNodejs = "\u{f4e7}"
    case SocialYahoo = "\u{f24b}"
    case AndroidSearch = "\u{f2f5}"
    case IosSkipforward = "\u{f4ad}"
    case IosPhotos = "\u{f482}"
    case IosClockOutline = "\u{f402}"
    case IosRefreshEmpty = "\u{f49a}"
    case SocialFoursquareOutline = "\u{f34c}"
    case Egg = "\u{f277}"
    case InformationCircled = "\u{f149}"
    case SocialTwitterOutline = "\u{f242}"
    case Male = "\u{f2a1}"
    case IosAlarmOutline = "\u{f3c7}"
    case SocialPython = "\u{f4e9}"
    case AndroidAddCircle = "\u{f359}"
    case Icecream = "\u{f27d}"
    case IosCalendarOutline = "\u{f3f3}"
    case IosPhotosOutline = "\u{f481}"
    case AndroidNotifications = "\u{f39b}"
    case GearB = "\u{f13e}"
    case IosGlasses = "\u{f43f}"
    case Man = "\u{f202}"
    case ChevronRight = "\u{f125}"
    case SocialSnapchatOutline = "\u{f4eb}"
    case AndroidArrowForward = "\u{f30f}"
    case ArrowExpand = "\u{f25e}"
    case IosBarcode = "\u{f3dc}"
    case IosCloseEmpty = "\u{f404}"
    case IosInformationEmpty = "\u{f44b}"
    case IosPaper = "\u{f472}"
    case AndroidPeople = "\u{f39e}"
    case AndroidFavorite = "\u{f388}"
    case ArrowRightB = "\u{f10a}"
    case IosCloudDownload = "\u{f408}"
    case IosPie = "\u{f484}"
    case Bluetooth = "\u{f116}"
    case IosList = "\u{f454}"
    case IosPint = "\u{f486}"
    case MinusCircled = "\u{f207}"
    case MusicNote = "\u{f20c}"
    case IosWorld = "\u{f4d3}"
    case AndroidDesktop = "\u{f380}"
    case AndroidArrowDown = "\u{f35d}"
    case AndroidWarning = "\u{f3bc}"
    case Locked = "\u{f200}"
    case PaperAirplane = "\u{f2c3}"
    case Merge = "\u{f33f}"
    case IosWorldOutline = "\u{f4d2}"
    case AndroidSync = "\u{f3b1}"
    case Checkmark = "\u{f122}"
    case CodeWorking = "\u{f270}"
    case AndroidHappy = "\u{f38e}"
    case IosBasketballOutline = "\u{f3df}"
    case CodeDownload = "\u{f26f}"
    case IosMusicalNote = "\u{f46b}"
    case Bookmark = "\u{f26b}"
    case Happy = "\u{f31c}"
    case IosCropStrong = "\u{f41d}"
    case IosNavigate = "\u{f46e}"
    case IosPlusOutline = "\u{f48a}"
    case AndroidMicrophoneOff = "\u{f395}"
    case ArrowGraphUpRight = "\u{f262}"
    case AndroidCalendar = "\u{f2d1}"
    case ArrowLeftB = "\u{f107}"
    case GearA = "\u{f13d}"
    case Ipad = "\u{f1f9}"
    case Pause = "\u{f210}"
    case IosSunnyOutline = "\u{f4b6}"
    case Play = "\u{f215}"
    case Refresh = "\u{f21c}"
    case SocialEuroOutline = "\u{f4e0}"
    case AndroidSend = "\u{f2f6}"
    case SocialFacebook = "\u{f231}"
    case SocialFreebsdDevil = "\u{f2c4}"
    case IosPaperOutline = "\u{f471}"
    case SocialGoogle = "\u{f34f}"
    case SocialHackernewsOutline = "\u{f236}"
    case AndroidHangout = "\u{f38d}"
    case EyeDisabled = "\u{f306}"
    case IosBookOutline = "\u{f3e7}"
    case SocialHtml5 = "\u{f4e3}"
    case SocialInstagramOutline = "\u{f350}"
    case Ionic = "\u{f14b}"
    case SocialSkypeOutline = "\u{f23e}"
    case Crop = "\u{f3c1}"
    case IosPlayOutline = "\u{f487}"
    case SocialYahooOutline = "\u{f24a}"
    case Stop = "\u{f24f}"
    case BatteryCharging = "\u{f111}"
    case HelpCircled = "\u{f142}"
    case Toggle = "\u{f355}"
    case Umbrella = "\u{f2b7}"
    case Usb = "\u{f2b8}"
    case SocialSnapchat = "\u{f4ec}"
    case Videocamera = "\u{f256}"
    case VolumeMute = "\u{f25a}"
    case IosCloudOutline = "\u{f409}"
    case Wand = "\u{f358}"
    case IosBoxOutline = "\u{f3eb}"
    case Xbox = "\u{f30c}"
    case LoadB = "\u{f29b}"
    case IosMedicalOutline = "\u{f45b}"
    case SocialInstagram = "\u{f351}"
    case ArrowReturnRight = "\u{f266}"
    case AndroidFunnel = "\u{f38b}"
    case SkipForward = "\u{f223}"
    case AndroidNotificationsOff = "\u{f39a}"
    case Compose = "\u{f12c}"
    case IosGlassesOutline = "\u{f43e}"
    case ChevronDown = "\u{f123}"
    case IosTennisballOutline = "\u{f4ba}"
    case PlusRound = "\u{f217}"
    case Pound = "\u{f219}"
    case Star = "\u{f24e}"
    case Flame = "\u{f31a}"
    case Woman = "\u{f25d}"
    case AndroidTrain = "\u{f3b4}"
    case Chatbox = "\u{f11b}"
    case IosStopwatch = "\u{f4b5}"
    case IosTennisball = "\u{f4bb}"
    case ToggleFilled = "\u{f354}"
    case Laptop = "\u{f1fc}"
    case IosCircleFilled = "\u{f400}"
    case IosTimer = "\u{f4c1}"
    case LoadD = "\u{f29d}"
    case IosRoseOutline = "\u{f4a2}"
    case Wineglass = "\u{f2b9}"
    case IosMonitor = "\u{f466}"
    case Bag = "\u{f110}"
    case IosSkipbackward = "\u{f4ab}"
    case Pin = "\u{f2a6}"
    case AndroidAttach = "\u{f367}"
    case FlashOff = "\u{f136}"
    case IosFlask = "\u{f431}"
    case Network = "\u{f341}"
    case AndroidPhoneLandscape = "\u{f3a1}"
    case RibbonA = "\u{f348}"
    case AndroidSad = "\u{f3ab}"
    case SocialAngular = "\u{f4d9}"
    case SocialVimeoOutline = "\u{f244}"
    case IosMore = "\u{f46a}"
}
