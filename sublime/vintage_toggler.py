import sublime
import sublime_plugin


class ToggleVintage(sublime_plugin.WindowCommand):
    def run(self):
        setts = sublime.load_settings('Preferences.sublime-settings')
        ignored = setts.get('ignored_packages')

        if 'Vintage' in ignored:
            ignored.remove('Vintage')
        else:
            ignored.append('Vintage')

        setts.set('ignored_packages', ignored)
        sublime.save_settings('Preferences.sublime-settings')
