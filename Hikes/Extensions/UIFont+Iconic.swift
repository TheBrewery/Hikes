//
//  UIFont+Iconic.swift
//  Hikes
//
//  Created by James Hildensperger on 2/11/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

//1.1.1

import Foundation
import UIKit

extension UIFont {
    class func iconicFontOfSize(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "open-iconic", size: fontSize)!
    }
}

public let IconicHash: [String: String] = [
    "arrow-thick-right": "\u{e011}",
    "target": "\u{e0c7}",
    "droplet": "\u{e058}",
    "copywriting": "\u{e04a}",
    "double-quote-sans-right": "\u{e055}",
    "monitor": "\u{e09e}",
    "share": "\u{e0bb}",
    "star": "\u{e0c2}",
    "chevron-bottom": "\u{e034}",
    "shield": "\u{e0bc}",
    "signpost": "\u{e0be}",
    "sort-descending": "\u{e0c0}",
    "check": "\u{e033}",
    "circle-check": "\u{e038}",
    "resize-both": "\u{e0b4}",
    "infinity": "\u{e07b}",
    "file": "\u{e067}",
    "thumb-up": "\u{e0cc}",
    "euro": "\u{e05e}",
    "home": "\u{e078}",
    "contrast": "\u{e049}",
    "book": "\u{e021}",
    "data-transfer-upload": "\u{e04f}",
    "moon": "\u{e09f}",
    "collapse-left": "\u{e043}",
    "justify-right": "\u{e080}",
    "volume-low": "\u{e0d6}",
    "zoom-out": "\u{e0de}",
    "envelope-open": "\u{e05d}",
    "puzzle-piece": "\u{e0af}",
    "play-circle": "\u{e0a9}",
    "volume-high": "\u{e0d5}",
    "location": "\u{e089}",
    "excerpt": "\u{e05f}",
    "grid-three-up": "\u{e072}",
    "fork": "\u{e06c}",
    "cloud": "\u{e03e}",
    "eject": "\u{e059}",
    "double-quote-serif-left": "\u{e056}",
    "dashboard": "\u{e04d}",
    "image": "\u{e079}",
    "underline": "\u{e0d0}",
    "collapse-right": "\u{e044}",
    "tablet": "\u{e0c4}",
    "audio": "\u{e015}",
    "collapse-up": "\u{e045}",
    "arrow-top": "\u{e013}",
    "link-intact": "\u{e086}",
    "bullhorn": "\u{e029}",
    "justify-left": "\u{e07f}",
    "tag": "\u{e0c5}",
    "bell": "\u{e01d}",
    "arrow-thick-left": "\u{e010}",
    "aperture": "\u{e007}",
    "flag": "\u{e069}",
    "account-logout": "\u{e001}",
    "document": "\u{e052}",
    "media-step-forward": "\u{e098}",
    "menu": "\u{e09b}",
    "caret-bottom": "\u{e02d}",
    "media-pause": "\u{e092}",
    "graph": "\u{e070}",
    "eyedropper": "\u{e066}",
    "volume-off": "\u{e0d7}",
    "media-step-backward": "\u{e097}",
    "fullscreen-exit": "\u{e06e}",
    "cloudy": "\u{e03f}",
    "box": "\u{e023}",
    "cloud-download": "\u{e03c}",
    "align-center": "\u{e004}",
    "arrow-circle-left": "\u{e00a}",
    "calculator": "\u{e02a}",
    "bolt": "\u{e020}",
    "expand-up": "\u{e063}",
    "italic": "\u{e07d}",
    "people": "\u{e0a4}",
    "person": "\u{e0a5}",
    "script": "\u{e0b9}",
    "thumb-down": "\u{e0cb}",
    "vertical-align-bottom": "\u{e0d1}",
    "bluetooth": "\u{e01e}",
    "pulse": "\u{e0ae}",
    "beaker": "\u{e01c}",
    "arrow-circle-top": "\u{e00c}",
    "heart": "\u{e077}",
    "caret-top": "\u{e030}",
    "bookmark": "\u{e022}",
    "justify-center": "\u{e07e}",
    "zoom-in": "\u{e0dd}",
    "fire": "\u{e068}",
    "brush": "\u{e027}",
    "action-redo": "\u{e002}",
    "delete": "\u{e050}",
    "phone": "\u{e0a6}",
    "calendar": "\u{e02b}",
    "rss-alt": "\u{e0b7}",
    "expand-right": "\u{e062}",
    "credit-card": "\u{e04b}",
    "video": "\u{e0d4}",
    "rss": "\u{e0b8}",
    "resize-height": "\u{e0b5}",
    "camera-slr": "\u{e02c}",
    "resize-width": "\u{e0b6}",
    "timer": "\u{e0cd}",
    "expand-left": "\u{e061}",
    "paperclip": "\u{e0a2}",
    "flash": "\u{e06a}",
    "clock": "\u{e03b}",
    "crop": "\u{e04c}",
    "layers": "\u{e083}",
    "share-boxed": "\u{e0ba}",
    "dollar": "\u{e053}",
    "elevator": "\u{e05a}",
    "external-link": "\u{e064}",
    "cog": "\u{e041}",
    "lightbulb": "\u{e084}",
    "question-mark": "\u{e0b0}",
    "media-record": "\u{e094}",
    "battery-full": "\u{e01b}",
    "ellipses": "\u{e05b}",
    "laptop": "\u{e082}",
    "chat": "\u{e032}",
    "inbox": "\u{e07a}",
    "medical-cross": "\u{e09a}",
    "media-skip-backward": "\u{e095}",
    "hard-drive": "\u{e074}",
    "compass": "\u{e048}",
    "pin": "\u{e0a8}",
    "envelope-closed": "\u{e05c}",
    "caret-right": "\u{e02f}",
    "dial": "\u{e051}",
    "move": "\u{e0a0}",
    "data-transfer-download": "\u{e04e}",
    "folder": "\u{e06b}",
    "power-standby": "\u{e0ab}",
    "arrow-bottom": "\u{e008}",
    "arrow-thick-bottom": "\u{e00f}",
    "warning": "\u{e0d8}",
    "lock-unlocked": "\u{e08b}",
    "magnifying-glass": "\u{e08f}",
    "loop-circular": "\u{e08c}",
    "yen": "\u{e0dc}",
    "map-marker": "\u{e090}",
    "map": "\u{e091}",
    "reload": "\u{e0b3}",
    "chevron-top": "\u{e037}",
    "cloud-upload": "\u{e03d}",
    "chevron-left": "\u{e035}",
    "chevron-right": "\u{e036}",
    "comment-square": "\u{e047}",
    "sort-ascending": "\u{e0bf}",
    "globe": "\u{e06f}",
    "eye": "\u{e065}",
    "grid-two-up": "\u{e073}",
    "vertical-align-center": "\u{e0d2}",
    "british-pound": "\u{e025}",
    "text": "\u{e0ca}",
    "browser": "\u{e026}",
    "print": "\u{e0ac}",
    "pie-chart": "\u{e0a7}",
    "briefcase": "\u{e024}",
    "microphone": "\u{e09c}",
    "minus": "\u{e09d}",
    "basket": "\u{e019}",
    "battery-empty": "\u{e01a}",
    "vertical-align-top": "\u{e0d3}",
    "arrow-thick-top": "\u{e012}",
    "badge": "\u{e016}",
    "plus": "\u{e0aa}",
    "tags": "\u{e0c6}",
    "arrow-circle-right": "\u{e00b}",
    "loop-square": "\u{e08d}",
    "link-broken": "\u{e085}",
    "expand-down": "\u{e060}",
    "account-login": "\u{e000}",
    "bug": "\u{e028}",
    "grid-four-up": "\u{e071}",
    "loop": "\u{e08e}",
    "key": "\u{e081}",
    "pencil": "\u{e0a3}",
    "trash": "\u{e0cf}",
    "terminal": "\u{e0c9}",
    "list-rich": "\u{e087}",
    "x": "\u{e0db}",
    "lock-locked": "\u{e08a}",
    "sun": "\u{e0c3}",
    "double-quote-sans-left": "\u{e054}",
    "arrow-circle-bottom": "\u{e009}",
    "rain": "\u{e0b1}",
    "ban": "\u{e017}",
    "caret-left": "\u{e02e}",
    "musical-note": "\u{e0a1}",
    "bar-chart": "\u{e018}",
    "wrench": "\u{e0da}",
    "bold": "\u{e01f}",
    "clipboard": "\u{e03a}",
    "header": "\u{e075}",
    "media-play": "\u{e093}",
    "transfer": "\u{e0ce}",
    "double-quote-serif-right": "\u{e057}",
    "collapse-down": "\u{e042}",
    "cart": "\u{e031}",
    "code": "\u{e040}",
    "headphones": "\u{e076}",
    "media-stop": "\u{e099}",
    "list": "\u{e088}",
    "signal": "\u{e0bd}",
    "fullscreen-enter": "\u{e06d}",
    "project": "\u{e0ad}",
    "action-undo": "\u{e003}",
    "arrow-right": "\u{e00e}",
    "wifi": "\u{e0d9}",
    "arrow-left": "\u{e00d}",
    "circle-x": "\u{e039}",
    "command": "\u{e046}",
    "random": "\u{e0b2}",
    "align-right": "\u{e006}",
    "media-skip-forward": "\u{e096}",
    "align-left": "\u{e005}",
    "spreadsheet": "\u{e0c1}",
    "audio-spectrum": "\u{e014}",
    "task": "\u{e0c8}",
    "info": "\u{e07c}",
]

