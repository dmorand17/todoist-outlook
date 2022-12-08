#!/usr/bin/osascript -l JavaScript

function run(argv) {
  var query = argv[0];
  var Safari = new Application("/Applications/Safari.app");

  Safari.activate();

  window = Safari.windows[0];

  tab = Safari.Tab({url:"http://www.google.com"});
  window.tabs.push(tab);
  window.currentTab = tab; 
}
