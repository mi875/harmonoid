import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

import 'package:harmonoid/constants/language.dart';
import 'package:harmonoid/utils/rendering.dart';

List<PopupMenuItem<int>> youtubeTrackPopupMenuItems(BuildContext context) => [
      PopupMenuItem(
        padding: EdgeInsets.zero,
        value: 1,
        child: ListTile(
          leading: Icon(Platform.isWindows
              ? FluentIcons.list_16_regular
              : Icons.queue_music),
          title: Text(
            Language.instance.ADD_TO_PLAYLIST,
            style: isDesktop ? Theme.of(context).textTheme.headline4 : null,
          ),
        ),
      ),
      PopupMenuItem(
        padding: EdgeInsets.zero,
        value: 0,
        child: ListTile(
          leading: Icon(
              Platform.isWindows ? FluentIcons.earth_20_regular : Icons.delete),
          title: Text(
            Language.instance.OPEN_IN_BROWSER,
            style: isDesktop ? Theme.of(context).textTheme.headline4 : null,
          ),
        ),
      ),
    ];
