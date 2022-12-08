
function run(argv) {
  var query = argv[0];
  
  /*
  var outlook = new Application("/Applications/Microsoft Outlook.app");

  outlook.activate();

  window = outlook.windows[0];
  console.log("testing"); 
  */
  var Outlook = new Application("/Applications/Microsoft Outlook.app");

  // Focus the application
  //Outlook.activate();

  var outlook_messages = Outlook.currentMessages();
  console.log("Heyo");

  console.log(`Messages selected: ${outlook_messages.length}`);
  outlook_messages.forEach(msg => console.log("Subject: " + msg.subject()));  
  
  
  var app = Application.currentApplication()
  app.includeStandardAdditions = true
  var dialogText = "The current date and time is " + (app.currentDate())
  app.displayDialog(dialogText)

}