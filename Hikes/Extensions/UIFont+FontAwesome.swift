//
//  UIFont+FontAwesome.swift
//  Hikes
//
//  Created by James Hildensperger on 2/11/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//
// v4.5.0

import Foundation
import UIKit

extension UIFont {
    class func fontAwesomeFontOfSize(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "FontAwesome", size: fontSize)!
    }
}

public let FontAwesomeHash: [String: String] = [
    "fa-diamond": "\u{f219}",
    "fa-dashcube": "\u{f210}",
    "fa-send": "\u{f1d8}",
    "fa-television": "\u{f26c}",
    "fa-edge": "\u{f282}",
    "fa-sort-down": "\u{f0dd}",
    "fa-skype": "\u{f17e}",
    "fa-spoon": "\u{f1b1}",
    "fa-suitcase": "\u{f0f2}",
    "fa-search-minus": "\u{f010}",
    "fa-trophy": "\u{f091}",
    "fa-shield": "\u{f132}",
    "fa-wordpress": "\u{f19a}",
    "fa-check": "\u{f00c}",
    "fa-chevron-up": "\u{f077}",
    "fa-xing-square": "\u{f169}",
    "fa-gg": "\u{f260}",
    "fa-paypal": "\u{f1ed}",
    "fa-genderless": "\u{f22d}",
    "fa-phone-square": "\u{f098}",
    "fa-file": "\u{f15b}",
    "fa-play": "\u{f04b}",
    "fa-yc": "\u{f23b}",
    "fa-chain": "\u{f0c1}",
    "fa-euro": "\u{f153}",
    "fa-facebook-official": "\u{f230}",
    "fa-forumbee": "\u{f211}",
    "fa-book": "\u{f02d}",
    "fa-home": "\u{f015}",
    "fa-ship": "\u{f21a}",
    "fa-th-list": "\u{f00b}",
    "fa-industry": "\u{f275}",
    "fa-usd": "\u{f155}",
    "fa-exclamation-circle": "\u{f06a}",
    "fa-rotate-right": "\u{f01e}",
    "fa-paragraph": "\u{f1dd}",
    "fa-puzzle-piece": "\u{f12e}",
    "fa-empire": "\u{f1d1}",
    "fa-toggle-up": "\u{f151}",
    "fa-play-circle": "\u{f144}",
    "fa-ticket": "\u{f145}",
    "fa-anchor": "\u{f13d}",
    "fa-chevron-circle-up": "\u{f139}",
    "fa-object-group": "\u{f247}",
    "fa-balance-scale": "\u{f24e}",
    "fa-camera-retro": "\u{f083}",
    "fa-envelope-square": "\u{f199}",
    "fa-sellsy": "\u{f213}",
    "fa-wikipedia-w": "\u{f266}",
    "fa-stop-circle": "\u{f28d}",
    "fa-cloud": "\u{f0c2}",
    "fa-bluetooth-b": "\u{f294}",
    "fa-cut": "\u{f0c4}",
    "fa-eject": "\u{f052}",
    "fa-mars-stroke-v": "\u{f22a}",
    "fa-slack": "\u{f198}",
    "fa-internet-explorer": "\u{f26b}",
    "fa-smile-o": "\u{f118}",
    "fa-toggle-down": "\u{f150}",
    "fa-angle-double-up": "\u{f102}",
    "fa-deviantart": "\u{f1bd}",
    "fa-battery-4": "\u{f240}",
    "fa-gg-circle": "\u{f261}",
    "fa-image": "\u{f03e}",
    "fa-binoculars": "\u{f1e5}",
    "fa-list-ul": "\u{f0ca}",
    "fa-underline": "\u{f0cd}",
    "fa-expand": "\u{f065}",
    "fa-envelope-o": "\u{f003}",
    "fa-tablet": "\u{f10a}",
    "fa-street-view": "\u{f21d}",
    "fa-sun-o": "\u{f185}",
    "fa-optin-monster": "\u{f23c}",
    "fa-product-hunt": "\u{f288}",
    "fa-graduation-cap": "\u{f19d}",
    "fa-send-o": "\u{f1d9}",
    "fa-drupal": "\u{f1a9}",
    "fa-umbrella": "\u{f0e9}",
    "fa-file-o": "\u{f016}",
    "fa-file-zip-o": "\u{f1c6}",
    "fa-frown-o": "\u{f119}",
    "fa-comment": "\u{f075}",
    "fa-digg": "\u{f1a6}",
    "fa-file-audio-o": "\u{f1c7}",
    "fa-times": "\u{f00d}",
    "fa-mars-double": "\u{f227}",
    "fa-lemon-o": "\u{f094}",
    "fa-chevron-circle-down": "\u{f13a}",
    "fa-file-image-o": "\u{f1c5}",
    "fa-contao": "\u{f26d}",
    "fa-font": "\u{f031}",
    "fa-cubes": "\u{f1b3}",
    "fa-female": "\u{f182}",
    "fa-hand-spock-o": "\u{f259}",
    "fa-medium": "\u{f23a}",
    "fa-cc-mastercard": "\u{f1f1}",
    "fa-list-alt": "\u{f022}",
    "fa-paint-brush": "\u{f1fc}",
    "fa-mail-reply-all": "\u{f122}",
    "fa-gittip": "\u{f184}",
    "fa-registered": "\u{f25d}",
    "fa-cc-visa": "\u{f1f0}",
    "fa-safari": "\u{f267}",
    "fa-map-signs": "\u{f277}",
    "fa-space-shuttle": "\u{f197}",
    "fa-eyedropper": "\u{f1fb}",
    "fa-square-o": "\u{f096}",
    "fa-thumbs-up": "\u{f164}",
    "fa-toggle-off": "\u{f204}",
    "fa-trello": "\u{f181}",
    "fa-html5": "\u{f13b}",
    "fa-volume-off": "\u{f026}",
    "fa-medkit": "\u{f0fa}",
    "fa-whatsapp": "\u{f232}",
    "fa-y-combinator-square": "\u{f1d4}",
    "fa-behance-square": "\u{f1b5}",
    "fa-cart-plus": "\u{f217}",
    "fa-cloud-download": "\u{f0ed}",
    "fa-align-center": "\u{f037}",
    "fa-arrow-circle-left": "\u{f0a8}",
    "fa-arrow-circle-o-right": "\u{f18e}",
    "fa-bolt": "\u{f0e7}",
    "fa-creative-commons": "\u{f25e}",
    "fa-file-code-o": "\u{f1c9}",
    "fa-google-plus-square": "\u{f0d4}",
    "fa-google": "\u{f1a0}",
    "fa-italic": "\u{f033}",
    "fa-facebook-f": "\u{f09a}",
    "fa-ioxhost": "\u{f208}",
    "fa-leaf": "\u{f06c}",
    "fa-bluetooth": "\u{f293}",
    "fa-life-buoy": "\u{f1cd}",
    "fa-maxcdn": "\u{f136}",
    "fa-bookmark-o": "\u{f097}",
    "fa-heart": "\u{f004}",
    "fa-outdent": "\u{f03b}",
    "fa-mail-reply": "\u{f112}",
    "fa-pinterest": "\u{f0d2}",
    "fa-caret-square-o-right": "\u{f152}",
    "fa-bookmark": "\u{f02e}",
    "fa-plus-circle": "\u{f055}",
    "fa-remove": "\u{f00d}",
    "fa-step-forward": "\u{f051}",
    "fa-superscript": "\u{f12b}",
    "fa-fire": "\u{f06d}",
    "fa-rotate-left": "\u{f0e2}",
    "fa-certificate": "\u{f0a3}",
    "fa-sitemap": "\u{f0e8}",
    "fa-asterisk": "\u{f069}",
    "fa-spinner": "\u{f110}",
    "fa-tint": "\u{f043}",
    "fa-calendar": "\u{f073}",
    "fa-weixin": "\u{f1d7}",
    "fa-bar-chart-o": "\u{f080}",
    "fa-caret-square-o-down": "\u{f150}",
    "fa-twitter": "\u{f099}",
    "fa-user": "\u{f007}",
    "fa-vimeo-square": "\u{f194}",
    "fa-rss": "\u{f09e}",
    "fa-keyboard-o": "\u{f11c}",
    "fa-ra": "\u{f1d0}",
    "fa-fighter-jet": "\u{f0fb}",
    "fa-paperclip": "\u{f0c6}",
    "fa-dedent": "\u{f03b}",
    "fa-fire-extinguisher": "\u{f134}",
    "fa-flash": "\u{f0e7}",
    "fa-power-off": "\u{f011}",
    "fa-toggle-left": "\u{f191}",
    "fa-map-o": "\u{f278}",
    "fa-table": "\u{f0ce}",
    "fa-birthday-cake": "\u{f1fd}",
    "fa-camera": "\u{f030}",
    "fa-reorder": "\u{f0c9}",
    "fa-dollar": "\u{f155}",
    "fa-microphone-slash": "\u{f131}",
    "fa-hashtag": "\u{f292}",
    "fa-hand-stop-o": "\u{f256}",
    "fa-feed": "\u{f09e}",
    "fa-volume-down": "\u{f027}",
    "fa-cog": "\u{f013}",
    "fa-battery-2": "\u{f242}",
    "fa-bullseye": "\u{f140}",
    "fa-paper-plane": "\u{f1d8}",
    "fa-calendar-check-o": "\u{f274}",
    "fa-hand-lizard-o": "\u{f258}",
    "fa-sign-out": "\u{f08b}",
    "fa-circle-o": "\u{f10c}",
    "fa-cab": "\u{f1ba}",
    "fa-inbox": "\u{f01c}",
    "fa-history": "\u{f1da}",
    "fa-pause-circle": "\u{f28b}",
    "fa-sort-numeric-desc": "\u{f163}",
    "fa-stop-circle-o": "\u{f28e}",
    "fa-file-video-o": "\u{f1c8}",
    "fa-arrow-up": "\u{f062}",
    "fa-compass": "\u{f14e}",
    "fa-clock-o": "\u{f017}",
    "fa-building-o": "\u{f0f7}",
    "fa-angle-double-down": "\u{f103}",
    "fa-area-chart": "\u{f1fe}",
    "fa-modx": "\u{f285}",
    "fa-folder": "\u{f07b}",
    "fa-flask": "\u{f0c3}",
    "fa-file-text": "\u{f15c}",
    "fa-hourglass-start": "\u{f251}",
    "fa-mouse-pointer": "\u{f245}",
    "fa-angle-down": "\u{f107}",
    "fa-angle-double-right": "\u{f101}",
    "fa-eye-slash": "\u{f070}",
    "fa-music": "\u{f001}",
    "fa-lastfm-square": "\u{f203}",
    "fa-close": "\u{f00d}",
    "fa-reddit": "\u{f1a1}",
    "fa-reply": "\u{f112}",
    "fa-odnoklassniki": "\u{f263}",
    "fa-shirtsinbulk": "\u{f214}",
    "fa-star-o": "\u{f006}",
    "fa-warning": "\u{f071}",
    "fa-map": "\u{f279}",
    "fa-backward": "\u{f04a}",
    "fa-chevron-left": "\u{f053}",
    "fa-fax": "\u{f1ac}",
    "fa-hourglass-half": "\u{f252}",
    "fa-legal": "\u{f0e3}",
    "fa-expeditedssl": "\u{f23e}",
    "fa-instagram": "\u{f16d}",
    "fa-commenting-o": "\u{f27b}",
    "fa-bicycle": "\u{f206}",
    "fa-eye": "\u{f06e}",
    "fa-globe": "\u{f0ac}",
    "fa-refresh": "\u{f021}",
    "fa-video-camera": "\u{f03d}",
    "fa-bell-o": "\u{f0a2}",
    "fa-folder-open": "\u{f07c}",
    "fa-check-square-o": "\u{f046}",
    "fa-briefcase": "\u{f0b1}",
    "fa-futbol-o": "\u{f1e3}",
    "fa-microphone": "\u{f130}",
    "fa-minus": "\u{f068}",
    "fa-at": "\u{f1fa}",
    "fa-mobile": "\u{f10b}",
    "fa-bitbucket-square": "\u{f172}",
    "fa-times-circle": "\u{f057}",
    "fa-usb": "\u{f287}",
    "fa-battery-empty": "\u{f244}",
    "fa-hourglass": "\u{f254}",
    "fa-krw": "\u{f159}",
    "fa-bitbucket": "\u{f171}",
    "fa-strikethrough": "\u{f0cc}",
    "fa-venus-mars": "\u{f228}",
    "fa-life-bouy": "\u{f1cd}",
    "fa-retweet": "\u{f079}",
    "fa-tags": "\u{f02c}",
    "fa-thumbs-o-up": "\u{f087}",
    "fa-arrow-circle-o-down": "\u{f01a}",
    "fa-filter": "\u{f0b0}",
    "fa-lastfm": "\u{f202}",
    "fa-google-wallet": "\u{f1ee}",
    "fa-tty": "\u{f1e4}",
    "fa-scissors": "\u{f0c4}",
    "fa-file-excel-o": "\u{f1c3}",
    "fa-chrome": "\u{f268}",
    "fa-trash": "\u{f1f8}",
    "fa-truck": "\u{f0d1}",
    "fa-user-times": "\u{f235}",
    "fa-circle-o-notch": "\u{f1ce}",
    "fa-key": "\u{f084}",
    "fa-credit-card-alt": "\u{f283}",
    "fa-question": "\u{f128}",
    "fa-star-half-o": "\u{f123}",
    "fa-rebel": "\u{f1d0}",
    "fa-university": "\u{f19c}",
    "fa-coffee": "\u{f0f4}",
    "fa-eraser": "\u{f12d}",
    "fa-shopping-cart": "\u{f07a}",
    "fa-css3": "\u{f13c}",
    "fa-hourglass-1": "\u{f251}",
    "fa-battery-0": "\u{f244}",
    "fa-long-arrow-right": "\u{f178}",
    "fa-flickr": "\u{f16e}",
    "fa-twitter-square": "\u{f081}",
    "fa-mobile-phone": "\u{f10b}",
    "fa-shopping-bag": "\u{f290}",
    "fa-ban": "\u{f05e}",
    "fa-shekel": "\u{f20b}",
    "fa-dot-circle-o": "\u{f192}",
    "fa-sort-desc": "\u{f0dd}",
    "fa-floppy-o": "\u{f0c7}",
    "fa-bar-chart": "\u{f080}",
    "fa-text-height": "\u{f034}",
    "fa-neuter": "\u{f22c}",
    "fa-wrench": "\u{f0ad}",
    "fa-bold": "\u{f032}",
    "fa-cogs": "\u{f085}",
    "fa-hdd-o": "\u{f0a0}",
    "fa-long-arrow-left": "\u{f177}",
    "fa-hospital-o": "\u{f0f8}",
    "fa-quote-left": "\u{f10d}",
    "fa-level-down": "\u{f149}",
    "fa-align-justify": "\u{f039}",
    "fa-bank": "\u{f19c}",
    "fa-plus-square-o": "\u{f196}",
    "fa-level-up": "\u{f148}",
    "fa-angle-left": "\u{f104}",
    "fa-codepen": "\u{f1cb}",
    "fa-pencil-square-o": "\u{f044}",
    "fa-cc-discover": "\u{f1f2}",
    "fa-calendar-times-o": "\u{f273}",
    "fa-pied-piper-alt": "\u{f1a8}",
    "fa-code": "\u{f121}",
    "fa-git": "\u{f1d3}",
    "fa-headphones": "\u{f025}",
    "fa-heartbeat": "\u{f21e}",
    "fa-signal": "\u{f012}",
    "fa-hand-o-right": "\u{f0a4}",
    "fa-quote-right": "\u{f10e}",
    "fa-navicon": "\u{f0c9}",
    "fa-child": "\u{f1ae}",
    "fa-arrow-right": "\u{f061}",
    "fa-linux": "\u{f17c}",
    "fa-share-square": "\u{f14d}",
    "fa-exclamation-triangle": "\u{f071}",
    "fa-adjust": "\u{f042}",
    "fa-hotel": "\u{f236}",
    "fa-copyright": "\u{f1f9}",
    "fa-align-right": "\u{f038}",
    "fa-envelope": "\u{f0e0}",
    "fa-hand-o-down": "\u{f0a7}",
    "fa-rmb": "\u{f157}",
    "fa-sort-alpha-desc": "\u{f15e}",
    "fa-align-left": "\u{f036}",
    "fa-fast-forward": "\u{f050}",
    "fa-newspaper-o": "\u{f1ea}",
    "fa-inr": "\u{f156}",
    "fa-renren": "\u{f18b}",
    "fa-cc-jcb": "\u{f24b}",
    "fa-arrows": "\u{f047}",
    "fa-android": "\u{f17b}",
    "fa-user-plus": "\u{f234}",
    "fa-reply-all": "\u{f122}",
    "fa-delicious": "\u{f1a5}",
    "fa-youtube": "\u{f167}",
    "fa-thumbs-o-down": "\u{f088}",
    "fa-stop": "\u{f04d}",
    "fa-object-ungroup": "\u{f248}",
    "fa-hand-paper-o": "\u{f256}",
    "fa-check-circle": "\u{f058}",
    "fa-heart-o": "\u{f08a}",
    "fa-share": "\u{f064}",
    "fa-star-half-full": "\u{f123}",
    "fa-hand-rock-o": "\u{f255}",
    "fa-fast-backward": "\u{f049}",
    "fa-hand-peace-o": "\u{f25b}",
    "fa-file-picture-o": "\u{f1c5}",
    "fa-houzz": "\u{f27c}",
    "fa-cart-arrow-down": "\u{f218}",
    "fa-percent": "\u{f295}",
    "fa-qq": "\u{f1d6}",
    "fa-star": "\u{f005}",
    "fa-toggle-right": "\u{f152}",
    "fa-google-plus": "\u{f0d5}",
    "fa-rss-square": "\u{f143}",
    "fa-cc-diners-club": "\u{f24c}",
    "fa-search": "\u{f002}",
    "fa-cny": "\u{f157}",
    "fa-paste": "\u{f0ea}",
    "fa-sliders": "\u{f1de}",
    "fa-tripadvisor": "\u{f262}",
    "fa-cc-stripe": "\u{f1f5}",
    "fa-file-text-o": "\u{f0f6}",
    "fa-pied-piper": "\u{f1a7}",
    "fa-exclamation": "\u{f12a}",
    "fa-file-archive-o": "\u{f1c6}",
    "fa-rouble": "\u{f158}",
    "fa-database": "\u{f1c0}",
    "fa-ruble": "\u{f158}",
    "fa-stumbleupon-circle": "\u{f1a3}",
    "fa-venus-double": "\u{f226}",
    "fa-arrow-down": "\u{f063}",
    "fa-minus-square": "\u{f146}",
    "fa-cc-paypal": "\u{f1f4}",
    "fa-battery-1": "\u{f243}",
    "fa-reddit-square": "\u{f1a2}",
    "fa-files-o": "\u{f0c5}",
    "fa-file-movie-o": "\u{f1c8}",
    "fa-btc": "\u{f15a}",
    "fa-caret-square-o-left": "\u{f191}",
    "fa-battery-3": "\u{f241}",
    "fa-caret-down": "\u{f0d7}",
    "fa-road": "\u{f018}",
    "fa-linkedin": "\u{f0e1}",
    "fa-sort-asc": "\u{f0de}",
    "fa-steam-square": "\u{f1b7}",
    "fa-rub": "\u{f158}",
    "fa-xing": "\u{f168}",
    "fa-photo": "\u{f03e}",
    "fa-sort-up": "\u{f0de}",
    "fa-scribd": "\u{f28a}",
    "fa-sticky-note": "\u{f249}",
    "fa-upload": "\u{f093}",
    "fa-hand-grab-o": "\u{f255}",
    "fa-info-circle": "\u{f05a}",
    "fa-weibo": "\u{f18a}",
    "fa-reddit-alien": "\u{f281}",
    "fa-link": "\u{f0c1}",
    "fa-rupee": "\u{f156}",
    "fa-gears": "\u{f085}",
    "fa-ellipsis-v": "\u{f142}",
    "fa-black-tie": "\u{f27e}",
    "fa-angle-up": "\u{f106}",
    "fa-crosshairs": "\u{f05b}",
    "fa-fonticons": "\u{f280}",
    "fa-clone": "\u{f24d}",
    "fa-gratipay": "\u{f184}",
    "fa-bell-slash": "\u{f1f6}",
    "fa-i-cursor": "\u{f246}",
    "fa-hourglass-o": "\u{f250}",
    "fa-repeat": "\u{f01e}",
    "fa-codiepie": "\u{f284}",
    "fa-soccer-ball-o": "\u{f1e3}",
    "fa-apple": "\u{f179}",
    "fa-wechat": "\u{f1d7}",
    "fa-mail-forward": "\u{f064}",
    "fa-youtube-play": "\u{f16a}",
    "fa-dashboard": "\u{f0e4}",
    "fa-behance": "\u{f1b4}",
    "fa-spotify": "\u{f1bc}",
    "fa-viacoin": "\u{f237}",
    "fa-arrow-circle-down": "\u{f0ab}",
    "fa-calendar-o": "\u{f133}",
    "fa-folder-open-o": "\u{f115}",
    "fa-life-ring": "\u{f1cd}",
    "fa-pinterest-p": "\u{f231}",
    "fa-paw": "\u{f1b0}",
    "fa-support": "\u{f1cd}",
    "fa-thumbs-down": "\u{f165}",
    "fa-flag-o": "\u{f11d}",
    "fa-long-arrow-up": "\u{f176}",
    "fa-vimeo": "\u{f27d}",
    "fa-map-pin": "\u{f276}",
    "fa-check-circle-o": "\u{f05d}",
    "fa-commenting": "\u{f27a}",
    "fa-volume-up": "\u{f028}",
    "fa-picture-o": "\u{f03e}",
    "fa-minus-square-o": "\u{f147}",
    "fa-pause-circle-o": "\u{f28c}",
    "fa-plus-square": "\u{f0fe}",
    "fa-twitch": "\u{f1e8}",
    "fa-bullhorn": "\u{f0a1}",
    "fa-hourglass-3": "\u{f253}",
    "fa-tag": "\u{f02b}",
    "fa-bell": "\u{f0f3}",
    "fa-hacker-news": "\u{f1d4}",
    "fa-y-combinator": "\u{f23b}",
    "fa-foursquare": "\u{f180}",
    "fa-wheelchair": "\u{f193}",
    "fa-flag": "\u{f024}",
    "fa-indent": "\u{f03c}",
    "fa-ambulance": "\u{f0f9}",
    "fa-gavel": "\u{f0e3}",
    "fa-calendar-plus-o": "\u{f271}",
    "fa-tasks": "\u{f0ae}",
    "fa-file-powerpoint-o": "\u{f1c4}",
    "fa-won": "\u{f159}",
    "fa-yc-square": "\u{f1d4}",
    "fa-play-circle-o": "\u{f01d}",
    "fa-qrcode": "\u{f029}",
    "fa-shopping-basket": "\u{f291}",
    "fa-share-alt-square": "\u{f1e1}",
    "fa-building": "\u{f1ad}",
    "fa-eur": "\u{f153}",
    "fa-battery-quarter": "\u{f243}",
    "fa-gamepad": "\u{f11b}",
    "fa-github": "\u{f09b}",
    "fa-circle": "\u{f111}",
    "fa-hourglass-end": "\u{f253}",
    "fa-mars-stroke": "\u{f229}",
    "fa-sign-in": "\u{f090}",
    "fa-steam": "\u{f1b6}",
    "fa-arrow-circle-o-up": "\u{f01b}",
    "fa-times-circle-o": "\u{f05c}",
    "fa-chevron-down": "\u{f078}",
    "fa-tree": "\u{f1bb}",
    "fa-copy": "\u{f0c5}",
    "fa-jpy": "\u{f157}",
    "fa-magnet": "\u{f076}",
    "fa-calendar-minus-o": "\u{f272}",
    "fa-external-link-square": "\u{f14c}",
    "fa-calculator": "\u{f1ec}",
    "fa-rocket": "\u{f135}",
    "fa-life-saver": "\u{f1cd}",
    "fa-search-plus": "\u{f00e}",
    "fa-caret-square-o-up": "\u{f151}",
    "fa-fort-awesome": "\u{f286}",
    "fa-intersex": "\u{f224}",
    "fa-tv": "\u{f26c}",
    "fa-github-square": "\u{f092}",
    "fa-thumb-tack": "\u{f08d}",
    "fa-cube": "\u{f1b2}",
    "fa-forward": "\u{f04e}",
    "fa-battery-three-quarters": "\u{f241}",
    "fa-bitcoin": "\u{f15a}",
    "fa-mortar-board": "\u{f19d}",
    "fa-share-square-o": "\u{f045}",
    "fa-unlock-alt": "\u{f13e}",
    "fa-slideshare": "\u{f1e7}",
    "fa-magic": "\u{f0d0}",
    "fa-phone": "\u{f095}",
    "fa-hourglass-2": "\u{f252}",
    "fa-vk": "\u{f189}",
    "fa-credit-card": "\u{f09d}",
    "fa-pencil-square": "\u{f14b}",
    "fa-gbp": "\u{f154}",
    "fa-pagelines": "\u{f18c}",
    "fa-save": "\u{f0c7}",
    "fa-opera": "\u{f26a}",
    "fa-tencent-weibo": "\u{f1d5}",
    "fa-location-arrow": "\u{f124}",
    "fa-check-square": "\u{f14a}",
    "fa-jsfiddle": "\u{f1cc}",
    "fa-simplybuilt": "\u{f215}",
    "fa-skyatlas": "\u{f216}",
    "fa-stack-exchange": "\u{f18d}",
    "fa-crop": "\u{f125}",
    "fa-angle-right": "\u{f105}",
    "fa-sort-numeric-asc": "\u{f162}",
    "fa-transgender": "\u{f224}",
    "fa-500px": "\u{f26e}",
    "fa-line-chart": "\u{f201}",
    "fa-mars-stroke-h": "\u{f22b}",
    "fa-paper-plane-o": "\u{f1d9}",
    "fa-bus": "\u{f207}",
    "fa-external-link": "\u{f08e}",
    "fa-try": "\u{f195}",
    "fa-ils": "\u{f20b}",
    "fa-battery-full": "\u{f240}",
    "fa-hand-o-up": "\u{f0a6}",
    "fa-github-alt": "\u{f113}",
    "fa-angle-double-left": "\u{f100}",
    "fa-laptop": "\u{f109}",
    "fa-lock": "\u{f023}",
    "fa-taxi": "\u{f1ba}",
    "fa-text-width": "\u{f035}",
    "fa-unsorted": "\u{f0dc}",
    "fa-tumblr": "\u{f173}",
    "fa-connectdevelop": "\u{f20e}",
    "fa-youtube-square": "\u{f166}",
    "fa-language": "\u{f1ab}",
    "fa-arrow-circle-up": "\u{f0aa}",
    "fa-firefox": "\u{f269}",
    "fa-circle-thin": "\u{f1db}",
    "fa-compress": "\u{f066}",
    "fa-joomla": "\u{f1aa}",
    "fa-caret-up": "\u{f0d8}",
    "fa-caret-right": "\u{f0da}",
    "fa-long-arrow-down": "\u{f175}",
    "fa-undo": "\u{f0e2}",
    "fa-comment-o": "\u{f0e5}",
    "fa-hand-scissors-o": "\u{f257}",
    "fa-pinterest-square": "\u{f0d3}",
    "fa-share-alt": "\u{f1e0}",
    "fa-facebook-square": "\u{f082}",
    "fa-gift": "\u{f06b}",
    "fa-meh-o": "\u{f11a}",
    "fa-unlock": "\u{f09c}",
    "fa-arrows-h": "\u{f07e}",
    "fa-subscript": "\u{f12c}",
    "fa-venus": "\u{f221}",
    "fa-map-marker": "\u{f041}",
    "fa-yen": "\u{f157}",
    "fa-plug": "\u{f1e6}",
    "fa-tachometer": "\u{f0e4}",
    "fa-cloud-upload": "\u{f0ee}",
    "fa-meanpath": "\u{f20c}",
    "fa-chevron-right": "\u{f054}",
    "fa-minus-circle": "\u{f056}",
    "fa-question-circle": "\u{f059}",
    "fa-cutlery": "\u{f0f5}",
    "fa-download": "\u{f019}",
    "fa-square": "\u{f0c8}",
    "fa-yahoo": "\u{f19e}",
    "fa-motorcycle": "\u{f21c}",
    "fa-soundcloud": "\u{f1be}",
    "fa-sort-amount-desc": "\u{f161}",
    "fa-server": "\u{f233}",
    "fa-hand-pointer-o": "\u{f25a}",
    "fa-arrows-alt": "\u{f0b2}",
    "fa-cc": "\u{f20a}",
    "fa-pie-chart": "\u{f200}",
    "fa-gear": "\u{f013}",
    "fa-battery-half": "\u{f242}",
    "fa-print": "\u{f02f}",
    "fa-subway": "\u{f239}",
    "fa-film": "\u{f008}",
    "fa-mars": "\u{f222}",
    "fa-th-large": "\u{f009}",
    "fa-sticky-note-o": "\u{f24a}",
    "fa-trash-o": "\u{f014}",
    "fa-chain-broken": "\u{f127}",
    "fa-barcode": "\u{f02a}",
    "fa-buysellads": "\u{f20d}",
    "fa-file-sound-o": "\u{f1c7}",
    "fa-plus": "\u{f067}",
    "fa-sort": "\u{f0dc}",
    "fa-arrow-circle-right": "\u{f0a9}",
    "fa-bomb": "\u{f1e2}",
    "fa-code-fork": "\u{f126}",
    "fa-facebook": "\u{f09a}",
    "fa-opencart": "\u{f23d}",
    "fa-archive": "\u{f187}",
    "fa-automobile": "\u{f1b9}",
    "fa-bug": "\u{f188}",
    "fa-pencil": "\u{f040}",
    "fa-train": "\u{f238}",
    "fa-terminal": "\u{f120}",
    "fa-bed": "\u{f236}",
    "fa-linkedin-square": "\u{f08c}",
    "fa-dropbox": "\u{f16b}",
    "fa-list-ol": "\u{f0cb}",
    "fa-user-secret": "\u{f21b}",
    "fa-lightbulb-o": "\u{f0eb}",
    "fa-beer": "\u{f0fc}",
    "fa-plane": "\u{f072}",
    "fa-file-photo-o": "\u{f1c5}",
    "fa-group": "\u{f0c0}",
    "fa-star-half": "\u{f089}",
    "fa-user-md": "\u{f0f0}",
    "fa-ellipsis-h": "\u{f141}",
    "fa-file-pdf-o": "\u{f1c1}",
    "fa-sheqel": "\u{f20b}",
    "fa-cc-amex": "\u{f1f3}",
    "fa-stack-overflow": "\u{f16c}",
    "fa-car": "\u{f1b9}",
    "fa-folder-o": "\u{f114}",
    "fa-glass": "\u{f000}",
    "fa-caret-left": "\u{f0d9}",
    "fa-stumbleupon": "\u{f1a4}",
    "fa-git-square": "\u{f1d2}",
    "fa-arrow-circle-o-left": "\u{f190}",
    "fa-toggle-on": "\u{f205}",
    "fa-unlink": "\u{f127}",
    "fa-openid": "\u{f19b}",
    "fa-windows": "\u{f17a}",
    "fa-chevron-circle-right": "\u{f138}",
    "fa-turkish-lira": "\u{f195}",
    "fa-vine": "\u{f1ca}",
    "fa-clipboard": "\u{f0ea}",
    "fa-ge": "\u{f1d1}",
    "fa-header": "\u{f1dc}",
    "fa-recycle": "\u{f1b8}",
    "fa-money": "\u{f0d6}",
    "fa-sort-amount-asc": "\u{f160}",
    "fa-moon-o": "\u{f186}",
    "fa-angellist": "\u{f209}",
    "fa-leanpub": "\u{f212}",
    "fa-users": "\u{f0c0}",
    "fa-sort-alpha-asc": "\u{f15d}",
    "fa-file-word-o": "\u{f1c2}",
    "fa-list": "\u{f03a}",
    "fa-institution": "\u{f19c}",
    "fa-hand-o-left": "\u{f0a5}",
    "fa-pause": "\u{f04c}",
    "fa-get-pocket": "\u{f265}",
    "fa-mixcloud": "\u{f289}",
    "fa-columns": "\u{f0db}",
    "fa-trademark": "\u{f25c}",
    "fa-comments": "\u{f086}",
    "fa-wifi": "\u{f1eb}",
    "fa-th": "\u{f00a}",
    "fa-male": "\u{f183}",
    "fa-flag-checkered": "\u{f11e}",
    "fa-bars": "\u{f0c9}",
    "fa-mercury": "\u{f223}",
    "fa-odnoklassniki-square": "\u{f264}",
    "fa-arrow-left": "\u{f060}",
    "fa-random": "\u{f074}",
    "fa-desktop": "\u{f108}",
    "fa-comments-o": "\u{f0e6}",
    "fa-step-backward": "\u{f048}",
    "fa-edit": "\u{f044}",
    "fa-transgender-alt": "\u{f225}",
    "fa-arrows-v": "\u{f07d}",
    "fa-amazon": "\u{f270}",
    "fa-yelp": "\u{f1e9}",
    "fa-exchange": "\u{f0ec}",
    "fa-stethoscope": "\u{f0f1}",
    "fa-dribbble": "\u{f17d}",
    "fa-tumblr-square": "\u{f174}",
    "fa-adn": "\u{f170}",
    "fa-chevron-circle-left": "\u{f137}",
    "fa-bell-slash-o": "\u{f1f7}",
    "fa-star-half-empty": "\u{f123}",
    "fa-h-square": "\u{f0fd}",
    "fa-info": "\u{f129}",
]
public enum FontAwesome: String {
    case PiedPiperAlt = "\u{f1a8}"
    case ChevronRight = "\u{f054}"
    case TrashO = "\u{f014}"
    case Spoon = "\u{f1b1}"
    case Codiepie = "\u{f284}"
    case Coffee = "\u{f0f4}"
    case LocationArrow = "\u{f124}"
    case TwitterSquare = "\u{f081}"
    case NewspaperO = "\u{f1ea}"
    case Comments = "\u{f086}"
    case Road = "\u{f018}"
    case ArrowsAlt = "\u{f0b2}"
    case ArrowCircleOUp = "\u{f01b}"
    case PlusCircle = "\u{f055}"
    case SortAlphaDesc = "\u{f15e}"
    case Television, Tv = "\u{f26c}"
    case Intersex, Transgender = "\u{f224}"
    case Play = "\u{f04b}"
    case Random = "\u{f074}"
    case Mars = "\u{f222}"
    case BellO = "\u{f0a2}"
    case User = "\u{f007}"
    case Edge = "\u{f282}"
    case Battery1, BatteryQuarter = "\u{f243}"
    case HandOLeft = "\u{f0a5}"
    case Font = "\u{f031}"
    case HandScissorsO = "\u{f257}"
    case FileWordO = "\u{f1c2}"
    case Youtube = "\u{f167}"
    case Battery3, BatteryThreeQuarters = "\u{f241}"
    case Sliders = "\u{f1de}"
    case FileText = "\u{f15c}"
    case PuzzlePiece = "\u{f12e}"
    case Code = "\u{f121}"
    case GetPocket = "\u{f265}"
    case CcVisa = "\u{f1f0}"
    case PlusSquare = "\u{f0fe}"
    case Delicious = "\u{f1a5}"
    case FileTextO = "\u{f0f6}"
    case Foursquare = "\u{f180}"
    case Odnoklassniki = "\u{f263}"
    case CommentsO = "\u{f0e6}"
    case Certificate = "\u{f0a3}"
    case Laptop = "\u{f109}"
    case BlackTie = "\u{f27e}"
    case HandPeaceO = "\u{f25b}"
    case Bars, Navicon, Reorder = "\u{f0c9}"
    case Bullhorn = "\u{f0a1}"
    case Ioxhost = "\u{f208}"
    case Music = "\u{f001}"
    case Skype = "\u{f17e}"
    case StackExchange = "\u{f18d}"
    case CreditCardAlt = "\u{f283}"
    case Digg = "\u{f1a6}"
    case StickyNote = "\u{f249}"
    case Exchange = "\u{f0ec}"
    case ClockO = "\u{f017}"
    case Star = "\u{f005}"
    case ICursor = "\u{f246}"
    case Hourglass = "\u{f254}"
    case DotCircleO = "\u{f192}"
    case Gift = "\u{f06b}"
    case Lock = "\u{f023}"
    case GitSquare = "\u{f1d2}"
    case Feed, Rss = "\u{f09e}"
    case SortNumericAsc = "\u{f162}"
    case Cab, Taxi = "\u{f1ba}"
    case FolderOpen = "\u{f07c}"
    case GraduationCap, MortarBoard = "\u{f19d}"
    case Github = "\u{f09b}"
    case Backward = "\u{f04a}"
    case CheckSquare = "\u{f14a}"
    case RssSquare = "\u{f143}"
    case Pagelines = "\u{f18c}"
    case TransgenderAlt = "\u{f225}"
    case Folder = "\u{f07b}"
    case Android = "\u{f17b}"
    case Dashboard, Tachometer = "\u{f0e4}"
    case EllipsisH = "\u{f141}"
    case Venus = "\u{f221}"
    case Cogs, Gears = "\u{f085}"
    case ArrowCircleRight = "\u{f0a9}"
    case Html5 = "\u{f13b}"
    case LevelUp = "\u{f148}"
    case OdnoklassnikiSquare = "\u{f264}"
    case Gg = "\u{f260}"
    case PinterestSquare = "\u{f0d3}"
    case TimesCircleO = "\u{f05c}"
    case BuildingO = "\u{f0f7}"
    case Weibo = "\u{f18a}"
    case Header = "\u{f1dc}"
    case Tint = "\u{f043}"
    case AreaChart = "\u{f1fe}"
    case FrownO = "\u{f119}"
    case Neuter = "\u{f22c}"
    case ThList = "\u{f00b}"
    case BitbucketSquare = "\u{f172}"
    case HandORight = "\u{f0a4}"
    case Tasks = "\u{f0ae}"
    case Forumbee = "\u{f211}"
    case Bluetooth = "\u{f293}"
    case Buysellads = "\u{f20d}"
    case Upload = "\u{f093}"
    case HourglassO = "\u{f250}"
    case CaretSquareORight, ToggleRight = "\u{f152}"
    case HandODown = "\u{f0a7}"
    case Safari = "\u{f267}"
    case Home = "\u{f015}"
    case Bug = "\u{f188}"
    case Google = "\u{f1a0}"
    case MinusCircle = "\u{f056}"
    case ArrowCircleODown = "\u{f01a}"
    case UserSecret = "\u{f21b}"
    case BookmarkO = "\u{f097}"
    case ChevronCircleRight = "\u{f138}"
    case Columns = "\u{f0db}"
    case GithubAlt = "\u{f113}"
    case Shirtsinbulk = "\u{f214}"
    case Fax = "\u{f1ac}"
    case Terminal = "\u{f120}"
    case Inr, Rupee = "\u{f156}"
    case CaretRight = "\u{f0da}"
    case Repeat, RotateRight = "\u{f01e}"
    case CcPaypal = "\u{f1f4}"
    case LemonO = "\u{f094}"
    case GooglePlusSquare = "\u{f0d4}"
    case Sellsy = "\u{f213}"
    case LongArrowLeft = "\u{f177}"
    case VideoCamera = "\u{f03d}"
    case File = "\u{f15b}"
    case Bullseye = "\u{f140}"
    case Behance = "\u{f1b4}"
    case CaretLeft = "\u{f0d9}"
    case Gittip, Gratipay = "\u{f184}"
    case ChevronDown = "\u{f078}"
    case ShoppingBasket = "\u{f291}"
    case HospitalO = "\u{f0f8}"
    case Square = "\u{f0c8}"
    case Wrench = "\u{f0ad}"
    case Map = "\u{f279}"
    case UserPlus = "\u{f234}"
    case CartArrowDown = "\u{f218}"
    case ArrowsV = "\u{f07d}"
    case ChevronCircleUp = "\u{f139}"
    case FileO = "\u{f016}"
    case FileExcelO = "\u{f1c3}"
    case LastfmSquare = "\u{f203}"
    case Clone = "\u{f24d}"
    case Minus = "\u{f068}"
    case MinusSquareO = "\u{f147}"
    case Forward = "\u{f04e}"
    case Mixcloud = "\u{f289}"
    case HandLizardO = "\u{f258}"
    case ArrowCircleORight = "\u{f18e}"
    case PowerOff = "\u{f011}"
    case Krw, Won = "\u{f159}"
    case SignIn = "\u{f090}"
    case Skyatlas = "\u{f216}"
    case Stumbleupon = "\u{f1a4}"
    case Try, TurkishLira = "\u{f195}"
    case VolumeDown = "\u{f027}"
    case MarsStrokeH = "\u{f22b}"
    case ChevronCircleDown = "\u{f13a}"
    case ExclamationCircle = "\u{f06a}"
    case MapMarker = "\u{f041}"
    case AngleRight = "\u{f105}"
    case BirthdayCake = "\u{f1fd}"
    case Dollar, Usd = "\u{f155}"
    case FileMovieO, FileVideoO = "\u{f1c8}"
    case Instagram = "\u{f16d}"
    case Magnet = "\u{f076}"
    case Cc = "\u{f20a}"
    case ToggleOn = "\u{f205}"
    case Unlock = "\u{f09c}"
    case ShareAltSquare = "\u{f1e1}"
    case AlignRight = "\u{f038}"
    case FireExtinguisher = "\u{f134}"
    case Commenting = "\u{f27a}"
    case Flask = "\u{f0c3}"
    case Jsfiddle = "\u{f1cc}"
    case SortAmountAsc = "\u{f160}"
    case Twitter = "\u{f099}"
    case Wordpress = "\u{f19a}"
    case Ambulance = "\u{f0f9}"
    case Retweet = "\u{f079}"
    case StopCircleO = "\u{f28e}"
    case SunO = "\u{f185}"
    case AngleDoubleLeft = "\u{f100}"
    case FortAwesome = "\u{f286}"
    case Bolt, Flash = "\u{f0e7}"
    case Industry = "\u{f275}"
    case Vine = "\u{f1ca}"
    case SmileO = "\u{f118}"
    case AngleLeft = "\u{f104}"
    case RotateLeft, Undo = "\u{f0e2}"
    case ArrowCircleDown = "\u{f0ab}"
    case FlagCheckered = "\u{f11e}"
    case Opera = "\u{f26a}"
    case ShareSquareO = "\u{f045}"
    case Paperclip = "\u{f0c6}"
    case StepBackward = "\u{f048}"
    case Tag = "\u{f02b}"
    case StumbleuponCircle = "\u{f1a3}"
    case Chain, Link = "\u{f0c1}"
    case HeartO = "\u{f08a}"
    case MicrophoneSlash = "\u{f131}"
    case Image, Photo, PictureO = "\u{f03e}"
    case Plug = "\u{f1e6}"
    case Asterisk = "\u{f069}"
    case Cube = "\u{f1b2}"
    case Sitemap = "\u{f0e8}"
    case ListAlt = "\u{f022}"
    case Empire, Ge = "\u{f1d1}"
    case Yahoo = "\u{f19e}"
    case PauseCircleO = "\u{f28c}"
    case ThumbsUp = "\u{f164}"
    case ToggleOff = "\u{f204}"
    case Wifi = "\u{f1eb}"
    case ArrowCircleUp = "\u{f0aa}"
    case AngleDoubleUp = "\u{f102}"
    case FolderO = "\u{f114}"
    case PaperPlaneO, SendO = "\u{f1d9}"
    case CcDiscover = "\u{f1f2}"
    case Eur, Euro = "\u{f153}"
    case Question = "\u{f128}"
    case Ticket = "\u{f145}"
    case Contao = "\u{f26d}"
    case CcDinersClub = "\u{f24c}"
    case MailForward, Share = "\u{f064}"
    case AngleDoubleDown = "\u{f103}"
    case CalendarMinusO = "\u{f272}"
    case Percent = "\u{f295}"
    case FolderOpenO = "\u{f115}"
    case FileArchiveO, FileZipO = "\u{f1c6}"
    case LineChart = "\u{f201}"
    case CalendarPlusO = "\u{f271}"
    case Leaf = "\u{f06c}"
    case TimesCircle = "\u{f057}"
    case List = "\u{f03a}"
    case ExternalLink = "\u{f08e}"
    case FlagO = "\u{f11d}"
    case GgCircle = "\u{f261}"
    case CreditCard = "\u{f09d}"
    case Hourglass1, HourglassStart = "\u{f251}"
    case LongArrowRight = "\u{f178}"
    case GithubSquare = "\u{f092}"
    case Gbp = "\u{f154}"
    case Facebook, FacebookF = "\u{f09a}"
    case CircleThin = "\u{f1db}"
    case Copy, FilesO = "\u{f0c5}"
    case Glass = "\u{f000}"
    case ObjectGroup = "\u{f247}"
    case HandOUp = "\u{f0a6}"
    case KeyboardO = "\u{f11c}"
    case Bitbucket = "\u{f171}"
    case FastForward = "\u{f050}"
    case Money = "\u{f0d6}"
    case FighterJet = "\u{f0fb}"
    case QuoteRight = "\u{f10e}"
    case Flickr = "\u{f16e}"
    case ThumbsDown = "\u{f165}"
    case EyeSlash = "\u{f070}"
    case AlignCenter = "\u{f037}"
    case ObjectUngroup = "\u{f248}"
    case Modx = "\u{f285}"
    case Vk = "\u{f189}"
    case Bitcoin, Btc = "\u{f15a}"
    case ChevronUp = "\u{f077}"
    case StopCircle = "\u{f28d}"
    case Scribd = "\u{f28a}"
    case Bookmark = "\u{f02e}"
    case ArrowRight = "\u{f061}"
    case Usb = "\u{f287}"
    case VimeoSquare = "\u{f194}"
    case Edit, PencilSquareO = "\u{f044}"
    case YCombinator, Yc = "\u{f23b}"
    case Cny, Jpy, Rmb, Yen = "\u{f157}"
    case ArrowDown = "\u{f063}"
    case Linkedin = "\u{f0e1}"
    case MapO = "\u{f278}"
    case Slideshare = "\u{f1e7}"
    case SortAmountDesc = "\u{f161}"
    case SortDesc, SortDown = "\u{f0dd}"
    case SteamSquare = "\u{f1b7}"
    case ThLarge = "\u{f009}"
    case Tty = "\u{f1e4}"
    case Joomla = "\u{f1aa}"
    case LongArrowUp = "\u{f176}"
    case Refresh = "\u{f021}"
    case MoonO = "\u{f186}"
    case Beer = "\u{f0fc}"
    case BellSlash = "\u{f1f6}"
    case Camera = "\u{f030}"
    case CalendarO = "\u{f133}"
    case ChevronLeft = "\u{f053}"
    case Leanpub = "\u{f212}"
    case Spotify = "\u{f1bc}"
    case Fonticons = "\u{f280}"
    case Tumblr = "\u{f173}"
    case Whatsapp = "\u{f232}"
    case Server = "\u{f233}"
    case StackOverflow = "\u{f16c}"
    case Tree = "\u{f1bb}"
    case Crosshairs = "\u{f05b}"
    case VolumeUp = "\u{f028}"
    case Xing = "\u{f168}"
    case Firefox = "\u{f269}"
    case VenusDouble = "\u{f226}"
    case LinkedinSquare = "\u{f08c}"
    case SortAsc, SortUp = "\u{f0de}"
    case Fire = "\u{f06d}"
    case Eject = "\u{f052}"
    case PlayCircle = "\u{f144}"
    case Windows = "\u{f17a}"
    case Table = "\u{f0ce}"
    case Sort, Unsorted = "\u{f0dc}"
    case Deviantart = "\u{f1bd}"
    case GooglePlus = "\u{f0d5}"
    case ArrowCircleLeft = "\u{f0a8}"
    case ArrowCircleOLeft = "\u{f190}"
    case Codepen = "\u{f1cb}"
    case CloudUpload = "\u{f0ee}"
    case Eraser = "\u{f12d}"
    case Rouble, Rub, Ruble = "\u{f158}"
    case SearchMinus = "\u{f010}"
    case Globe = "\u{f0ac}"
    case PlusSquareO = "\u{f196}"
    case ShoppingBag = "\u{f290}"
    case Calculator = "\u{f1ec}"
    case LifeBouy, LifeBuoy, LifeRing, LifeSaver, Support = "\u{f1cd}"
    case PlayCircleO = "\u{f01d}"
    case ChainBroken, Unlink = "\u{f127}"
    case Archive = "\u{f187}"
    case ExclamationTriangle, Warning = "\u{f071}"
    case Check = "\u{f00c}"
    case Desktop = "\u{f108}"
    case Microphone = "\u{f130}"
    case MehO = "\u{f11a}"
    case Paw = "\u{f1b0}"
    case Medkit = "\u{f0fa}"
    case TextHeight = "\u{f034}"
    case Underline = "\u{f0cd}"
    case PhoneSquare = "\u{f098}"
    case Clipboard, Paste = "\u{f0ea}"
    case Mobile, MobilePhone = "\u{f10b}"
    case SortNumericDesc = "\u{f163}"
    case CheckCircle = "\u{f058}"
    case Pinterest = "\u{f0d2}"
    case Hashtag = "\u{f292}"
    case Train = "\u{f238}"
    case Bold = "\u{f032}"
    case FloppyO, Save = "\u{f0c7}"
    case Arrows = "\u{f047}"
    case Group, Users = "\u{f0c0}"
    case Linux = "\u{f17c}"
    case CcMastercard = "\u{f1f1}"
    case Exclamation = "\u{f12a}"
    case Houzz = "\u{f27c}"
    case MapPin = "\u{f276}"
    case Tags = "\u{f02c}"
    case InfoCircle = "\u{f05a}"
    case Angellist = "\u{f209}"
    case Heart = "\u{f004}"
    case HandGrabO, HandRockO = "\u{f255}"
    case Heartbeat = "\u{f21e}"
    case StarHalf = "\u{f089}"
    case Wheelchair = "\u{f193}"
    case GoogleWallet = "\u{f1ee}"
    case MarsStrokeV = "\u{f22a}"
    case Comment = "\u{f075}"
    case Slack = "\u{f198}"
    case Cubes = "\u{f1b3}"
    case Signal = "\u{f012}"
    case ListOl = "\u{f0cb}"
    case Compass = "\u{f14e}"
    case Book = "\u{f02d}"
    case CameraRetro = "\u{f083}"
    case Download = "\u{f019}"
    case RedditSquare = "\u{f1a2}"
    case XingSquare = "\u{f169}"
    case Ils, Shekel, Sheqel = "\u{f20b}"
    case Database = "\u{f1c0}"
    case Bomb = "\u{f1e2}"
    case CircleO = "\u{f10c}"
    case MailReply, Reply = "\u{f112}"
    case SquareO = "\u{f096}"
    case LightbulbO = "\u{f0eb}"
    case CalendarTimesO = "\u{f273}"
    case CommentingO = "\u{f27b}"
    case Viacoin = "\u{f237}"
    case Hourglass3, HourglassEnd = "\u{f253}"
    case CodeFork = "\u{f126}"
    case Rocket = "\u{f135}"
    case Bank, Institution, University = "\u{f19c}"
    case Plane = "\u{f072}"
    case QuestionCircle = "\u{f059}"
    case Trophy = "\u{f091}"
    case Genderless = "\u{f22d}"
    case Chrome = "\u{f268}"
    case UserTimes = "\u{f235}"
    case Adjust = "\u{f042}"
    case CommentO = "\u{f0e5}"
    case 500Px = "\u{f26e}"
    case FileImageO, FilePhotoO, FilePictureO = "\u{f1c5}"
    case OptinMonster = "\u{f23c}"
    case Paypal = "\u{f1ed}"
    case Drupal = "\u{f1a9}"
    case FastBackward = "\u{f049}"
    case Dropbox = "\u{f16b}"
    case Eye = "\u{f06e}"
    case Hourglass2, HourglassHalf = "\u{f252}"
    case BehanceSquare = "\u{f1b5}"
    case Bicycle = "\u{f206}"
    case Compress = "\u{f066}"
    case FilePowerpointO = "\u{f1c4}"
    case ExternalLinkSquare = "\u{f14c}"
    case QuoteLeft = "\u{f10d}"
    case Ship = "\u{f21a}"
    case Superscript = "\u{f12b}"
    case Opencart = "\u{f23d}"
    case MarsStroke = "\u{f229}"
    case Flag = "\u{f024}"
    case Trademark = "\u{f25c}"
    case Cutlery = "\u{f0f5}"
    case Bell = "\u{f0f3}"
    case Envelope = "\u{f0e0}"
    case Eyedropper = "\u{f1fb}"
    case Building = "\u{f1ad}"
    case AngleDoubleRight = "\u{f101}"
    case FutbolO, SoccerBallO = "\u{f1e3}"
    case Headphones = "\u{f025}"
    case History = "\u{f1da}"
    case MarsDouble = "\u{f227}"
    case PaperPlane, Send = "\u{f1d8}"
    case ShareSquare = "\u{f14d}"
    case Shield = "\u{f132}"
    case TencentWeibo = "\u{f1d5}"
    case ThumbTack = "\u{f08d}"
    case Pause = "\u{f04c}"
    case YoutubeSquare = "\u{f166}"
    case EnvelopeO = "\u{f003}"
    case Strikethrough = "\u{f0cc}"
    case Umbrella = "\u{f0e9}"
    case StreetView = "\u{f21d}"
    case PiedPiper = "\u{f1a7}"
    case Briefcase = "\u{f0b1}"
    case FacebookOfficial = "\u{f230}"
    case Connectdevelop = "\u{f20e}"
    case Print = "\u{f02f}"
    case Recycle = "\u{f1b8}"
    case Subway = "\u{f239}"
    case Yelp = "\u{f1e9}"
    case Cog, Gear = "\u{f013}"
    case CalendarCheckO = "\u{f274}"
    case ProductHunt = "\u{f288}"
    case BluetoothB = "\u{f294}"
    case CcAmex = "\u{f1f3}"
    case LongArrowDown = "\u{f175}"
    case Qq = "\u{f1d6}"
    case ArrowsH = "\u{f07e}"
    case Plus = "\u{f067}"
    case ListUl = "\u{f0ca}"
    case Renren = "\u{f18b}"
    case SpaceShuttle = "\u{f197}"
    case CircleONotch = "\u{f1ce}"
    case Medium = "\u{f23a}"
    case AlignJustify = "\u{f039}"
    case Ban = "\u{f05e}"
    case Phone = "\u{f095}"
    case Close, Remove, Times = "\u{f00d}"
    case RedditAlien = "\u{f281}"
    case Suitcase = "\u{f0f2}"
    case TumblrSquare = "\u{f174}"
    case VenusMars = "\u{f228}"
    case Barcode = "\u{f02a}"
    case Info = "\u{f129}"
    case Filter = "\u{f0b0}"
    case At = "\u{f1fa}"
    case AngleUp = "\u{f106}"
    case ArrowUp = "\u{f062}"
    case Css3 = "\u{f13c}"
    case Calendar = "\u{f073}"
    case HandSpockO = "\u{f259}"
    case Battery4, BatteryFull = "\u{f240}"
    case CcStripe = "\u{f1f5}"
    case Search = "\u{f002}"
    case Trello = "\u{f181}"
    case CheckCircleO = "\u{f05d}"
    case Dedent, Outdent = "\u{f03b}"
    case MousePointer = "\u{f245}"
    case CaretSquareOLeft, ToggleLeft = "\u{f191}"
    case CaretDown = "\u{f0d7}"
    case ChevronCircleLeft = "\u{f137}"
    case Git = "\u{f1d3}"
    case Paragraph = "\u{f1dd}"
    case StarO = "\u{f006}"
    case Adn = "\u{f170}"
    case CcJcb = "\u{f24b}"
    case ArrowLeft = "\u{f060}"
    case Female = "\u{f182}"
    case Battery2, BatteryHalf = "\u{f242}"
    case FileAudioO, FileSoundO = "\u{f1c7}"
    case LevelDown = "\u{f149}"
    case MapSigns = "\u{f277}"
    case HddO = "\u{f0a0}"
    case HSquare = "\u{f0fd}"
    case Apple = "\u{f179}"
    case FacebookSquare = "\u{f082}"
    case AlignLeft = "\u{f036}"
    case Lastfm = "\u{f202}"
    case UnlockAlt = "\u{f13e}"
    case Italic = "\u{f033}"
    case Vimeo = "\u{f27d}"
    case SignOut = "\u{f08b}"
    case Crop = "\u{f125}"
    case Binoculars = "\u{f1e5}"
    case EnvelopeSquare = "\u{f199}"
    case CreativeCommons = "\u{f25e}"
    case ShareAlt = "\u{f1e0}"
    case Bus = "\u{f207}"
    case Tablet = "\u{f10a}"
    case TextWidth = "\u{f035}"
    case Bed, Hotel = "\u{f236}"
    case Truck = "\u{f0d1}"
    case Meanpath = "\u{f20c}"
    case CloudDownload = "\u{f0ed}"
    case HandPaperO, HandStopO = "\u{f256}"
    case PieChart = "\u{f200}"
    case Gavel, Legal = "\u{f0e3}"
    case Motorcycle = "\u{f21c}"
    case Dashcube = "\u{f210}"
    case Dribbble = "\u{f17d}"
    case Simplybuilt = "\u{f215}"
    case Amazon = "\u{f270}"
    case MailReplyAll, ReplyAll = "\u{f122}"
    case StickyNoteO = "\u{f24a}"
    case Qrcode = "\u{f029}"
    case Copyright = "\u{f1f9}"
    case InternetExplorer = "\u{f26b}"
    case ThumbsODown = "\u{f088}"
    case CaretUp = "\u{f0d8}"
    case Expeditedssl = "\u{f23e}"
    case Pencil = "\u{f040}"
    case Anchor = "\u{f13d}"
    case Steam = "\u{f1b6}"
    case AngleDown = "\u{f107}"
    case Stethoscope = "\u{f0f1}"
    case Tripadvisor = "\u{f262}"
    case UserMd = "\u{f0f0}"
    case VolumeOff = "\u{f026}"
    case PinterestP = "\u{f231}"
    case HandPointerO = "\u{f25a}"
    case Expand = "\u{f065}"
    case MinusSquare = "\u{f146}"
    case SearchPlus = "\u{f00e}"
    case PencilSquare = "\u{f14b}"
    case FilePdfO = "\u{f1c1}"
    case Reddit = "\u{f1a1}"
    case Child = "\u{f1ae}"
    case Circle = "\u{f111}"
    case EllipsisV = "\u{f142}"
    case Key = "\u{f084}"
    case Inbox = "\u{f01c}"
    case Cloud = "\u{f0c2}"
    case ThumbsOUp = "\u{f087}"
    case FileCodeO = "\u{f1c9}"
    case WikipediaW = "\u{f266}"
    case YoutubePlay = "\u{f16a}"
    case Mercury = "\u{f223}"
    case HackerNews, YCombinatorSquare, YcSquare = "\u{f1d4}"
    case BalanceScale = "\u{f24e}"
    case CartPlus = "\u{f217}"
    case Subscript = "\u{f12c}"
    case Automobile, Car = "\u{f1b9}"
    case Diamond = "\u{f219}"
    case StarHalfEmpty, StarHalfFull, StarHalfO = "\u{f123}"
    case StepForward = "\u{f051}"
    case Twitch = "\u{f1e8}"
    case Th = "\u{f00a}"
    case Registered = "\u{f25d}"
    case Magic = "\u{f0d0}"
    case Language = "\u{f1ab}"
    case Wechat, Weixin = "\u{f1d7}"
    case CheckSquareO = "\u{f046}"
    case Gamepad = "\u{f11b}"
    case Male = "\u{f183}"
    case PaintBrush = "\u{f1fc}"
    case Soundcloud = "\u{f1be}"
    case BarChart, BarChartO = "\u{f080}"
    case Indent = "\u{f03c}"
    case Spinner = "\u{f110}"
    case BellSlashO = "\u{f1f7}"
    case Trash = "\u{f1f8}"
    case PauseCircle = "\u{f28b}"
    case SortAlphaAsc = "\u{f15d}"
    case Ra, Rebel = "\u{f1d0}"
    case Film = "\u{f008}"
    case Maxcdn = "\u{f136}"
    case CaretSquareODown, ToggleDown = "\u{f150}"
    case Cut, Scissors = "\u{f0c4}"
    case CaretSquareOUp, ToggleUp = "\u{f151}"
    case ShoppingCart = "\u{f07a}"
    case Stop = "\u{f04d}"
    case Battery0, BatteryEmpty = "\u{f244}"
    case Openid = "\u{f19b}"
}