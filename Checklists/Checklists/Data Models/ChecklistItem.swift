
import Foundation
import UserNotifications

class ChecklistItem: NSObject, Codable {
	var text = ""
	var checked = false

  var dueDate = Date()
  var shouldRemind = false
  var itemID: Int

  override init() {
    itemID = DataModel.nextChecklistItemID()
    super.init()
  }
  
	func toggleChecked() {
		checked = !checked
	}

  func scheduleNotification() {
    if shouldRemind && dueDate > Date() {
      //Set up the message title and the message body with thte checklist text
      let content = UNMutableNotificationContent()
      content.title = "Reminder"
      content.body = text
      content.sound = UNNotificationSound.default()
      //set the calendar date with month day hour and minute
      let calendar = Calendar(identifier: .gregorian)
      let components = calendar.dateComponents([.month, .day, .hour, .minute], from: dueDate)
      //the calendar notification trigger shows the notification on a specific date
      let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
      //create the notification request
      let request = UNNotificationRequest(identifier: "\(itemID)", content: content, trigger: trigger)
      // add the notification request to the notification center
      let center = UNUserNotificationCenter.current()
      center.add(request)

      print("Scheduled: \(request) for itemID: \(itemID)")
    }
  }
}
