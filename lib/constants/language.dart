/* 
 *  This file is part of Harmonoid (https://github.com/harmonoid/harmonoid).
 *  
 *  Harmonoid is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *  
 *  Harmonoid is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU General Public License for more details.
 *  
 *  You should have received a copy of the GNU General Public License
 *  along with Harmonoid. If not, see <https://www.gnu.org/licenses/>.
 * 
 *  Copyright 2020-2022, Hitesh Kumar Saini <saini123hitesh@gmail.com>.
 */

import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

import 'package:harmonoid/constants/strings.dart';
import 'package:harmonoid/core/configuration.dart';

class LanguageRegion {
  final String code;
  final String countryCode;
  final String name;
  final String country;
  final String translator;
  final String github;

  const LanguageRegion({
    required this.code,
    required this.countryCode,
    required this.name,
    required this.country,
    required this.translator,
    required this.github,
  });

  static const enUs = LanguageRegion(
    code: 'en',
    countryCode: 'US',
    name: 'English',
    country: 'United States',
    translator: 'alexmercerind',
    github: 'https://github.com/alexmercerind',
  );
  static const ruRu = LanguageRegion(
    code: 'ru',
    countryCode: 'RU',
    name: 'Русский',
    country: 'Россия',
    translator: 'raitonoberu',
    github: 'https://github.com/raitonoberu',
  );
  static const slSi = LanguageRegion(
    code: 'sl',
    countryCode: 'SI',
    name: 'slovenščina',
    country: 'Slovenija',
    translator: 'mytja',
    github: 'https://github.com/mytja',
  );
  static const ptBr = LanguageRegion(
    code: 'pt',
    countryCode: 'BR',
    name: 'Português',
    country: 'Brasil',
    translator: 'bdlukaa',
    github: 'https://github.com/bdlukaa',
  );
  static const hiIn = LanguageRegion(
    code: 'hi',
    countryCode: 'IN',
    name: 'हिंदी',
    country: 'भारत',
    translator: 'alexmercerind',
    github: 'https://github.com/alexmercerind',
  );
  static const deDe = LanguageRegion(
      code: 'de',
      countryCode: 'DE',
      name: 'Deutsche',
      country: 'Deutschland',
      translator: 'MickLesk',
      github: 'https://github.com/MickLesk');
  static const nlNl = LanguageRegion(
    code: 'nl',
    countryCode: 'NL',
    name: 'Nederlands',
    country: 'Nederland',
    translator: 'kebabinjeneus',
    github: 'https://github.com/kebabinjeneus',
  );
  static const svSe = LanguageRegion(
    code: 'sv',
    countryCode: 'SE',
    name: 'Svenska',
    country: 'Sverige',
    translator: 'Max Haureus',
    github: '',
  );
  static const frFr = LanguageRegion(
    code: 'fr',
    countryCode: 'FR',
    name: 'Français',
    country: 'France',
    translator: 'Gaetan Jonathan',
    github: 'https://github.com/gaetan1903',
  );
  static const huHu = LanguageRegion(
    code: 'hu',
    countryCode: 'HU',
    name: 'Magyar',
    country: 'Magyarország',
    translator: 'RedyAu',
    github: 'https://github.com/RedyAu',
  );
  static const mgMG = LanguageRegion(
    code: 'mg',
    countryCode: 'MG',
    name: 'Malagasy',
    country: 'Madagascar',
    translator: 'Dominick',
    github: 'https://github.com/c3k4ah',
  );
  static const zhCN = LanguageRegion(
    code: 'zh',
    countryCode: 'CN',
    name: '汉语',
    country: '中国',
    translator: 'stonegate',
    github: 'https://github.com/stonega',
  );
  static const jaJP = LanguageRegion(
    code: 'ja',
    countryCode: 'JP',
    name: '日本語',
    country: '日本',
    translator: 'さぶうぇい',
    github: 'https://github.com/HiSubway',
  );

