#!/bin/bash
for plugin in "redmine_close_button" "redmine_custom_reports" "redmine_editor_preview_tab" "redmine_emoji" "redmine_highlightjs" "redmine_image_clipboard_paste" "redmine_issue_badge" "redmine_issue_checklist" "redmine_issue_templates" "redmine_issues_tree" "redmine_lightbox2" "redmine_local_avatars" "redmine_my_page_queries" "redmine_plugin_display_role" "redmine_priority_colors" "redmine_show_issue_assignee_avatar" "redmine_user_specific_theme" "redmine_watcher_filter" "redmine_watcher_groups" "redmine_work_time" "redmine_zenedit" "sidebar_hide"; do
  echo "--//plugin: ${plugin}"
  git submodule add https://github.com/ChatWorks/${plugin}.git plugins/${plugin}
done

for theme in "PurpleMine2" "redmine-theme-gitmike"; do
  echo "--//theme: ${theme}"
  git submodule add https://github.com/ChatWorks/${theme}.git themes/${theme}
done


