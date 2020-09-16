class SettingService {
  bool theme = true;

  bool checkTheme() {
    return this.theme;
  }

  bool changetheme() {
    this.theme = !this.theme;
    return this.theme;
  }
}