public enum Iconic: String {
    case Briefcase = "\u{e024}"
    case Euro = "\u{e05e}"
    case Minus = "\u{e09d}"
    case ArrowThickBottom = "\u{e00f}"
    case DataTransferUpload = "\u{e04f}"
    case MediaRecord = "\u{e094}"
    case RssAlt = "\u{e0b7}"
    case AccountLogout = "\u{e001}"
    case Copywriting = "\u{e04a}"
    case FullscreenEnter = "\u{e06d}"
    case MediaPause = "\u{e092}"
    case Box = "\u{e023}"
    case People = "\u{e0a4}"
    case Eject = "\u{e059}"
    case CaretLeft = "\u{e02e}"
    case Calendar = "\u{e02b}"
    case Bluetooth = "\u{e01e}"
    case MediaStepForward = "\u{e098}"
    case Browser = "\u{e026}"
    case Elevator = "\u{e05a}"
    case ArrowCircleTop = "\u{e00c}"
    case Heart = "\u{e077}"
    case Image = "\u{e079}"
    case File = "\u{e067}"
    case Share = "\u{e0bb}"
    case CaretRight = "\u{e02f}"
    case ArrowThickRight = "\u{e011}"
    case JustifyCenter = "\u{e07e}"
    case Pin = "\u{e0a8}"
    case Badge = "\u{e016}"
    case Fork = "\u{e06c}"
    case Tag = "\u{e0c5}"
    case Delete = "\u{e050}"
    case Italic = "\u{e07d}"
    case MedicalCross = "\u{e09a}"
    case ResizeBoth = "\u{e0b4}"
    case Eyedropper = "\u{e066}"
    case ArrowRight = "\u{e00e}"
    case ArrowThickLeft = "\u{e010}"
    case Bullhorn = "\u{e029}"
    case JustifyRight = "\u{e080}"
    case Task = "\u{e0c8}"
    case ArrowCircleLeft = "\u{e00a}"
    case Rss = "\u{e0b8}"
    case LockUnlocked = "\u{e08b}"
    case LoopCircular = "\u{e08c}"
    case Contrast = "\u{e049}"
    case Book = "\u{e021}"
    case Folder = "\u{e06b}"
    case PuzzlePiece = "\u{e0af}"
    case HardDrive = "\u{e074}"
    case Graph = "\u{e070}"
    case AccountLogin = "\u{e000}"
    case Monitor = "\u{e09e}"
    case Layers = "\u{e083}"
    case ResizeWidth = "\u{e0b6}"
    case Inbox = "\u{e07a}"
    case VerticalAlignCenter = "\u{e0d2}"
    case Clock = "\u{e03b}"
    case Compass = "\u{e048}"
    case Dollar = "\u{e053}"
    case ArrowBottom = "\u{e008}"
    case Home = "\u{e078}"
    case Basket = "\u{e019}"
    case ExpandUp = "\u{e063}"
    case Fire = "\u{e068}"
    case Trash = "\u{e0cf}"
    case Bug = "\u{e028}"
    case BatteryFull = "\u{e01b}"
    case Timer = "\u{e0cd}"
    case X = "\u{e0db}"
    case Ban = "\u{e017}"
    case DataTransferDownload = "\u{e04e}"
    case Script = "\u{e0b9}"
    case Map = "\u{e091}"
    case Plus = "\u{e0aa}"
    case ExpandRight = "\u{e062}"
    case Audio = "\u{e015}"
    case ChevronBottom = "\u{e034}"
    case Pencil = "\u{e0a3}"
    case Excerpt = "\u{e05f}"
    case Eye = "\u{e065}"
    case DoubleQuoteSerifLeft = "\u{e056}"
    case DoubleQuoteSerifRight = "\u{e057}"
    case VerticalAlignTop = "\u{e0d3}"
    case Flag = "\u{e069}"
    case Info = "\u{e07c}"
    case Move = "\u{e0a0}"
    case ActionUndo = "\u{e003}"
    case Person = "\u{e0a5}"
    case CollapseUp = "\u{e045}"
    case Moon = "\u{e09f}"
    case Print = "\u{e0ac}"
    case ThumbDown = "\u{e0cb}"
    case ZoomIn = "\u{e0dd}"
    case EnvelopeOpen = "\u{e05d}"
    case Signpost = "\u{e0be}"
    case CircleCheck = "\u{e038}"
    case VerticalAlignBottom = "\u{e0d1}"
    case GridFourUp = "\u{e071}"
    case Bell = "\u{e01d}"
    case Star = "\u{e0c2}"
    case MediaStepBackward = "\u{e097}"
    case Location = "\u{e089}"
    case ChevronLeft = "\u{e035}"
    case BritishPound = "\u{e025}"
    case Paperclip = "\u{e0a2}"
    case CaretBottom = "\u{e02d}"
    case Infinity = "\u{e07b}"
    case CollapseRight = "\u{e044}"
    case VolumeLow = "\u{e0d6}"
    case AudioSpectrum = "\u{e014}"
    case Menu = "\u{e09b}"
    case CaretTop = "\u{e030}"
    case Microphone = "\u{e09c}"
    case Loop = "\u{e08e}"
    case CreditCard = "\u{e04b}"
    case ArrowThickTop = "\u{e012}"
    case CollapseLeft = "\u{e043}"
    case BatteryEmpty = "\u{e01a}"
    case ShareBoxed = "\u{e0ba}"
    case Crop = "\u{e04c}"
    case Cloudy = "\u{e03f}"
    case Transfer = "\u{e0ce}"
    case Flash = "\u{e06a}"
    case CommentSquare = "\u{e047}"
    case Clipboard = "\u{e03a}"
    case Rain = "\u{e0b1}"
    case Bookmark = "\u{e022}"
    case Pulse = "\u{e0ae}"
    case GridThreeUp = "\u{e072}"
    case Aperture = "\u{e007}"
    case Laptop = "\u{e082}"
    case Terminal = "\u{e0c9}"
    case CollapseDown = "\u{e042}"
    case Dashboard = "\u{e04d}"
    case ArrowCircleRight = "\u{e00b}"
    case Tags = "\u{e0c6}"
    case Document = "\u{e052}"
    case ArrowTop = "\u{e013}"
    case AlignCenter = "\u{e004}"
    case ArrowCircleBottom = "\u{e009}"
    case Headphones = "\u{e076}"
    case MediaSkipForward = "\u{e096}"
    case Target = "\u{e0c7}"
    case CircleX = "\u{e039}"
    case Shield = "\u{e0bc}"
    case VolumeHigh = "\u{e0d5}"
    case Droplet = "\u{e058}"
    case Video = "\u{e0d4}"
    case Tablet = "\u{e0c4}"
    case Signal = "\u{e0bd}"
    case ExpandDown = "\u{e060}"
    case ExternalLink = "\u{e064}"
    case MusicalNote = "\u{e0a1}"
    case Beaker = "\u{e01c}"
    case Reload = "\u{e0b3}"
    case PowerStandby = "\u{e0ab}"
    case MediaPlay = "\u{e093}"
    case ChevronRight = "\u{e036}"
    case Header = "\u{e075}"
    case Warning = "\u{e0d8}"
    case EnvelopeClosed = "\u{e05c}"
    case Cart = "\u{e031}"
    case CloudDownload = "\u{e03c}"
    case Lightbulb = "\u{e084}"
    case LinkBroken = "\u{e085}"
    case Phone = "\u{e0a6}"
    case PieChart = "\u{e0a7}"
    case VolumeOff = "\u{e0d7}"
    case DoubleQuoteSansRight = "\u{e055}"
    case List = "\u{e088}"
    case DoubleQuoteSansLeft = "\u{e054}"
    case ResizeHeight = "\u{e0b5}"
    case MapMarker = "\u{e090}"
    case ListRich = "\u{e087}"
    case LockLocked = "\u{e08a}"
    case ChevronTop = "\u{e037}"
    case ActionRedo = "\u{e002}"
    case AlignLeft = "\u{e005}"
    case Random = "\u{e0b2}"
    case Text = "\u{e0ca}"
    case CloudUpload = "\u{e03d}"
    case PlayCircle = "\u{e0a9}"
    case Cloud = "\u{e03e}"
    case Wrench = "\u{e0da}"
    case SortAscending = "\u{e0bf}"
    case Bolt = "\u{e020}"
    case Ellipses = "\u{e05b}"
    case LinkIntact = "\u{e086}"
    case QuestionMark = "\u{e0b0}"
    case Sun = "\u{e0c3}"
    case Calculator = "\u{e02a}"
    case AlignRight = "\u{e006}"
    case MediaStop = "\u{e099}"
    case Chat = "\u{e032}"
    case GridTwoUp = "\u{e073}"
    case Wifi = "\u{e0d9}"
    case Check = "\u{e033}"
    case Underline = "\u{e0d0}"
    case Code = "\u{e040}"
    case Command = "\u{e046}"
    case Cog = "\u{e041}"
    case ExpandLeft = "\u{e061}"
    case CameraSlr = "\u{e02c}"
    case LoopSquare = "\u{e08d}"
    case Bold = "\u{e01f}"
    case MagnifyingGlass = "\u{e08f}"
    case JustifyLeft = "\u{e07f}"
    case ThumbUp = "\u{e0cc}"
    case ArrowLeft = "\u{e00d}"
    case Yen = "\u{e0dc}"
    case Globe = "\u{e06f}"
    case Brush = "\u{e027}"
    case Key = "\u{e081}"
    case FullscreenExit = "\u{e06e}"
    case ZoomOut = "\u{e0de}"
    case SortDescending = "\u{e0c0}"
    case Dial = "\u{e051}"
    case BarChart = "\u{e018}"
    case Spreadsheet = "\u{e0c1}"
    case Project = "\u{e0ad}"
    case MediaSkipBackward = "\u{e095}"
}