  static const values = <LanguageRegion>[
    enUs,
    ruRu,
    slSi,
    ptBr,
    hiIn,
    deDe,
    nlNl,
    svSe,
    frFr,
    huHu,
    mgMG,
    zhCN,
    jaJP
  ];

  int get index => values.indexOf(this);
}

class Language extends Strings with ChangeNotifier {
  late LanguageRegion current;

  static Language? get() => language;

  static Future<void> initialize() async {
    language = Language();
    await language.set(
      languageRegion: configuration.languageRegion!,
    );
  }

  Future<void> set({required LanguageRegion languageRegion}) async {
    var string = await rootBundle.loadString(
        'assets/translations/${languageRegion.code}_${languageRegion.countryCode}.json');
    var asset = jsonDecode(string);
    this.ABOUT_SUBTITLE = asset['ABOUT_SUBTITLE']!;
    this.ABOUT_TITLE = asset['ABOUT_TITLE']!;
    this.ADD_NEW_FOLDER = asset['ADD_NEW_FOLDER']!;
    this.ADD_TO_NOW_PLAYING = asset['ADD_TO_NOW_PLAYING']!;
    this.ADD_TO_PLAYLIST = asset['ADD_TO_PLAYLIST']!;
    this.ALBUM = asset['ALBUM']!;
    this.ALBUMS_FROM_ARTIST = asset['ALBUMS_FROM_ARTIST']!;
    this.ALBUM_SINGLE = asset['ALBUM_SINGLE']!;
    this.ARTIST = asset['ARTIST']!;
    this.ARTIST_SINGLE = asset['ARTIST_SINGLE']!;
    this.A_TO_Z = asset['A_TO_Z']!;
    this.BUFFERING = asset['BUFFERING']!;
    this.CANCEL = asset['CANCEL']!;
    this.COLLECTION = asset['COLLECTION']!;
    this.COLLECTION_ALBUM_ALBUM_DELETE_DIALOG_BODY = asset['COLLECTION_ALBUM_ALBUM_DELETE_DIALOG_BODY']!;
    this.COLLECTION_ALBUM_ALBUM_DELETE_DIALOG_HEADER = asset['COLLECTION_ALBUM_ALBUM_DELETE_DIALOG_HEADER']!;
    this.COLLECTION_ALBUM_INFO_SUBHEADER = asset['COLLECTION_ALBUM_INFO_SUBHEADER']!;
    this.COLLECTION_ALBUM_PLAYLIST_DELETE_DIALOG_BODY = asset['COLLECTION_ALBUM_PLAYLIST_DELETE_DIALOG_BODY']!;
    this.COLLECTION_ALBUM_PLAYLIST_DELETE_DIALOG_HEADER = asset['COLLECTION_ALBUM_PLAYLIST_DELETE_DIALOG_HEADER']!;
    this.COLLECTION_ALBUM_TRACKS_SUBHEADER = asset['COLLECTION_ALBUM_TRACKS_SUBHEADER']!;
    this.COLLECTION_ALBUM_TRACK_DELETE_DIALOG_BODY = asset['COLLECTION_ALBUM_TRACK_DELETE_DIALOG_BODY']!;
    this.COLLECTION_ALBUM_TRACK_DELETE_DIALOG_HEADER = asset['COLLECTION_ALBUM_TRACK_DELETE_DIALOG_HEADER']!;
    this.COLLECTION_INDEXING_HINT = asset['COLLECTION_INDEXING_HINT']!;
    this.COLLECTION_INDEXING_LABEL = asset['COLLECTION_INDEXING_LABEL']!;
    this.COLLECTION_OTHER_SUBHEADER_ALBUM = asset['COLLECTION_OTHER_SUBHEADER_ALBUM']!;
    this.COLLECTION_OTHER_SUBHEADER_ARTIST = asset['COLLECTION_OTHER_SUBHEADER_ARTIST']!;
    this.COLLECTION_OTHER_SUBHEADER_TRACK = asset['COLLECTION_OTHER_SUBHEADER_TRACK']!;
    this.COLLECTION_SEARCH_LABEL = asset['COLLECTION_SEARCH_LABEL']!;
    this.COLLECTION_SEARCH_NO_RESULTS = asset['COLLECTION_SEARCH_NO_RESULTS']!;
    this.COLLECTION_SEARCH_WELCOME = asset['COLLECTION_SEARCH_WELCOME']!;
    this.COLLECTION_TOP_BODY_ALBUM_EMPTY = asset['COLLECTION_TOP_BODY_ALBUM_EMPTY']!;
    this.COLLECTION_TOP_SUBHEADER_ALBUM = asset['COLLECTION_TOP_SUBHEADER_ALBUM']!;
    this.COLLECTION_TOP_SUBHEADER_ARTIST = asset['COLLECTION_TOP_SUBHEADER_ARTIST']!;
    this.COLLECTION_TOP_SUBHEADER_TRACK = asset['COLLECTION_TOP_SUBHEADER_TRACK']!;
    this.COMING_UP = asset['COMING_UP']!;
    this.DATE_ADDED = asset['DATE_ADDED']!;
    this.DELETE = asset['DELETE']!;
    this.DELETE_TRACK = asset['DELETE_TRACK']!;
    this.DISCORD = asset['DISCORD']!;
    this.DOWNLOAD_UPDATE = asset['DOWNLOAD_UPDATE']!;
    this.ENABLE_125_SCALING = asset['ENABLE_125_SCALING']!;
    this.ENABLE_ACRYLIC_BLUR = asset['ENABLE_ACRYLIC_BLUR']!;
    this.EXIT_SUBTITLE = asset['EXIT_SUBTITLE']!;
    this.EXIT_TITLE = asset['EXIT_TITLE']!;
    this.INTERNET_ERROR = asset['INTERNET_ERROR']!;
    this.KNOW_MORE = asset['KNOW_MORE']!;
    this.LAST_COLLECTION_DIRECTORY_REMOVED = asset['LAST_COLLECTION_DIRECTORY_REMOVED']!;
    this.LYRICS = asset['LYRICS']!;
    this.LYRICS_NOT_FOUND = asset['LYRICS_NOT_FOUND']!;
    this.LYRICS_RETRIEVING = asset['LYRICS_RETRIEVING']!;
    this.MENU = asset['MENU']!;
    this.NO = asset['NO']!;
    this.NOTIFICATION_LYRICS_SUBTITLE = asset['NOTIFICATION_LYRICS_SUBTITLE']!;
    this.NOTIFICATION_LYRICS_TITLE = asset['NOTIFICATION_LYRICS_TITLE']!;
    this.NOW_PLAYING = asset['NOW_PLAYING']!;
    this.NOW_PLAYING_NEXT_TRACK = asset['NOW_PLAYING_NEXT_TRACK']!;
    this.NOW_PLAYING_NOT_PLAYING_TITLE = asset['NOW_PLAYING_NOT_PLAYING_TITLE']!;
    this.NOW_PLAYING_PREVIOUS_TRACK = asset['NOW_PLAYING_PREVIOUS_TRACK']!;
    this.NO_COLLECTION_SUBTITLE = asset['NO_COLLECTION_SUBTITLE']!;
    this.NO_COLLECTION_TITLE = asset['NO_COLLECTION_TITLE']!;
    this.NO_DOWNLOAD_UPDATE = asset['NO_DOWNLOAD_UPDATE']!;
    this.NO_INTERNET_SUBTITLE = asset['NO_INTERNET_SUBTITLE']!;
    this.NO_INTERNET_TITLE = asset['NO_INTERNET_TITLE']!;
    this.OK = asset['OK']!;
    this.OPTIONS = asset['OPTIONS']!;
    this.PAUSE = asset['PAUSE']!;
    this.PLAY = asset['PLAY']!;
    this.PLAYLIST = asset['PLAYLIST']!;
    this.PLAYLISTS_CREATE = asset['PLAYLISTS_CREATE']!;
    this.PLAYLISTS_SUBHEADER = asset['PLAYLISTS_SUBHEADER']!;
    this.PLAYLISTS_TEXT_FIELD_HINT = asset['PLAYLISTS_TEXT_FIELD_HINT']!;
    this.PLAYLISTS_TEXT_FIELD_LABEL = asset['PLAYLISTS_TEXT_FIELD_LABEL']!;
    this.PLAYLIST_ADD_DIALOG_BODY = asset['PLAYLIST_ADD_DIALOG_BODY']!;
    this.PLAYLIST_ADD_DIALOG_TITLE = asset['PLAYLIST_ADD_DIALOG_TITLE']!;
    this.PLAYLIST_TRACKS_SUBHEADER = asset['PLAYLIST_TRACKS_SUBHEADER']!;
    this.PLAY_NOW = asset['PLAY_NOW']!;
    this.RECOMMENDATIONS = asset['RECOMMENDATIONS']!;
    this.REFRESH = asset['REFRESH']!;
    this.REMOVE = asset['REMOVE']!;
    this.RETRIEVING_INFO = asset['RETRIEVING_INFO']!;
    this.RETRIEVING_LINK = asset['RETRIEVING_LINK']!;
    this.SAVE_TO_DOWNLOADS = asset['SAVE_TO_DOWNLOADS']!;
    this.SEARCH = asset['SEARCH']!;
    this.SEARCH_COLLECTION = asset['SEARCH_COLLECTION']!;
    this.SEARCH_HISTORY_SUBHEADER = asset['SEARCH_HISTORY_SUBHEADER']!;
    this.SEARCH_NO_RECENT_SEARCHES = asset['SEARCH_NO_RECENT_SEARCHES']!;
    this.SEARCH_RESULT_LOADER_LABEL = asset['SEARCH_RESULT_LOADER_LABEL']!;
    this.SEARCH_WELCOME = asset['SEARCH_WELCOME']!;
    this.SELECTED_DIRECTORIES = asset['SELECTED_DIRECTORIES']!;
    this.SELECTED_DIRECTORY = asset['SELECTED_DIRECTORY']!;
    this.SETTING = asset['SETTING']!;
    this.SETTING_ACCENT_COLOR_AUTOMATIC = asset['SETTING_ACCENT_COLOR_AUTOMATIC']!;
    this.SETTING_ACCENT_COLOR_SUBTITLE = asset['SETTING_ACCENT_COLOR_SUBTITLE']!;
    this.SETTING_ACCENT_COLOR_TITLE = asset['SETTING_ACCENT_COLOR_TITLE']!;
    this.SETTING_APP_VERSION_INSTALLED = asset['SETTING_APP_VERSION_INSTALLED']!;
    this.SETTING_APP_VERSION_LATEST = asset['SETTING_APP_VERSION_LATEST']!;
    this.SETTING_APP_VERSION_SUBTITLE = asset['SETTING_APP_VERSION_SUBTITLE']!;
    this.SETTING_APP_VERSION_TITLE = asset['SETTING_APP_VERSION_TITLE']!;
    this.SETTING_GITHUB = asset['SETTING_GITHUB']!;
    this.SETTING_INDEXING_DONE = asset['SETTING_INDEXING_DONE']!;
    this.SETTING_INDEXING_LINEAR_PROGRESS_INDICATOR = asset['SETTING_INDEXING_LINEAR_PROGRESS_INDICATOR']!;
    this.SETTING_INDEXING_SUBTITLE = asset['SETTING_INDEXING_SUBTITLE']!;
    this.SETTING_INDEXING_TITLE = asset['SETTING_INDEXING_TITLE']!;
    this.SETTING_INDEXING_WARNING = asset['SETTING_INDEXING_WARNING']!;
    this.SETTING_LANGUAGE_PROVIDERS_SUBTITLE = asset['SETTING_LANGUAGE_PROVIDERS_SUBTITLE']!;
    this.SETTING_LANGUAGE_PROVIDERS_TITLE = asset['SETTING_LANGUAGE_PROVIDERS_TITLE']!;
    this.SETTING_LANGUAGE_RESTART_DIALOG_SUBTITLE = asset['SETTING_LANGUAGE_RESTART_DIALOG_SUBTITLE']!;
    this.SETTING_LANGUAGE_RESTART_DIALOG_TITLE = asset['SETTING_LANGUAGE_RESTART_DIALOG_TITLE']!;
    this.SETTING_LANGUAGE_SUBTITLE = asset['SETTING_LANGUAGE_SUBTITLE']!;
    this.SETTING_LANGUAGE_TITLE = asset['SETTING_LANGUAGE_TITLE']!;
    this.SETTING_MISCELLANEOUS_ENABLE_IOS_SUBTITLE = asset['SETTING_MISCELLANEOUS_ENABLE_IOS_SUBTITLE']!;
    this.SETTING_MISCELLANEOUS_ENABLE_IOS_TITLE = asset['SETTING_MISCELLANEOUS_ENABLE_IOS_TITLE']!;
    this.SETTING_MISCELLANEOUS_SUBTITLE = asset['SETTING_MISCELLANEOUS_SUBTITLE']!;
    this.SETTING_MISCELLANEOUS_TITLE = asset['SETTING_MISCELLANEOUS_TITLE']!;
    this.SETTING_STARGAZERS_SUBTITLE = asset['SETTING_STARGAZERS_SUBTITLE']!;
    this.SETTING_STARGAZERS_TITLE = asset['SETTING_STARGAZERS_TITLE']!;
    this.SETTING_STAR_GITHUB = asset['SETTING_STAR_GITHUB']!;
    this.SETTING_THEME_SUBTITLE = asset['SETTING_THEME_SUBTITLE']!;
    this.SETTING_THEME_TITLE = asset['SETTING_THEME_TITLE']!;
    this.SHARE = asset['SHARE']!;
    this.SORT_BY = asset['SORT_BY']!;
    this.STARTING_PLAYBACK = asset['STARTING_PLAYBACK']!;
    this.SWITCH_THEME = asset['SWITCH_THEME']!;
    this.THEME_MODE_DARK = asset['THEME_MODE_DARK']!;
    this.THEME_MODE_LIGHT = asset['THEME_MODE_LIGHT']!;
    this.THEME_MODE_SYSTEM = asset['THEME_MODE_SYSTEM']!;
    this.TRACK = asset['TRACK']!;
    this.TRACKS_FROM_ARTIST = asset['TRACKS_FROM_ARTIST']!;
    this.TRACK_SINGLE = asset['TRACK_SINGLE']!;
    this.TRANSFERS = asset['TRANSFERS']!;
    this.WARNING = asset['WARNING']!;
    this.YEAR = asset['YEAR']!;
    this.YES = asset['YES']!;
    this.YOUTUBE = asset['YOUTUBE']!;
    this.YOUTUBE_INTERNET_ERROR = asset['YOUTUBE_INTERNET_ERROR']!;
    this.YOUTUBE_NO_RESULTS = asset['YOUTUBE_NO_RESULTS']!;
    this.YOUTUBE_WELCOME = asset['YOUTUBE_WELCOME']!;
    configuration.save(languageRegion: languageRegion);
    this.current = languageRegion;
    this.notifyListeners();
  }

  @override
  // ignore: must_call_super
  void dispose() {}
}

/// Late initialized [Language] object instance.
late Language language;
