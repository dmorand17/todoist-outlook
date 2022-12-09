const app = Application.currentApplication();
app.includeStandardAdditions = true;

function run(argv) {  
  var query = argv[0];

  // app.displayDialog("adding task from outlook...");
  var Outlook = new Application("/Applications/Microsoft Outlook.app");

  //Focus the application
  Outlook.activate();

  var msg = Outlook.selectedObjects()[0];

  //console.log(`Messages selected: ${outlook_messages.length}`);
  //outlook_messages.forEach(msg => console.log("Subject: " + msg.subject()));  
  
  //var dialogText = "The current date and time is " + (app.currentDate())
  //app.displayDialog(dialogText);
  
  const OUTLOOK_URL_PREFIX = "outlook://";

  var id = msg.id();
  var outlook_url = OUTLOOK_URL_PREFIX + id;
  return outlook_url;
}