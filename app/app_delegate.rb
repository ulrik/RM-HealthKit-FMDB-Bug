class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'hk_test'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible


    types = {read: [:blood_pressure_systolic] }

    Medic.authorize types do |success, error|
      NSLog "Success!" if success
    end

    options = {sort: :start_date, limit: 7}
    Medic.find_samples :blood_pressure_systolic, options do |samples|
      samples.each do |sample|
        NSLog sample.to_s
      end
    end

    queue = FMDatabaseQueue.databaseQueueWithPath("db.sqlite3")
    queue.inDatabase(
      lambda do |db|
        db.executeQuery("SELECT * FROM nothing;", withArgumentsInArray:{})
      end
    )

    true
  end
end
