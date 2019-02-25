//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

struct IOSProject: Ressource {

    static let jsonString: String = """
{
  "children" : [
    {
      "identifier" : "Any",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "arcs" : [
            {
              "identifier" : "UIResponder",
              "isRoot" : false,
              "scope" : "unknown"
            },
            {
              "identifier" : "UIApplicationDelegate",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "children" : [
            {
              "arcs" : [
                {
                  "identifier" : "UIWindow",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.window",
              "isRoot" : false,
              "scope" : "variable"
            },
            {
              "arcs" : [
                {
                  "identifier" : "UIApplication",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "UIApplication.LaunchOptionsKey",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "Any",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "Bool",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.application(_:didFinishLaunchingWithOptions:)",
              "isRoot" : false,
              "scope" : "function"
            },
            {
              "arcs" : [
                {
                  "identifier" : "UIApplication",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.applicationWillResignActive(_:)",
              "isRoot" : false,
              "scope" : "function"
            },
            {
              "arcs" : [
                {
                  "identifier" : "UIApplication",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.applicationDidEnterBackground(_:)",
              "isRoot" : false,
              "scope" : "function"
            },
            {
              "arcs" : [
                {
                  "identifier" : "UIApplication",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.applicationWillEnterForeground(_:)",
              "isRoot" : false,
              "scope" : "function"
            },
            {
              "arcs" : [
                {
                  "identifier" : "UIApplication",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.applicationDidBecomeActive(_:)",
              "isRoot" : false,
              "scope" : "function"
            },
            {
              "arcs" : [
                {
                  "identifier" : "UIApplication",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.applicationWillTerminate(_:)",
              "isRoot" : false,
              "scope" : "function"
            },
            {
              "identifier" : "AppDelegate.Type",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "identifier" : "AppDelegate",
          "isRoot" : false,
          "scope" : "class"
        }
      ],
      "identifier" : "AppDelegateSourceFile",
      "isRoot" : false,
      "scope" : "sourceFile"
    },
    {
      "identifier" : "Bool",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "identifier" : "UIApplication.LaunchOptionsKey",
          "isRoot" : false,
          "scope" : "unknown"
        }
      ],
      "identifier" : "UIApplication",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "UIApplicationDelegate",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "UIResponder",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "UIViewController",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "UIWindow",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "arcs" : [
            {
              "identifier" : "UIViewController",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "children" : [
            {
              "identifier" : "ViewController.viewDidLoad()",
              "isRoot" : false,
              "scope" : "function"
            },
            {
              "identifier" : "ViewController.Type",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "identifier" : "ViewController",
          "isRoot" : false,
          "scope" : "class"
        }
      ],
      "identifier" : "ViewControllerSourceFile",
      "isRoot" : false,
      "scope" : "sourceFile"
    }
  ],
  "isRoot" : true,
  "scope" : "root"
}
"""

}
